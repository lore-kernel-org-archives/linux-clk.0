Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6561C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350247AbiD1QrM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349980AbiD1QrL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:11 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B69B2473
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:43:56 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 25E7F5C00F7;
        Thu, 28 Apr 2022 12:43:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 28 Apr 2022 12:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164236; x=1651250636; bh=fy
        y4sb3h2k1BRDDzhkFEDuMI2Jk8T2bOKAwH/JJJTq4=; b=f94P0slH8AIbtEMY4A
        OYvwFEpcydqfYGSQ/64ynPOhiovwjRd3z1AfAXXATTG7x5kiCLFT2GNkgFGs0hK1
        fzysUPMslGI7PmMsDmNVgBj7o5uwatH7OdB9mGN9ucmx5hS45ozvG/hEkUeV6EgN
        /L5RIE6lAHd8H9Q0OgNGX2Ip3ZJiJlI6nFiBwHIXtWje87Kg2UfYy4SOYtQ3Ate4
        HhdF95R+ZpN62enUsdohJLZBQvt47tg5N9kVSjE6D2ceAlnTBH59lcGikPPIKK87
        iM0dWqIz1XTjfgMJb6r2p00ECsiS7Z//967+1hCWr80LRNMev0JlQ2g6ggPU7+cz
        0xBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164236; x=1651250636; bh=fyy4sb3h2k1BRDDzhkFEDuMI2Jk8T2bOKAw
        H/JJJTq4=; b=OdPxNbxKjgHboAqIYi3QmjqxDEuk6edm4+mYE2Y/NS7RLGk+sZa
        ahXmUR2FZO+Xf1EH34fc0Svutn8/+tww9jyB4RbEPvy2crBRpolMLjS9C9GF6+cM
        8wsQt7i9X9ByueMTH9a1ui1AyZf/JJ9Ka4IUTslo1ghCsjqyVg4yyThs61dwz/QS
        SU5NFgExbQ/pgn9HMJHAj/ts0uIBel9IbKhwCUGwXS+3D0dpip3UCNisHkEw1WLn
        qaFabzckBnhwSN23qQ7LXsvcu3dR181ZQO/tKlKmn7ik/Olx7ejiMkKQhbmDEJGy
        utyQ3vwkGTCYcyHkgfWJSMm2F9x7zeAWRBQ==
X-ME-Sender: <xms:S8RqYr3GpIlPffC11meVGV01BUPqNXa4cVT2ryCmZNjD68oD3C19LA>
    <xme:S8RqYqGI6Ak06-01oYS_4ChtLtAYNfc9FJMVwGqQHtDlOKs_UlvkYYsOE59umshJS
    NHfcY4gmksu-K5pCyM>
X-ME-Received: <xmr:S8RqYr4qj6zNvB3rMcIwxaaymf7yLK4Wpaup8mrFltAcqB789gGOZGG0bbP_BCXJtWpxcZKFwCOXGf1-E0JN7GiqHMfy1shgPsVpTsk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TMRqYg1TZ4ndekwmXlkSB1cKNmBJA5yqCgU21kRwP-4Ej4CEmWJJdg>
    <xmx:TMRqYuHO22f3VURI7zWmw_4QY2qhzqbAv6TU2zz5R3FTM0EV-OaRsg>
    <xmx:TMRqYh_YxwpZ-xlq4qzgMIu2g98PKw0nvz9Kno-ThPAbJxjsK8hK1w>
    <xmx:TMRqYm_bx8SWBdd6mFWLRgGmYaHFpAqHw8O8p7i3623fNTy8vQN7tQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:43:55 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 06/28] clk: Clarify clk_get_rate() expectations
Date:   Thu, 28 Apr 2022 18:43:16 +0200
Message-Id: <20220428164338.717443-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As shown by a number of clock users already, clk_get_rate() can be
called whether or not the clock is enabled.

Similarly, a number of clock drivers will return a rate of 0 whenever
the rate cannot be figured out.

Since it was a bit ambiguous before, let's make it clear in the
clk_get_rate() documentation.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d228f96dfb0f..a1699f4a3d52 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1672,8 +1672,9 @@ static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
  * @clk: the clk whose rate is being returned
  *
  * Simply returns the cached rate of the clk, unless CLK_GET_RATE_NOCACHE flag
- * is set, which means a recalc_rate will be issued.
- * If clk is NULL then returns 0.
+ * is set, which means a recalc_rate will be issued. Can be called regardless of
+ * the clock enabledness. If clk is NULL, or if an error occurred, then returns
+ * 0.
  */
 unsigned long clk_get_rate(struct clk *clk)
 {
-- 
2.35.1

