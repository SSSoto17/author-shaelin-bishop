create sequence "public"."header_id_seq";

create sequence "public"."media_id_seq";

create sequence "public"."pages_id_seq";

create sequence "public"."payload_locked_documents_id_seq";

create sequence "public"."payload_locked_documents_rels_id_seq";

create sequence "public"."payload_migrations_id_seq";

create sequence "public"."payload_preferences_id_seq";

create sequence "public"."payload_preferences_rels_id_seq";

create sequence "public"."users_id_seq";

create table "public"."header" (
    "id" integer not null default nextval('header_id_seq'::regclass),
    "updated_at" timestamp(3) with time zone,
    "created_at" timestamp(3) with time zone
);


create table "public"."header_items" (
    "_order" integer not null,
    "_parent_id" integer not null,
    "id" character varying not null,
    "page_id" integer not null
);


create table "public"."media" (
    "id" integer not null default nextval('media_id_seq'::regclass),
    "alt" character varying not null,
    "updated_at" timestamp(3) with time zone not null default now(),
    "created_at" timestamp(3) with time zone not null default now(),
    "url" character varying,
    "thumbnail_u_r_l" character varying,
    "filename" character varying,
    "mime_type" character varying,
    "filesize" numeric,
    "width" numeric,
    "height" numeric,
    "focal_x" numeric,
    "focal_y" numeric
);


create table "public"."pages" (
    "id" integer not null default nextval('pages_id_seq'::regclass),
    "title" character varying not null,
    "path" character varying not null,
    "updated_at" timestamp(3) with time zone not null default now(),
    "created_at" timestamp(3) with time zone not null default now()
);


create table "public"."payload_locked_documents" (
    "id" integer not null default nextval('payload_locked_documents_id_seq'::regclass),
    "global_slug" character varying,
    "updated_at" timestamp(3) with time zone not null default now(),
    "created_at" timestamp(3) with time zone not null default now()
);


create table "public"."payload_locked_documents_rels" (
    "id" integer not null default nextval('payload_locked_documents_rels_id_seq'::regclass),
    "order" integer,
    "parent_id" integer not null,
    "path" character varying not null,
    "users_id" integer,
    "media_id" integer,
    "pages_id" integer
);


create table "public"."payload_migrations" (
    "id" integer not null default nextval('payload_migrations_id_seq'::regclass),
    "name" character varying,
    "batch" numeric,
    "updated_at" timestamp(3) with time zone not null default now(),
    "created_at" timestamp(3) with time zone not null default now()
);


create table "public"."payload_preferences" (
    "id" integer not null default nextval('payload_preferences_id_seq'::regclass),
    "key" character varying,
    "value" jsonb,
    "updated_at" timestamp(3) with time zone not null default now(),
    "created_at" timestamp(3) with time zone not null default now()
);


create table "public"."payload_preferences_rels" (
    "id" integer not null default nextval('payload_preferences_rels_id_seq'::regclass),
    "order" integer,
    "parent_id" integer not null,
    "path" character varying not null,
    "users_id" integer
);


create table "public"."users" (
    "id" integer not null default nextval('users_id_seq'::regclass),
    "updated_at" timestamp(3) with time zone not null default now(),
    "created_at" timestamp(3) with time zone not null default now(),
    "email" character varying not null,
    "reset_password_token" character varying,
    "reset_password_expiration" timestamp(3) with time zone,
    "salt" character varying,
    "hash" character varying,
    "login_attempts" numeric default 0,
    "lock_until" timestamp(3) with time zone
);


alter sequence "public"."header_id_seq" owned by "public"."header"."id";

alter sequence "public"."media_id_seq" owned by "public"."media"."id";

alter sequence "public"."pages_id_seq" owned by "public"."pages"."id";

alter sequence "public"."payload_locked_documents_id_seq" owned by "public"."payload_locked_documents"."id";

alter sequence "public"."payload_locked_documents_rels_id_seq" owned by "public"."payload_locked_documents_rels"."id";

alter sequence "public"."payload_migrations_id_seq" owned by "public"."payload_migrations"."id";

alter sequence "public"."payload_preferences_id_seq" owned by "public"."payload_preferences"."id";

alter sequence "public"."payload_preferences_rels_id_seq" owned by "public"."payload_preferences_rels"."id";

alter sequence "public"."users_id_seq" owned by "public"."users"."id";

CREATE INDEX header_items_order_idx ON public.header_items USING btree (_order);

CREATE INDEX header_items_page_idx ON public.header_items USING btree (page_id);

CREATE INDEX header_items_parent_id_idx ON public.header_items USING btree (_parent_id);

CREATE UNIQUE INDEX header_items_pkey ON public.header_items USING btree (id);

CREATE UNIQUE INDEX header_pkey ON public.header USING btree (id);

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);

CREATE UNIQUE INDEX media_pkey ON public.media USING btree (id);

CREATE INDEX media_updated_at_idx ON public.media USING btree (updated_at);

CREATE INDEX pages_created_at_idx ON public.pages USING btree (created_at);

CREATE UNIQUE INDEX pages_pkey ON public.pages USING btree (id);

CREATE INDEX pages_updated_at_idx ON public.pages USING btree (updated_at);

CREATE INDEX payload_locked_documents_created_at_idx ON public.payload_locked_documents USING btree (created_at);

CREATE INDEX payload_locked_documents_global_slug_idx ON public.payload_locked_documents USING btree (global_slug);

CREATE UNIQUE INDEX payload_locked_documents_pkey ON public.payload_locked_documents USING btree (id);

CREATE INDEX payload_locked_documents_rels_media_id_idx ON public.payload_locked_documents_rels USING btree (media_id);

CREATE INDEX payload_locked_documents_rels_order_idx ON public.payload_locked_documents_rels USING btree ("order");

CREATE INDEX payload_locked_documents_rels_pages_id_idx ON public.payload_locked_documents_rels USING btree (pages_id);

CREATE INDEX payload_locked_documents_rels_parent_idx ON public.payload_locked_documents_rels USING btree (parent_id);

CREATE INDEX payload_locked_documents_rels_path_idx ON public.payload_locked_documents_rels USING btree (path);

CREATE UNIQUE INDEX payload_locked_documents_rels_pkey ON public.payload_locked_documents_rels USING btree (id);

CREATE INDEX payload_locked_documents_rels_users_id_idx ON public.payload_locked_documents_rels USING btree (users_id);

CREATE INDEX payload_locked_documents_updated_at_idx ON public.payload_locked_documents USING btree (updated_at);

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);

CREATE UNIQUE INDEX payload_migrations_pkey ON public.payload_migrations USING btree (id);

CREATE INDEX payload_migrations_updated_at_idx ON public.payload_migrations USING btree (updated_at);

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);

CREATE UNIQUE INDEX payload_preferences_pkey ON public.payload_preferences USING btree (id);

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);

CREATE UNIQUE INDEX payload_preferences_rels_pkey ON public.payload_preferences_rels USING btree (id);

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);

CREATE INDEX payload_preferences_updated_at_idx ON public.payload_preferences USING btree (updated_at);

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);

CREATE UNIQUE INDEX users_pkey ON public.users USING btree (id);

CREATE INDEX users_updated_at_idx ON public.users USING btree (updated_at);

alter table "public"."header" add constraint "header_pkey" PRIMARY KEY using index "header_pkey";

alter table "public"."header_items" add constraint "header_items_pkey" PRIMARY KEY using index "header_items_pkey";

alter table "public"."media" add constraint "media_pkey" PRIMARY KEY using index "media_pkey";

alter table "public"."pages" add constraint "pages_pkey" PRIMARY KEY using index "pages_pkey";

alter table "public"."payload_locked_documents" add constraint "payload_locked_documents_pkey" PRIMARY KEY using index "payload_locked_documents_pkey";

alter table "public"."payload_locked_documents_rels" add constraint "payload_locked_documents_rels_pkey" PRIMARY KEY using index "payload_locked_documents_rels_pkey";

alter table "public"."payload_migrations" add constraint "payload_migrations_pkey" PRIMARY KEY using index "payload_migrations_pkey";

alter table "public"."payload_preferences" add constraint "payload_preferences_pkey" PRIMARY KEY using index "payload_preferences_pkey";

alter table "public"."payload_preferences_rels" add constraint "payload_preferences_rels_pkey" PRIMARY KEY using index "payload_preferences_rels_pkey";

alter table "public"."users" add constraint "users_pkey" PRIMARY KEY using index "users_pkey";

alter table "public"."header_items" add constraint "header_items_page_id_pages_id_fk" FOREIGN KEY (page_id) REFERENCES pages(id) ON DELETE SET NULL not valid;

alter table "public"."header_items" validate constraint "header_items_page_id_pages_id_fk";

alter table "public"."header_items" add constraint "header_items_parent_id_fk" FOREIGN KEY (_parent_id) REFERENCES header(id) ON DELETE CASCADE not valid;

alter table "public"."header_items" validate constraint "header_items_parent_id_fk";

alter table "public"."payload_locked_documents_rels" add constraint "payload_locked_documents_rels_media_fk" FOREIGN KEY (media_id) REFERENCES media(id) ON DELETE CASCADE not valid;

alter table "public"."payload_locked_documents_rels" validate constraint "payload_locked_documents_rels_media_fk";

alter table "public"."payload_locked_documents_rels" add constraint "payload_locked_documents_rels_pages_fk" FOREIGN KEY (pages_id) REFERENCES pages(id) ON DELETE CASCADE not valid;

alter table "public"."payload_locked_documents_rels" validate constraint "payload_locked_documents_rels_pages_fk";

alter table "public"."payload_locked_documents_rels" add constraint "payload_locked_documents_rels_parent_fk" FOREIGN KEY (parent_id) REFERENCES payload_locked_documents(id) ON DELETE CASCADE not valid;

alter table "public"."payload_locked_documents_rels" validate constraint "payload_locked_documents_rels_parent_fk";

alter table "public"."payload_locked_documents_rels" add constraint "payload_locked_documents_rels_users_fk" FOREIGN KEY (users_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."payload_locked_documents_rels" validate constraint "payload_locked_documents_rels_users_fk";

alter table "public"."payload_preferences_rels" add constraint "payload_preferences_rels_parent_fk" FOREIGN KEY (parent_id) REFERENCES payload_preferences(id) ON DELETE CASCADE not valid;

alter table "public"."payload_preferences_rels" validate constraint "payload_preferences_rels_parent_fk";

alter table "public"."payload_preferences_rels" add constraint "payload_preferences_rels_users_fk" FOREIGN KEY (users_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."payload_preferences_rels" validate constraint "payload_preferences_rels_users_fk";

grant delete on table "public"."header" to "anon";

grant insert on table "public"."header" to "anon";

grant references on table "public"."header" to "anon";

grant select on table "public"."header" to "anon";

grant trigger on table "public"."header" to "anon";

grant truncate on table "public"."header" to "anon";

grant update on table "public"."header" to "anon";

grant delete on table "public"."header" to "authenticated";

grant insert on table "public"."header" to "authenticated";

grant references on table "public"."header" to "authenticated";

grant select on table "public"."header" to "authenticated";

grant trigger on table "public"."header" to "authenticated";

grant truncate on table "public"."header" to "authenticated";

grant update on table "public"."header" to "authenticated";

grant delete on table "public"."header" to "service_role";

grant insert on table "public"."header" to "service_role";

grant references on table "public"."header" to "service_role";

grant select on table "public"."header" to "service_role";

grant trigger on table "public"."header" to "service_role";

grant truncate on table "public"."header" to "service_role";

grant update on table "public"."header" to "service_role";

grant delete on table "public"."header_items" to "anon";

grant insert on table "public"."header_items" to "anon";

grant references on table "public"."header_items" to "anon";

grant select on table "public"."header_items" to "anon";

grant trigger on table "public"."header_items" to "anon";

grant truncate on table "public"."header_items" to "anon";

grant update on table "public"."header_items" to "anon";

grant delete on table "public"."header_items" to "authenticated";

grant insert on table "public"."header_items" to "authenticated";

grant references on table "public"."header_items" to "authenticated";

grant select on table "public"."header_items" to "authenticated";

grant trigger on table "public"."header_items" to "authenticated";

grant truncate on table "public"."header_items" to "authenticated";

grant update on table "public"."header_items" to "authenticated";

grant delete on table "public"."header_items" to "service_role";

grant insert on table "public"."header_items" to "service_role";

grant references on table "public"."header_items" to "service_role";

grant select on table "public"."header_items" to "service_role";

grant trigger on table "public"."header_items" to "service_role";

grant truncate on table "public"."header_items" to "service_role";

grant update on table "public"."header_items" to "service_role";

grant delete on table "public"."media" to "anon";

grant insert on table "public"."media" to "anon";

grant references on table "public"."media" to "anon";

grant select on table "public"."media" to "anon";

grant trigger on table "public"."media" to "anon";

grant truncate on table "public"."media" to "anon";

grant update on table "public"."media" to "anon";

grant delete on table "public"."media" to "authenticated";

grant insert on table "public"."media" to "authenticated";

grant references on table "public"."media" to "authenticated";

grant select on table "public"."media" to "authenticated";

grant trigger on table "public"."media" to "authenticated";

grant truncate on table "public"."media" to "authenticated";

grant update on table "public"."media" to "authenticated";

grant delete on table "public"."media" to "service_role";

grant insert on table "public"."media" to "service_role";

grant references on table "public"."media" to "service_role";

grant select on table "public"."media" to "service_role";

grant trigger on table "public"."media" to "service_role";

grant truncate on table "public"."media" to "service_role";

grant update on table "public"."media" to "service_role";

grant delete on table "public"."pages" to "anon";

grant insert on table "public"."pages" to "anon";

grant references on table "public"."pages" to "anon";

grant select on table "public"."pages" to "anon";

grant trigger on table "public"."pages" to "anon";

grant truncate on table "public"."pages" to "anon";

grant update on table "public"."pages" to "anon";

grant delete on table "public"."pages" to "authenticated";

grant insert on table "public"."pages" to "authenticated";

grant references on table "public"."pages" to "authenticated";

grant select on table "public"."pages" to "authenticated";

grant trigger on table "public"."pages" to "authenticated";

grant truncate on table "public"."pages" to "authenticated";

grant update on table "public"."pages" to "authenticated";

grant delete on table "public"."pages" to "service_role";

grant insert on table "public"."pages" to "service_role";

grant references on table "public"."pages" to "service_role";

grant select on table "public"."pages" to "service_role";

grant trigger on table "public"."pages" to "service_role";

grant truncate on table "public"."pages" to "service_role";

grant update on table "public"."pages" to "service_role";

grant delete on table "public"."payload_locked_documents" to "anon";

grant insert on table "public"."payload_locked_documents" to "anon";

grant references on table "public"."payload_locked_documents" to "anon";

grant select on table "public"."payload_locked_documents" to "anon";

grant trigger on table "public"."payload_locked_documents" to "anon";

grant truncate on table "public"."payload_locked_documents" to "anon";

grant update on table "public"."payload_locked_documents" to "anon";

grant delete on table "public"."payload_locked_documents" to "authenticated";

grant insert on table "public"."payload_locked_documents" to "authenticated";

grant references on table "public"."payload_locked_documents" to "authenticated";

grant select on table "public"."payload_locked_documents" to "authenticated";

grant trigger on table "public"."payload_locked_documents" to "authenticated";

grant truncate on table "public"."payload_locked_documents" to "authenticated";

grant update on table "public"."payload_locked_documents" to "authenticated";

grant delete on table "public"."payload_locked_documents" to "service_role";

grant insert on table "public"."payload_locked_documents" to "service_role";

grant references on table "public"."payload_locked_documents" to "service_role";

grant select on table "public"."payload_locked_documents" to "service_role";

grant trigger on table "public"."payload_locked_documents" to "service_role";

grant truncate on table "public"."payload_locked_documents" to "service_role";

grant update on table "public"."payload_locked_documents" to "service_role";

grant delete on table "public"."payload_locked_documents_rels" to "anon";

grant insert on table "public"."payload_locked_documents_rels" to "anon";

grant references on table "public"."payload_locked_documents_rels" to "anon";

grant select on table "public"."payload_locked_documents_rels" to "anon";

grant trigger on table "public"."payload_locked_documents_rels" to "anon";

grant truncate on table "public"."payload_locked_documents_rels" to "anon";

grant update on table "public"."payload_locked_documents_rels" to "anon";

grant delete on table "public"."payload_locked_documents_rels" to "authenticated";

grant insert on table "public"."payload_locked_documents_rels" to "authenticated";

grant references on table "public"."payload_locked_documents_rels" to "authenticated";

grant select on table "public"."payload_locked_documents_rels" to "authenticated";

grant trigger on table "public"."payload_locked_documents_rels" to "authenticated";

grant truncate on table "public"."payload_locked_documents_rels" to "authenticated";

grant update on table "public"."payload_locked_documents_rels" to "authenticated";

grant delete on table "public"."payload_locked_documents_rels" to "service_role";

grant insert on table "public"."payload_locked_documents_rels" to "service_role";

grant references on table "public"."payload_locked_documents_rels" to "service_role";

grant select on table "public"."payload_locked_documents_rels" to "service_role";

grant trigger on table "public"."payload_locked_documents_rels" to "service_role";

grant truncate on table "public"."payload_locked_documents_rels" to "service_role";

grant update on table "public"."payload_locked_documents_rels" to "service_role";

grant delete on table "public"."payload_migrations" to "anon";

grant insert on table "public"."payload_migrations" to "anon";

grant references on table "public"."payload_migrations" to "anon";

grant select on table "public"."payload_migrations" to "anon";

grant trigger on table "public"."payload_migrations" to "anon";

grant truncate on table "public"."payload_migrations" to "anon";

grant update on table "public"."payload_migrations" to "anon";

grant delete on table "public"."payload_migrations" to "authenticated";

grant insert on table "public"."payload_migrations" to "authenticated";

grant references on table "public"."payload_migrations" to "authenticated";

grant select on table "public"."payload_migrations" to "authenticated";

grant trigger on table "public"."payload_migrations" to "authenticated";

grant truncate on table "public"."payload_migrations" to "authenticated";

grant update on table "public"."payload_migrations" to "authenticated";

grant delete on table "public"."payload_migrations" to "service_role";

grant insert on table "public"."payload_migrations" to "service_role";

grant references on table "public"."payload_migrations" to "service_role";

grant select on table "public"."payload_migrations" to "service_role";

grant trigger on table "public"."payload_migrations" to "service_role";

grant truncate on table "public"."payload_migrations" to "service_role";

grant update on table "public"."payload_migrations" to "service_role";

grant delete on table "public"."payload_preferences" to "anon";

grant insert on table "public"."payload_preferences" to "anon";

grant references on table "public"."payload_preferences" to "anon";

grant select on table "public"."payload_preferences" to "anon";

grant trigger on table "public"."payload_preferences" to "anon";

grant truncate on table "public"."payload_preferences" to "anon";

grant update on table "public"."payload_preferences" to "anon";

grant delete on table "public"."payload_preferences" to "authenticated";

grant insert on table "public"."payload_preferences" to "authenticated";

grant references on table "public"."payload_preferences" to "authenticated";

grant select on table "public"."payload_preferences" to "authenticated";

grant trigger on table "public"."payload_preferences" to "authenticated";

grant truncate on table "public"."payload_preferences" to "authenticated";

grant update on table "public"."payload_preferences" to "authenticated";

grant delete on table "public"."payload_preferences" to "service_role";

grant insert on table "public"."payload_preferences" to "service_role";

grant references on table "public"."payload_preferences" to "service_role";

grant select on table "public"."payload_preferences" to "service_role";

grant trigger on table "public"."payload_preferences" to "service_role";

grant truncate on table "public"."payload_preferences" to "service_role";

grant update on table "public"."payload_preferences" to "service_role";

grant delete on table "public"."payload_preferences_rels" to "anon";

grant insert on table "public"."payload_preferences_rels" to "anon";

grant references on table "public"."payload_preferences_rels" to "anon";

grant select on table "public"."payload_preferences_rels" to "anon";

grant trigger on table "public"."payload_preferences_rels" to "anon";

grant truncate on table "public"."payload_preferences_rels" to "anon";

grant update on table "public"."payload_preferences_rels" to "anon";

grant delete on table "public"."payload_preferences_rels" to "authenticated";

grant insert on table "public"."payload_preferences_rels" to "authenticated";

grant references on table "public"."payload_preferences_rels" to "authenticated";

grant select on table "public"."payload_preferences_rels" to "authenticated";

grant trigger on table "public"."payload_preferences_rels" to "authenticated";

grant truncate on table "public"."payload_preferences_rels" to "authenticated";

grant update on table "public"."payload_preferences_rels" to "authenticated";

grant delete on table "public"."payload_preferences_rels" to "service_role";

grant insert on table "public"."payload_preferences_rels" to "service_role";

grant references on table "public"."payload_preferences_rels" to "service_role";

grant select on table "public"."payload_preferences_rels" to "service_role";

grant trigger on table "public"."payload_preferences_rels" to "service_role";

grant truncate on table "public"."payload_preferences_rels" to "service_role";

grant update on table "public"."payload_preferences_rels" to "service_role";

grant delete on table "public"."users" to "anon";

grant insert on table "public"."users" to "anon";

grant references on table "public"."users" to "anon";

grant select on table "public"."users" to "anon";

grant trigger on table "public"."users" to "anon";

grant truncate on table "public"."users" to "anon";

grant update on table "public"."users" to "anon";

grant delete on table "public"."users" to "authenticated";

grant insert on table "public"."users" to "authenticated";

grant references on table "public"."users" to "authenticated";

grant select on table "public"."users" to "authenticated";

grant trigger on table "public"."users" to "authenticated";

grant truncate on table "public"."users" to "authenticated";

grant update on table "public"."users" to "authenticated";

grant delete on table "public"."users" to "service_role";

grant insert on table "public"."users" to "service_role";

grant references on table "public"."users" to "service_role";

grant select on table "public"."users" to "service_role";

grant trigger on table "public"."users" to "service_role";

grant truncate on table "public"."users" to "service_role";

grant update on table "public"."users" to "service_role";


