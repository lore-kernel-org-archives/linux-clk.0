Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866DAC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 14:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350112AbiATOex (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 09:34:53 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:58897 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351432AbiATOew (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 09:34:52 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id BC1213201F66;
        Thu, 20 Jan 2022 09:34:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 20 Jan 2022 09:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=OHFTn7GOQZcdexAVl+IrIj7Ir1JYzG
        9d/APR13X0Vns=; b=UowVh02C9QVN1XVBEiqBFyjTVkfDXxD/pZ6EAT+/JmupC5
        iquIIorjOTaAgEDid+6JDWVyELNH8+yurvp3rtI2tXTn5ZYqQ1C3ouNsk0uiBgE4
        ZvyPoMLxsigEwwRAH7/OWpQAavua9UXXXdIA5KSKvB7sxqeaqG3odIZNlNkjgZJ2
        5NQk7cxX/DtspACM9a/HFPyRE6hM22Vx4WYMyXRVCZdQvy79RrjmuVys1xVtrVbB
        HpZnw08oL0BAjqQLtx6JKlV7rsMglzBzPsTiV1dIgnGkY10rAtbd8kXIrD6Z59sK
        Rki7xz6kCaa/P0ew9Q3BTEHpAHhcSqi6AYDivSyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OHFTn7
        GOQZcdexAVl+IrIj7Ir1JYzG9d/APR13X0Vns=; b=fhWSsGh5SUPxL5NWjwUylp
        KqmoyiNvholOpjyLOjARqsfaCaWzMxw9pHKiKOPIqcADhXDFneFII89EUREsayjw
        c2zWbdmhyzqXfQBzosqOCpbuoqN3+IkmVt1cjzcj12H/GqIO8XkMVscyAp8oluAs
        Uraw9ptA1U59VpEdKeV9RVKNTl5KbXv//V4W+U6dNZG2RNgYMv3YzvgRa1ErdmKU
        z91bBxd0WCAZeYJ3QtIJZdQmqTcrTW9hjx+SZgXoLjdabAVsbKu3/wsmNn0BFAPi
        p9jYKgDYRCUuOheKZLnQiqRXeLlWZSK3IMOiM+ZF3dQC2IV+m9RPM/zHHlQInIqA
        ==
X-ME-Sender: <xms:C3PpYX9hxUrxHOsu-UDGo5J2lVu5YnugEoD495KCUWCyN8-Xgijy7Q>
    <xme:C3PpYTu5rHZR1NfbVbabVhC5h8bS6akNg6GEVrZ4OTLaPtvawnnCHduOPUh6QAruu
    obUpztu1ykxhjv8LMg>
X-ME-Received: <xmr:C3PpYVA4upnLm7MVPn65qU8ZvqxTQjZkfrolNkMBWfHahnKiG3j-If7jjzHKbmS52q7VE0GTIgWQjcMu5MfPwna3I_d0hTyeNSe1HPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:C3PpYTdGhVHcO7sJNUWsgaNA7qebaE5ozvzS-OQ-SuxTIewDqOTP9A>
    <xmx:C3PpYcMTzBttpBvfiy2yh60ZrPbtk0_2_TipPW0ALuz6ZxCKzVg3Xg>
    <xmx:C3PpYVk4UAK8MBGX2CFudccwt3EV0DvHTcbcPAa7jMmBkkVXq4bxoA>
    <xmx:C3PpYTcIc3xTDuJgQ9Jazahj0W8n2-IPAH3R8BKHnAQCEnc0-bhPJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:50 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 09/10] drm/vc4: Add logging and comments
Date:   Thu, 20 Jan 2022 15:34:16 +0100
Message-Id: <20220120143417.543744-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120143417.543744-1-maxime@cerno.tech>
References: <20220120143417.543744-1-maxime@cerno.tech>
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
2.34.1

