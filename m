Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6C4C04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 21:54:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14ECA20850
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 21:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNVs5ODp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14ECA20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbeLCVyS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 16:54:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:56756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726156AbeLCVyR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 16:54:17 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E08B20864;
        Mon,  3 Dec 2018 21:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543874056;
        bh=2Wp/1VZ19iUdG965GD+O05IBYwAn8sHWLKyP+buAeI8=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=GNVs5ODpLxJrCOoWU07LeldxQuzX0J2t+M3qTzXdnZAizgYx+d6G6BPeDlYiDeVS4
         dp28eWLQqSlWKymFYSSgfjFq61o6GKxCkwr77MbP5ufHwxDB+GJDMq/rpOQD3gYtka
         LsCZpdAWhsibgfDlaygpTEugpZLbN2IY01xlvvbE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
X-Patchwork-Hint: ignore
In-Reply-To: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
Message-ID: <154387405554.88331.5413259014915237358@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [GIT PULL] clk: meson: updates for v4.21
Date:   Mon, 03 Dec 2018 13:54:15 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Neil Armstrong (2018-11-23 07:23:33)
> Dear clock maintainers,
> =

> Below is a request to pull updates for Amlogic clocks.
> =

> It covers essentially Meson GX Video clocks, Meson8b CPU clocks
> and 2 bindings changes.

Pulled into clk-next now.

I got this when testing:

drivers/clk/meson/vid-pll-div.c:58:26: warning: symbol '_get_table_val' was=
 not declared. Should it be static?
drivers/clk/meson/gxbb.c:1585:12: warning: symbol 'gxbb_vid_pll_parent_name=
s' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1620:12: warning: symbol 'gxbb_vclk_parent_names' =
was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1980:12: warning: symbol 'gxbb_cts_parent_names' w=
as not declared. Should it be static?
drivers/clk/meson/gxbb.c:2036:12: warning: symbol 'gxbb_cts_hdmi_tx_parent_=
names' was not declared. Should it be static?

which looks like nice sparse noise to silence.

It would also be nice to make that table of mux selectors const, is that
possible?

---8<----
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 30fbf8f1f190..b92df222f553 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1582,7 +1582,7 @@ static struct clk_regmap gxbb_vid_pll_div =3D {
 	},
 };
 =

-const char *gxbb_vid_pll_parent_names[] =3D { "vid_pll_div", "hdmi_pll" };
+static const char * const gxbb_vid_pll_parent_names[] =3D { "vid_pll_div",=
 "hdmi_pll" };
 =

 static struct clk_regmap gxbb_vid_pll_sel =3D {
 	.data =3D &(struct clk_regmap_mux_data){
@@ -1617,7 +1617,7 @@ static struct clk_regmap gxbb_vid_pll =3D {
 	},
 };
 =

-const char *gxbb_vclk_parent_names[] =3D {
+static const char * const gxbb_vclk_parent_names[] =3D {
 	"vid_pll", "fclk_div4", "fclk_div3", "fclk_div5", "vid_pll",
 	"fclk_div7", "mpll1",
 };
@@ -1977,7 +1977,7 @@ static struct clk_fixed_factor gxbb_vclk2_div12 =3D {
 };
 =

 static u32 mux_table_cts_sel[] =3D { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-const char *gxbb_cts_parent_names[] =3D {
+static const char * const gxbb_cts_parent_names[] =3D {
 	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
 	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
 	"vclk2_div6", "vclk2_div12"
@@ -2033,7 +2033,7 @@ static struct clk_regmap gxbb_cts_vdac_sel =3D {
 =

 /* TOFIX: add support for cts_tcon */
 static u32 mux_table_hdmi_tx_sel[] =3D { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-const char *gxbb_cts_hdmi_tx_parent_names[] =3D {
+static const char * const gxbb_cts_hdmi_tx_parent_names[] =3D {
 	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
 	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
 	"vclk2_div6", "vclk2_div12"
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-di=
v.c
index b3370ea7beac..88af0e282ea0 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -55,8 +55,8 @@ static const struct vid_pll_div vid_pll_div_table[] =3D {
 #define to_meson_vid_pll_div(_hw) \
 	container_of(_hw, struct meson_vid_pll_div, hw)
 =

-const struct vid_pll_div *_get_table_val(unsigned int shift_val,
-					 unsigned int shift_sel)
+static const struct vid_pll_div *_get_table_val(unsigned int shift_val,
+						unsigned int shift_sel)
 {
 	int i;
 =


