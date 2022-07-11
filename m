Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746B6CCA47B
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiGKPZF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbiGKPZE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:04 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B56275C0
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:03 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 048955C0199;
        Mon, 11 Jul 2022 11:25:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 11 Jul 2022 11:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553103; x=1657639503; bh=AR
        N9NKe1bx2uquzIIAFTHapAX3QVFQI/DrzTuX5i0mA=; b=Qqy+HSieEVxSf5XMmM
        8+XC6rZBPST7hlR3Su3AcqmzY+NkhvZX3OJuiV68UiBrAu4vo/LMkJMcOLkVbGhA
        KOtlFbGiTmEOYWNnd39mN0dBu/wUgjHYeznQh39TdpFxK4dfXaRWR9v/6ilZd3r0
        HMD0g+3hmRkafEu80quXb3N6bM3iNoE0dRQscD0pg/R4J1xy6NozzW8Hngz4clEe
        ggk/kmSSNJ09kW29KI8V2E+nrNNM8avRlVZVogcAscjjHGmX6t0upCIBamK3wqoh
        N93oguoEIFezojDKYkJCRfbEEchtbtcGCEpPgrt+zZBKQKgGuEdbyD97v/DlSp4p
        cR5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553103; x=1657639503; bh=ARN9NKe1bx2uq
        uzIIAFTHapAX3QVFQI/DrzTuX5i0mA=; b=H7BABEhrzIAPlOseaehkff/t6bTXt
        ChU1sDwFL7dLy3E3+mAEaPj/0fYbpRZFzVVeUF0EoXCZsP6qQpoloz5cfXTrSx1f
        8OSHLPus3yF/DQRuDXUiXVifb7TOPVTkT/4TRJTO1H71WimCLFj172/SqpQeOVF9
        hMIJmRuRlZbKC9Ryff5a/M4OaaJ+yBBAzo9WeR/VDPoPlDzkp4irNcjd5QX5HaJL
        VAeVqqkWDpwT6ac5QOH9rvydHwWqQGV4GcFgOdR7A0CGd5HYzW2TME5qfXju0zjU
        5KFylWz/9F/yvEYHwQuipR06fMzGn9fV7DwuDczFzndXIz4kSzpZCEZgQ==
X-ME-Sender: <xms:zkDMYj2SbJZXo-5j1tnNzKo4hzaUJ6y8pSFJEodNr1Y-r3pg6vduRA>
    <xme:zkDMYiEuz5Ux_PhXlW5bO-z5Td1AbgOClVUuo9fCuGjgeCdZSIpt0xHeFhjEn8u47
    tiPVPzGRJgyvhOVg2Q>
X-ME-Received: <xmr:zkDMYj6idAg13NMO1I4nLk-m_L6IFPBJIf8Dh15h7V_yc5xYCVDVg18cl-RtAXXDMuIHloL5nBU8rLQ5JVSJjOheEtRyUORCwwxifMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zkDMYo00eP1j0vEKJaGkUc7U-3eVZo18sHmOrj6SpOFbZATswbemcA>
    <xmx:zkDMYmHSpN-Xf0RSaDYQ-z6Lu8pAz7Dc8CoNnGqCSx9sE0STRwVH6g>
    <xmx:zkDMYp9Vg94GfOkFsKovJCBOO4LZ0D5vdin7TQHORltROLGslFUnjA>
    <xmx:z0DMYu--2FbwfeDg8ngZ0FqenoXS0J9XDIOdZDMsBQqpphRGXSwVAQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:25:02 -0400 (EDT)
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
Subject: [PATCH v6 19/28] clk: Introduce clk_hw_init_rate_request()
Date:   Mon, 11 Jul 2022 17:24:15 +0200
Message-Id: <20220711152424.701311-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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
index 7a071c567800..195f051ee536 100644
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
index 12e9cbf533b2..2d08000346b1 100644
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

