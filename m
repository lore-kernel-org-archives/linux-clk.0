Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7D3C2BB41
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiHOPoK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232294AbiHOPnk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:43:40 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCAEB1DC
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:43:40 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id A6EFF320095B;
        Mon, 15 Aug 2022 11:43:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 15 Aug 2022 11:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578218; x=1660664618; bh=KC
        2kRBMKlZTS+P0FFMYYilN2O+LYi9UzyMErHe/hOkI=; b=eBg7d9zEaHtHbv6GWt
        L6/RHHl8G6PEL+brhKoWtbYJCY0B7r1YxP4JNw5CW7BTP+3Hn6/KGaXLJU3ia1jL
        p4Eh17DHuKjENa/QjOFm7m4YleYokqSAOSLibya1eHxlPoGHAhEzcmjJgALYB8xx
        6SmZkR57aRAUCXIkcggehVAmtz0azCu8NQnwfxKRovvhB2IwXUJ67mNfHdOW0keN
        +sVDjprJw4gY4q2vmU06mLCltkZrqJNwV4Hhd74gcouUDZkeVLkHgTTPhDYpUOKl
        HA2rn0AzVRSflzq1V9xMA9Kq+lNMwBmJ6sIAVD6JgGJjdj61wd5r1fqAkOYW3LiW
        diag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578218; x=1660664618; bh=KC2kRBMKlZTS+
        P0FFMYYilN2O+LYi9UzyMErHe/hOkI=; b=iRYTnt/M4jZvrg+eTHpl+W5otSBdW
        ull2Cde+j1atATcw5C36yfAlyyjxsWdPPPP0gYm15axUqfHGcpPBrpfahjjGkUa8
        tTeF7cS6KGjqaf9zQICC/0IWN/j5cBTtIiIq74cHpmo1pgVNRt4YOAGAd+Yh1YsU
        yMZyywBD7J1IzFhRUvNF8o8gllPup7G9pQb9NPScogz8M5/7yX913pj/JbV5vwkG
        YRAtJ6sPUm7R8TfdHWGOXOi+KgLvF3Gw37jP1KMwo6RIVBrzN5333gar9rZvbtMv
        5GmhNjt2bezFuDBpS/DUUbI+twzScyMCSCerlMx8iR6qIv7YZzP6SWgEg==
X-ME-Sender: <xms:qmn6YmvJEJQ7SJmYplrisgVbFPdcxhaES88wYsJKirsI4_R7MvIHUQ>
    <xme:qmn6YrcAtuAiwgWWxcFiJGmBhUyXgAYDaGLbEsGLACf5ft4yu4ZfdrLhZZOXoIzpe
    gdHllRi492jnaX30Hs>
X-ME-Received: <xmr:qmn6YhwQN4RvaSyrLYVUv9KKfd9HB7WJc8BcmxHehk-D1_wWnvKnnr3Dhzn5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qmn6YhNwnirGSyrxTy0rn7MDOJR6DX19ZXWx0uubTIDhbr5z2ndMVQ>
    <xmx:qmn6Ym-O7oV6jDJKQi9yetwXnWqLEqdEW1G0m6K4ItrzQ_YHMhLAwA>
    <xmx:qmn6YpX7xGsKoQi1nslSimyKDv3t2UeuzOFFWm_yaujFy74eDie0Lw>
    <xmx:qmn6Yn2aYZlNm5WD_C7xDrygexhaQiyl3hy7rM7PEKbOD7yKIbNcmw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:43:37 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 24/25] clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d
Date:   Mon, 15 Aug 2022 17:41:46 +0200
Message-Id: <20220815154147.1631441-25-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gfx3d clock is hand-crafting its own clk_rate_request in
clk_gfx3d_determine_rate to pass to the parent of that clock.

However, since the clk_rate_request is zero'd at creation, it will have
a max_rate of 0 which will break any code depending on the clock
boundaries.

That includes the recent commit 948fb0969eae ("clk: Always clamp the
rounded rate") which will clamp the rate given to clk_round_rate() to
the current clock boundaries.

For the gfx3d clock, it means that since both the min_rate and max_rate
fields are set at zero, clk_round_rate() now always return 0.

Let's initialize the min_rate and max_rate fields properly for that
clock.

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/qcom/clk-rcg2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 28019edd2a50..ee536b457952 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -908,6 +908,15 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 		req->best_parent_hw = p2;
 	}
 
+	clk_hw_get_rate_range(req->best_parent_hw,
+			      &parent_req.min_rate, &parent_req.max_rate);
+
+	if (req->min_rate > parent_req.min_rate)
+		parent_req.min_rate = req->min_rate;
+
+	if (req->max_rate < parent_req.max_rate)
+		parent_req.max_rate = req->max_rate;
+
 	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
 	if (ret)
 		return ret;
-- 
2.37.1

