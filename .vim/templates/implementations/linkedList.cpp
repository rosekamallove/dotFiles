class node 
{
  public:
    int data;
    node * next;
    node(int val)
    {
      data = val;
      next = NULL;
    }
};

void insertAtTail(node * &head, int val)
{
  node * n = new node(val);
  if(head == NULL)
  {
    head = n;
    return;
  }
  node * temp = head;
  while(tmep->next != NULL)
  {
    temp = temp->next;
  }
  temp->next = n;
}

void insertAtHead(node * &head, int val)
{
  node * n = new node(val);
  n->next = head;
  head = n;
}

void display(node * head)
{
  node * temp = head;
  while (temp != NULL)
  {
    cout<<temp->data <<"->";
    temp = temp->next;
  }
  cout<<"NULL"<<endl;
}
