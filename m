Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CCDC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 14:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241829AbiBYOgb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 09:36:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241824AbiBYOga (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 09:36:30 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF3F1AE659
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 06:35:58 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 174D05C0138;
        Fri, 25 Feb 2022 09:35:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 25 Feb 2022 09:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=uiveBeYnqGcqK+zu9ioOaNZW1ydXbC
        w+PmOS3Kp8raY=; b=BfsEUYpd4BiAiEIcB4Dt4XJil8q0OsRcLJhm6Vg3L2JuIE
        yDq0V3FY135nlLY9SbcTZ5tf+bhUbyjXIbj7BVW6jp6Cnu73unJ2RHLH64C3lWBz
        Tbhu/fBHeb/czU8aFh6bT5hztqLTiHzP97IKwHDou+8xhLP6hYLQq0sX/HXVOHoB
        fbnl8pPOiIPUL7g6hauKEX08pVSBMIvBxfdt1v20XlVgQTc0sKlhkG/ABjrm+eg9
        6FO5sJyYJPsnFDqVjtdAHnc5sYTNiCyaDdOZoThz/eLXFZxcDYwo0dk99nEe4epw
        5LaOF94MNeJePwn4uVbKw1fVzwIGSThzNlFLoigA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uiveBe
        YnqGcqK+zu9ioOaNZW1ydXbCw+PmOS3Kp8raY=; b=j4gb2U1+YOobIkUw1t/jHx
        EVQQzoJtMnp2owNYKBUmPWx7eCx4dJUs+4yhgKV/zFRnxDXAqQCNyeorWEIPBlFn
        TEFcjUjq+Xcf8Jo9/2vO+eKKUPtL8oXlM5jRJb0jMBQnPWSPILSIBtn+7GdwEcdl
        kxScdxHSrf98qAHJzzuqAPkd/RoAJGDv0v+0IBkX6JEB+dkMlCf9+dTPgHm38Jq1
        vV7gaIZTKq1YILNpGcPJZ++Ds4e/imWr3Nyf1xDSJc90xl2DDNhAUkF2tvq+Cjng
        DvBab47l/UVWXGVvCF0WH1WjniiMHiTYgQYtZGOKOUmX8REbVEiQigfhtKdutNmQ
        ==
X-ME-Sender: <xms:TekYYrzHDtG5mYDU5GN6H3e0gL-VYK9DWeu_fDAOlQKiWSuCFF5TLg>
    <xme:TekYYjQPBLzWu2_SFv-aQ7MAgAfiZgnxQ5NueK6Y81bh6eIA69pqHAB_GcWi1vxUA
    7B1hBLhF6E1LpOkWfk>
X-ME-Received: <xmr:TekYYlWJs8ao9c87l-JZhLWP8EIimQWOPwgnoUe0eBJmO1tmkzWYfxq4K4Hx1B3r9L7SfVkS0k_eZ8pxPEi_GRaa9DBeYfR_ind6VGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TukYYlhDE33eqWEPz5DEeAxCM6q1pgsY_bWvlpBcYRbxQT7GPnr7uA>
    <xmx:TukYYtCAGDGOkn0fXJCwZaA7Ah2EtpbLSgDlTBscTsmr4FrrNw09lw>
    <xmx:TukYYuJU0IsT1n1aqTu2fTHA1xZWkI7u0fmfpUxFvJCyHtHniIO0wg>
    <xmx:TukYYnDOHxvy_dEWSYABwazl388hTbubKFHIVm1H1ntqho1ET9QJPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:57 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 11/12] drm/vc4: Add logging and comments
Date:   Fri, 25 Feb 2022 15:35:33 +0100
Message-Id: <20220225143534.405820-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
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

