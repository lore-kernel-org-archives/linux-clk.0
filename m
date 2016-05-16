Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:38146 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752719AbcEPMrg (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2016 08:47:36 -0400
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 20/20] ARM: sunxi: Enable VGA bridge
Date: Mon, 16 May 2016 14:47:20 +0200
Message-Id: <1463402840-17062-21-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Enable the VGA bridge used on the A13-Olinuxino in the sunxi defconfig

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/configs/sunxi_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
index 6a1447cf8feb..3676cc2db2eb 100644
--- a/arch/arm/configs/sunxi_defconfig
+++ b/arch/arm/configs/sunxi_defconfig
@@ -98,6 +98,7 @@ CONFIG_MEDIA_RC_SUPPORT=y
 CONFIG_RC_DEVICES=y
 CONFIG_IR_SUNXI=y
 CONFIG_DRM=y
+CONFIG_DRM_DUMB_VGA=y
 CONFIG_DRM_SUN4I=y
 CONFIG_FB=y
 CONFIG_FB_SIMPLE=y
-- 
2.8.2

