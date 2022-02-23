Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AF5C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 10:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239596AbiBWK44 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 05:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239729AbiBWK44 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 05:56:56 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8088C7D1
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 02:56:28 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 450685C0212;
        Wed, 23 Feb 2022 05:56:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 23 Feb 2022 05:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=uiveBeYnqGcqK+zu9ioOaNZW1ydXbC
        w+PmOS3Kp8raY=; b=ruClEbyLW4VP7CbpAk7NHIYbGGwawcC9xZMp7TYFfwYv87
        EMv73/e7OatQ0nKUuCTZ90jGegGabv6K5v8bQsz9qOjSOobjPZw89cwetKYCagWb
        8dFTXdrJJNXs8UFUiGvlJyHW4aVaql5GPDVWJqlFToN51N07mBDD3Y0n8c3zDFy9
        WY5Cv2SD8FpiqNiiUiTe9914umsPtG0XAI4vek49qhYlcaSDZ/manVECQ4+GdSJa
        GZCuqLUWVa7BVPthfT2q2asUnvZO3js0IyjAHTwWPgmnsZjluI0wYi3Pb4YiS8KR
        IOH2qjc2DTTzvqpY7Ild9TzajrLLifyKYMU3cCLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uiveBe
        YnqGcqK+zu9ioOaNZW1ydXbCw+PmOS3Kp8raY=; b=Dykv+DUp23bFJwtkvarTf3
        8GBgCQ/tri4a0xvgwLxfjBC19HvqBEhLCU8dXa881DOPvrXzJUDB6jiAyr+TyAc3
        yAURnw+VmHOTq8I6Elusv8gScJYuK6EmgF5hxCQZI0irVf8sSC0eW5xXrDd77H0t
        VWAWoNKijD7GYv6vYgV5pfa2maYqsQ3WHJepsThbClyXFBQCMLi+ECi1QBGmELAh
        JRMQnDyLrqrQ92PnBp82CWoYyc0nMUAf7ToawFlcRpjNQh5qnbYjAiYKinNTG6nj
        ciyYh/ylwLW+qHms2WpBv1JuexIioZiScxt3/s3kmxPBSJaCVJnzX8tQ6gYh7nDA
        ==
X-ME-Sender: <xms:3BIWYsexU2OuiPxurXQrW8OlS-n3k0MYvM6RouEGYx15A0CYlNQL8A>
    <xme:3BIWYuOXxTnHdF6VqlKdYptCK-2Pjadwt-5Nt7C0YQtX5CSukdTgpdosPcTU9lpkF
    kHaHf8CnSZf2s8gsyI>
X-ME-Received: <xmr:3BIWYtj1O_YuBVbDdG4VYUjopCmSb-nOtDtHJpKyLEqB3gTbVTzJVQyyKf7DQFeOvfiO61ohAYk5MWUXUu3pspTn4i5j6ETEWIXrvj4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3BIWYh8pa-4CguG4i2K8xZCLAzhSXQ3GVJvOthiP-K9ySX42ZLA1gg>
    <xmx:3BIWYosgatESWDwWJkopBrVAoVGT1xvNKQmXq8JFXK2yDVyWXbggNg>
    <xmx:3BIWYoFZd47m8rIKdJTSxHT6-M6YhtskvqeuU945vG0k_iBAe7D6Ww>
    <xmx:3BIWYt_goBtNotwB4U2eeH1rNtruBBLKJH-IfNVnTRZWOj6OAgrRZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:27 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 11/12] drm/vc4: Add logging and comments
Date:   Wed, 23 Feb 2022 11:55:59 +0100
Message-Id: <20220223105600.1132593-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The HVS core clock isn't really obvious, so let's add a bunch more
comments and some logging for easier debugging.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 24de29bc1cda..6fe03fc17d73 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -389,8 +389,15 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 						500000000,
 						new_hvs_state->core_clock_rate);
 
+		drm_dbg(dev, "Raising the core clock at %lu Hz\n", core_rate);
+
+		/*
+		 * Do a temporary request on the core clock during the
+		 * modeset.
+		 */
 		clk_set_min_rate(hvs->core_clk, core_rate);
 	}
+
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
 	vc4_ctm_commit(vc4, state);
@@ -416,6 +423,10 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		drm_dbg(dev, "Running the core clock at %lu Hz\n",
 			new_hvs_state->core_clock_rate);
 
+		/*
+		 * Request a clock rate based on the current HVS
+		 * requirements.
+		 */
 		clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate);
 	}
 }
-- 
2.35.1

