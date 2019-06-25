Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34960C4646C
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 01:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05B9B20663
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 01:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561425433;
	bh=+hj47sTwmKBDJvyyLIh4W4IbUA1BkBMWX0D6j641nnw=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=Q9gSvQx375dgVoPuf7/3qxn6jbo6cdHFLDTk/S8txehexSVv0JqSluUw2cpZQbuWH
	 9nOBUj413AirMrggZueCMPBzqyM5VMw6MJcvOVlhNLPnNMYzrv10s0BTMLjer9L3T5
	 f2XXlTmhdmXOnekvR++6eH5THua2GCqHjqYBmnAY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbfFYBRM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jun 2019 21:17:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:39756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbfFYBRM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Jun 2019 21:17:12 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D2D520663;
        Tue, 25 Jun 2019 01:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561425431;
        bh=+hj47sTwmKBDJvyyLIh4W4IbUA1BkBMWX0D6j641nnw=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=OsfmJE8eR++j21vrxJwqy17Yga503MPRPpcQWmjPZI5IAx3z0bk4Ok6+BGvKbjfh5
         FTuP81eFgtILbUCGGQiQIb75faVHb0xeUMAht3h9wKbaqfULEZE1MzHcjbMeKUrf2Y
         ugeu7xYL2CDnBPEFufZFHyCRi9jv9g2nFIfoLTQo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1deb7a85-0859-54f1-950a-33de3a08f9fd@ti.com>
References: <1deb7a85-0859-54f1-950a-33de3a08f9fd@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: keystone: changes for 5.3 v2
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
User-Agent: alot/0.8.1
Date:   Mon, 24 Jun 2019 18:17:10 -0700
Message-Id: <20190625011711.3D2D520663@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2019-06-12 04:56:15)
> Hi Stephen, Mike, Santosh,
>=20
> Here's a 2nd take of the pull request for the clock changes for keystone =

> SoC for 5.3. The only change compared to the v1 is to add the required=20
> drivers/firmware change in. This avoids the nasty dependency between the =

> pull requests between the clock driver and firmware driver.
>=20
> -Tero
>=20
> ---

Thanks. Pulled into clk-next. I guess we should increase the size of the
number of parents that can exist to be more than a u8? We're close to
getting there with the new way of specifying clk parents, so maybe we
should expand it to an unsigned int, but then we may need to optimize
finding parents when searching through all the parents of a clk.

Also, there isn't any quantification of how much better it is to scan DT
for all the clks that are used and only register those ones. It would be
nice to understand how much better it is to do that sort of scan vs.
just populating all clks at boot time. It may be useful to make the code
generic because NXP folks also want to populate clks from DT so maybe we
should provide this from the core framework somehow to ask providers to
register a particular clk or not. I haven't thought about it at all, but
it may come up that we totally rewrite this code in the future to be
shared outside of the TI clk driver.

FYI: I had to apply this patch on top to make sparse happy.

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index b417cef35769..92b77d38dd1f 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2402,12 +2402,13 @@ devm_ti_sci_get_of_resource(const struct ti_sci_han=
dle *handle,
 	if (!res)
 		return ERR_PTR(-ENOMEM);
=20
-	res->sets =3D of_property_count_elems_of_size(dev_of_node(dev), of_prop,
+	ret =3D of_property_count_elems_of_size(dev_of_node(dev), of_prop,
 						    sizeof(u32));
-	if (res->sets < 0) {
+	if (ret < 0) {
 		dev_err(dev, "%s resource type ids not available\n", of_prop);
-		return ERR_PTR(res->sets);
+		return ERR_PTR(ret);
 	}
+	res->sets =3D ret;
=20
 	res->desc =3D devm_kcalloc(dev, res->sets, sizeof(*res->desc),
 				 GFP_KERNEL);

