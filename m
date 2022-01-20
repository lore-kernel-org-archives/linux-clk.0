Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21A5C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 14:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351432AbiATOe4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 09:34:56 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:36363 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351156AbiATOe4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 09:34:56 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id F106F3201F4E;
        Thu, 20 Jan 2022 09:34:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 20 Jan 2022 09:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=wBu9J7wxuK4z+ljHUb05tznQulJ5zH
        VjzKdqXqasOyQ=; b=Xa3sTsKAk+TBDKa/QK2yzcaU34qpFxkV0wkwR395SckcVJ
        Hp2Nkm1AgqlET6F04brUHop6lo4tlF6RtBu2JEJbNi+jk5DO7SEMhgqbG3XidfNd
        oONOPeCNGK3lK2lVfZUaek8nbhgKoxjUutRlrr3ga2yJO/C9MALj8uFTmHYLg/lR
        LUL/pMqRTb1hMeku7eUFjaXgcwi958hL+ZAPpunh2FI2XbPrfhpSZ2P/pZZuc/NZ
        IMtPU+2SzZ6pLsaQc5/+PwMaKjQ8L/s9EwiWRzJARKyGJFnqWo2S7K/ljXcg7R2l
        WR07p0+OUkedoNRjF4fCz8Zx2DfV88QIIgPnqIHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wBu9J7
        wxuK4z+ljHUb05tznQulJ5zHVjzKdqXqasOyQ=; b=Ey1rXe0cynh5c95c8SsAYh
        sktDMNYziMOr5SQ0dZm0C+4EubbgL8whUo5huHqAR0zzKGiGnhyg5BoDAM9ivXvs
        1A2uErbeQdgL9R07GJeT+1n1r1uON4MF6IQEnGSqVbjok2uyM4ZZW6F5gdUT/jGx
        rBV4VSMkm1Gr+ktlEEJLHweCPrnH35BNfdyJKvQnGVzX5vErVjXB4lYprYJmPXeq
        N4HFkbDHpfkE+iZhFnhiVEn39jlFDakdoOH+c5f9+dzcOkcZ44jTRmsWishDiHrW
        ynJaJduHUT3oBCbMzxj9/HII2Hdi4fA/6dQiHGHNf6v8vUBNozHpsur7kOVIUdAQ
        ==
X-ME-Sender: <xms:DnPpYfZrM-NRmtVk2UOT9CWM5KCSox15U9iwsqumOHnhufuxsvEtww>
    <xme:DnPpYeYXohLMwyBnhlwEhoYuw_MXVsV6Zhu-pV9zHIbjCXDTPJWIMa3ZIBRw4wGHU
    kjbntUNwh9XeXGQP5E>
X-ME-Received: <xmr:DnPpYR8p5QO7w0YiQBVmym3JrnhPxvk4y6etfK8a0sVOHSR2uxSf8UfC6EPkmIbgxqDHkm9ybis903fueOJXBPl3M7Gstv7n5Mh7wAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DnPpYVrI-5pkbv4J7qfOVQGysAQD1jHevr52zEE1HhEAnmo7COvsRg>
    <xmx:DnPpYarucC4IhV-w1LXcIRLl9jC3F1NSdJRjz1f9Xijp4n0LcKZivw>
    <xmx:DnPpYbT2IC46MJ5Bf-VYavW1MkSW8ZL8HJzI_mwc--ZlrNCMw9MJtQ>
    <xmx:DnPpYaJn-QXCDZkMh2V7iAQ5sk-FLKz7OXeGGaoOYlFmfXdB9HLQwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:53 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 10/10] drm/vc4: hdmi: Remove clock rate initialization
Date:   Thu, 20 Jan 2022 15:34:17 +0100
Message-Id: <20220120143417.543744-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120143417.543744-1-maxime@cerno.tech>
References: <20220120143417.543744-1-maxime@cerno.tech>
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
index 053fbaf765ca..43aced269082 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2543,19 +2543,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
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
2.34.1

