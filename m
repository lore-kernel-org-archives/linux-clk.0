Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D240EC43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbiGKPYp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbiGKPYo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:44 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA454275C0
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:43 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 53E5E5C0193;
        Mon, 11 Jul 2022 11:24:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 11:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553083; x=1657639483; bh=yv
        9KGhC+qy1VsuXD+drVzU1oBKbOW0RK5GDUKIeq44I=; b=vqihhx2ClZnrVYRf5v
        zWKofuVBf+ZJs5+6mie5G0RtDvkcQZMIxDuOBh8+dDkyisZm2l5X3K47uiNdOgr0
        jsvbRHrcq/FKZoP2gDDlLp7EClJHK6xf40qe39dCTMD2jnHkfRk4qjFh3O6zwpwL
        MwptS8w0Nniu/8xVYINxGVe4PFjKvvjRIyAp323Qz43YibaCl3pl1E//IGnT0x3J
        /ufZN1rAjchbExlSXP5x+5xcYIhpZvJf5xbIkfIHvyMusrXSN50NZLJw8vqfTnO5
        eQe81++XzBRUYz0qjbdYHoLCc2b3/v6hCYnF+2mENDN1o7avZw+eKCilkN0+i+qk
        1CSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553083; x=1657639483; bh=yv9KGhC+qy1Vs
        uXD+drVzU1oBKbOW0RK5GDUKIeq44I=; b=FRxMQcFczwt1xxUquhshg/FPJmtjr
        xC+oRqjkHs+E5bCzPCH5Dr+Wk3fDTrHoT5uZAViPiJY/01Tz0aSptTox+rbx0kYm
        9G/qs8AZOuf1bDeWnnN5KJ9yks2j9rt+iwqOnKcZVptBrE3FRqhRIAnTvJSqMW0P
        eRokI8SBioj5UwGC7DTxRCAB+uBQmMe9mCrs6Jygx3LKAf9ySDjRxWK/CLdmkWwI
        qqgRqI4hMJJ1R1RBPEh2Oxq9FuMc8k4iLG0vr8hXnBDKCXbsnsHm7Yc1B9/TwP4u
        X88FHYMEdH42v4bXaWyVcuxA4xSWtZ1UGPmlRbRsISmRfISlCaqkW7i7w==
X-ME-Sender: <xms:u0DMYooOpImFsAq-4uPVuIfg_rfJnAeFZlsxOmkPtlf1vs6_8Q-JdA>
    <xme:u0DMYupIGFsbqMNy2AeRJdEkuIWMFb_57tgInsIgvQNomEx_Nm0Vzdm7YKvwpGify
    M6x1rLwSKqAzcE20ks>
X-ME-Received: <xmr:u0DMYtOf8bVLzyypVrkSPIygCKXanAGhhiLtpHrFyyQrdrzHteTY75Ta3AMS_pEv_tr4ZjgUEs6-D40It71NZCzB_1wwM6B-kMe9XLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:u0DMYv4K4CJkYZZWngoHS9LdtOzrrp75q7MxaPk0ZJKZ0m9opTf4cg>
    <xmx:u0DMYn6msMV4r31K3htUFXrEpTMv1ttIgCPRNpHO2n1miO0UJRMrmA>
    <xmx:u0DMYviz2iJQaYg6G4-MWgdzan38IZYI8VBfhlye_ZYMLhosWugP0g>
    <xmx:u0DMYkzUpdTGR06mo8fsHtE1OwCEjJogO1pysKBNw8V9h74090wBEw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:42 -0400 (EDT)
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
Subject: [PATCH v6 08/28] clk: Clarify clk_get_rate() expectations
Date:   Mon, 11 Jul 2022 17:24:04 +0200
Message-Id: <20220711152424.701311-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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
index 9d63163244d4..caa2eb640441 100644
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
2.36.1

