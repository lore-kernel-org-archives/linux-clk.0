Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073E0C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:28:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242705AbiEPN2F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243529AbiEPN1J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:27:09 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84D7289A0
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:27:02 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 8057532009A1;
        Mon, 16 May 2022 09:27:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 16 May 2022 09:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707620; x=1652794020; bh=PI
        uzbyO7A+ufIai1lujejQXo1UeRPgHN207KWVIj91w=; b=P7A/WQO/BVx/5R8D7V
        UNW/u1kAFybouJiohx7fXEWEpNDrycr51YMh5idltbiRw/T7qHeaMlj4fhFK7TM0
        nAlbhj2/d2Rcr6aRCHBT6cQhvcmRu+oV2eV5SxxgYU53BcWYU186sd22VRa6BVDu
        ZBhJZvS5XmPQ2SmJqhmeFlaiNT59x9NcG5RSeTdtU/KuMNb4EPjWt5ZdaPAcnhYf
        BAh4KIubCBrAU7y9SmdzXtsr5Ge2z1FF52U+TXSXrYR/VQKaYn07RTsl+SGTB7WT
        Ex+GUwwgEQng2ckCsPGq0aw7GXnJtFpWWh1orlxCcL8HA6xbT7J6CItTJUQ8fVV3
        uRUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707620; x=1652794020; bh=PIuzbyO7A+ufIai1lujejQXo1UeRPgHN207
        KWVIj91w=; b=lkeFHaso4zpkDFzzmXDN02iVhQ1IJVyxKIQIyKEtmKJMgJbjmlp
        TLmZSpxId01dmC4CaBZJA8SYrlVyd3Xvi4yaWILlSMEC9u4dt99sI5z0XuSey/Sb
        mV5GFgkef/yTOdZbozfzyOz1FHkGclh9uFKVJYgfMwnjD1+5mUmFIllPAcM3QHK5
        lwvgUFhxZ7skX58veJai9wa3Zwa1tXPTMd2Z9KoMpUSu6z/1k6WpvJG7cKm2k35G
        8y7bbACXLqavr2iYa3KMwnojseHwm+hbsnrQwMkr5OB8sGgyMNHY223qkbLvIjfo
        /w+BPEKF0YNiKgteA4cgn5F9dwPtlq1AvsQ==
X-ME-Sender: <xms:I1GCYrP_qSmAEQO9PlRUj-iuzePkNekms2-S5zOGCwLjxqnuLCqVBw>
    <xme:I1GCYl_NFrQcayvTud7iWpDx1pOmv9a9uE4aWcBqhXgp5oF4f8sTDvjFQu71Ph1Wm
    5ImVc8t_H2GP675jG4>
X-ME-Received: <xmr:I1GCYqQjLdcVWkWCpTvftaq7qsXsxdluZtSK2iv6eRS-MYTPpisHfjVyV7qll_f31y-c0aS6ZPuOqX9iOM-uL5zU4GxBNgT0JDsSwow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:I1GCYvvwUIRXVqo_MWJN1Pp9FEZGNrWuMtCKabIZrbIB3-h6Q9tGEQ>
    <xmx:I1GCYjfhnxxIS5uROCWl3rP1ZpXfZaLqXzvyj_4yNcmbQmywBPvcbA>
    <xmx:I1GCYr3qBKYGk2eGQ0rc7Mu6iHanFR2WNIpbbOPFauA89NP67LpF5A>
    <xmx:JFGCYkUvrcH4ctXDkL7aVjOQ8chp4SDQWUztxHVnLjE9J1QCwe-2jQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:59 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 25/28] clk: Introduce the clk_hw_get_rate_range function
Date:   Mon, 16 May 2022 15:25:24 +0200
Message-Id: <20220516132527.328190-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some clock providers are hand-crafting their clk_rate_request, and need
to figure out the current boundaries of their clk_hw to fill it
properly.

Let's create such a function for clock providers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c            | 16 ++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 364e6baa3d1c..54fbc6894e3d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -683,6 +683,22 @@ static void clk_core_get_boundaries(struct clk_core *core,
 		*max_rate = min(*max_rate, clk_user->max_rate);
 }
 
+/*
+ * clk_hw_get_rate_range() - returns the clock rate range for a hw clk
+ * @hw: the hw clk we want to get the range from
+ * @min_rate: pointer to the variable that will hold the minimum
+ * @max_rate: pointer to the variable that will hold the maximum
+ *
+ * Fills the @min_rate and @max_rate variables with the minimum and
+ * maximum that clock can reach.
+ */
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate)
+{
+	clk_core_get_boundaries(hw->core, min_rate, max_rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_rate_range);
+
 static bool clk_core_check_boundaries(struct clk_core *core,
 				      unsigned long min_rate,
 				      unsigned long max_rate)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 7f4f34ff2b83..c0bcf72d5ecd 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1235,6 +1235,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
 
-- 
2.36.1

