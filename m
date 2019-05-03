Return-Path: <SRS0=gieW=TD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADC2C43219
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 17:44:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F1B720675
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556905457;
	bh=yf3cIixxRlrd596LCv3gAs6nxjFIqNhsij41V1dUymg=;
	h=In-Reply-To:References:To:Cc:From:Subject:Date:List-ID:From;
	b=aea2IRM+TulhhlVzR3IY3NYUeESiDY9ZiN3reXWcd5qF0cjl++F3kMHXK+hJUIspI
	 y/R1O5WiBz6c0V+HD3JS7dfpWZZsA+U/ONHznuYiCf0BVLOr+Tc1rcBUvOhfhlVZ9Z
	 WHHVXhBVU+uCJZL9ItLskNccXiLj3/JqwV2tFpNk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbfECRoR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 May 2019 13:44:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:32876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbfECRoQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 May 2019 13:44:16 -0400
Received: from localhost (unknown [104.132.0.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5108320675;
        Fri,  3 May 2019 17:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556905455;
        bh=yf3cIixxRlrd596LCv3gAs6nxjFIqNhsij41V1dUymg=;
        h=In-Reply-To:References:To:Cc:From:Subject:Date:From;
        b=vVVBNMNzTd5z/b86sgfE535qXL3piVEH6f4/WQ+hDGOzbfRkcjmq0nAG90hFaH+w2
         YWFSzZKH4k/KbX8tcp0/KkqVEA0PhEOvsKJWhBM0kgazNzm1ajje0iIvk4d9Zs2DS6
         r9zq78cgjYVEqGYKhS4QaS4jgPKAAhSYY8ngmPdg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190503163322.GH81578@ediswmail.ad.cirrus.com>
References: <20190430144412.20950-1-ckeepax@opensource.cirrus.com> <155664268919.168659.14590969678316998228@swboyd.mtv.corp.google.com> <20190501083317.GF81578@ediswmail.ad.cirrus.com> <155674078882.168659.17440291177352926788@swboyd.mtv.corp.google.com> <20190503163322.GH81578@ediswmail.ad.cirrus.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        patches@opensource.cirrus.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] clk: Ensure new parent is looked up when changing parents
Message-ID: <155690545447.200842.5551565192328786460@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 03 May 2019 10:44:14 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-05-03 09:33:22)
> On Wed, May 01, 2019 at 12:59:48PM -0700, Stephen Boyd wrote:
> > Quoting Charles Keepax (2019-05-01 01:33:17)
> > > On Tue, Apr 30, 2019 at 09:44:49AM -0700, Stephen Boyd wrote:
> > > > Quoting Charles Keepax (2019-04-30 07:44:11)
>=20
> Thank you for the explanation think I am starting to get there.
>=20
> > I don't expect parents[i].core to be populated until we do the fallback
> > string match in this function when the globally unique names match or if
> > it's already populated by some other path calling
> > clk_core_fill_parent_index(). The problem is we just fixed a long
> > standing regression in this function with commit ede77858473a ("clk:
> > Remove global clk traversal on fetch parent index"). Calling
> > clk_core_fill_parent_index() will bring that performance problem back,
> > so we need to figure out how to find the index for a clk without doing
> > the global search.
> >=20
>=20
> There is a slight error in the commit message there I think, the
> change doesn't affect clk_mux_determine_rate_flags which still
> calls clk_core_get_parent_by_index so will still do the full
> lookup. It looks like it affects clk_calc_new_rates instead.
>=20
> Which I guess does raise the question would an optimisation on
> the determine_rate path help these power issues as well?

Yes I would think that determine_rate() is iterating over parents and
trying to find them again and again even when there are holes and that's
probably wasting time. I hope we can fill the parent cache of a clk with
the error pointer indicating the clk will never appear (-ENOENT?) and
then skip over it in this case.

>=20
> > It seems that some clk providers specify parents that may never exist,
> > so we'll possibly spend time looping through the parents each time doing
> > a global string comparison on hundreds of clks. It would be best to
> > avoid that, so we shouldn't really do any sort of caching here except
> > for the one clk_core pointer we already have passed in.
> >=20
> > So you're saying this happens in the clk_set_parent() path, where the
> > parent passed into this function has never been cached before?
>=20
> Yeah that seems to be what is happening in my case. As best I
> can figure out so far, this relates to our clocks not having
> any rate setting capabilities, as it looks like most of the
> cache population comes from those paths.

Makes sense!

>=20
> > +
> > +             /* Maybe it hasn't been cached (clk_set_parent() path) */
> > +             if (parent =3D=3D clk_core_get(core, i))
> > +                     return i;
>=20
> This part does fix my issue. Is there a reason not to update
> core->parents[i].core on this path?
>=20

Nope. I though clk_core_get() did it already, but it doesn't. Thanks for
catching it. Find the new patch attached:

---8<---
Subject: [PATCH] clk: Cache core in clk_fetch_parent_index() without names

If a clk has specified parents via clk_hw pointers it won't specify the
globally unique names for the parents. Without the unique names, we
can't fallback to comparing them against the name of the 'parent'
pointer here. Therefore, do a pointer comparison against the clk_hw
pointers too and cache the clk_core structure if they match. This fixes
parent lookup code for clks that only specify clk_hw pointers and
nothing else, like muxes that are purely inside a clk controller.

Similarly, if the parent pointer isn't cached after trying to match
clk_core or clk_hw pointers, lookup the pointer from DT or via clkdev
lookups instead of relying purely on the globally unique clk name match.
This should allow us to move away from having to specify global names
for clk parents entirely.

While we're in the area, add some comments so it's clearer what's going
on. The if statements don't lend themselves to much clarity in their raw
form.

Fixes: fc0c209c147f ("clk: Allow parents to be specified without string nam=
es")
Reported-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index dc05cb339761..dcb7e1cddd2d 100644
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
+	int index =3D core->parents[p_index].index;
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
@@ -1612,20 +1612,37 @@ static int clk_fetch_parent_index(struct clk_core *=
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
-		/* Fallback to comparing globally unique names */
-		if (!strcmp(parent->name, core->parents[i].name)) {
-			core->parents[i].core =3D parent;
-			return i;
+		/* Maybe core hasn't been cached but the hw is all we know? */
+		if (core->parents[i].hw) {
+			if (core->parents[i].hw =3D=3D parent->hw)
+				break;
+
+			/* Didn't match, but we're expecting a clk_hw */
+			continue;
 		}
+
+		/* Maybe it hasn't been cached (clk_set_parent() path) */
+		if (parent =3D=3D clk_core_get(core, i))
+			break;
+
+		/* Fallback to comparing globally unique names */
+		if (!strcmp(parent->name, core->parents[i].name))
+			break;
 	}
=20
-	return -EINVAL;
+	if (i =3D=3D core->num_parents)
+		return -EINVAL;
+
+	core->parents[i].core =3D parent;
+	return i;
 }
=20
 /*
--=20
Sent by a computer through tubes
