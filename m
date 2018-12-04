Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7171C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 12:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CF8E20645
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 12:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ang4smmJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CF8E20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbeLDM6o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 07:58:44 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33703 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbeLDM6o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 07:58:44 -0500
Received: by mail-wm1-f67.google.com with SMTP id r24so9363770wmh.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 04:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BU1XjBeD1tQVwVbfyiuvmz0QDxeExllOnoq3LKOaY3M=;
        b=Ang4smmJ++DtTA2vrJRVBtWTNlQRY92MjF8dkXlEXMIW06OjtDPpjBHFatjBIje349
         3QzxzYVnodRKvqZQugAEg8l3fIAcnHz6z+dfM2qy/bWXM6OnBKqQbhYOqUpuoAOcTKsX
         SF+62ydEh2Qu61hyJ7sH1KJMqjrpvPnIe5LoMxbrqoSFY8vvsuucVIBaEEvJ8TbYeG9z
         PoKnxWjV9A5Zbjaka8IeZy3B7Op8HDXsYz0To9xteAtx6YnxsD3SnWAyvAQ8MZ4RrsxO
         g0118DrH4/ZB4kcUFmU9CQyt6LkvY2R2v3a8Ov964PBa2jHJLtbwAc65NWS2RtKqP7oH
         KOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BU1XjBeD1tQVwVbfyiuvmz0QDxeExllOnoq3LKOaY3M=;
        b=dAiQBKz+46d/x0Djyqtn84SCbWUrAw8o1U3iklAMeGVc65liu/jW4qwWDmvRROX3ii
         RCk1+UMGKUewtqXTWL9BRefUsTfr0Nl8mIslCBlZyMmSpH1YYkNAnM+PZxjnkCaFtqrg
         mcAEqmLiXIg0PG8ShAFW8PyqbHxl0DgDx0ItDUm38JeyQHSY4wE8P4JqnH/KLuW4NY+o
         jTReGytYiqs6nu1OpBX6s/YXWoln6F64QE/I604KmQ6z4hZhmr+8rpQGTqPYyhDBniP2
         o7fq9a2StsBCeplrPXad8h91z0kBPv7TCU24EBY4tu3lUpx/WXrJmXhxg3C3usKbpbz4
         gPPA==
X-Gm-Message-State: AA+aEWYGEe1gtRh4cPkVYaFZy29jSXm1uCYpqsycukuau/jRau0VPEy6
        oIYvrK/nHwAzE46JFyIPN1vG1A==
X-Google-Smtp-Source: AFSGD/U4nBudV5Gfw98oP845UsmbX5+qejUymLDyCs40ISEmWDnL+hQL87edtB4kWljA/vnpplQvdg==
X-Received: by 2002:a1c:709:: with SMTP id 9mr11210770wmh.39.1543928322316;
        Tue, 04 Dec 2018 04:58:42 -0800 (PST)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v8sm19623606wrq.53.2018.12.04.04.58.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 04:58:41 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson-gxbb: switch video clocks mux tables to static
Date:   Tue,  4 Dec 2018 13:58:39 +0100
Message-Id: <20181204125839.14505-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Makes the following sparse warnings silent:
drivers/clk/meson/vid-pll-div.c:58:26: warning: symbol '_get_table_val' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1585:12: warning: symbol 'gxbb_vid_pll_parent_names' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1620:12: warning: symbol 'gxbb_vclk_parent_names' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1980:12: warning: symbol 'gxbb_cts_parent_names' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:2036:12: warning: symbol 'gxbb_cts_hdmi_tx_parent_names' was not declared. Should it be static?

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/gxbb.c        | 8 ++++----
 drivers/clk/meson/vid-pll-div.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 794f6492a93d..9290465c0589 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1588,7 +1588,7 @@ static struct clk_regmap gxbb_vid_pll_div = {
 	},
 };
 
-const char *gxbb_vid_pll_parent_names[] = { "vid_pll_div", "hdmi_pll" };
+static const char * const gxbb_vid_pll_parent_names[] = { "vid_pll_div", "hdmi_pll" };
 
 static struct clk_regmap gxbb_vid_pll_sel = {
 	.data = &(struct clk_regmap_mux_data){
@@ -1623,7 +1623,7 @@ static struct clk_regmap gxbb_vid_pll = {
 	},
 };
 
-const char *gxbb_vclk_parent_names[] = {
+static const char * const gxbb_vclk_parent_names[] = {
 	"vid_pll", "fclk_div4", "fclk_div3", "fclk_div5", "vid_pll",
 	"fclk_div7", "mpll1",
 };
@@ -1983,7 +1983,7 @@ static struct clk_fixed_factor gxbb_vclk2_div12 = {
 };
 
 static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-const char *gxbb_cts_parent_names[] = {
+static const char * const gxbb_cts_parent_names[] = {
 	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
 	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
 	"vclk2_div6", "vclk2_div12"
@@ -2039,7 +2039,7 @@ static struct clk_regmap gxbb_cts_vdac_sel = {
 
 /* TOFIX: add support for cts_tcon */
 static u32 mux_table_hdmi_tx_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-const char *gxbb_cts_hdmi_tx_parent_names[] = {
+static const char * const gxbb_cts_hdmi_tx_parent_names[] = {
 	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
 	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
 	"vclk2_div6", "vclk2_div12"
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index b3370ea7beac..88af0e282ea0 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -55,8 +55,8 @@ static const struct vid_pll_div vid_pll_div_table[] = {
 #define to_meson_vid_pll_div(_hw) \
 	container_of(_hw, struct meson_vid_pll_div, hw)
 
-const struct vid_pll_div *_get_table_val(unsigned int shift_val,
-					 unsigned int shift_sel)
+static const struct vid_pll_div *_get_table_val(unsigned int shift_val,
+						unsigned int shift_sel)
 {
 	int i;
 
-- 
2.19.2

