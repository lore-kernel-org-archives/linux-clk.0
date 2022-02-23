Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A618EC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 10:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239723AbiBWK5A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 05:57:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239734AbiBWK47 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 05:56:59 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E1F287
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 02:56:31 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 675105C0153;
        Wed, 23 Feb 2022 05:56:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 23 Feb 2022 05:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=B/S+5pJTjISbVKXDbmkZvJslRN2Aa6
        NU173g50j/vbU=; b=GaBwn3jLrwRlgVb3TQnNczA72rlHpkyQuBIEkv9sX+7+wl
        oD4KZGh3UDnBBcW3yvp9muv7M6ckIGWKlWkixLzm1Gr/9TcD70CiEXDR0fPH7jl+
        ivhqldwEwCK82doRSk9Ov/mnX3kW0B7jm4Vi8gA8o7tWwsMjCuf9sV6txsQc/MLh
        rH0gT2z2F0ddu7ma+1hVi/vyEh8YioONK1XNmtRzbQL5/rytoFvEmbY/HjnmuIiO
        TY2SaztoTbl4IKNXKrt+JJT4cMhJCQ6qvJJskcQhl8xEYt8tTncYrn2HyYK1qBRq
        Khk9ClPMJiqJCgTHamMV+7uwGyjCQVoOtB9bA8Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B/S+5p
        JTjISbVKXDbmkZvJslRN2Aa6NU173g50j/vbU=; b=PeJN+GMYjV67kRx++a+UjX
        NCDcQbR70B0a5owlgPdUX815sHRjgM7VFlSAgoPUjXDib1kHuqXJn5YSYlCiMH5K
        p97xB/pJyL6zaEczaP2bcEgIHF1M4mp5tCevtv14LoRIs48H4zhCaYCa0ijRHIxV
        p+rZv8t4AmjIplSWvR594m+XA5fDLU5oXvzTm5GkLpMx8kFr5pFUxfWNoHODFoSh
        yuWy6JuvU7u2mKjTKWQGG+qIvW7j+W+P6U1sPloxdA98nOaQ9Nde7CQF8mwddyi/
        UUxHUwGedRsrM9y44fvCvVfTCr4sBm802WBuPvvaMU0AG/2ly18+hngWS4P/DYIQ
        ==
X-ME-Sender: <xms:3hIWYq8dBgifeWnOScvPTHx63UTwTheYztYMfg7BBuxwOsP8fqez-A>
    <xme:3hIWYqv5j1BqQQqggSP07rZpX0RM3McAmyI-zzB9X3vIliu8jIJy70KkeRo2WTrBh
    G4cgZahUoP7lpSr85I>
X-ME-Received: <xmr:3hIWYgBIoRK6v0-myzmRRUvuRaMjN0Abw6BkjrUIOnfxTDCjDcqbDJzKA38XDYlIYL4xbkG88VzVYmoKk3z_uDLUt7LxKRhKXIc84X8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3hIWYicUP3qoxkRGYNmyXaBdqm5Qs5o-BZ2vL8C6MY0fN_FThzX3ow>
    <xmx:3hIWYvNiLlsO2cSEjMmPY-ABCUKATk_sO6jFmagI8-CYVFk_r663Ig>
    <xmx:3hIWYskPkfLbCybM_Pqio1qMpyLYLFM8v3On4MmIbyGeITsbuKNmxg>
    <xmx:3hIWYqdEZ8hyByb94gBRJtu6arp4gaZRYPPMpqb4HdATia_9B1DoIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:29 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 12/12] drm/vc4: hdmi: Remove clock rate initialization
Date:   Wed, 23 Feb 2022 11:56:00 +0100
Message-Id: <20220223105600.1132593-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
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

