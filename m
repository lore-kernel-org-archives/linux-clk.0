Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B620C43460
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 16:46:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A78C6103D
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 16:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbhCaQqU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 12:46:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:57686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhCaQqC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 31 Mar 2021 12:46:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D51616101E;
        Wed, 31 Mar 2021 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617209162;
        bh=6VJa2G/8GiZyhJFRNepPg4qOIIoUKn5WU2RVV8tZ0d8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dG9Id/uVZ0TNV6Xim0Hgo6iG1zBMrjUxpxzQSj/qCQYdbmmzhe7eDpkJO39gk0c7S
         0x01LNT72fiHGIjgOwO2aAS5agWm8eknhZNoPIjCf5uNpmFe5ifSzGrZnN5QAcooqs
         402GsLmg2v2Kjn9e8i9thIbPGdnnAwr1VJHA7DcUi6qgMcAkCm9DisJyKta50Nox/P
         5s3BNONFQmd13fg2zqFtLuT8elrqz36JWSpCdHKm0i08EFQdZVWtRliMBhhUmWT+vh
         KxDHrp9KweGloqGBtdKSu6QC/V96ioL6ULc1x0CsFYmzrK+JUDYiliWkrAhkMga+a6
         3JzdRpmeUhBbw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210331155822.3648-1-lb@semihalf.com>
References: <20210317160545.14309-1-lb@semihalf.com> <20210331155822.3648-1-lb@semihalf.com>
Subject: Re: [PATCH v3] clk: fix invalid usage of a list_for_each_entry cursor
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, upstream@semihalf.com
To:     Lukasz Bartosik <lb@semihalf.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 31 Mar 2021 09:46:00 -0700
Message-ID: <161720916025.2260335.304063957155907384@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lukasz Bartosik (2021-03-31 08:58:22)
> Fix invalid usage of a list_for_each_entry cursor. When
> list is empty or if the list is completely traversed (without
> breaking from the loop on one of the entries) then the list
> cursor does not point to a valid entry and therefore should
> not be used.
>=20
> The issue was dicovered when running 5.12-rc1 kernel on x86_64
> with KASAN enabled:
> BUG: KASAN: global-out-of-bounds in clk_notifier_register+0xab/0x230
> Read of size 8 at addr ffffffffa0d10588 by task swapper/0/1
>=20
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc1 #1
> Hardware name: Google Caroline/Caroline,
> BIOS Google_Caroline.7820.430.0 07/20/2018
> Call Trace:
>  dump_stack+0xee/0x15c
>  print_address_description+0x1e/0x2dc
>  kasan_report+0x188/0x1ce
>  ? clk_notifier_register+0xab/0x230
>  ? clk_prepare_lock+0x15/0x7b
>  ? clk_notifier_register+0xab/0x230
>  clk_notifier_register+0xab/0x230
>  dw8250_probe+0xc01/0x10d4
> ...
> Memory state around the buggy address:
>  ffffffffa0d10480: 00 00 00 00 00 03 f9 f9 f9 f9 f9 f9 00 00 00 00
>  ffffffffa0d10500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9
> >ffffffffa0d10580: f9 f9 f9 f9 00 00 00 00 00 00 00 00 00 00 00 00
>                       ^
>  ffffffffa0d10600: 00 00 00 00 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00
>  ffffffffa0d10680: 00 00 00 00 00 00 00 00 f9 f9 f9 f9 00 00 00 00
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Fixes: b2476490ef11 ("clk: introduce the common clock framework")
> Reported-by: Lukasz Majczak <lma@semihalf.com>
> Signed-off-by: Lukasz Bartosik <lb@semihalf.com>
> ---

Please stop sending these as replies to previous versions.

>  drivers/clk/clk.c | 41 ++++++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index d181c6d31d22..742cb8611ad4 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4345,20 +4345,19 @@ int clk_notifier_register(struct clk *clk, struct=
 notifier_block *nb)
>         /* search the list of notifiers for this clk */
>         list_for_each_entry(cn, &clk_notifier_list, node)
>                 if (cn->clk =3D=3D clk)
> -                       break;
> +                       goto found;
> =20
>         /* if clk wasn't in the notifier list, allocate new clk_notifier =
*/
> -       if (cn->clk !=3D clk) {
> -               cn =3D kzalloc(sizeof(*cn), GFP_KERNEL);
> -               if (!cn)
> -                       goto out;
> +       cn =3D kzalloc(sizeof(*cn), GFP_KERNEL);
> +       if (!cn)
> +               goto out;
> =20
> -               cn->clk =3D clk;
> -               srcu_init_notifier_head(&cn->notifier_head);
> +       cn->clk =3D clk;
> +       srcu_init_notifier_head(&cn->notifier_head);
> =20
> -               list_add(&cn->node, &clk_notifier_list);
> -       }
> +       list_add(&cn->node, &clk_notifier_list);
> =20
> +found:
>         ret =3D srcu_notifier_chain_register(&cn->notifier_head, nb);
> =20
>         clk->core->notifier_count++;

This part looks good.

> @@ -4393,24 +4392,24 @@ int clk_notifier_unregister(struct clk *clk, stru=
ct notifier_block *nb)
> =20
>         list_for_each_entry(cn, &clk_notifier_list, node)
>                 if (cn->clk =3D=3D clk)
> -                       break;
> +                       goto found;
> =20
> -       if (cn->clk =3D=3D clk) {
> -               ret =3D srcu_notifier_chain_unregister(&cn->notifier_head=
, nb);
> +       ret =3D -ENOENT;
> +       goto out;
> =20
> -               clk->core->notifier_count--;
> +found:
> +       ret =3D srcu_notifier_chain_unregister(&cn->notifier_head, nb);

But then this part looks awful!

> =20
> -               /* XXX the notifier code should handle this better */
> -               if (!cn->notifier_head.head) {
> -                       srcu_cleanup_notifier_head(&cn->notifier_head);
> -                       list_del(&cn->node);
> -                       kfree(cn);
> -               }
> +       clk->core->notifier_count--;
> =20
> -       } else {
> -               ret =3D -ENOENT;
> +       /* XXX the notifier code should handle this better */
> +       if (!cn->notifier_head.head) {
> +               srcu_cleanup_notifier_head(&cn->notifier_head);
> +               list_del(&cn->node);
> +               kfree(cn);
>         }
> =20
> +out:
>         clk_prepare_unlock();
> =20
>         return ret;

Can we do this? Also, please split this part to a different patch that
we don't need to send back to stable trees. Presumably drivers aren't
calling the unregister function on an empty list or one that doesn't
contain the clk they're interested in because something should be
registered already by the register function.

Of course, the kernel-doc comment is also incorrect.  We need to get rid
of this notifier code. Sigh.

---8<---

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5052541a0986..f73b8bbe7ec3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4395,32 +4395,28 @@ EXPORT_SYMBOL_GPL(clk_notifier_register);
  */
 int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
 {
-	struct clk_notifier *cn =3D NULL;
-	int ret =3D -EINVAL;
+	struct clk_notifier *cn;
+	int ret =3D -ENOENT;
=20
 	if (!clk || !nb)
 		return -EINVAL;
=20
 	clk_prepare_lock();
=20
-	list_for_each_entry(cn, &clk_notifier_list, node)
-		if (cn->clk =3D=3D clk)
-			break;
-
-	if (cn->clk =3D=3D clk) {
-		ret =3D srcu_notifier_chain_unregister(&cn->notifier_head, nb);
+	list_for_each_entry(cn, &clk_notifier_list, node) {
+		if (cn->clk =3D=3D clk) {
+			ret =3D srcu_notifier_chain_unregister(&cn->notifier_head, nb);
=20
-		clk->core->notifier_count--;
+			clk->core->notifier_count--;
=20
-		/* XXX the notifier code should handle this better */
-		if (!cn->notifier_head.head) {
-			srcu_cleanup_notifier_head(&cn->notifier_head);
-			list_del(&cn->node);
-			kfree(cn);
+			/* XXX the notifier code should handle this better */
+			if (!cn->notifier_head.head) {
+				srcu_cleanup_notifier_head(&cn->notifier_head);
+				list_del(&cn->node);
+				kfree(cn);
+			}
+			break;
 		}
-
-	} else {
-		ret =3D -ENOENT;
 	}
=20
 	clk_prepare_unlock();
