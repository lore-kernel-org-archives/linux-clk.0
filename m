Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BC8C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbiHPLwU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235147AbiHPLv7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:51:59 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B6BD7D28
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:46 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 0584832002FB;
        Tue, 16 Aug 2022 07:26:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 07:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649204; x=1660735604; bh=ks
        hy8iHs9TLE7pecnKYztZXpKnIq4e/dogqhRiXgHCk=; b=CwJrG8+1EvVq79SmJm
        iBcg+zmObnUUPTR4Rrc2aN49lpJLiwui6ii9QkPie9XQ/k1yn+t0C2IW19dfYd4Y
        Rdby4w1gKNc+iIYU46yZ4qYIagSAqaS522bWaTv86SemT844FgdaQ+v7W0izWmef
        eJrN0/9kRkbGYfCqHJCO8eut8dkTmzYKosnPzhb9cwW4NxT1kwz+VmbYqhEMc0BT
        Cs79MSA5wD4WxQD6YIdtyTl0ZzVI4zpnapmGb/mnZWgm7/fP67jZOV5KNHEk4vPo
        D1Dp0AN+BE/olF4yJI9rqCycKTnTmZGVd+4d2LVwE1x79B/M+CZNy/rRqOpxrEkD
        9mOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649204; x=1660735604; bh=kshy8iHs9TLE7
        pecnKYztZXpKnIq4e/dogqhRiXgHCk=; b=Y5Dtyx4+SPHTtQ+AkGg94Kvn2hKhw
        ufQ+UAplg/wjCWrv1FtocaTwT4mJfeE1lLt7T24IOfi3Hbeid1CaDQqjGS5+OKU6
        Lu2+p5bq8L5WtYgvpgIKzSmN5pApQMHu22tL7mg1AfTJqv3dUwCptjRD0/WYyFpo
        RSiSYDAGSBcfSGw+4yTI9WoIsu0ZRRsun3r9eYzLi5V4W+43N4w5K8dEdVpv/WXl
        H997eUgRTmGKAvoQuU80vq9hco1uHifJ0XbJ/vln+aIukQlxDERYHnnaTSVqd3We
        L38iVAjgro/jXvYwwL8CQFK8GYsYa2rDc5vceiGdamFZLqCdC0r4n8Cxg==
X-ME-Sender: <xms:9H77Yrj0cyPS2o9VPsDEtL_nAnMKOXmM3SUHnnF1n_oRRjA-QWAo8Q>
    <xme:9H77YoCe0rewALGAe_wnxPgIb11gs2j0yGoxIxHMpCwhth2QY7gwfzpWFLEhNAMEK
    AD6rcSL6Ladrk0PBOA>
X-ME-Received: <xmr:9H77YrHUdJREEwlMGs-9YR6HoLHS5sZge-H4I7SRMQcAMw9gUTEAIAkZpgE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9H77YoQB5QIYr2zhnCji8wuIYdPzYbd3SagcU6LkQGD3jc_piRDO5Q>
    <xmx:9H77YowB0hQF2QWB9LSuQEI40wCnYHP8Q1UGZWIkYhCh4AX1opMiJA>
    <xmx:9H77Yu4MxeB-QDGXfFMTYBXT1kN9zeAC_N-YZcZ3iZMSfVrx_mFA1w>
    <xmx:9H77YtoOLLHwORNRfS1pijCjXtPAp2azOY-6LN8CXmjN2YV7pmC4pw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:43 -0400 (EDT)
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
Subject: [PATCH v9 15/25] clk: Move clk_core_init_rate_req() from clk_core_round_rate_nolock() to its caller
Date:   Tue, 16 Aug 2022 13:25:20 +0200
Message-Id: <20220816112530.1837489-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_rate_request structure is used internally as an argument for
the clk_core_determine_round_nolock() and clk_core_round_rate_nolock().

In both cases, the clk_core_init_rate_req() function is used to
initialize the clk_rate_request structure.

However, the expectation on who gets to call that function is
inconsistent between those two functions. Indeed,
clk_core_determine_round_nolock() will assume the structure is properly
initialized and will just use it.

On the other hand, clk_core_round_rate_nolock() will call
clk_core_init_rate_req() itself, expecting the caller to have filled
only a minimal set of parameters (rate, min_rate and max_rate).

If we ignore the calling convention inconsistency, this leads to a
second inconsistency for drivers:

   * If they get called by the framework through
     clk_core_round_rate_nolock(), the rate, min_rate and max_rate
     fields will be filled by the caller, and the best_parent_rate and
     best_parent_hw fields will get filled by clk_core_init_rate_req().

   * If they get called by a driver through __clk_determine_rate (and
     thus clk_core_round_rate_nolock), only best_parent_rate and
     best_parent_hw are being explicitly set by the framework. Even
     though we can reasonably expect rate to be set, only one of the 6
     in-tree users explicitly set min_rate and max_rate.

   * If they get called by the framework through
     clk_core_determine_round_nolock(), then we have two callpaths.
     Either it will be called by clk_core_round_rate_nolock() itself, or
     it will be called by clk_calc_new_rates(), which will properly
     initialize rate, min_rate, max_rate itself, and best_parent_rate
     and best_parent_hw through clk_core_init_rate_req().

Even though the first and third case seems equivalent, they aren't when
the clock has CLK_SET_RATE_PARENT. Indeed, in such a case
clk_core_round_rate_nolock() will call itself on the current parent
clock with the same clk_rate_request structure.

The clk_core_init_rate_req() function will then be called on the parent
clock, with the child clk_rate_request pointer and will fill the
best_parent_rate and best_parent_hw fields with the parent context.

When the whole recursion stops and the call returns, the initial caller
will end up with a clk_rate_request structure with some informations of
the child clock (rate, min_rate, max_rate) and some others of the last
clock up the tree whose child had CLK_SET_RATE_PARENT (best_parent_hw,
best_parent_rate).

In the most common case, best_parent_rate is going to be equal on all
the parent clocks so it's not a big deal. However, best_parent_hw is
going to point to a clock that never has been a valid parent for that
clock which is definitely confusing.

In order to fix the calling inconsistency, let's move the
clk_core_init_rate_req() calls to the callers, which will also help a
bit with the clk_core_round_rate_nolock() recursion.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 75cfde9f917f..553e1e9eb300 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1415,8 +1415,6 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 		return 0;
 	}
 
-	clk_core_init_rate_req(core, req, req->rate);
-
 	if (clk_core_can_round(core))
 		return clk_core_determine_round_nolock(core, req);
 	else if (core->flags & CLK_SET_RATE_PARENT)
@@ -1464,8 +1462,8 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 	int ret;
 	struct clk_rate_request req;
 
+	clk_core_init_rate_req(hw->core, &req, rate);
 	clk_core_get_boundaries(hw->core, &req.min_rate, &req.max_rate);
-	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(hw->core, &req);
 	if (ret)
@@ -1497,8 +1495,8 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 	if (clk->exclusive_count)
 		clk_core_rate_unprotect(clk->core);
 
+	clk_core_init_rate_req(clk->core, &req, rate);
 	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
-	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(clk->core, &req);
 
@@ -2209,8 +2207,8 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 	if (cnt < 0)
 		return cnt;
 
+	clk_core_init_rate_req(core, &req, req_rate);
 	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
-	req.rate = req_rate;
 
 	ret = clk_core_round_rate_nolock(core, &req);
 
-- 
2.37.1

