Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523DCC43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbiGKPYc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbiGKPYc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:32 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C2C18E35
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:31 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 981975C018D;
        Mon, 11 Jul 2022 11:24:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 11 Jul 2022 11:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553070; x=1657639470; bh=G9
        EdpfN70sJON9GjfksyeNoCezBX2s+ydZvfZcqFDJE=; b=G61v6eQt9GAEwT0qbo
        tBway4GzlVaPpAsIxH2UIfX1TWW/PLE9GI9Qnkcydz8m/2XqTaRyY1PzaaDZiHWW
        4t4tn2YP6PbsjgYgD4M6wLyYh1ergBl5IQMQD7jl5TjJsJtaa49MuJ8zHpO8CY4Y
        gTm0hQ6EstzN4LdjvyXeguq1uXHusXXtQ4Y5TkD5A+FH+UVoOdhThRcwF3N+MW93
        K/vAcf47FmQUEJQleqmsgKkuVs/tnrqRRU8QLnlVpSMFYjJa0I5zn7146EayfXna
        Ry28Ueikg7lja7p2QknktvLdIaegA3JXBATyZBQj8N+5MyVJ4YmqIT2mdtKWepl2
        m1Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553070; x=1657639470; bh=G9EdpfN70sJON
        9GjfksyeNoCezBX2s+ydZvfZcqFDJE=; b=TH0Nf92hvtK+Ajlcu3drw5sasNwd/
        6/fgBXaw4AsXy6jqtuNJO7l1zqgh8whNEm2Yo6qE5KrLsU7Bx0EDAxSbkOwtG6oW
        QOTGyQhcHQuuKW2LFtPdElxru5y9Wc0anLn84ZWXKf7sG0R7jxP4j96BenjYc46V
        +Enf614B46YIsTCi8tvkr7KBnB4JWCyXjYl3LxOHm2mJYMO4OFI3DRoxFa7OKK1i
        D7zL9kNrgQOym3l2H8YISAIz3ahG8s353pwRHN/2tOlRxhPVFETLe9JmYrybGEjx
        YvUOFoCF2FaHIgg7O8ihdrZXsrOp3A3TMjQYypSzb8cw/n48XO2qm/chA==
X-ME-Sender: <xms:rkDMYu1hCc7JgMBNIDi6_sSehE5AFiTv2tjAve_hZeWqj5a-60GagA>
    <xme:rkDMYhG8azz68mMzpxmk_IHqYmSj4p5Veg1huyseYS7uD49RuqkiE017ZlzHAL_KZ
    W6hB69Cf3v6I5wB-_w>
X-ME-Received: <xmr:rkDMYm6x4pnwgLeDbvz472ithw3D-4TI-E6ROLmNQWwAuy5V_qwPoE2LZ5QI8IKOO_jfEf2oNQx31KEuy3IodIT6WBzMdA-X5fvSFks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rkDMYv3LOWtxn3q4wbgOQUjcpeLiwfcphSJOUVKOc8x9yBf1jZGoPQ>
    <xmx:rkDMYhHtYER9oLjWqyP5U-xPm1RQXsKWi5Pw9UG68ZvzXNt8cfYuJg>
    <xmx:rkDMYo_S1PzeFjEIF0g6Y5lxPk-yS01J3dXOlaFdTNAugGZGI8vjkw>
    <xmx:rkDMYp_lkHrp4oYM5_yvRidLxm1dEPB1cjXi7vK9WJOlksDjlkLqKQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:29 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 01/28] clk: bcm: rpi: Create helper to retrieve private data
Date:   Mon, 11 Jul 2022 17:23:57 +0200
Message-Id: <20220711152424.701311-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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

