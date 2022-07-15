Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E89C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbiGOQA3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiGOQA0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:00:26 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D39562A4C
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:00:26 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 859783200A14;
        Fri, 15 Jul 2022 12:00:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 15 Jul 2022 12:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900824; x=1657987224; bh=G9
        EdpfN70sJON9GjfksyeNoCezBX2s+ydZvfZcqFDJE=; b=VpDK85SDsLl4kk/DbF
        xz2P7AF+t2NNzjyG9BmfmTbuCunn0Vwm8ihXxviMYo4dKh+H7+iDBEnwouAq9zaI
        pOQCju5/4RCOU2TLlVEEOj3cEjhe1vD4yM88PvyUWhjRl/VdgZpoZ2eYoxukl6mv
        OthE+1CL8XqIzzSaceJj04WjU15lK7B9AlPzXHSvexOFgfnxBL4Ha9a4xDjxWeea
        uthtYfXtZhbM/KJ47BA0Qnjd8LPKZoWxUcxI1m6a34q/N9jZuoknGUtokm2OD4YR
        aUrFQ/XhEx7IaNOeNxrZhQMpeQjSkf4ic6wNUHQlcSBMCLhbniWL6m3KIi8tLvDs
        Bnxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900824; x=1657987224; bh=G9EdpfN70sJON
        9GjfksyeNoCezBX2s+ydZvfZcqFDJE=; b=hfkw45AF2Q3MP84TUD9C6M+Qe7+wW
        KfCuChfikrgGJSxGTopsAeGm3dNgDGeweqlnic0FyRbNkH1QWEWLRRsOI7qIUj6h
        bYcZOnWG7ys2t740ShdrKFl562IDuxV0jm3Kuw775Vv2o6LclrpxJk4l/hkX1344
        W3znh4nq1mz0VWdu6DMfcDBmgphfXiJNWWzmzih8dyacXsWZnpaWcfgJvv/rR/0W
        cFEEUspZ2/wuC7iOsAd8d14+U1+WzwOSxCKu4KvJrhkKAbEuB0F2HbpTTl1RgJmC
        +pIp89c5HhW85N3oaI3QY10hzDHFavxdDKRyz9uQcrFA1XgJA6UV1Kuvg==
X-ME-Sender: <xms:F4_RYrlnsDBjZdJPkO4ky8rcX-kMt4E5TJclZ8WV7a7xKlyWg39EhA>
    <xme:F4_RYu17zoxfavItMPs1o-mv3uf9ldeQcJY7EXH5NPmqmccta_U3D2NfJb4IPrf4Q
    qMeJyrA1GE_O6Y5bWI>
X-ME-Received: <xmr:F4_RYhoKHjMeIpO64W3ByMQpOJNn0qBW2iMQbqyQP1FikNjIFAOc42ta920AshW3dtF8zs8ut4d7yZtuMhqE_gKeco1w9klnR-PUCNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:F4_RYjkVueET7h8CUSypg3r9F_d0Sbb0YUWsd8XFYWotx8deVAfu1g>
    <xmx:F4_RYp0Dr59j_TXSdiiUpaCK-fW-VjSRI9O3eHunwwFYlkCxfXMz5A>
    <xmx:F4_RYis0Zjbx1_fZjr5WHCeTyt2TTrHzp45BCA3MnkogS88OTlgAGA>
    <xmx:GI_RYiu3Af3hnpFh7lc8f7CiHapOdDDalOjmoVPAxtrlRgnHSDfFvQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:22 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 01/28] clk: bcm: rpi: Create helper to retrieve private data
Date:   Fri, 15 Jul 2022 17:59:47 +0200
Message-Id: <20220715160014.2623107-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The RaspberryPi firmware clocks driver uses in several instances a
container_of to retrieve the struct raspberrypi_clk_data from a pointer
to struct clk_hw. Let's create a small function to avoid duplicating it
all over the place.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 73518009a0f2..6c0a0fd6cd79 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -73,6 +73,12 @@ struct raspberrypi_clk_data {
 	struct raspberrypi_clk *rpi;
 };
 
+static inline
+const struct raspberrypi_clk_data *clk_hw_to_data(const struct clk_hw *hw)
+{
+	return container_of(hw, struct raspberrypi_clk_data, hw);
+}
+
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
@@ -176,8 +182,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 
 static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -194,8 +199,7 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 val = 0;
 	int ret;
@@ -211,8 +215,7 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk *rpi = data->rpi;
 	u32 _rate = rate;
 	int ret;
@@ -229,8 +232,7 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
-	struct raspberrypi_clk_data *data =
-		container_of(hw, struct raspberrypi_clk_data, hw);
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
 	struct raspberrypi_clk_variant *variant = data->variant;
 
 	/*
-- 
2.36.1

