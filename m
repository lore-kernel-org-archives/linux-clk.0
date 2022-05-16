Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69414C4321E
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243608AbiEPN1O (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235583AbiEPN0j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:39 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF613222A4
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:37 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 2B4A032009B2;
        Mon, 16 May 2022 09:26:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 16 May 2022 09:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707595; x=1652793995; bh=78
        mjLpgZpR0U86TTOmeBJjXTX7xn4htRFYw9i6mT6R8=; b=Lx4Q+UrbBiPCcrFTm2
        2atdPqcpBfijkpFblPGc5oCXgBNJJ/PvJYt3EB8xf7v0gby0W8QMxoAjVXARGYz+
        b48STvj8QPOUDcIm8GZmFxzebLm01Ha4d6Vm+2GtqwtVIVM59cGHqOb4PmGwkEuw
        Tpxx02W7DhJ9CehiG3oqZndB2XaSozuvKRofCsTmJoEMyrIZ+pb33jr/OKPFeyeZ
        wOTlzuQUNCnGQnXPV5y3BXkZr/6cLGX0yoKNB0CESwy+2BFpTSa0ukmnuDvpEpmL
        ZBO1q5fpJaF9uHfOL1sVpwITSGci8/zHLfVl+cgKE/+3aV+SupNZL3KlqvUS3liH
        5Jiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707595; x=1652793995; bh=78mjLpgZpR0U86TTOmeBJjXTX7xn4htRFYw
        9i6mT6R8=; b=bje3yoCdKWeQLq8nAXiNJB6/yQHFU69PTkZ1fOM7yl9JgZZ0jIX
        snMYZQAeskF1P5AS5Va+xfeMFvGzpta/ZGdZvpvuXZSARL3gBX+wGDtLAS5vcqy3
        G1fYAU/7U2OOayDc9mgu5SjPBFNJwarwyJfY2+4MwHGM6OTk1SFQ6SL1198xfILQ
        93WRb9VXsJZ/dlFp6egdB7iJwkCHHrK10Typi7xV7pf58AuCOyHgW17ZWMITWCwy
        bCkQ8pCr7h4HRGCKLWP1PueIAIPeSugjA4XNF1IJttc1RTHMzKpMsK0wqMflk3AP
        qz2KVGFfC7DQJggWC6uPAi4MfJITkch4oWg==
X-ME-Sender: <xms:C1GCYj7qvRJHprBog9Asrf-1lL7mt0oS-WQNbM7XyQIjAnAbLZhXEw>
    <xme:C1GCYo6MbpiysRaXJUyT9CnyUn_WJ9sbJrq0IELicEPfci1WPP3wL0Csf0G5WiAbH
    ozE9CtLng-YjpXjzTk>
X-ME-Received: <xmr:C1GCYqfEoefe6q5utoBEQETQdbu_suHwbSNUlg3gOKVUxvHO7DpUPLcd0oQdGWnKhBYyh9K8NYa7reozhhylEfgmbgpPtCR0n-TNvKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:C1GCYkIxZlekLDX1GDGcmxSJbphKmdZIifwJVYv3CsmzmnHqh-NPKQ>
    <xmx:C1GCYnIJ4OcBiCVwKelLij_HixIs2zV7I0ig8NXPZBNNY751caSw8Q>
    <xmx:C1GCYtwN3xTFodMqc7C5226nLdA9NyucgBzpBPxhO4NfBEbmrZC2wA>
    <xmx:C1GCYkDcAzjfz2t_JCKtGJ-b9tpXQJw98j79IZgJUrL_NV3vB1NIig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:35 -0400 (EDT)
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
Subject: [PATCH v5 18/28] clk: Introduce clk_hw_init_rate_request()
Date:   Mon, 16 May 2022 15:25:17 +0200
Message-Id: <20220516132527.328190-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk-divider instantiates clk_rate_request internally for its round_rate
implementations to share the code with its determine_rate
implementations.

However, it's missing a few fields (min_rate, max_rate) that would be
initialized properly if it was using clk_core_init_rate_req().

Let's create the clk_hw_init_rate_request() function for clock providers
to be able to share the code to instation clk_rate_requests with the
framework. This will also be useful for some tests introduced in later
patches.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-divider.c    | 20 ++++++++++----------
 drivers/clk/clk.c            | 20 ++++++++++++++++++++
 include/linux/clk-provider.h |  6 ++++++
 3 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f6b2bf558486..a2c2b5203b0a 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -386,13 +386,13 @@ long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 			       const struct clk_div_table *table,
 			       u8 width, unsigned long flags)
 {
-	struct clk_rate_request req = {
-		.rate = rate,
-		.best_parent_rate = *prate,
-		.best_parent_hw = parent,
-	};
+	struct clk_rate_request req;
 	int ret;
 
+	clk_hw_init_rate_request(hw, &req, rate);
+	req.best_parent_rate = *prate;
+	req.best_parent_hw = parent;
+
 	ret = divider_determine_rate(hw, &req, table, width, flags);
 	if (ret)
 		return ret;
@@ -408,13 +408,13 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 				  const struct clk_div_table *table, u8 width,
 				  unsigned long flags, unsigned int val)
 {
-	struct clk_rate_request req = {
-		.rate = rate,
-		.best_parent_rate = *prate,
-		.best_parent_hw = parent,
-	};
+	struct clk_rate_request req;
 	int ret;
 
+	clk_hw_init_rate_request(hw, &req, rate);
+	req.best_parent_rate = *prate;
+	req.best_parent_hw = parent;
+
 	ret = divider_ro_determine_rate(hw, &req, table, width, flags, val);
 	if (ret)
 		return ret;
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e5ebcfcfe4eb..8952c5c71af2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1400,6 +1400,26 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 	}
 }
 
+/**
+ * clk_hw_init_rate_request - Initializes a clk_rate_request
+ * @hw: the clk for which we want to submit a rate request
+ * @req: the clk_rate_request structure we want to initialise
+ * @rate: the rate which is to be requested
+ *
+ * Initializes a clk_rate_request structure to submit to
+ * __clk_determine_rate() or similar functions.
+ */
+void clk_hw_init_rate_request(const struct clk_hw *hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate)
+{
+	if (WARN_ON(!hw || !req))
+		return;
+
+	clk_core_init_rate_req(hw->core, req, rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_init_rate_request);
+
 static bool clk_core_can_round(struct clk_core * const core)
 {
 	return core->ops->determine_rate || core->ops->round_rate;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 58e5baa49db0..c8f25924fa05 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -42,6 +42,8 @@ struct dentry;
  * struct clk_rate_request - Structure encoding the clk constraints that
  * a clock user might require.
  *
+ * Should be initialized by calling clk_hw_init_rate_request().
+ *
  * @rate:		Requested clock rate. This field will be adjusted by
  *			clock drivers according to hardware capabilities.
  * @min_rate:		Minimum rate imposed by clk users.
@@ -60,6 +62,10 @@ struct clk_rate_request {
 	struct clk_hw *best_parent_hw;
 };
 
+void clk_hw_init_rate_request(const struct clk_hw *hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate);
+
 /**
  * struct clk_duty - Struture encoding the duty cycle ratio of a clock
  *
-- 
2.36.1

