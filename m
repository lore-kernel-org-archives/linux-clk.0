Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3360C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350250AbiD1QrQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350249AbiD1QrP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:15 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83B2B2467
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:00 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 278D75C0061;
        Thu, 28 Apr 2022 12:44:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 28 Apr 2022 12:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164240; x=1651250640; bh=u3
        aK/yL+t2bsEeuaQy2U5jnHPJFcA1Uh8VryTfIHwuo=; b=kTvUsc4UHp/bQYIq1c
        fjld7aYUx0rGMHB2PJFX+Df9k0+SJsHSmbqT/LUf5YOVQ8hp2p9K/3cfBtIn2aYW
        D6D1j1GC+EsQzJkbxyrvpT98EuL1vBO/RfINdUXWtLqzUvspe80G9SFPPKWgfeyi
        z71rQ5D8CI46OjQLPRDiKma/qjaCWeA/WInMpHMNBDXbeEsmrAd12W4+Pb6koRsI
        s4O/AG0DytEYSQ8vpwAZgv+aPAi0NyuxWWQxpBSY/uudBVIapjTSM8alTiFQ5gIK
        jo917lj/j6DhG8j1r5rjepj8F4orFEuKbyO7rqadce0X9me4gXsUpqz0A+OpByD5
        rwXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164240; x=1651250640; bh=u3aK/yL+t2bsEeuaQy2U5jnHPJFcA1Uh8Vr
        yTfIHwuo=; b=X5Wl5K30TmGoBcyZ2R0rIG/1xMTpE4r0i0D03pkHOaWZ+aYxBZn
        KSMrrgb8GujZSumJ7/e4lGGNXPm0d1dJQHg/RPEs1xwLpI1hVSWuuHrzY+dtmI2X
        6DCXQtCQKhLX8AfboOtiV+qfeeGof1OFbr78dt6CTLoJ0SmRwW4AZ+WGtUVeHJuo
        pugQLBKLuCzeiBWwLEjcFlAy6QHtNtG9vkcuVsW0IsrahTyaE8lqSPeVPKVrc3tr
        O/kQKj9b/ROYbO2VfjmbMiT+PdhfFIXQnyTNsshnEis0lGTHDDOEmX9oqUmc7v/N
        hKQgppX0BBQu4xQwPY6cRVrnBJv607xTD/w==
X-ME-Sender: <xms:T8RqYtR8rWd5ZJgCfgPWgjyR2jc9ioFeNBcH2M6h-sfIq25rDNcRjQ>
    <xme:T8RqYmy6ajbBA6ituKz8-hko16AkF3-WrfkNSCS5xotlJ1WgNrVFOGUtPewwO1QLf
    0C88XexHVZwUaW9ILM>
X-ME-Received: <xmr:T8RqYi3A3omyHBqLOj0Vbo-NtxwyxvVQdWH2TjyNKwt77wxitWMKZNBHlTIbDwJrKE1e2NKjZVBgm7kNS7Y_Xl_8G9c2FNDpsZq8wyY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehleetfeejteeivdetveegtdetgeffffdvkeeuheejuedvjeefvdekffel
    gfefieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:UMRqYlCt30hsgUOo2clE0dUwSGYctd1B0jWDGsN3az-DXGTiPydlcg>
    <xmx:UMRqYmhv9l4R94xrzrmhMleqO8OVpViyrEQZJ0hArQncfQEfZPKaVg>
    <xmx:UMRqYpp7yzsL1wVwNeJX5P58-5NRD7-wWXE0LcESNwQH-6yA9eit7A>
    <xmx:UMRqYrar9xRSVzFZ9IMiE9_b_W1wu7SRcMadBI8FXcWPoe4p4ziarA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:43:59 -0400 (EDT)
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
Subject: [PATCH v2 08/28] clk: tests: Add reference to the orphan mux bug report
Date:   Thu, 28 Apr 2022 18:43:18 +0200
Message-Id: <20220428164338.717443-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
index 64ae7e210e78..be23c19813d0 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -314,6 +314,9 @@ static void clk_orphan_transparent_single_parent_mux_test_exit(struct kunit *tes
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
2.35.1

