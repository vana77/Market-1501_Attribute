import scipy.io as scio


def get_market_attributes(set_name='train'):
    path = './market_attribute.mat'
    data = scio.loadmat(path)
    data = data['market_attribute'][0][0]
    data = data[set_name]

    attributes = dict()
    fields = ['age', 'backpack', 'bag', 'handbag', 'downblack', 'downblue', 'downbrown', 'downgray', 'downgreen',
              'downpink', 'downpurple', 'downwhite', 'downyellow', 'upblack', 'upblue', 'upgreen', 'upgray',
              'uppurple', 'upred', 'upwhite', 'upyellow', 'clothes', 'down', 'up', 'hair', 'hat', 'gender',
              'image_index']

    for field in fields:
        attributes[field] = data[field][0][0][0].tolist()

    attributes['image_index'] = [str(int(s[0])) for s in attributes['image_index']]

    label2word = {'gender': {1: 'male', 2: 'female'},
                  'hair': {1: 'short_hair', 2: 'long_hair'},
                  'up': {1: 'long_sleeve', 2: 'short_sleeve'},
                  'down': {1: 'long_lower_body_clothing', 2: 'short_lower_body_clothing'},
                  'clothes': {1: 'dress', 2: 'pants'},
                  'hat': {1: 'no_hat', 2: 'wearing_hat'},
                  'backpack': {1: 'no_backpack', 2: 'carrying_backpack'},
                  'bag': {1: 'no_bag', 2: 'carrying_bag'},
                  'handbag': {1: 'no_handbag', 2: 'carrying_handbag'},
                  'age': {1: 'young', 2: 'teenager', 3: 'adult', 4: 'old'},
                  'upblack': {1: 'not_upblack', 2: 'upblack'},
                  'upwhite': {1: 'not_upwhite', 2: 'upwhite'},
                  'upred': {1: 'not_upred', 2: 'upred'},
                  'uppurple': {1: 'not_uppurple', 2: 'uppurple'},
                  'upyellow': {1: 'not_upyellow', 2: 'upyellow'},
                  'upgray': {1: 'not_upgray', 2: 'upgray'},
                  'upblue': {1: 'not_upblue', 2: 'upblue'},
                  'upgreen': {1: 'not_upgreen', 2: 'upgreen'},
                  'downblack': {1: 'not_downblack', 2: 'downblack'},
                  'downwhite': {1: 'not_downwhite', 2: 'downwhite'},
                  'downpink': {1: 'not_downpink', 2: 'downpink'},
                  'downpurple': {1: 'not_downpurple', 2: 'downpurple'},
                  'downyellow': {1: 'not_downyellow', 2: 'downyellow'},
                  'downgray': {1: 'not_downgray', 2: 'downgray'},
                  'downblue': {1: 'not_downblue', 2: 'downblue'},
                  'downgreen': {1: 'not_downgreen', 2: 'downgreen'},
                  'downbrown': {1: 'not_downbrown', 2: 'downbrown'},
                  }

    return attributes, label2word
