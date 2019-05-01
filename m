Return-Path: <SRS0=T3R6=TB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D19C43219
	for <linux-clk@archiver.kernel.org>; Wed,  1 May 2019 19:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7F6D20651
	for <linux-clk@archiver.kernel.org>; Wed,  1 May 2019 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556740791;
	bh=cN0Ccce6Q5hghgIpi/VMZlO7Bg3QQwmDTX6DgwkP2hE=;
	h=In-Reply-To:References:From:Subject:To:Cc:Date:List-ID:From;
	b=H7IM8hlp42++kZqzEG2bVjc5CGCw10fQlSt9gDpsaJCVAlmCQMDgCOSW6TwWkXN1m
	 uAmRjeGJTaKgrcvkm8rWCB2n155Bf+MEEGywlWSywoFMC1kgbbdQjsczQskgwteAIy
	 dCLwv2mGZaWNDu8M6GRzH2CfrSiVp6aupGSEmxkw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfEAT7v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 May 2019 15:59:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:57498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726004AbfEAT7v (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 1 May 2019 15:59:51 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5F1720651;
        Wed,  1 May 2019 19:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556740789;
        bh=cN0Ccce6Q5hghgIpi/VMZlO7Bg3QQwmDTX6DgwkP2hE=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=1faprgN0lQPHxaM6rSgdZbPArpt6m6qbcN0S1U97U18B3jqLQWIaMjy0nW7NJtgJH
         CtSlnVV/IT6C2xSFHx31wQ9llPnM4vrrjGh3zGoxqd4qTkGXWLbvhZiVVO2VR9/+7d
         WAQBFc8SjAhJ+DGovOakLiYS+KU+tmvYATUQs9AI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190501083317.GF81578@ediswmail.ad.cirrus.com>
References: <20190430144412.20950-1-ckeepax@opensource.cirrus.com> <155664268919.168659.14590969678316998228@swboyd.mtv.corp.google.com> <20190501083317.GF81578@ediswmail.ad.cirrus.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] clk: Ensure new parent is looked up when changing parents
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        patches@opensource.cirrus.com
Message-ID: <155674078882.168659.17440291177352926788@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Wed, 01 May 2019 12:59:48 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-05-01 01:33:17)
> On Tue, Apr 30, 2019 at 09:44:49AM -0700, Stephen Boyd wrote:
> > Quoting Charles Keepax (2019-04-30 07:44:11)
> > > clk_core_fill_parent_index is called from clk_mux_determine_rate_flags
> > > and for the initial parent of the clock but seems to not get called on
> > > the path changing a clocks parent. This can cause a clock parent chan=
ge
> > > to fail, fix this by adding a call in clk_fetch_parent_index.
> > >=20
> > > Fixes: fc0c209c147f ("clk: Allow parents to be specified without stri=
ng names")
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > >  drivers/clk/clk.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index ffd33b63c37eb..5aa180180ee95 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1601,6 +1601,9 @@ static int clk_fetch_parent_index(struct clk_co=
re *core,
> > >                 return -EINVAL;
> > > =20
> > >         for (i =3D 0; i < core->num_parents; i++) {
> > > +               if (!core->parents[i].core)
> > > +                       clk_core_fill_parent_index(core, i);
> > > +
> >=20
> > Hm... are you not specifying 'names' for the parent, so just clk_hw
> > pointer? Maybe we need to compare clk_hw pointers with clk_hw pointers
> > and then fill in the core pointer with what we have in hand. Pretty much
> > at all costs we shouldn't call clk_core_fill_parent_index() here because
> > drivers may fall into the trap of searching the entire clk tree for a
> > pointer we already have.
> >=20
>=20
> Apologies perhaps I am misunderstanding how this new system
> works. In the event of the parent clocks being specified in
> DT, whilst going round this loop would you expect the clock to
> match on the core =3D=3D parent check?  Or on the fallback unique
> name check? My assumption was on the core =3D=3D parent check, and
> if that is the case how would you expect the parents[i].core
> field to have been populated?
>=20

I don't expect parents[i].core to be populated until we do the fallback
string match in this function when the globally unique names match or if
it's already populated by some other path calling
clk_core_fill_parent_index(). The problem is we just fixed a long
standing regression in this function with commit ede77858473a ("clk:
Remove global clk traversal on fetch parent index"). Calling
clk_core_fill_parent_index() will bring that performance problem back,
so we need to figure out how to find the index for a clk without doing
the global search.

It seems that some clk providers specify parents that may never exist,
so we'll possibly spend time looping through the parents each time doing
a global string comparison on hundreds of clks. It would be best to
avoid that, so we shouldn't really do any sort of caching here except
for the one clk_core pointer we already have passed in.

So you're saying this happens in the clk_set_parent() path, where the
parent passed into this function has never been cached before?
Otherwise, it looks like the only other case where it might be a problem
would be if a .round_rate() or .determine_rate() clk_op returns a parent
that hasn't been cached yet, maybe via hard-coding of the parent hw
pointer or just because they don't call clk_hw_get_parent_by_index().
I'd rather not cater to those corner cases by trying to optimize them,
so perhaps we can use this patch and avoid the regression while
supporting the use-cases we need?

----8<-----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index dc05cb339761..7ad1751bf2b4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -327,8 +327,7 @@ static struct clk_core *clk_core_lookup(const char *nam=
e)
 /**
  * clk_core_get - Find the clk_core parent of a clk
  * @core: clk to find parent of
- * @name: name to search for (if string based)
- * @index: index to use for search (if DT index based)
+ * @p_index: parent index to search for
  *
  * This is the preferred method for clk providers to find the parent of a
  * clk when that parent is external to the clk controller. The parent_names
@@ -360,9 +359,10 @@ static struct clk_core *clk_core_lookup(const char *na=
me)
  * provider knows about the clk but it isn't provided on this system.
  * A valid clk_core pointer when the clk can be found in the provider.
  */
-static struct clk_core *clk_core_get(struct clk_core *core, const char *na=
me,
-				     int index)
+static struct clk_core *clk_core_get(struct clk_core *core, u8 p_index)
 {
+	const char *name =3D core->parents[p_index].fw_name;
+	u8 index =3D core->parents[p_index].index;
 	struct clk_hw *hw =3D ERR_PTR(-ENOENT);
 	struct device *dev =3D core->dev;
 	const char *dev_id =3D dev ? dev_name(dev) : NULL;
@@ -400,7 +400,7 @@ static void clk_core_fill_parent_index(struct clk_core =
*core, u8 index)
 		if (!parent)
 			parent =3D ERR_PTR(-EPROBE_DEFER);
 	} else {
-		parent =3D clk_core_get(core, entry->fw_name, entry->index);
+		parent =3D clk_core_get(core, index);
 		if (IS_ERR(parent) && PTR_ERR(parent) =3D=3D -ENOENT)
 			parent =3D clk_core_lookup(entry->name);
 	}
@@ -1612,12 +1612,29 @@ static int clk_fetch_parent_index(struct clk_core *=
core,
 		return -EINVAL;
=20
 	for (i =3D 0; i < core->num_parents; i++) {
+		/* Found it first try! */
 		if (core->parents[i].core =3D=3D parent)
 			return i;
=20
+		/* Something else is here, so keep looking */
 		if (core->parents[i].core)
 			continue;
=20
+		/* Maybe core hasn't been cached but the hw is all we know? */
+		if (core->parents[i].hw) {
+			if (core->parents[i].hw =3D=3D parent->hw) {
+				core->parents[i].core =3D parent;
+				return i;
+			}
+
+			/* Didn't match, but we're expecting a clk_hw */
+			continue;
+		}
+
+		/* Maybe it hasn't been cached (clk_set_parent() path) */
+		if (parent =3D=3D clk_core_get(core, i))
+			return i;
+
 		/* Fallback to comparing globally unique names */
 		if (!strcmp(parent->name, core->parents[i].name)) {
 			core->parents[i].core =3D parent;
