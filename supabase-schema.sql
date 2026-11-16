-- Exécuter dans Supabase > SQL Editor.
create table if not exists public.planning_documents (
  path text primary key,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.planning_documents enable row level security;
revoke all on table public.planning_documents from anon, authenticated;
grant select, insert, update on table public.planning_documents to authenticated;

drop policy if exists "approved users can read planning" on public.planning_documents;
create policy "approved users can read planning"
  on public.planning_documents for select to authenticated
  using ((select lower(auth.jwt() ->> 'email')) in ('admin@example.com', 'dev@example.com'));

drop policy if exists "approved users can add planning" on public.planning_documents;
create policy "approved users can add planning"
  on public.planning_documents for insert to authenticated
  with check ((select lower(auth.jwt() ->> 'email')) in ('admin@example.com', 'dev@example.com'));

drop policy if exists "approved users can update planning" on public.planning_documents;
create policy "approved users can update planning"
  on public.planning_documents for update to authenticated
  using ((select lower(auth.jwt() ->> 'email')) in ('admin@example.com', 'dev@example.com'))
  with check ((select lower(auth.jwt() ->> 'email')) in ('admin@example.com', 'dev@example.com'));
