Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D13C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350298AbiD1Qrv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350316AbiD1Qrs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:48 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA432B2473
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:33 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 391705C0064;
        Thu, 28 Apr 2022 12:44:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 28 Apr 2022 12:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164273; x=1651250673; bh=T4
        MPclhD4EGQVChwRQdlz+XDQPVOZDdlBnzmF9FRIdo=; b=lL+GVFsKXuqO2LL7ac
        s1Dd0Krzgp+t4hbhsnNeNfTeO2Uwb0zyQoOSSet7AejMhUDyg285W6CW40b4d84n
        DkpMnKdlpkWVYKy6sBselG8SV5mUNXaPtQEHC7oW+6KZiVUXqenCawtwVXponDmA
        NDbvPn7q13wGc5CpxsRyY9URgbfiQH0i+zvaab4dmWhd0ymyCHPI/okmMvCH4BQ6
        SG1ngrYQCJVkKykX5P1FnTkIbIKIG/UyZEMmqEBqQnTWc53Dswjuy3ejmf9zy0dw
        YZeGNQU560iClJSXgKGmj2aMNcccdaHuxNRhHMpbeDZcC1Ukf+7yN3u0PyAqQLpp
        Uvgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164273; x=1651250673; bh=T4MPclhD4EGQVChwRQdlz+XDQPVOZDdlBnz
        mF9FRIdo=; b=Mq4ubMpBNVSIl9vuGtZfMDpa2gHJEOOdHew3baMHeBtS7jgVIX1
        JzlcIvYtgpYYJToWtMVmPu41PL4/gu5kSdY6sXxD4jWWCJC/j3mRCN1RKCjQ4Cu1
        9n8FAG2o+/5aGWcWl1965Wj9rWQv9hOYM7TUEGbGRxHS7lbCLpGxKEypgFI1+xEB
        CVxAKdysq+Z6FLT7ijkyOvG4wnVUQ1EdD8vjk13d4NjLKcAbQ5S+kiaj4vSuVBA6
        lxkOh7VdYcpQjAvTZqmodhAd8x/4J6h0xTfPM0q6pi+3PB1DgXWWveeoSGSlrFCq
        XQPO8SCtOJzGasLPjLh7g8tZx1WpfX+ZARg==
X-ME-Sender: <xms:ccRqYu5xWPJvIT43oTTZUjEjb-CbwuNsmnX0TrYtjXymkZ0o12XG5A>
    <xme:ccRqYn5yYll-ZjspDK6cKDHZwygIJ84VNMcrQIAyEH2JGWYpAMCWzOyWMGVLgwEh_
    adlYzZ3aNAoCrgg7nc>
X-ME-Received: <xmr:ccRqYtdLUEktErA2p9QFhEFcnvcDKQ35xh-WxxoVmBEuxOzLFg1RWTDRrISxUIlNthrTwfSmqbOJYy6kkhBeNeUGWB-wNKLedVaYSjo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ccRqYrLgavwA9fE5kRACjaYewFUjl6aq3ajQ_fg4demg6xA3uGcIjg>
    <xmx:ccRqYiJcvTv3TNyet-0lKjdFoPN6HzeQgK4oQks0VvbsWFuD0nwFTw>
    <xmx:ccRqYsxipXzg-DbJZSQ8r69hU9ba0a36vCHBGLhBKKU5axa-aq6ahg>
    <xmx:ccRqYvA6m7VQJm2ohBa045u-p3M56MB51XII-oTP5CLTOHQZCuh-ig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:32 -0400 (EDT)
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
Subject: [PATCH v2 24/28] clk: Test the clock pointer in clk_hw_get_name()
Date:   Thu, 28 Apr 2022 18:43:34 +0200
Message-Id: <20220428164338.717443-25-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unlike __clk_get_name(), clk_hw_get_name() doesn't test wether passed
clk_hw pointer is NULL or not and dereferences it directly. This can
then lead to NULL pointer dereference.

Let's make sure the pointer isn't NULL before dereferencing it.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 306108cbcdbc..de2674e350b2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -262,7 +262,7 @@ EXPORT_SYMBOL_GPL(__clk_get_name);
 
 const char *clk_hw_get_name(const struct clk_hw *hw)
 {
-	return hw->core->name;
+	return !hw ? NULL : hw->core->name;
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
-- 
2.35.1

