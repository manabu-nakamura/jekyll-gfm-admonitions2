As a test, I rewrote the [GitHub Flavored Markdown Admonitions](https://github.com/Helveg/jekyll-gfm-admonitions) plugin as a [Converter](https://jekyllrb.com/docs/plugins/converters/): https://github.com/manabu-nakamura/jekyll-gfm-admonitions2/blob/master/lib/jekyll-gfm-admonitions.rb.
```markdown
> [!NOTE]
> foo
> bar
  baz
qux

quux
```
⬇️Markdown processor?
```html
<blockquote>
<p>[!NOTE]
foo
bar
baz
qux</p>
</blockquote>
<p>quux</p>
```
⬇️GFMAdmonitionConverter
```html
<div class='markdown-alert markdown-alert-note'><p class='markdown-alert-title'><svg class="octicon octicon-info" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path d="..."></path></svg> Note</p>foo
bar
baz
qux</div>
<p>quux</p>
```
⬇️
> [!NOTE]
> foo
> bar
  baz
qux

quux

https://manabu-nakamura.github.io/jekyll-gfm-admonitions2/,
https://manabu-nakamura.github.io/jekyll-gfm-admonitions2/README2.html,
https://github.com/manabu-nakamura/jekyll-gfm-admonitions2
```markdown
> foo
> bar
  baz
qux

quux
> [!NOTE]
> foo
> bar
  baz
qux

quux
> foo
> bar
# H1
> [!NOTE]
> foo
> bar
# H1
> [!NOTE] My own title
> Fancy!

  > [!NOTE] My own title
  > Fancy!

    > [!NOTE] My own title
    > Fancy!
```
> foo
> bar
  baz
qux

quux
> [!NOTE]
> foo
> bar
  baz
qux

quux
> foo
> bar
# H1
> [!NOTE]
> foo
> bar
# H1
> [!NOTE] My own title
> Fancy!

  > [!NOTE] My own title
  > Fancy!

    > [!NOTE] My own title
    > Fancy!

[Manabu Nakamura](https://github.com/manabu-nakamura)