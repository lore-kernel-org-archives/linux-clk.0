Return-Path: <SRS0=4m2Q=TA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642F4C43219
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 16:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3228D2147A
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556642691;
	bh=lWEEoFZwjdF8QGDLE7Lg3PIEloUN9WtKB9Z+M65e27c=;
	h=In-Reply-To:References:From:Subject:To:Cc:Date:List-ID:From;
	b=IMQoOUsFeaEXmf7IzFSqEueSTSAfhd4O2xCVhlV0dlJNQSVyCzoPLuTJyyMzIglHW
	 HwhvI/ZIe8o9s6M1QhT5UbQQEkCw3h7yOZ8xWc55cFZEZH3ZGt1Ku0zIHNIm8Bd+/O
	 mrDJdWth1ax3/F/pFCUhn2NEWmtSZ5qfi9R02sO8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfD3Qou (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Apr 2019 12:44:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbfD3Qou (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Apr 2019 12:44:50 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A5F721670;
        Tue, 30 Apr 2019 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556642690;
        bh=lWEEoFZwjdF8QGDLE7Lg3PIEloUN9WtKB9Z+M65e27c=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=AkHsKikDfpMYv3dmGBhv0wXAB/6EQlDnG4KuH7eo9i/QYhMufbkcqs+iDQEJv9c2n
         dZ9aBhWzsBD0Z1gXs9HtSvEE3HVb1yWRJvgwFXhZalIcmd3UYzctSwEhzqgIPCHco6
         91Cel17Y7YhxZ6RjNB4iM1EAk2ljpxss2527vZyw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190430144412.20950-1-ckeepax@opensource.cirrus.com>
References: <20190430144412.20950-1-ckeepax@opensource.cirrus.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] clk: Ensure new parent is looked up when changing parents
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        patches@opensource.cirrus.com
Message-ID: <155664268919.168659.14590969678316998228@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 30 Apr 2019 09:44:49 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-04-30 07:44:11)
> clk_core_fill_parent_index is called from clk_mux_determine_rate_flags
> and for the initial parent of the clock but seems to not get called on
> the path changing a clocks parent. This can cause a clock parent change
> to fail, fix this by adding a call in clk_fetch_parent_index.
>=20
> Fixes: fc0c209c147f ("clk: Allow parents to be specified without string n=
ames")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/clk/clk.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ffd33b63c37eb..5aa180180ee95 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1601,6 +1601,9 @@ static int clk_fetch_parent_index(struct clk_core *=
core,
>                 return -EINVAL;
> =20
>         for (i =3D 0; i < core->num_parents; i++) {
> +               if (!core->parents[i].core)
> +                       clk_core_fill_parent_index(core, i);
> +

Hm... are you not specifying 'names' for the parent, so just clk_hw
pointer? Maybe we need to compare clk_hw pointers with clk_hw pointers
and then fill in the core pointer with what we have in hand. Pretty much
at all costs we shouldn't call clk_core_fill_parent_index() here because
drivers may fall into the trap of searching the entire clk tree for a
pointer we already have.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 114f0bffd630..c4fa341330fa 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1619,6 +1619,11 @@ static int clk_fetch_parent_index(struct clk_core *c=
ore,
 		if (core->parents[i].core)
 			continue;
=20
+		if (core->parents[i].hw =3D=3D parent->hw) {
+			core->parents[i].core =3D parent;
+			return i;
+		}
+
 		/* Fallback to comparing globally unique names */
 		if (!strcmp(parent->name, core->parents[i].name)) {
 			core->parents[i].core =3D parent;
