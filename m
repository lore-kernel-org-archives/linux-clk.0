Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBDAC00140
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiHOPmd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbiHOPmQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:16 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69B1B4A4
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:15 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 6C5503200904;
        Mon, 15 Aug 2022 11:42:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 11:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578133; x=1660664533; bh=9m
        SIvZirEfrsLvGqMlF8wdE5r27omc05ePk56j5Bha4=; b=oL414DihjcOvbI3DFT
        u1NACEoLO6d/16VhwdijMaHnl9WlnMdfEon9kfeVlwhL4ioNI4f1mm1obwGMZIcI
        CEcyVoZfyuusrSYz+VIM+I6DoB03IXR05DSGTQWUAmVYLQWIGqAc8SFWnfZTjbk8
        BtkHmByWsHpOvGmD5GX/i5q0Szb0eb49H4ljcO5BV60P9EN7QPL1PqWAiW2/sXnG
        Ahe9LBNAz2aQS71H/ASU1Rq1XoUFthogL/KmjniTVzgaZ6/BNb8ID/eFQfpXwYE9
        e/vx72dXxPxpSbc4tOZpugLP4aLD1xv1tGVEk4BzCEE9DY2t3sJXrYZX615CHKWP
        oYsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578133; x=1660664533; bh=9mSIvZirEfrsL
        vGqMlF8wdE5r27omc05ePk56j5Bha4=; b=KJUkuumgaiYsLdklRYb1e6nL+PaO9
        HswI2Fj60tjHUa5WlWpev7sZ5mPj1MDBXbFUjWF7Hm0rfJNjMQ+qTZmrCyLL8IBu
        SXneBZCTl6DZ1/Hg4IHVYI9n73bbykTd42ZP1oSJMco/8Gemba01/u+dKQ2Cav21
        NML9kOxLKaTnoLU8IPzrzASKlZtCrsJWq3ZBhRpgUF3SLkEuF6MC9rV0KisrIccX
        9LyHWKdVkV2myFoAxR+DunGKz+8//8cLcJ7yUbVrPxgMUFBO9lsMYxoC692wbPhv
        n9+znk7dDu2+4TYWxcrfnxldan2Sp5hOctTsi9U4t/4MVLVxH8jJXoJ9w==
X-ME-Sender: <xms:VWn6YlDeUXjxe4FOSyjxOcK0NZv5j97GWT0G_0bpzjENe6ZfsO5Qrw>
    <xme:VWn6YjikTWKKqr34Y66Od_1sdarpSoF5-JK7UEW9OUoeNNBDJ8FOyqYDxV1VbwzIK
    yWe0plkPZMh0bmGJRw>
X-ME-Received: <xmr:VWn6YgmUmYcWNqaMvuCSW0fpReysCAi70MlWHUtwg96wZKPWBz5zabGv3U47>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VWn6YvyJk0Lbr3MK9-GRDRIWSrdUBJ8r0yb46iyz_zlzm5VvfRRXyw>
    <xmx:VWn6YqTsXd8NzaGDAW_ppiMpFoSzeFolnwM9dDSe-rKLnUxSsaIPxw>
    <xmx:VWn6Yia2r120qUKLF0GU_PncoKXDZbIV3RcGQc61vqBg_DLnXG1FkA>
    <xmx:VWn6YvLvaL2eA5cevI-tOXCr1sJD45hGGWTkMwikWgFPUwmt1znTgA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:13 -0400 (EDT)
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
Subject: [PATCH v8 05/25] clk: Clarify clk_get_rate() expectations
Date:   Mon, 15 Aug 2022 17:41:27 +0200
Message-Id: <20220815154147.1631441-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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

