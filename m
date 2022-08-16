Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0636AC25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbiHPLvg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235112AbiHPLu1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:27 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A17C653F
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:25:51 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 04F1D3200932;
        Tue, 16 Aug 2022 07:25:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 16 Aug 2022 07:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649149; x=1660735549; bh=wk
        0Sqd9dl+QUsXUDPiBpUeqYKlJdHWrgnstCr5mfz3Q=; b=gEd/iroluHfRf5Wv8A
        pcG8Nq0MCYzsddxEwXqDSytYNDDI0q4wN6WbRtVHp0bj0vJ5dg91l2Mt2tx710v+
        a8UdjbrBhmv8joggjbLBqNQSmOOr3S8qoj1E1xkpIf6HsujfGUBSlOAZxNx62R9J
        5Ej9dIsFcr8+QyBBf972Jjm+YFWN0OHXFWZMMUv6RvCs3tnnnyqNrY4OeIL1OQEX
        OvNVX5crskgaP9Uy/dp1WlQn1F1prgM+bwofU9kZjRfplQyz44wyRWV0z/Q6aIg0
        zFKix5B4zEHjLQ4KRJpTLXEX9hCblDcuLbNM5B2f4iKY34UcXgj1ohOdgOVWOhqM
        3NpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649149; x=1660735549; bh=wk0Sqd9dl+QUs
        XUDPiBpUeqYKlJdHWrgnstCr5mfz3Q=; b=2Euss7joT7qTrHw+dnZhk5KoouMtn
        Mw1E9rX6JTGrvE02QcDHMlV7hhHed9qWjD3hrNLQVwSI2/fePmGQJN0cfnwX4DiN
        fRGC7ynNTvw2P7UEMTVicqYx85WI9BFYrLSXBADLFFdVWBs3g6D1TdF1LKP3bqFX
        wgN+UvJnzm5fLNRk9w9xFxfMEQSlrk6/9fOaa06AuASH4/T3ek3jXF+GxYiat0CH
        Ve8uZx2UIwgpfNKEskMHzOZuUV3ovRQ5ER7vYla30EAyIpUqEom71n5zBIBFmb5k
        OW85iDQ+huSBeer/lS6HS/Z3TkjLLMZQViBSJrTJXnv+7jB1YL1C27gTA==
X-ME-Sender: <xms:vX77Yg8ryBpP3WJ-A0O_SbJet0cIaT7X-lYaMEp-O23OFE-Im9jQyw>
    <xme:vX77YovrszkqLPFhHh5M8Kkk1_vE0ddlh_cclUhHi_0iJTCGZGju99YtgM9BS8OlL
    g2-3pz84UpqJqI6Ycw>
X-ME-Received: <xmr:vX77YmCEvtxGDuvEB-yRKvvIYOq77Q8u28cNEh1QwQn9jXbmjRv8zrWTE50>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vX77YgcJcLV2a_2O29uWkjikgtT2oTSt7w4bgpJ0_duEoxcH83oUkA>
    <xmx:vX77YlPmh4lFMOdhZe5xsOwDJKQHzHnNhKDl6vYydNu04Dvx6H72PQ>
    <xmx:vX77Yqk_Nne8W-Ng6c4W7GB7uNJSeWRI_yYQmUOwTG69hNoLNSu-sQ>
    <xmx:vX77YmGzUAklhc-MTqJHfGhPSfyelKqf3yNgWUVwqyZigzZSiv-Qiw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:25:48 -0400 (EDT)
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
Subject: [PATCH v9 03/25] clk: Skip clamping when rounding if there's no boundaries
Date:   Tue, 16 Aug 2022 13:25:08 +0200
Message-Id: <20220816112530.1837489-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 948fb0969eae ("clk: Always clamp the rounded rate") recently
started to clamp the request rate in the clk_rate_request passed as an
argument of clk_core_determine_round_nolock() with the min_rate and
max_rate fields of that same request.

While the clk_rate_requests created by the framework itself always have
those fields set, some drivers will create it themselves and don't
always fill min_rate and max_rate.

In such a case, we end up clamping the rate with a minimum and maximum
of 0, thus always rounding the rate to 0.

Let's skip the clamping if both min_rate and max_rate are set to 0 and
complain so that it gets fixed.

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a5e0ab8bd6be..9d63163244d4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1341,7 +1341,19 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
-	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+	/*
+	 * Some clock providers hand-craft their clk_rate_requests and
+	 * might not fill min_rate and max_rate.
+	 *
+	 * If it's the case, clamping the rate is equivalent to setting
+	 * the rate to 0 which is bad. Skip the clamping but complain so
+	 * that it gets fixed, hopefully.
+	 */
+	if (!req->min_rate && !req->max_rate)
+		pr_warn("%s: %s: clk_rate_request has initialized min or max rate.\n",
+			__func__, core->name);
+	else
+		req->rate = clamp(req->rate, req->min_rate, req->max_rate);
 
 	/*
 	 * At this point, core protection will be disabled
-- 
2.37.1

