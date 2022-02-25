Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569FDC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 14:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234160AbiBYOgd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 09:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241819AbiBYOgc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 09:36:32 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DFC1AE64D
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 06:36:00 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id F0F075C0138;
        Fri, 25 Feb 2022 09:35:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 25 Feb 2022 09:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=B/S+5pJTjISbVKXDbmkZvJslRN2Aa6
        NU173g50j/vbU=; b=XBp17LPoauOjyeNC4WdBZXIG5Y4US0YJ13un+UcoxObIO8
        t6TCTomoTNNRT+2ULAqRiuY0ke4qktCEJiKwkYJ75nsyguKOO3IRXuBXrmFKHTaE
        Srpik1wUExrDinF72y2wcoBb4nrflzb3OXCX8X8i8ikYlGal4HkHkHSsTqv+aRAI
        Zf1Dy0vux5BD83KZ1F761qYREGMiVF/QhmOAjIuVAIF4bD5aYMRgIg37bkbX64JW
        OtwAJ7WzjwyCEZxrvDByTi43NbDU32X8dBIu+GYUcdq01zmz9OE+XRpskG7JCYT2
        9Oa/0eMEorSM+Eojsi4t0aOwc4UFBkxsTUed6R/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B/S+5p
        JTjISbVKXDbmkZvJslRN2Aa6NU173g50j/vbU=; b=kAotQOEkxd+hD4BDdLCLA/
        hBz/1Kry7hN1knZlfWkWSFY5Kk62/Y4AknUJnuItOg103m1/j5WggBVH6EYu32M1
        9tqaXf8/USQFRljSgqalUKCbmTvbzXCkBncruymddiUompnaNtFBxQoxmaAZPuSl
        rAgwaC5bVndChcp6dbAW5rn91fsylQszycIHq0XjTsjeWXEERhKGGsLcDn9BdH42
        17SsTG85Y0vCN42FOMb/wuYQ64jyBv+egYtEUrxQJdulclx6H/qQsIoCX7q8D6wh
        HC6yvpbaEScbzMqcEH7utL6YjjheB2JrzKN+5dm1mcPXlJW3wejCVOoFgucddEcw
        ==
X-ME-Sender: <xms:T-kYYkHbrSHxF9zRYwpN41KjskSHspH3ZbtLihDIa1ShCj8W5sxStQ>
    <xme:T-kYYtXc5E-hQJYgVLsblT1eCXMIZ2nXSXzwwG3KPmHS7urQmzKuTFpf9Bh27zB-2
    TnM08Guu0QrAQpvN04>
X-ME-Received: <xmr:T-kYYuK8leTEbL3o1-QovEQj42yfVV6df0mzz4Fur-pQpuplkxdiIVSRdgfCQyBsT7kYSM6P2yqTE0P_8CgnNy1AfJwG3Pyx4F7J9Y0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T-kYYmHkrzzG1_4DJtc3QBxbTmg8IpqMsI0piTGA5SXdQt_N2AYivQ>
    <xmx:T-kYYqUnw8FZ5jTJgeo2-IEBAV9fQXZ-GhHCnky5ojYTK6DSyYRPPA>
    <xmx:T-kYYpO7uPhLr9RZLxi0Ye03DMmV_Crrlgf0-ijqHCykDf3oV6MMgQ>
    <xmx:T-kYYlFGw_UUiEv0JSYoO2vq66fawq87d_hgYEQbzc_0bztk9z0Nqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:59 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 12/12] drm/vc4: hdmi: Remove clock rate initialization
Date:   Fri, 25 Feb 2022 15:35:34 +0100
Message-Id: <20220225143534.405820-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that the clock driver makes sure we never end up with a rate of 0,
the HDMI driver doesn't need to care anymore.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 92b1530aa17b..21aff3ad96cf 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2576,19 +2576,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 			vc4_hdmi->disable_4kp60 = true;
 	}
 
-	/*
-	 * If we boot without any cable connected to the HDMI connector,
-	 * the firmware will skip the HSM initialization and leave it
-	 * with a rate of 0, resulting in a bus lockup when we're
-	 * accessing the registers even if it's enabled.
-	 *
-	 * Let's put a sensible default at runtime_resume so that we
-	 * don't end up in this situation.
-	 */
-	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, HSM_MIN_CLOCK_FREQ);
-	if (ret)
-		goto err_put_ddc;
-
 	/*
 	 * We need to have the device powered up at this point to call
 	 * our reset hook and for the CEC init.
-- 
2.35.1

