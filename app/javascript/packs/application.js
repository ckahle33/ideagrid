import Bootstrap from 'bootstrap.native';
import trix from 'trix'

import Turbolinks from "turbolinks";
Turbolinks.start()

import * as ActiveStorage from "activestorage";
ActiveStorage.start()

import '../src/ideas/comment.es6';
import '../src/ideas/vote.es6';
import '../src/tags.es6';
