Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74348EB64D7
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 19:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238289AbjFMTVL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 15:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjFMTVK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 15:21:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D038B8;
        Tue, 13 Jun 2023 12:21:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA454639DC;
        Tue, 13 Jun 2023 19:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B43C433D9;
        Tue, 13 Jun 2023 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686684068;
        bh=gmktvKd0cvOuO+tggD8U3ZBLhGXR6MBUypOu3qi+whs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TynZgYw8E9zDS+MsRloN1Krzb1+HN17uYqk48Y+Fgqkql4Rp02R12SLPikCvxe8oe
         2JPaZrTGOB3rDVpE+m5NnIpeZI/FudYI3/+i//vHlX89K78SS9nm+jpDkjzFOKM5Tg
         NwTrurHkPCpu2f5HWNPlnv40V7byuzM7klr6TbBe/DXP4nzCQVjCNdc0YX0cD3OEjo
         rRvvt5BZ2zEX2d+VLhylRi99T5XqpVKIg5e4T4AjwR9FcGAZLEQv1R14LdTSLZNaM9
         pHqgy1+NnUHpP5raYXi2iwNBpizsWnkjTNXGXBMZ/g51oUjhOR6iiU0xxJ+R2EiH+e
         9mTYCetZvkWCA==
Message-ID: <9f2bdc8f0750177b42f5a3b2b9aaec14.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <45fdc54e-7ab6-edd6-d55a-473485608473@oracle.com>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech> <20221018-clk-range-checks-fixes-v4-61-971d5077e7d2@cerno.tech> <45fdc54e-7ab6-edd6-d55a-473485608473@oracle.com>
Subject: Re: [PATCH v4 61/68] clk: sprd: composite: Switch to determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Dan Carpenter <error27@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        kernel-janitors@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 13 Jun 2023 12:21:06 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Harshit Mogalapalli (2023-06-13 10:11:43)
> Hi Maxime,
>=20
> On 05/05/23 4:56 pm, Maxime Ripard wrote:
> > The Spreadtrum composite clocks implements a mux with a set_parent
> > hook, but doesn't provide a determine_rate implementation.
> >=20
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >=20
> > The other trigger would be a call to clk_set_parent(), but it's far less
> > used, and it doesn't look like there's any obvious user for that clock.
> >=20
> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call to
> > clk_set_parent().
> >=20
> > The driver does implement round_rate() though, which means that we can
> > change the rate of the clock, but we will never get to change the
> > parent.
> >=20
> > However, It's hard to tell whether it's been done on purpose or not.
> >=20
> > Since we'll start mandating a determine_rate() implementation, let's
> > convert the round_rate() implementation to a determine_rate(), which
> > will also make the current behavior explicit. And if it was an
> > oversight, the clock behaviour can be adjusted later on.
> >=20
> > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/clk/sprd/composite.c | 16 +++++++++++-----
> >   1 file changed, 11 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
> > index ebb644820b1e..d3a852720c07 100644
> > --- a/drivers/clk/sprd/composite.c
> > +++ b/drivers/clk/sprd/composite.c
> > @@ -9,13 +9,19 @@
> >  =20
> >   #include "composite.h"
> >  =20
> > -static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
> > -                             unsigned long *parent_rate)
> > +static int sprd_comp_determine_rate(struct clk_hw *hw,
> > +                                 struct clk_rate_request *req)
> >   {
> >       struct sprd_comp *cc =3D hw_to_sprd_comp(hw);
> > +     unsigned long rate;
> >  =20
> > -     return sprd_div_helper_round_rate(&cc->common, &cc->div,
> > -                                      rate, parent_rate);
> > +     rate =3D sprd_div_helper_round_rate(&cc->common, &cc->div,
> > +                                       req->rate, &req->best_parent_ra=
te);
> > +     if (rate < 0)
> > +             return rate;
>=20
> As rate is unsigned long, it can never be less than zero, so the above=20
> if condition is never true. Smatch detected this.
>=20
> Also if we just change the type of rate from unsigned long to long, will =

> the return type of the function "sprd_comp_determine_rate" being int is=20
> correct?

The return type of the determine_rate clk_op is int. We can't change
that. Are you asking if long will be converted properly to an int when
it is signed?

I see that sprd_div_helper_round_rate() calls divider_round_rate() which
calls divider_round_rate_parent() which calls divider_determine_rate(),
so we might as well change everything here to call
divider_determine_rate() directly. That significantly cleans things up.

----8<----
diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
index d3a852720c07..ad6b6383e21f 100644
--- a/drivers/clk/sprd/composite.c
+++ b/drivers/clk/sprd/composite.c
@@ -13,15 +13,8 @@ static int sprd_comp_determine_rate(struct clk_hw *hw,
 				    struct clk_rate_request *req)
 {
 	struct sprd_comp *cc =3D hw_to_sprd_comp(hw);
-	unsigned long rate;
=20
-	rate =3D sprd_div_helper_round_rate(&cc->common, &cc->div,
-					  req->rate, &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
-
-	req->rate =3D rate;
-	return 0;
+	return divider_determine_rate(hw, req, NULL, cc->div.width, 0);
 }
=20
 static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
diff --git a/drivers/clk/sprd/div.c b/drivers/clk/sprd/div.c
index 7621a1d1ab9c..c7261630cab4 100644
--- a/drivers/clk/sprd/div.c
+++ b/drivers/clk/sprd/div.c
@@ -9,23 +9,13 @@
=20
 #include "div.h"
=20
-long sprd_div_helper_round_rate(struct sprd_clk_common *common,
-				const struct sprd_div_internal *div,
-				unsigned long rate,
-				unsigned long *parent_rate)
-{
-	return divider_round_rate(&common->hw, rate, parent_rate,
-				  NULL, div->width, 0);
-}
-EXPORT_SYMBOL_GPL(sprd_div_helper_round_rate);
-
 static long sprd_div_round_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long *parent_rate)
 {
 	struct sprd_div *cd =3D hw_to_sprd_div(hw);
=20
-	return sprd_div_helper_round_rate(&cd->common, &cd->div,
-					  rate, parent_rate);
+	return divider_round_rate(&cd->common.hw, rate, parent_rate, NULL,
+				  cd->div.width, 0);
 }
=20
 unsigned long sprd_div_helper_recalc_rate(struct sprd_clk_common *common,
diff --git a/drivers/clk/sprd/div.h b/drivers/clk/sprd/div.h
index 6acfe6b179fc..f5d614b3dcf1 100644
--- a/drivers/clk/sprd/div.h
+++ b/drivers/clk/sprd/div.h
@@ -64,11 +64,6 @@ static inline struct sprd_div *hw_to_sprd_div(const stru=
ct clk_hw *hw)
 	return container_of(common, struct sprd_div, common);
 }
=20
-long sprd_div_helper_round_rate(struct sprd_clk_common *common,
-				const struct sprd_div_internal *div,
-				unsigned long rate,
-				unsigned long *parent_rate);
-
 unsigned long sprd_div_helper_recalc_rate(struct sprd_clk_common *common,
 					  const struct sprd_div_internal *div,
 					  unsigned long parent_rate);
