Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:32915 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752847AbdK0PmD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Nov 2017 10:42:03 -0500
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        plaes@plaes.org, icenowy@aosc.io,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        jernej.skrabec@siol.net, stable@vger.kernel.org
Subject: [PATCH v2 04/18] drm/sun4i: Fix error path handling
Date: Mon, 27 Nov 2017 16:41:28 +0100
Message-Id: <9dcb9aab9969c28dd32f8c3599091e3c4c4682ca.1511797218.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The commit 4c7f16d14a33 ("drm/sun4i: Fix TCON clock and regmap
initialization sequence") moved a bunch of logic around, but forgot to
update the gotos after the introduction of the err_free_dotclock label.

It means that if we fail later that the one introduced in that commit,
we'll just to the old label which isn't free the clock we created. This
will result in a breakage as soon as someone tries to do something with
that clock, since its resources will have been long reclaimed.

Cc: <stable@vger.kernel.org>
Fixes: 4c7f16d14a33 ("drm/sun4i: Fix TCON clock and regmap initialization sequence")
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index e122f5b2a395..f4284b51bdca 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -724,12 +724,12 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 	if (IS_ERR(tcon->crtc)) {
 		dev_err(dev, "Couldn't create our CRTC\n");
 		ret = PTR_ERR(tcon->crtc);
-		goto err_free_clocks;
+		goto err_free_dotclock;
 	}
 
 	ret = sun4i_rgb_init(drm, tcon);
 	if (ret < 0)
-		goto err_free_clocks;
+		goto err_free_dotclock;
 
 	if (tcon->quirks->needs_de_be_mux) {
 		/*
-- 
git-series 0.9.1
