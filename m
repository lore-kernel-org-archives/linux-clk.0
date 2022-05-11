Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FB9C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbiEKOoe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244965AbiEKOo0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:44:26 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45F5E44FF
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:44:25 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id F2E4032009D7;
        Wed, 11 May 2022 10:44:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 11 May 2022 10:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280263; x=1652366663; bh=zq
        3MyoUqbmmuzS/qY39TRwMD9B9TPQVDxAiLQZE7Bp4=; b=kAvqH9N5Vs52Yn3BlD
        /He5qzdo/mi8EGPSo+q0ewccmcVsbXW9mOeZ+B6M1l5sSqCyEV+9g592/hXEZSSi
        zG1AuXsg8P9WHKo6uZqAuy5yyGO13UXpr6dbhORiLMXLPNHsEvfO9xyvqK6+79VG
        uiu8jtYg6NWNW8OnUbnSvARjiNf3c36W7C+LZ0MXDlSMMFvDO86m3nT31HkL+xfb
        Ldag7dIkJ0U5gOLOQnW45UJWfvyv9whuNTyDt+sHmQ8Rrk3GU5L+eEip23Jkp6SM
        PV5K0x+0hOe8+KgZ+S2oO7bN5FDRkrLzh+QD3e7OFdde473lnn9vzAQUamX36NPa
        T5CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280263; x=1652366663; bh=zq3MyoUqbmmuzS/qY39TRwMD9B9TPQVDxAi
        LQZE7Bp4=; b=WOzSseAPblfIDXRfH8k1BwXQAyQ7oApudLgkOxTAI3FiaIBylgw
        wc8FPNvM4SdLcX8E/yv9QOLTK/l2V479QUYSGirroAQVCUCXjg22w/irqnC2tN9s
        w0XDT33eApgn1MAEe6yyrLezfquHPHAeJTDSW95jXsbFpw9vJ30wRihFAVa2fMKa
        Pmw8SADxI+IXqC3z7i7DgKZShHX9YCy5rW6YQW3gkGS83xRsRRjF49SE4CQvRIVB
        XdjpXwrpAKq4U8ggx4k7aAhAZOA2dS0/k9lXqPv7Z0CIqeC5Z9+pMLKvARSeu9mr
        16zvHKL/OfXT+oIPZvzaSI1Bd4US36xhSIQ==
X-ME-Sender: <xms:x8t7Yk7siwdigOUJYDTb0mQ-1EujOEa6yEwWiK3NEpRqRcwO0okAZQ>
    <xme:x8t7Yl7Nv7BgxuWebGWxh-thstRkQRus7rXDOi9fVMBbckmCWNAKC-N3CkTBmJw7-
    fJNHgRfmER2PT7AxIY>
X-ME-Received: <xmr:x8t7Yjc9NWJV33EYy5t3sWG7xYFw3CiY42mNi_Rznm1tNL1Y32DWs6WHiSJLQv1WqyE0ULvKYHSySR78OrwZJtzddR4ZVeT6vzjVKLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:x8t7YpLmQQsEFac5vAELZ2Fda93yjF4whzwin1CBpPO0r-o9zOgACg>
    <xmx:x8t7YoIcEmeYuQHXrJ-q8GZ3kqMOutr2tnDp3x6cRZm56rq4pFahNg>
    <xmx:x8t7YqyLEa2fiP30ND2KrxFQfFBVUjvLgbvUk99euyXoE435Gprn-g>
    <xmx:x8t7YlDTIIul0INCY5QTZlsd57ogkzoD-VhEV42wuNQORs91Oj8Q1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:44:22 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 23/28] clk: Zero the clk_rate_request structure
Date:   Wed, 11 May 2022 16:42:44 +0200
Message-Id: <20220511144249.354775-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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
index 75927377a2c2..d8441e7221be 100644
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

