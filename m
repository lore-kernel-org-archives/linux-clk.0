Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCEFC433DB
	for <linux-clk@archiver.kernel.org>; Mon, 29 Mar 2021 20:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A9B561922
	for <linux-clk@archiver.kernel.org>; Mon, 29 Mar 2021 20:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhC2Uaw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Mar 2021 16:30:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:45876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhC2Uav (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 29 Mar 2021 16:30:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08FA96190A;
        Mon, 29 Mar 2021 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617049851;
        bh=6DOuuDZHFOD4VnSACJp8NTL7I1SbBH+ZsPwELoDGO0k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AY/82NdQV7GFjMUnB6J3BvJmhUQCHUE07uVkqddOBfX8fuWYZq8vmCrz0MzWUfJBN
         dLlKiKmTvzNJ7iPdEqQ09YUfSkH2JScjOKNwwQkQnbPa7LqZJU27X4oKJlkPOvvUsg
         bdOOnhmUiVCFNHN9VnvTDXk2ZVlpRnfT+oLCFhSD09GbOIB4N5JyNcJ2g00DEQBr8a
         ZAJl+Zk6HDFn15v3UCmXMsE//7m1Z5lfsqbDVgpoi5/sHDfs77sYgHHKhGLnQjANQs
         WWhDN/gpdU1yz5/vILEgXCCW72RpFSfH0WNScHpEFZDG8EIOOxPoUq/oljoiJBEPtC
         iaxTCIItw0Z1A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAK8ByeJv3iHPG77ix35QkgHsCpZnnwPkGT1_fYFEUeuj5i5noQ@mail.gmail.com>
References: <20210305191307.15915-1-lb@semihalf.com> <161566785522.1478170.3268340283624516294@swboyd.mtv.corp.google.com> <CAK8ByeLEZJKZJ+5ajhO1LQbv6oSMny3WDQL9-e1fxYNR0eV8DQ@mail.gmail.com> <CAK8ByeJv3iHPG77ix35QkgHsCpZnnwPkGT1_fYFEUeuj5i5noQ@mail.gmail.com>
Subject: Re: [PATCH v1] clk: fix invalid usage of list_for_each_entry cursor
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, upstream@semihalf.com
To:     <lb@semihalf.com>
Date:   Mon, 29 Mar 2021 13:30:49 -0700
Message-ID: <161704984972.3012082.1839219245014187895@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> > >
> > > How about using list_empty()?
> > >
> > >         if (list_empty() || cn->clk !=3D clk)
> > >
> > > Then the diff is very small.
> >
> > Good point. I will use list_empty(). Thanks
>=20
> Although your comment was appealing to make the diff neat and small I
> realized it won't work after making the changes.
> Looking at the original code:
>     /* search the list of notifiers for this clk */
>     list_for_each_entry(cn, &clk_notifier_list, node)
>         if (cn->clk =3D=3D clk)
>         break;
>=20
>     /* if clk wasn't in the notifier list, allocate new clk_notifier */
>     if (cn->clk !=3D clk) {
>=20
> The list cursor (cn) in the comparison above will not be pointing to a
> valid entry not only when the clk_notifier_list is empty but also in
> the case when clk_notifier_list list was completely traversed without
> breaking from the list_for_each_entry loop on one of the entries.
> Therefore making the comparison
>=20
>     if (list_empty() || cn->clk !=3D clk) {
>=20
> will not help because if the list is not empty and there was no match
> cn will not point to a valid entry. I have not noticed that before.
> Based on that I propose to stay with my original fix.

Ok, so then use 'goto found' approach?

----8<----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5052541a0986..16634d5912be 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4357,20 +4357,19 @@ int clk_notifier_register(struct clk *clk, struct n=
otifier_block *nb)
 	/* search the list of notifiers for this clk */
 	list_for_each_entry(cn, &clk_notifier_list, node)
 		if (cn->clk =3D=3D clk)
-			break;
+			goto found;
=20
 	/* if clk wasn't in the notifier list, allocate new clk_notifier */
-	if (cn->clk !=3D clk) {
-		cn =3D kzalloc(sizeof(*cn), GFP_KERNEL);
-		if (!cn)
-			goto out;
+	cn =3D kzalloc(sizeof(*cn), GFP_KERNEL);
+	if (!cn)
+		goto out;
=20
-		cn->clk =3D clk;
-		srcu_init_notifier_head(&cn->notifier_head);
+	cn->clk =3D clk;
+	srcu_init_notifier_head(&cn->notifier_head);
=20
-		list_add(&cn->node, &clk_notifier_list);
-	}
+	list_add(&cn->node, &clk_notifier_list);
=20
+found:
 	ret =3D srcu_notifier_chain_register(&cn->notifier_head, nb);
=20
 	clk->core->notifier_count++;
