Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10493C43219
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350282AbiD1Qrs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350296AbiD1Qrk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:40 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4BBB2476
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:25 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 2F15D5C0058;
        Thu, 28 Apr 2022 12:44:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 28 Apr 2022 12:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164265; x=1651250665; bh=R3
        Mfips9elzQe0hxvwYlSjomtPpizoCz9urzDRQu5Rs=; b=yuf5/dBVoJRT06ZWRD
        B17WSTaeeKm5YikcneA3W9puExGC31rnV+nZI+jpsPTcLZjWGDRAmL+JByFFvUo6
        /GWtvdtmrBTwKrgP0CMm/tnJl/THU+s/IXMuHaIn4VbSYfWatQ9Oaopbh0+Sqnj2
        ZHLzFCckN1VQTiHFdRgUJ+mZMs58XpozkM2JJBslQzmXGK6NwbobHel9rPCQ/yIn
        s/kwVpUW2CHcLrG5IYuzr+m7fBfAxztaYQpMye2xaT+WY2DbGcMQCterxRI1uV1c
        KQTQqILqSXvt+yikntMWvOO5FA+mwywOI518LeQEUR4E4Tsbl2qOuI87RJg3Zc7C
        ejdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164265; x=1651250665; bh=R3Mfips9elzQe0hxvwYlSjomtPpizoCz9ur
        zDRQu5Rs=; b=T0kqQzfa6vp6Pz1C6WaaoPqxaRzAIDaTshQLn9VqczLQ+k7QKzY
        W2A6ALrF3nOmBj20YJzODDTlpu2PBbZzyAH7EMHcGk/ZJe13tMY2alolvcn42LqS
        0s5TwlAiV/+kyCqMXnFO6XYQ8/qQY+OLbG8CFiVERlWEKiQyBTzRvPvjA8jFvj2h
        k0gdSQw/Oan1lvmcEUrhRpIpcpKBbGopxKDMMJ6qVI1lqmZ7Zf+4/+DHcjkngli7
        3Zo1vxuUxF3FqKdfIN7ds2o0ms2QMTEhKLfi0xn6Krr+DaOyG/sCrtzVDWrAMIFp
        UoEzvPRJEH1r/wNJ/wfJL0EtaYbWWmsjrEw==
X-ME-Sender: <xms:acRqYnXvAxGma0KtVhkA7SbtnhG-RA2nAWuxyDkCFBZJXxCQoucuwQ>
    <xme:acRqYvkuokUM7nrC42PzFMbuCa7fVhQeSbUEoHX7d8g2fq3QgkQd7aSdaAJtcqN-u
    zzrwTtoTKtD-X4IDG0>
X-ME-Received: <xmr:acRqYjYOLo9PaF28YNb2bbLkh_BG1O4mPJk8qhHWaWv8SpAcGG0s4RsPs0kU61RRiT7GLiFaBYfqeC8RTOnvrUDs0ExaOAgqgmlPJ7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:acRqYiX9C4oWfbRztUiyLIQrMtI56LVfjl12S_9WSHBSPoD9heeZqw>
    <xmx:acRqYhnL6TztQ9E1WOSz5vHs992rYnvX87xInXU6OaG3rWdbW1OgPw>
    <xmx:acRqYveL9mWqt30nGy9egXRhvX50Nls3jj1Se8l_oUl879Jnfgd0MA>
    <xmx:acRqYqdVrULTPbFMpikqQHo_4lG-dgUdkMNlo2zSfagAr2DGixtkog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:24 -0400 (EDT)
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
Subject: [PATCH v2 20/28] clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
Date:   Thu, 28 Apr 2022 18:43:30 +0200
Message-Id: <20220428164338.717443-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_mux_determine_rate_flags() will call into __clk_determine_rate()
with a clk_hw pointer, while it has access to the clk_core pointer
already.

This leads to back and forth between clk_hw and clk_core, while
__clk_determine_rate will only call clk_core_round_rate_nolock() with
the clk_core pointer it retrieved from the clk_hw.

Let's simplify things a bit by calling into clk_core_round_rate_nolock
directly.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e079f8b263d0..add5d576fbd5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -536,6 +536,9 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 	return now <= rate && now > best;
 }
 
+static int clk_core_round_rate_nolock(struct clk_core *core,
+				      struct clk_rate_request *req);
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -549,8 +552,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent = core->parent;
 		if (core->flags & CLK_SET_RATE_PARENT) {
-			ret = __clk_determine_rate(parent ? parent->hw : NULL,
-						   &parent_req);
+			if (!parent) {
+				req->rate = 0;
+				return 0;
+			}
+
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				return ret;
 
@@ -573,7 +580,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 
 		if (core->flags & CLK_SET_RATE_PARENT) {
 			parent_req = *req;
-			ret = __clk_determine_rate(parent->hw, &parent_req);
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				continue;
 		} else {
-- 
2.35.1

