class MapQueue<E> {

  ArrayList<E> searchList;

  public MapQueue() {
    searchList = new ArrayList<E>();
  }

  boolean add(E t) {
    try {
      searchList.add(t);
      return true;
    }
    catch(Exception e) {
      return false;
    }
  }

  E element() {
    return searchList.get(0);
  }

  boolean offer(E t) {
    try {
      searchList.add(t);
      return true;
    }
    catch(Exception e) {
      return false;
    }
  }

  E peek() {
    if (searchList.size() == 0) {
      return null;
    } else {
      return searchList.get(0);
    }
  }

  E poll() {
    if (searchList.size() == 0) {
      return null;
    } else {
      return searchList.remove(0);
    }
  }

  E remove() {
    return searchList.remove(0);
  }
  
  ArrayList<E> getQueue() {
    return searchList;
  }
}

