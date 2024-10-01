'''Save/load features'''

import os, json

_WORKING_DIRECTORY=os.getcwd()+'\\source-code\\datafiles\\'
_WORKING_DIRECTORY_L=_WORKING_DIRECTORY+'localizations\\'

def _delete(_file):
    if os.path.exists(_file):
        os.remove(_file)
    else:
        print('The file does not exist')

def SL_load():

    data = {}

    # Load global.cdat

    data["global"] = json.load(open(_WORKING_DIRECTORY+"global.cdat", encoding="utf-8"))

    # Load localizations

    data['localizations'] = {}
    files = next(os.walk(_WORKING_DIRECTORY_L), (None, None, []))[2]

    for i in files:
        file = json.load(open(_WORKING_DIRECTORY_L+i, encoding='utf-8'))
        file['name'] = i.split(".")[0]

        data['localizations'][file['name']] = file

    return data

def SL_save(data):
    
    json.dump(data['global'], open(_WORKING_DIRECTORY+'global.cdat', 'w', encoding='utf-8'), ensure_ascii=False, sort_keys=True, indent=4)

    for i in data['localizations'].values():
        #print(i)
        json.dump(i, open(_WORKING_DIRECTORY_L+i['name']+'.l', 'w', encoding='utf-8'), ensure_ascii=False, sort_keys=True, indent=4)
