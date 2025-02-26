const Ideas = {}
const Comments = {}

Ideas.removeIdeaCard = function (ideaId) {
  document.getElementById('idea-' + ideaId).parentElement.remove()
}

Comments.buildComment = function (comment) {
  const commentTime = document.createElement('time')
  commentTime.setAttribute('datetime', '2017-11-28T13:48')
  commentTime.appendChild(document.createTextNode(comment.when))

  const commentHeader = document.createElement('h3')
  commentHeader.className = 'comment__title'
  commentHeader.appendChild(document.createTextNode(comment.commenter))

  const commentParagraph = document.createElement('p')
  commentParagraph.appendChild(document.createTextNode(comment.body))

  const commentBody = document.createElement('div')
  commentBody.className = 'comment__body'
  commentBody.appendChild(commentHeader)
  commentBody.appendChild(commentParagraph)

  const avatar = document.createElement('img')
  avatar.className = 'avatar'
  avatar.setAttribute('src', comment.avatar_url)

  const commentListItem = document.createElement('li')
  commentListItem.className = 'comment'
  commentListItem.appendChild(avatar)
  commentListItem.appendChild(commentBody)

  return commentListItem
}

Comments.addComment = function (comment) {
  const newComment = Comments.buildComment(comment)
  const comments = document.getElementById('commentList')
  comments.insertBefore(newComment, comments.firstChild)
}
