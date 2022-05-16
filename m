Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B13C4167D
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242024AbiEPN1P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242705AbiEPN1H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:27:07 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED14D28722
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:55 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 9B89832009A7;
        Mon, 16 May 2022 09:26:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 16 May 2022 09:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707613; x=1652794013; bh=HB
        GtpOtyfJD1V629op1Nqk5n94YAhqClHVk7ezAf8jg=; b=ljmLwMrWzXmhVwrXsh
        ekVP+FNKYITL3Fxw25SId6vPu2DmJR/HNFqxScBBJk1LqpSPkI1GTCApIRD0cUxl
        X42JiqxR1HN78KcLH8UhL+uWvRYg4xSX2dvHnXCLeFU2E5YRoUwZRuARq5bg6QXp
        GLNNayywjE3hQrI8C+/bP2ZRs/Qy2++kMHBPTaUwHBEhyS5g01CCeNsRzMer8AyY
        kTjfEa9N18dUw49HuJYTk5F4BtqroOoyTLehHAYr7AQjm9V/RxQmlFdiUtZfB3bC
        AP04iV9LpuWVbPmH6BBSE0aPxlM3zaGWlTlJyWjWEm5rOt73vKbtcVqD4RnK2SpL
        9NbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707613; x=1652794013; bh=HBGtpOtyfJD1V629op1Nqk5n94YAhqClHVk
        7ezAf8jg=; b=WuXD11P12NMAbGT1lQ2Aa+/ZOIxk0MvcM16afU2m5ojGjWWZwxg
        z3Sk0YRvGZoJ7beiTr0WdXIOVAAL7Iz2Uuz+Fkt8CUF3CR57RmbSDPmecHRHzrjM
        R5Pnu/C+SOAPGlJe0TgRn+u1NwBTxnFAXUl1oPHmYl5aslIMTDduuuteinrO3IOx
        OmvIJeEzkEIDloXX3jndvwJWrWgV6y9ewA4f7f0KGO8L7cg4TA7NMK57fiXnNIXQ
        59Yjhxr/nbZixSc/JFXYnkxmyG6vu0x90L/JHWEMCNJq64yXCBHO7thB1NQUmGlC
        ILK15pEA9gVtUtkOy1E5BlBst+Wih5gFbTg==
X-ME-Sender: <xms:HFGCYlzYXP8YsWAfgVB7-6UZGpX5u5CBF9ooJg5cXh_wJUZAig3VLA>
    <xme:HFGCYlTjsKmv4FIu2bkISQFMkgVs34PLLQX10VxPQxpSDtD3W-oJLGWs4mAH9lRw0
    GodIAKZarhEad-dxw4>
X-ME-Received: <xmr:HFGCYvWaXo0TDsE72x5frQkQQY1lYRHQI_aRu2Ra9Hm_-CtWGRQvqi5GM5TfvfS6jv4K6sad8iPCQoDtJ6L3yE8bm6XNBS5RnY8UDxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HVGCYniEP8UP0QEA4OAQXHqy08on8UP_OsD4cn7Qxwc3hC3A8ApwPA>
    <xmx:HVGCYnD78nd6cipgVIoD1xC2KQr-U7p9Xepg9ZmiDKrhPD1iY2N-6w>
    <xmx:HVGCYgJLgsxJ41IPMFXbWDVk4k3OQ0oBn4AUga12gH3AONtj0WZMtQ>
    <xmx:HVGCYr5Jz9nfJ3DOjMG7KANE7hnvVa8EBNnpsp1T9KB4xG2v-ECreg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:52 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 23/28] clk: Zero the clk_rate_request structure
Date:   Mon, 16 May 2022 15:25:22 +0200
Message-Id: <20220516132527.328190-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to make sure we don't carry anything over from an already
existing clk_rate_request pointer we would pass to
clk_core_init_rate_req(), let's zero the entire structure before
initializing it.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index df9fca8415a8..d953ca61ea38 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1446,6 +1446,8 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 	if (WARN_ON(!core || !req))
 		return;
 
+	memset(req, 0, sizeof(*req));
+
 	req->rate = rate;
 	clk_core_get_boundaries(core, &req->min_rate, &req->max_rate);
 
-- 
2.36.1

