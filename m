Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01B6C43334
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbiGOQBp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbiGOQBb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:01:31 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9270747BE
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:01:30 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 1E8ED32009C5;
        Fri, 15 Jul 2022 12:01:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 15 Jul 2022 12:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900888; x=1657987288; bh=0v
        bMlPACmQkqdMU+ZTBxKq/E0O3U4fCSA6J1jaa8YtI=; b=WGxzozxjXDFumjjPjS
        j8k2cvqlhEhpT3uqebEjXUbsfrG/fNiN7SBcTjdTT55HeepSdFbLfoXN4Z4iMipH
        B6n/Kg4ZiyVQFXU0nmwP8pQbV/eGQD8ffhTnZa9zaJ+Xi+2QUrTy/ihKP7Isnkqb
        GR6f/lyMmD5G5xUHCAHczcqzqX6zfisU0f0Bz61UW+FvHxZ21Rq6mcdqcbSYw14F
        0CWmWeETnaF2VU3FyOaoMlqzu+aBDy0kUL+qJYAl2X97wHbPWsUcvsKnGxkq2tDt
        riU93RMWTU6Kwi3InFPp9mkc4MzEm8+1wUHXejEEMSnLDcr77RJ8D5WHafOg+wku
        bxVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900888; x=1657987288; bh=0vbMlPACmQkqd
        MU+ZTBxKq/E0O3U4fCSA6J1jaa8YtI=; b=LZYSDAMJEmqUgURER5mNwYEBiC5Vs
        RDV5S+t+U7ZGO0+nNl5bi73DPw7PZpaKXgoDZJkg5UJCDUgNkXSxjF7oSIuwwBu2
        vTUU1/wB10FWKA2kRjatE6WnpgSFPIaSOu9MZ0CneeZQM3f/vrhlnCjw1fQRzx6z
        69b6TFAe0EXHItRf4b8/jahYywmyMZaLcP+E0fxbudnRkqWqLN0QvUSNZ2qrZ4rd
        YEwl7LlbocWDLk61AyzKMrXCucMvIgLxnT4RcWULklEnVTW+o/flaLKnlkqa09QK
        rU4+m1rn8TrUlmGWNHugIT1qcIoQYk58dLj9789TQIlXlV3AOSgcft3fQ==
X-ME-Sender: <xms:V4_RYkKx3gxLXNYgw7JtdWJKKezLMx98UGQ-n2V6M7XH8TrIihKkYQ>
    <xme:V4_RYkLh4HrEcsztdquFdhSBpeWLnHaEgDa9t5fLvBhlvkpw2llHyue6Zh66lrkSn
    6V7V2DgFoGNPk3sCJc>
X-ME-Received: <xmr:V4_RYkuNWTg6o98DigFskl00yBfxo1g5dAvA1uTOZJbGiXfJbgGtA7zGoAn0EAPJqKrLUACtVoE6pkBP1D4Q2QbgweQtdX1abwctfCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V4_RYhb3GQPgNWWKAnCN20OEPpK_aAcCL7fvQEU_b_1ho3DUx4vo7g>
    <xmx:V4_RYra8l77MCSAdXoS4wIpcNAR1fDUcm5oOquhSD5Sv4Fvtaa04zw>
    <xmx:V4_RYtB51cYIBZUPJVoQJNp1jHc70Arsib1pBllYUsp_29_vpgackQ>
    <xmx:WI_RYoTo3uYnYBmmkifi0z_xGwLN8utLdXz_oJn5wTtWWWsQ90GHAA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:01:27 -0400 (EDT)
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
Subject: [PATCH v7 17/28] clk: Change clk_core_init_rate_req prototype
Date:   Fri, 15 Jul 2022 18:00:03 +0200
Message-Id: <20220715160014.2623107-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The expectation is that a clk_rate_request structure is supposed to be
initialized using clk_core_init_rate_req(), yet the rate we want to
request still needs to be set by hand.

Let's just pass the rate as a function argument so that callers don't
have any extra work to do.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6f5284f6cab5..6670e61edb31 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1380,13 +1380,16 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 }
 
 static void clk_core_init_rate_req(struct clk_core * const core,
-				   struct clk_rate_request *req)
+				   struct clk_rate_request *req,
+				   unsigned long rate)
 {
 	struct clk_core *parent;
 
 	if (WARN_ON(!core || !req))
 		return;
 
+	req->rate = rate;
+
 	parent = core->parent;
 	if (parent) {
 		req->best_parent_hw = parent->hw;
@@ -1412,7 +1415,7 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 		return 0;
 	}
 
-	clk_core_init_rate_req(core, req);
+	clk_core_init_rate_req(core, req, req->rate);
 
 	if (clk_core_can_round(core))
 		return clk_core_determine_round_nolock(core, req);
@@ -2001,11 +2004,10 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	if (clk_core_can_round(core)) {
 		struct clk_rate_request req;
 
-		req.rate = rate;
 		req.min_rate = min_rate;
 		req.max_rate = max_rate;
 
-		clk_core_init_rate_req(core, &req);
+		clk_core_init_rate_req(core, &req, rate);
 
 		ret = clk_core_determine_round_nolock(core, &req);
 		if (ret < 0)
-- 
2.36.1

