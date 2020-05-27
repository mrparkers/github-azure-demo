import React from 'react'
import {Provider} from 'react-redux';
import {ConnectedRouter} from 'connected-react-router';
import {render} from '@testing-library/react'
import '@testing-library/jest-dom/extend-expect'
import Chance from 'chance';

import { store, history} from '../../store';
import ArticleList from '../../components/ArticleList';

const chance = new Chance();

const createRandomArticle = () => ({
    slug: chance.guid(),
    favorited: chance.bool(),
    author: {
        username: chance.word(),
        image: chance.url(),
    },
    createdAt: chance.date(),
    favoritesCount: chance.d6(),
    title: chance.sentence(),
    description: chance.paragraph(),
    tagList: chance.n(chance.word, chance.d6())
});

test('renders a loading div when no articles are loaded', () => {
    const {queryAllByText} = render(<ArticleList/>);
    const query = queryAllByText('Loading...')

    expect(query).toHaveLength(1);
});

test('renders each article list', () => {
    const numberOfArticles = chance.d6();
    const articles = chance.n(createRandomArticle, numberOfArticles)

    const {queryAllByText} = render(
        <Provider store={store}>
            <ConnectedRouter history={history}>
                <ArticleList articles={articles}/>
            </ConnectedRouter>
        </Provider>
    );

    articles.forEach((article) => {
        expect(queryAllByText(article.title)).toHaveLength(1);
    });
});
