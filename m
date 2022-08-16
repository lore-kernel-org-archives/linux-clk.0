Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50572C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235051AbiHPLvk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbiHPLu3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:29 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A3227B13
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:00 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 36D30320091C;
        Tue, 16 Aug 2022 07:25:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 07:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649158; x=1660735558; bh=9m
        SIvZirEfrsLvGqMlF8wdE5r27omc05ePk56j5Bha4=; b=NEgzF34Z+E6rSxRryR
        tGt1bbhoq4DQYd9Jkq7brg8naEHPjIgE4Uw8GBpV9roXzpShi1e+3Asa5pWwYG2P
        i8Ode3E1EPVa9e/KO0kdNkcuYLKHg34uW892utE/9dMRfPSJtLD3XiKyGv6xaOoE
        DqYR0Bzfuu99eMGmxv4IWK2jtIGkT6rEsa0NE+FYrmrDZDZMGExTVUUDzMRqcrDw
        FNbjqd9DAll/tCBKEWWRk8o+FLfYbt+4CEKou8bnAmt03SC3MRCtQPF7ybR0FVeK
        vMPW1fOPFBhvWtuiwsJLayttVuf2QdAlvrvhLdXUKNcGnUCD15KPwsv0hzyg8uGN
        feQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649158; x=1660735558; bh=9mSIvZirEfrsL
        vGqMlF8wdE5r27omc05ePk56j5Bha4=; b=4e0oTzrBc8+pz7Kf0u8jqR7S8/9/b
        8nE22YkN6soL93RsPnvD1FGLzGPVo2G9fuwu+qYzn/igT+JQvB5vxIttu2rq37vH
        Nr7bsq6aCMaIXM/MIdxtjmHYFM3+n6pBp7TRpHaqWPhcdG4xUt0dSkHqVdxqB7AB
        2E3vt8IOP/88Sy+P07hx3CqxHbdeyDFdSnUW0Z2Cnq+IvuxAzc/ObwUmHWpDL//X
        seBy1Yzn1tgO5DwyK8rxO7ufuNzJN0FzkAOfLrMi6M68jZNParRkLJg4u0rZrvJG
        fb0vEGSfbEsefRD9WLNma+tme91RNOOeWnQOd7BADh6SlXWOF0uDrkr3g==
X-ME-Sender: <xms:xn77YnmkBIU7dpZUPucBlnOSigQNyV-itTnbowQ9BNHU6GrI0FMF4A>
    <xme:xn77Yq3ZQKQtB4_R05QwQR5OpLpYKOePaldrlOl3XKvzFFG2oVmpORRsquc0-W_jv
    YMao5T_9f_rx7koa4U>
X-ME-Received: <xmr:xn77Ytp0Ctxmh9sFpeQjKwQITh2LCrTF6_8QgR51rkM0x0Uk0m8IRo0AoN4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xn77YvkISx9FKhMrKlGELtPUyMgZGDGQ5imKpXbz5Q79NfieyeMBUg>
    <xmx:xn77Yl1M0iw2bMzj_y2TGK9vWdzVSYdfcBIMzpDEpUfsFzyRgwKraA>
    <xmx:xn77YuutyJKEk5jVUPfW68ixMm4DPMi7b-tVpaRIh7vENVeqxb92_A>
    <xmx:xn77YuuviBCfwMRGY39O1ocS1BmedTUVCcgR9ZqLlD_WWQxi_rhAAA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:25:57 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 05/25] clk: Clarify clk_get_rate() expectations
Date:   Tue, 16 Aug 2022 13:25:10 +0200
Message-Id: <20220816112530.1837489-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
2.37.1

