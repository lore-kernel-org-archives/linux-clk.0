Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54216C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235117AbiHPLv4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbiHPLua (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:30 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D515E65C
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:09 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id BF1473200927;
        Tue, 16 Aug 2022 07:26:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 16 Aug 2022 07:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649167; x=1660735567; bh=pF
        xYRZyB0FRERX7hanRyYPuks1o944pCOBiLlgMNcr8=; b=rzz74i5t7VOB39RuUZ
        W2zcbtu75GLkLcQDObB8se473fYVPChPx0RCgRCrhR6GCh2n8lRI6zKw72HZ579r
        J0a2PMOK94kUJk5M8zBOnwQBwLFEkdJunDX+3ij/qZG0TuBuhiXmJ0ia49QUrtcZ
        jYC1VrY9sG+cbIew786uKgWwzJa8LJGx25UNj3RDUhepnZSpH1ouMo2iqNKRDA3t
        ql2tARSBVL4j9e1OKwshrVBWgpUqYuFgqcuZCz83qQQnukpG0bsOep71hGRUyhzz
        7whwxt536YiYPSsK8BXBp9rPW631VsxJeBISal3K0sXJ+2aVrZ67jnl5BG0cy2Ar
        K6gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649167; x=1660735567; bh=pFxYRZyB0FRER
        X7hanRyYPuks1o944pCOBiLlgMNcr8=; b=g+UhR8IGeS73qozAM5ZVBmTM7F3a1
        vJWu0kUKaV462DGc0sZhycdrjqHsTz0MazWOB7qBsM+zkHcUQYw7IjQw6mbbg7LE
        5yJQG5qUz6xRw+Wxo3dq8+VVzRS8g0aEA/BNuYAvqGPBcbzQBz/+7Yi0ToyLQ4c5
        yZonvaNJok4Q6WM+GqE8XQrJSCEeGg+y9DwOLc85QfWWPn0wPwY1zqYuCcdXDbXI
        G7uWhgFMI1V7cFxeqFvfczypr+gC0c5iajknlresevoL1qADWKigzorWTAWoKOim
        qzoqBU7HczPTUCApjqmGgx3ubKgDq7ejuHQihvuA4gNlSoCcfJ1S9mChA==
X-ME-Sender: <xms:z377YrEhgBhWO5cSYYWzdyqpWyZ88CPEahAynAOVqLeYeLEFuR1GUA>
    <xme:z377YoV69WFZ_VEiSmQkaJmF5lcaEdeiTy54JJifmN-88e7HMmlhr8LK7DuypBFRK
    pp4CkR2Xe_ir7lSy9c>
X-ME-Received: <xmr:z377YtIAlYEkkF5VY9Dzhxc2b97Cyd8nUNFH7uN9gxZgdbWgLFQsTcARfYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehleetfeejteeivdetveegtdetgeffffdvkeeuheejuedvjeefvdekffel
    gfefieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:z377YpFxqS0I1nxhhD_8dXYBiMUYP8rF9mOFCJl4mP3HdYcGHJknxw>
    <xmx:z377YhVlHVnseg7rSkUxfXlmlBgNDVHN_RyK25K0xMPS3w4CzdajWA>
    <xmx:z377YkOEl0Cv7XGpZ3elmvJvaqAymD5_JXp_qpV9l4cYcNIo4pB2fQ>
    <xmx:z377YqNmKxmfHAHNXZz7El1w4M9GCRsZIcsgL-iTQgl5vAlUmB_mKA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:06 -0400 (EDT)
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
Subject: [PATCH v9 07/25] clk: tests: Add reference to the orphan mux bug report
Date:   Tue, 16 Aug 2022 13:25:12 +0200
Message-Id: <20220816112530.1837489-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some more context might be useful for unit-tests covering a previously
reported bug, so let's add a link to the discussion for that bug.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1a7cb482ec58..b8e32406a6e4 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -322,6 +322,9 @@ static void clk_orphan_transparent_single_parent_mux_test_exit(struct kunit *tes
 /*
  * Test that a mux-only clock, with an initial rate within a range,
  * will still have the same rate after the range has been enforced.
+ *
+ * See:
+ * https://lore.kernel.org/linux-clk/7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com/
  */
 static void clk_test_orphan_transparent_parent_mux_set_range(struct kunit *test)
 {
-- 
2.37.1

