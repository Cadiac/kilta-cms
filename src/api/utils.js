const cachedReply = (reply, data, cached) => {
  const lastModified = cached ? new Date(cached.stored) : new Date();
  return reply(data).header('Last-Modified', lastModified.toUTCString());
};

module.exports = {
  cachedReply,
};
