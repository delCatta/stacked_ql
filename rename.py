import os, fnmatch

oldName = input("Insert old app name (stackedql): ") or "stackedql"
newName = input("Insert new app name: ")
if not newName: exit(0)

apppath = "src/"+oldName+"_app"
ferrypath = "src/"+oldName+"_ferry"



newapppath = "src/"+newName+"_app"
newferrypath = "src/"+newName+"_ferry"

def checkdirs():

    appcheck = os.path.isdir(apppath)
    ferrycheck = os.path.isdir(ferrypath)

    if not appcheck: print(apppath,"doesn't exist.")
    if not ferrycheck: print(ferrypath,"doesn't exist.")
    if not appcheck or not ferrycheck: exit(0)

def renameFolders():

    os.rename(apppath, newapppath)
    os.rename(ferrypath, newferrypath)

def findReplace(directory, find, replace, filePattern):
    for path, dirs, files in os.walk(os.path.abspath(directory)):
        for filename in fnmatch.filter(files, filePattern):
            filepath = os.path.join(path, filename)
            with open(filepath) as f:
                s = f.read()
            s = s.replace(find, replace)
            with open(filepath, "w") as f:
                f.write(s)
            

def renameProject(oldProjectName,projectName,path,isApp):
    os.chdir(path)
    bundleID= input("Insert Bundle ID for "+projectName+f" (com.example.{projectName}): ") or f"com.example.{projectName}"
    result = os.system(f'flutter pub global run rename --bundleId {bundleID}')
    result = os.system(f'flutter pub global run rename --appname "{projectName}"')
    if isApp:
        result = os.system(f'flutter create .')
        result = os.system(f'rm -rf test')
    findReplace("./", f"package:{oldProjectName}", f"package:{projectName}", "*.dart")
    findReplace("./", f"{oldName}_", f"{newName}_", "*.yaml")
    os.chdir("../../")
    
        
def pubGetAndBuild(oldProjectName,projectName,path):
    os.chdir(path)
    os.system("flutter pub get")
    os.system("flutter pub run build_runner build --delete-conflicting-outputs")
    os.chdir("../../")

def createPackageProjectWithExample(name):
    os.chdir("./src")
    os.system(f"flutter create --template=package {name}")
    os.chdir(f"./{name}")
    os.system(f"flutter create example")
    os.chdir("../../")



checkdirs()
renameFolders()

appProjectName = newName+"_app"
uiProjectName = newName+"_ui"
ferryProjectName = newName+"_ferry"

oldappProjectName = oldName+"_app"
olduiProjectName = oldName+"_ui"
oldferryProjectName = oldName+"_ferry"


# os.system("flutter pub global activate rename")
createPackageProjectWithExample(f"{newName}_ui")
renameProject(oldferryProjectName,ferryProjectName,newferrypath,False)
pubGetAndBuild(oldferryProjectName,ferryProjectName,newferrypath)


def changeOtherImports(projectPath,oldOtherPackage,newOtherPackage):
    findReplace(newapppath, f"package:{oldOtherPackage}", f"package:{newOtherPackage}", "*.dart")


findReplace(newapppath, "stackedql_ui", newName+"_ui", "*.dart")
renameProject(oldappProjectName,appProjectName,newapppath,True)
changeOtherImports(newapppath,oldferryProjectName,ferryProjectName)
pubGetAndBuild(oldappProjectName,appProjectName,newapppath)


# remember to copy graphql schema
# remember to copy queries and mutations

# delete .git - readme - python script option
# if input("Delete repo files? (y/n):")=="y":
#     os.rmdir(".git")
#     os.remove("README.md")
#     os.remove("rename.py")
