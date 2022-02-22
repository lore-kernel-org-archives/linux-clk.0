Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037F1C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 13:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232373AbiBVNTr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 08:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbiBVNTq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 08:19:46 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BAEC3303
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:19:21 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id CE59F5C02A7;
        Tue, 22 Feb 2022 08:19:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 22 Feb 2022 08:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=B/S+5pJTjISbVKXDbmkZvJslRN2Aa6
        NU173g50j/vbU=; b=F+mdGpaG9z3fetPwFzIGTrYl4fAJg6HGc6CMNahQq7hbpW
        8A/3QNlNKXv72AIkfsdtqnaMRB/PwaEYFLIlv1f8zGRC7rFEqdpT6bKgsUZPfWxR
        tZ3RR56vMnRpoFU+GfaNyedLUWn2Dwst4rakShI+apbfA54VQIG5DXeJKhEV4WJ6
        wJpdLhZ3gK5JyRSU5PwZN0v6mrAaUX2jjD0nwYBOgzOR0DI7/itI9tOPKiV7w95v
        qv4FVM82t+UAUkRHTZpVREcl1jESBUBkUTbOkAGLfWlw3ppPCPm6clKArWbJRNWL
        oYBjs60iEv5348dB5jSzOAsaDW0yZAPXvSzNG2TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B/S+5p
        JTjISbVKXDbmkZvJslRN2Aa6NU173g50j/vbU=; b=LBuLf4LcU6W9IwF604VwVp
        q0IPuJ4EB4/nZOKdBKIlLOb+T1PuHbHkK7tvsyHm/RJBSKHbo4DuemgQeo7fW2cy
        P67vVdTpEaR/k+P20zopYY7OpcWW7efQssS+3lw+Z7kiRClq4WO+zm9699H6y+W6
        C00PcsejnOWJ0d6dcXuHxXGnSy3FJ0jBFmJwIk/rxcUGBMFHZqdQTCa67hKVst3z
        GIcCVurM5VM4jk2nfXY8rVDXFGwYhaI+gKhmoU8gZF0uKQ35rBXEIK7kodOKWxkx
        VxoIZwCjx/eZtogsS/Dxz15y0Wm7KugwyEeLokHo9cOXCnP4unixSeEpYwWWCdng
        ==
X-ME-Sender: <xms:2OIUYi4gQL5TSgCFgM64Bo7r2JoGqMSNdTb960lPIxCqMefQcvWK0A>
    <xme:2OIUYr4jlXTRp9lIqx7eb5FVYrDqBdurA4c1qXDoW6_qqr1FL77WH4WfKark_AU0m
    DDYC9MM04O4uNNn-P8>
X-ME-Received: <xmr:2OIUYhdEJVDCGWBNT52YOmvsWhz4G20qR-CbZVHbgKMiwGRrx6PcfDWn2RaC5iAhhK2XxaUHIcueuZ-Xev8rEtBRT5FlodXiWoV9P-Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2OIUYvITIpeMjWTzHoXU4JTekwS3Z3giRRNTrcbANDhzLPLyB4SbQQ>
    <xmx:2OIUYmKuyXJ32u0XLf8dqSDiBNtEJBG9PqN2mnGI5kOksGYoC-S8HA>
    <xmx:2OIUYgzoyVEXBiYpNi-4L8B9E5lZ5lKTIcMlKshMJ0LGQLk2D839ug>
    <xmx:2OIUYnoZpygPWOtHhUu_QypK5MImsedgc0icwvrUkgyztKG690CipA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:20 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 11/11] drm/vc4: hdmi: Remove clock rate initialization
Date:   Tue, 22 Feb 2022 14:18:53 +0100
Message-Id: <20220222131853.198625-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131853.198625-1-maxime@cerno.tech>
References: <20220222131853.198625-1-maxime@cerno.tech>
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

