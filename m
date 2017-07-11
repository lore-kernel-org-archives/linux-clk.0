Return-Path: <robdclark@gmail.com>
Return-Path: <robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Archit Taneja <architt@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	viresh.kumar@linaro.org,
	Rob Clark <robdclark@gmail.com>
Subject: [RFC 2/3] drm/msm: inherit display from bootloader
Date: Tue, 11 Jul 2017 14:20:07 -0400
Message-Id: <20170711182008.28298-3-robdclark@gmail.com>
In-Reply-To: <20170711182008.28298-1-robdclark@gmail.com>
References: <20170711182008.28298-1-robdclark@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

It is quite common for bootloader to enable display on tablets/phones.
But until now for upstream kernel we've been ignoring that since it
highly confuses drm/msm, and recommending to disable the bootloader
display.  (Otherwise we end up trying to set rates on already enabled
clks and all sorts of similar fun.)  But to get grub graphical boot
menu to work (and also efifb for early boot), we need to solve this
properly.

This could possibly be split out better.  But the basic idea is to

(a) determine what is enabled at probe time by looking at what clocks
    are enabled (ie. if display is enabled at all, mdp5's core clock
    will be on.  If DSI output is enabled (at least in video mode)
    the dsi block's pixel clock will be enabled, etc.

(b) For the enabled outputs, work backwards up the display pipe from
    output to plane (input).  We need to work in this direction as
    we cannot (for example) read back crtc state until we know which
    layer-mixer is used or read plane state until we know which hw
    pipe is used.  (But for mdp5 which drm_plane or drm_crtc is
    picked does not matter since they are virtualized, ie. we assign
    dynamically hwpipes and lm's to planes and crtcs.)

So far this is only implemented for DSI video mode.  For DSI command-
mode I think we end up needing to get the mode from the drm_panel.
(On db410c, which I'm testing this on, it is DSI video mode to an
adv7533 bridge.)  HDMI/eDP are unimplemented so far.

We have to make some simplifications/assumptions in a few places, about
how the bootloader is setting things up (ie. that there is just a single
plane, and about the pixel format).  I'm not sure that working backwards
from hw state is completely possible in all cases without making some
assumptions.  (For example, the hw is flexible enough to deal with
imaginary color formats like BARG5865.. and I think for 4k scanout
ganging up multiple hwpipes and layermixers you end up with multiple
possible sw states mapping to single hw state.)  Maybe there is some
room for a more generic optional framework for this (which can also be
used for extra debug to validate atomic commits via hw-readback after
commit), but probably best to start with some more simple display block
for that.
---
 drivers/gpu/drm/msm/dsi/dsi.h                   |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c              |  32 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   1 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c      |   2 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c      |   2 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c |   2 +
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_cmd_encoder.c |   8 ++
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c        |  21 ++++
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c         |  48 +++++++++
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.h         |   3 +
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_encoder.c     | 132 ++++++++++++++++++++++--
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c         |  79 +++++++++++++-
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h         |  11 ++
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c       |  79 ++++++++++++++
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.c         |  45 ++++++++
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.h         |   2 +
 drivers/gpu/drm/msm/msm_drv.c                   |   3 +
 drivers/gpu/drm/msm/msm_drv.h                   |   2 +
 drivers/gpu/drm/msm/msm_fbdev.c                 |  15 ++-
 drivers/gpu/drm/msm/msm_kms.h                   |   2 +
 21 files changed, 478 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 9e6017387efb..4340edaec8e2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -99,6 +99,7 @@ bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
 void msm_dsi_manager_attach_dsi_device(int id, u32 device_flags);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
+void msm_dsi_hw_readback(struct msm_dsi *msm_dsi);
 
 /* msm dsi */
 static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9e9c5696bc03..71a1d3dd7eb5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -28,11 +28,14 @@
 #include <linux/regmap.h>
 #include <video/mipi_display.h>
 
+#include "msm_drv.h"
+#include "msm_kms.h"
 #include "dsi.h"
 #include "dsi.xml.h"
 #include "sfpb.xml.h"
 #include "dsi_cfg.h"
 #include "msm_kms.h"
+#include "phy/dsi_phy.h"
 
 static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
 {
@@ -1866,6 +1869,35 @@ void msm_dsi_host_unregister(struct mipi_dsi_host *host)
 	}
 }
 
+// XXX msm_dsi_host_hw_readback()... preserve the layer-cake?
+void msm_dsi_hw_readback(struct msm_dsi *msm_dsi)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(msm_dsi->host);
+	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	if (!__clk_is_enabled(msm_host->pixel_clk))
+		return;
+
+	kms->funcs->hw_readback_encoder(kms, msm_dsi->encoder);
+	msm_dsi->connector->state->crtc = msm_dsi->encoder->crtc;
+	msm_dsi->connector->state->best_encoder = msm_dsi->encoder;
+	msm_dsi->encoder->crtc->state->connector_mask =
+		(1 << drm_connector_index(msm_dsi->connector));
+	msm_host->power_on = true;
+
+	/* also fixup refcnt on regulators: */
+	dsi_host_regulator_enable(msm_host);
+
+	/* clocks will already be on, but with just a single refcnt,
+	 * whereas normally (at least in some cases) both dsi and
+	 * mdp5 take a reference to the same clks.  So take an extra
+	 * reference here to balance things out in the disable path.
+	 */
+	dsi_bus_clk_enable(msm_host);
+	dsi_phy_enable_resource(msm_dsi->phy);
+}
+
 int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
 				const struct mipi_dsi_msg *msg)
 {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 0c2eb9c9a1fc..ea0d674983dd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -354,11 +354,13 @@ static int dsi_phy_regulator_enable(struct msm_dsi_phy *phy)
 	return ret;
 }
 
-static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
+int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
 {
 	struct device *dev = &phy->pdev->dev;
 	int ret;
 
+	DBG("");
+
 	pm_runtime_get_sync(dev);
 
 	ret = clk_prepare_enable(phy->ahb_clk);
@@ -372,6 +374,7 @@ static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
 
 static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
 {
+	DBG("");
 	clk_disable_unprepare(phy->ahb_clk);
 	pm_runtime_put_sync(&phy->pdev->dev);
 }
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 1733f6608a09..ee417c43c539 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -103,6 +103,7 @@ int msm_dsi_dphy_timing_calc_v2(struct msm_dsi_dphy_timing *timing,
 void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 reg,
 				u32 bit_mask);
 int msm_dsi_phy_init_common(struct msm_dsi_phy *phy);
+int dsi_phy_enable_resource(struct msm_dsi_phy *phy);
 
 #endif /* __DSI_PHY_H__ */
 
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
index fe15aa64086f..fef3f208199a 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
@@ -1088,6 +1088,8 @@ struct msm_dsi_pll *msm_dsi_pll_14nm_init(struct platform_device *pdev, int id)
 	pll->save_state = dsi_pll_14nm_save_state;
 	pll->restore_state = dsi_pll_14nm_restore_state;
 	pll->set_usecase = dsi_pll_14nm_set_usecase;
+	pll->pll_on = pll_14nm_poll_for_ready(pll_14nm, POLL_MAX_READS,
+			POLL_TIMEOUT_US);
 
 	pll_14nm->vco_delay = 1;
 
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
index 26e3a01a99c2..f1634c533e1f 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
@@ -313,6 +313,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
 	.prepare = msm_dsi_pll_helper_clk_prepare,
 	.unprepare = msm_dsi_pll_helper_clk_unprepare,
 	.is_enabled = dsi_pll_28nm_clk_is_enabled,
+	.is_prepared = dsi_pll_28nm_clk_is_enabled,
 };
 
 /*
@@ -619,6 +620,7 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_init(struct platform_device *pdev,
 	pll->disable_seq = dsi_pll_28nm_disable_seq;
 	pll->save_state = dsi_pll_28nm_save_state;
 	pll->restore_state = dsi_pll_28nm_restore_state;
+	pll->pll_on = pll_28nm_poll_for_ready(pll_28nm, 10, 50);
 
 	if (type == MSM_DSI_PHY_28NM_HPM) {
 		pll_28nm->vco_delay = 1;
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
index 49008451085b..16eb49f22bf2 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
@@ -520,6 +520,8 @@ struct msm_dsi_pll *msm_dsi_pll_28nm_8960_init(struct platform_device *pdev,
 	pll->disable_seq = dsi_pll_28nm_disable_seq;
 	pll->save_state = dsi_pll_28nm_save_state;
 	pll->restore_state = dsi_pll_28nm_restore_state;
+	pll->pll_on = pll_28nm_poll_for_ready(pll_28nm, POLL_MAX_READS,
+			POLL_TIMEOUT_US);
 
 	pll->en_seq_cnt = 1;
 	pll->enable_seqs[0] = dsi_pll_28nm_enable_seq;
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_cmd_encoder.c
index aa7402e03f67..83322f52f971 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_cmd_encoder.c
@@ -146,6 +146,14 @@ void mdp5_cmd_encoder_mode_set(struct drm_encoder *encoder,
 	mdp5_crtc_set_pipeline(encoder->crtc);
 }
 
+struct drm_display_mode *mdp5_cmd_encoder_readback_mode(struct drm_encoder *encoder)
+{
+	// TODO can we even reconstruct something that resembles a mode
+	// in the case of cmd mode?  (And will bootloader ever enable
+	// a panel in cmd mode, or can we just ignore this scenario?)
+	return NULL;
+}
+
 void mdp5_cmd_encoder_disable(struct drm_encoder *encoder)
 {
 	struct mdp5_encoder *mdp5_cmd_enc = to_mdp5_encoder(encoder);
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
index 9d01656d853e..e0f8437ac868 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_crtc.c
@@ -409,6 +409,27 @@ static void mdp5_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	spin_unlock_irqrestore(&mdp5_crtc->lm_lock, flags);
 }
 
+void mdp5_crtc_readback(struct drm_crtc *crtc, struct drm_display_mode *mode,
+		enum mdp5_pipe pipe)
+{
+	struct drm_crtc_state *state = crtc->state;
+	struct drm_plane *plane = crtc->primary;
+	int ret;
+
+	// TODO probably just drop mdp5_state->enabled?
+	to_mdp5_crtc(crtc)->enabled = true;
+
+	state->active = true;
+	ret = drm_atomic_set_mode_for_crtc(state, mode);
+	WARN_ON(ret);
+	drm_mode_copy(&state->adjusted_mode, mode);
+
+	state->plane_mask = 1 << drm_plane_index(plane);
+	plane->state->crtc = crtc;
+
+	mdp5_plane_readback(plane, pipe);
+}
+
 static void mdp5_crtc_disable(struct drm_crtc *crtc)
 {
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c
index 439e0a300e25..a4a27bfeaf31 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.c
@@ -446,6 +446,54 @@ int mdp5_ctl_blend(struct mdp5_ctl *ctl, struct mdp5_pipeline *pipeline,
 	return 0;
 }
 
+/* Look at the CTL_LAYER_REG's and figure out currently used layermixer
+ * and pipe.  This is really only suitable for the single layer case,
+ * but that is all we'll get from the bootloader.
+ */
+struct mdp5_hw_mixer * mdp5_ctl_readback(struct mdp5_ctl *ctl,
+		enum mdp5_pipe *pipe)
+{
+	struct mdp5_kms *mdp5_kms = get_kms(ctl->ctlm);
+	int i;
+
+	for (i = 0; i < mdp5_kms->num_hwmixers; i++) {
+		struct mdp5_hw_mixer *mixer = mdp5_kms->hwmixers[i];
+		uint32_t reg;
+
+		reg = ctl_read(ctl, REG_MDP5_CTL_LAYER_REG(ctl->id, mixer->lm));
+
+		if (!reg)
+			continue;
+
+		if (FIELD(reg, MDP5_CTL_LAYER_REG_RGB0))
+			*pipe = SSPP_RGB0;
+		else if (FIELD(reg, MDP5_CTL_LAYER_REG_RGB1))
+			*pipe = SSPP_RGB1;
+		else if (FIELD(reg, MDP5_CTL_LAYER_REG_RGB2))
+			*pipe = SSPP_RGB2;
+		else if (FIELD(reg, MDP5_CTL_LAYER_REG_RGB3))
+			*pipe = SSPP_RGB3;
+		else if (FIELD(reg, MDP5_CTL_LAYER_REG_VIG0))
+			*pipe = SSPP_VIG0;
+		else if (FIELD(reg, MDP5_CTL_LAYER_REG_VIG1))
+			*pipe = SSPP_VIG1;
+		else if (FIELD(reg, MDP5_CTL_LAYER_REG_VIG2))
+			*pipe = SSPP_VIG2;
+		else if (FIELD(reg, MDP5_CTL_LAYER_REG_VIG2))
+			*pipe = SSPP_VIG2;
+		else if (FIELD(reg, MDP5_CTL_LAYER_REG_DMA0))
+			*pipe = SSPP_DMA0;
+		else if (FIELD(reg, MDP5_CTL_LAYER_REG_DMA1))
+			*pipe = SSPP_DMA1;
+		else
+			continue; /* WTF? */
+
+		return mixer;
+	}
+
+	return NULL;
+}
+
 u32 mdp_ctl_flush_mask_encoder(struct mdp5_interface *intf)
 {
 	if (intf->type == INTF_WB)
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.h b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.h
index b63120388dc6..5b8fa5df7713 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.h
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_ctl.h
@@ -65,6 +65,9 @@ int mdp5_ctl_blend(struct mdp5_ctl *ctl, struct mdp5_pipeline *pipeline,
 		   enum mdp5_pipe r_stage[][MAX_PIPE_STAGE],
 		   u32 stage_cnt, u32 ctl_blend_op_flags);
 
+struct mdp5_hw_mixer * mdp5_ctl_readback(struct mdp5_ctl *ctl,
+		enum mdp5_pipe *pipe);
+
 /**
  * mdp_ctl_flush_mask...() - Register FLUSH masks
  *
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_encoder.c
index 97f3294fbfc6..b80b6cf19dc8 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_encoder.c
@@ -101,6 +101,18 @@ static const struct drm_encoder_funcs mdp5_encoder_funcs = {
 	.destroy = mdp5_encoder_destroy,
 };
 
+static void mdp5_encoder_setup_crtc_state(struct drm_encoder *encoder,
+		struct drm_crtc_state *crtc_state)
+{
+	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
+	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc_state);
+	struct mdp5_interface *intf = mdp5_encoder->intf;
+	struct mdp5_ctl *ctl = mdp5_encoder->ctl;
+
+	mdp5_cstate->ctl = ctl;
+	mdp5_cstate->pipeline.intf = intf;
+}
+
 static void mdp5_vid_encoder_mode_set(struct drm_encoder *encoder,
 				      struct drm_display_mode *mode,
 				      struct drm_display_mode *adjusted_mode)
@@ -209,6 +221,70 @@ static void mdp5_vid_encoder_mode_set(struct drm_encoder *encoder,
 	mdp5_crtc_set_pipeline(encoder->crtc);
 }
 
+static struct drm_display_mode *
+mdp5_vid_encoder_readback_mode(struct drm_encoder *encoder)
+{
+	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
+	struct mdp5_kms *mdp5_kms = get_kms(encoder);
+	struct drm_display_mode *mode;
+	int intfn = mdp5_encoder->intf->num;
+	uint32_t hsync_ctl, display_hctl;
+	uint32_t vsync_period, vsync_len;
+	uint32_t display_v_start, display_v_end;
+	uint32_t dtv_hsync_skew = 0;  /* get this from panel? */
+
+	mode = drm_mode_create(encoder->dev);
+
+	hsync_ctl    = mdp5_read(mdp5_kms, REG_MDP5_INTF_HSYNC_CTL(intfn));
+	display_hctl = mdp5_read(mdp5_kms, REG_MDP5_INTF_DISPLAY_HCTL(intfn));
+	vsync_period = mdp5_read(mdp5_kms, REG_MDP5_INTF_VSYNC_PERIOD_F0(intfn));
+	display_v_start = mdp5_read(mdp5_kms, REG_MDP5_INTF_DISPLAY_VSTART_F0(intfn));
+	display_v_end   = mdp5_read(mdp5_kms, REG_MDP5_INTF_DISPLAY_VEND_F0(intfn));
+	vsync_len    = mdp5_read(mdp5_kms, REG_MDP5_INTF_VSYNC_LEN_F0(intfn));
+
+	// TODO I don't think there is a way to recover mode->clock??
+	mode->htotal      = FIELD(hsync_ctl, MDP5_INTF_HSYNC_CTL_PERIOD);
+	mode->hsync_start = mode->htotal - FIELD(display_hctl, MDP5_INTF_DISPLAY_HCTL_START);
+	mode->hsync_end   = FIELD(hsync_ctl, MDP5_INTF_HSYNC_CTL_PULSEW) + mode->hsync_start;
+	mode->hdisplay    = FIELD(display_hctl, MDP5_INTF_DISPLAY_HCTL_END) + 1 -
+			mode->htotal + mode->hsync_start;
+
+	if (mdp5_encoder->intf->type == INTF_eDP) {
+		display_v_start -= mode->htotal - mode->hsync_start;
+	}
+
+	mode->vtotal      = vsync_period / mode->htotal;
+	mode->vsync_start = mode->vtotal - ((display_v_start - dtv_hsync_skew) / mode->htotal);
+	mode->vsync_end   = (vsync_len / mode->htotal) + mode->vsync_start;
+	mode->vdisplay    = mode->vsync_start - ((vsync_period + dtv_hsync_skew - 1 - display_v_end) / mode->htotal);
+
+	// TODO maybe we want a flag to indicate that this is a readback
+	// mode, so not all fields are valid.  (Ie. when comparing to
+	// another mode to decide whether to do full modeset or not,
+	// ignore the fields that are zero.)
+	mode->type = DRM_MODE_TYPE_DRIVER;
+
+	// XXX how can we get these?  Maybe get modes from connector and
+	// see what fits (although that sounds ugly and annoying)
+	mode->clock = 148500;
+	mode->vrefresh = 60;
+
+	drm_mode_set_name(mode);
+
+	drm_mode_set_crtcinfo(mode, 0);
+
+	DBG("readback: %d:\"%s\" %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x",
+			mode->base.id, mode->name,
+			mode->vrefresh, mode->clock,
+			mode->hdisplay, mode->hsync_start,
+			mode->hsync_end, mode->htotal,
+			mode->vdisplay, mode->vsync_start,
+			mode->vsync_end, mode->vtotal,
+			mode->type, mode->flags);
+
+	return mode;
+}
+
 static void mdp5_vid_encoder_disable(struct drm_encoder *encoder)
 {
 	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
@@ -282,6 +358,54 @@ static void mdp5_encoder_mode_set(struct drm_encoder *encoder,
 		mdp5_vid_encoder_mode_set(encoder, mode, adjusted_mode);
 }
 
+void mdp5_encoder_readback(struct drm_encoder *encoder)
+{
+	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
+	struct msm_drm_private *priv = encoder->dev->dev_private;
+	struct mdp5_kms *mdp5_kms = get_kms(encoder);
+	struct drm_display_mode *mode;
+	struct mdp5_crtc_state *mdp5_cstate;
+	struct mdp5_hw_mixer *mixer;
+	enum mdp5_pipe pipe;
+
+	if (mdp5_encoder->intf->mode == MDP5_INTF_DSI_MODE_COMMAND)
+		mode = mdp5_cmd_encoder_readback_mode(encoder);
+	else
+		mode = mdp5_vid_encoder_readback_mode(encoder);
+
+	if (!mode)
+		return;
+
+	/* things like the chosen ctl and mixer need to be read back
+	 * and punched in to crtc state so that crtc knows what reg's
+	 * to readback.  The ctl is based on the encoder connected to
+	 * the crtc (ie. us) and the ctl is needed to figure out what
+	 * mixer is used.
+	 *
+	 * The good news is that since the crtc is fully virtualized,
+	 * we can just pick any one!
+	 */
+	encoder->crtc = priv->crtcs[0];
+	encoder->crtc->state->encoder_mask = (1 << drm_encoder_index(encoder));
+
+	mdp5_cstate = to_mdp5_crtc_state(encoder->crtc->state);
+
+	mdp5_encoder_setup_crtc_state(encoder, encoder->crtc->state);
+
+	mixer = mdp5_ctl_readback(mdp5_cstate->ctl, &pipe);
+	if (WARN_ON(!mixer))
+		return;
+
+	DBG("got mixer=%u, pipe=%s", mixer->lm, pipe2name(pipe));
+
+	mdp5_cstate->pipeline.mixer = mixer;
+	mdp5_kms->state->hwmixer.hwmixer_to_crtc[mixer->idx] = encoder->crtc;
+
+	mdp5_encoder->enabled = true;
+
+	mdp5_crtc_readback(encoder->crtc, mode, pipe);
+}
+
 static void mdp5_encoder_disable(struct drm_encoder *encoder)
 {
 	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
@@ -308,13 +432,7 @@ static int mdp5_encoder_atomic_check(struct drm_encoder *encoder,
 				     struct drm_crtc_state *crtc_state,
 				     struct drm_connector_state *conn_state)
 {
-	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
-	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc_state);
-	struct mdp5_interface *intf = mdp5_encoder->intf;
-	struct mdp5_ctl *ctl = mdp5_encoder->ctl;
-
-	mdp5_cstate->ctl = ctl;
-	mdp5_cstate->pipeline.intf = intf;
+	mdp5_encoder_setup_crtc_state(encoder, crtc_state);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
index d94c8a7657fa..12557ca9f2f0 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
@@ -22,6 +22,7 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
+#include "dsi/dsi.h"
 
 static const char *iommu_ports[] = {
 		"mdp_0",
@@ -33,6 +34,9 @@ static int mdp5_hw_init(struct msm_kms *kms)
 	struct platform_device *pdev = mdp5_kms->pdev;
 	unsigned long flags;
 
+	if (mdp5_kms->poweron_enabled)
+		return 0;
+
 	pm_runtime_get_sync(&pdev->dev);
 	mdp5_enable(mdp5_kms);
 
@@ -72,6 +76,56 @@ static int mdp5_hw_init(struct msm_kms *kms)
 	return 0;
 }
 
+static void mdp5_hw_readback(struct msm_kms *kms)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct msm_drm_private *priv = mdp5_kms->dev->dev_private;
+	unsigned i;
+
+	if (!mdp5_kms->poweron_enabled)
+		return;
+
+	/* We need to work backwards up the pipeline starting with the
+	 * connectors.
+	 *
+	 * TODO eDP
+	 * TODO HDMI
+	 */
+	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++)
+		if (priv->dsi[i])
+			msm_dsi_hw_readback(priv->dsi[i]);
+
+	if (mdp5_kms->smp) {
+		struct drm_plane *plane;
+
+		/* readback SMP state for active planes: */
+		drm_for_each_plane(plane, mdp5_kms->dev) {
+			struct mdp5_plane_state *pstate =
+				to_mdp5_plane_state(plane->state);
+			if (!plane->state->crtc ||
+			    !plane->state->crtc->state->enable ||
+			    !pstate->hwpipe)
+				continue;
+			mdp5_smp_readback(mdp5_kms->smp,
+				&mdp5_kms->state->smp,
+				pstate->hwpipe->pipe);
+		}
+	}
+
+	if (drm_debug & DRM_UT_DRIVER) {
+		struct drm_printer p = drm_info_printer(mdp5_kms->dev->dev);
+		drm_state_dump(mdp5_kms->dev, &p);
+		if (mdp5_kms->smp)
+			mdp5_smp_dump(mdp5_kms->smp, &p);
+	}
+}
+
+static void mdp5_hw_readback_encoder(struct msm_kms *kms,
+		struct drm_encoder *encoder)
+{
+	mdp5_encoder_readback(encoder);
+}
+
 struct mdp5_state *mdp5_get_state(struct drm_atomic_state *s)
 {
 	struct msm_drm_private *priv = s->dev->dev_private;
@@ -223,6 +277,8 @@ static int mdp5_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
 		.hw_init         = mdp5_hw_init,
+		.hw_readback     = mdp5_hw_readback,
+		.hw_readback_encoder = mdp5_hw_readback_encoder,
 		.irq_preinstall  = mdp5_irq_preinstall,
 		.irq_postinstall = mdp5_irq_postinstall,
 		.irq_uninstall   = mdp5_irq_uninstall,
@@ -653,7 +709,9 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 		if (mdp5_cfg_intf_is_virtual(config->hw->intf.connect[i]) ||
 		    !config->hw->intf.base[i])
 			continue;
-		mdp5_write(mdp5_kms, REG_MDP5_INTF_TIMING_ENGINE_EN(i), 0);
+
+		if (!mdp5_kms->poweron_enabled)
+			mdp5_write(mdp5_kms, REG_MDP5_INTF_TIMING_ENGINE_EN(i), 0);
 
 		mdp5_write(mdp5_kms, REG_MDP5_INTF_FRAME_LINE_COUNT_EN(i), 0x3);
 	}
@@ -908,11 +966,22 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	/* optional clocks: */
 	get_clk(pdev, &mdp5_kms->lut_clk, "lut_clk", false);
 
-	/* we need to set a default rate before enabling.  Set a safe
-	 * rate first, then figure out hw revision, and then set a
-	 * more optimal rate:
+	/* If clock is enabled when driver is loaded, then bootloader
+	 * has already set up the display:
 	 */
-	clk_set_rate(mdp5_kms->core_clk, 200000000);
+	if (__clk_is_enabled(mdp5_kms->core_clk)) {
+		mdp5_kms->poweron_enabled = true;
+		mdp5_kms->enable_count++;
+
+		/* let pm-runtime know that we are already enabled: */
+		pm_runtime_get_noresume(&pdev->dev);
+	} else {
+		/* we need to set a default rate before enabling.  Set a safe
+		 * rate first, then figure out hw revision, and then set a
+		 * more optimal rate:
+		 */
+		clk_set_rate(mdp5_kms->core_clk, 200000000);
+	}
 
 	pm_runtime_enable(&pdev->dev);
 	mdp5_kms->rpm_enabled = true;
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h
index 3b6dd4250242..15d32357d58b 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.h
@@ -74,6 +74,7 @@ struct mdp5_kms {
 	spinlock_t resource_lock;
 
 	bool rpm_enabled;
+	bool poweron_enabled;     /* display already on when driver probed */
 
 	struct mdp_irq error_handler;
 
@@ -273,12 +274,15 @@ void mdp5_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 int mdp5_irq_domain_init(struct mdp5_kms *mdp5_kms);
 void mdp5_irq_domain_fini(struct mdp5_kms *mdp5_kms);
 
+void mdp5_plane_readback(struct drm_plane *plane, enum mdp5_pipe pipe);
 uint32_t mdp5_plane_get_flush(struct drm_plane *plane);
 enum mdp5_pipe mdp5_plane_pipe(struct drm_plane *plane);
 enum mdp5_pipe mdp5_plane_right_pipe(struct drm_plane *plane);
 struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 				  enum drm_plane_type type);
 
+void mdp5_crtc_readback(struct drm_crtc *crtc, struct drm_display_mode *mode,
+		enum mdp5_pipe pipe);
 struct mdp5_ctl *mdp5_crtc_get_ctl(struct drm_crtc *crtc);
 uint32_t mdp5_crtc_vblank(struct drm_crtc *crtc);
 
@@ -290,6 +294,7 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 				struct drm_plane *plane,
 				struct drm_plane *cursor_plane, int id);
 
+void mdp5_encoder_readback(struct drm_encoder *encoder);
 struct drm_encoder *mdp5_encoder_init(struct drm_device *dev,
 		struct mdp5_interface *intf, struct mdp5_ctl *ctl);
 int mdp5_vid_encoder_set_split_display(struct drm_encoder *encoder,
@@ -302,6 +307,7 @@ u32 mdp5_encoder_get_framecount(struct drm_encoder *encoder);
 void mdp5_cmd_encoder_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *mode,
 			       struct drm_display_mode *adjusted_mode);
+struct drm_display_mode *mdp5_cmd_encoder_readback_mode(struct drm_encoder *encoder);
 void mdp5_cmd_encoder_disable(struct drm_encoder *encoder);
 void mdp5_cmd_encoder_enable(struct drm_encoder *encoder);
 int mdp5_cmd_encoder_set_split_display(struct drm_encoder *encoder,
@@ -312,6 +318,11 @@ static inline void mdp5_cmd_encoder_mode_set(struct drm_encoder *encoder,
 					     struct drm_display_mode *adjusted_mode)
 {
 }
+static inline struct drm_display_mode *
+mdp5_cmd_encoder_readback_mode(struct drm_encoder *encoder)
+{
+	return NULL;
+}
 static inline void mdp5_cmd_encoder_disable(struct drm_encoder *encoder)
 {
 }
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
index 1cbf8f823eba..933121274719 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
@@ -192,6 +192,85 @@ mdp5_plane_atomic_print_state(struct drm_printer *p,
 	drm_printf(p, "\tstage=%s\n", stage2name(pstate->stage));
 }
 
+void mdp5_plane_readback(struct drm_plane *plane, enum mdp5_pipe pipe)
+{
+	struct mdp5_kms *mdp5_kms = get_kms(plane);
+	struct drm_plane_state *state = plane->state;
+	struct mdp5_plane_state *mdp5_state = to_mdp5_plane_state(state);
+	struct msm_drm_private *priv = plane->dev->dev_private;
+	uint32_t reg, pitch, format;
+	unsigned i;
+
+	for (i = 0; i < mdp5_kms->num_hwpipes; i++) {
+		struct mdp5_hw_pipe *hwpipe = mdp5_kms->hwpipes[i];
+
+		if (hwpipe->pipe == pipe) {
+			mdp5_state->hwpipe = hwpipe;
+			mdp5_kms->state->hwpipe.hwpipe_to_plane[hwpipe->idx] =
+					plane;
+			break;
+		}
+	}
+
+	if (WARN_ON(!mdp5_state->hwpipe))
+		return;
+
+	/* NOTE: we expect to just have a single layer, so punt on
+	 * bothering to figure out how to map blending state back
+	 * to plane state.  And assume no scaling or anything fancy.
+	 *
+	 * TODO: we can't really differentiate between two non-
+	 * overlaping planes hooked to one CRTC, and src-split
+	 * mode, can we?  For now just completely ignore r_hwpipe.
+	 */
+
+	reg = mdp5_read(mdp5_kms, REG_MDP5_PIPE_SRC_IMG_SIZE(pipe));
+	state->src_w = FIELD(reg, MDP5_PIPE_SRC_SIZE_WIDTH) << 16;
+	state->src_h = FIELD(reg, MDP5_PIPE_SRC_SIZE_HEIGHT) << 16;
+
+	reg = mdp5_read(mdp5_kms, REG_MDP5_PIPE_SRC_XY(pipe));
+	state->src_x = FIELD(reg, MDP5_PIPE_SRC_XY_X) << 16;
+	state->src_y = FIELD(reg, MDP5_PIPE_SRC_XY_Y) << 16;
+
+	reg = mdp5_read(mdp5_kms, REG_MDP5_PIPE_OUT_SIZE(pipe));
+	state->crtc_w = FIELD(reg, MDP5_PIPE_OUT_SIZE_WIDTH);
+	state->crtc_h = FIELD(reg, MDP5_PIPE_OUT_SIZE_HEIGHT);
+
+	reg = mdp5_read(mdp5_kms, REG_MDP5_PIPE_OUT_XY(pipe));
+	state->crtc_x = FIELD(reg, MDP5_PIPE_OUT_XY_X);
+	state->crtc_y = FIELD(reg, MDP5_PIPE_OUT_XY_Y);
+
+	state->visible = true;
+	mdp5_state->stage = STAGE_BASE;
+
+	/* Reconstruct a framebuffer.
+	 *
+	 * TODO: assume XRGB8888 .. unpatched lk probably actually
+	 * is using RGB565 or BGR888, but those also don't work with
+	 * grub / EFI GOP, so just ignore it for now instead of
+	 * figuring out how to map the format related registers back
+	 * to a fourcc.  Since we know lk is only going to use one
+	 * of 3 formats, perhaps we could take a simplified approach
+	 * by just looking at MDP5_PIPE_SRC_FORMAT.{A,R,G,B}_BPC.
+	 * Note that mdp5 hw is expressive enough to encoded crazy
+	 * formats (RXBG5856 anyone?) so I don't think we can really
+	 * do a perfect job at mapping back to drm fourcc in any
+	 * case.
+	 */
+	format = DRM_FORMAT_XRGB8888;
+
+	reg = mdp5_read(mdp5_kms, REG_MDP5_PIPE_SRC_STRIDE_A(pipe));
+	pitch = FIELD(reg, MDP5_PIPE_SRC_STRIDE_A_P0);
+
+	state->fb = msm_alloc_stolen_fb(plane->dev,
+			state->src_w >> 16,
+			state->src_h >> 16,
+			pitch, format);
+
+	priv->stolen_fb = state->fb;
+	drm_framebuffer_get(priv->stolen_fb);
+}
+
 static void mdp5_plane_reset(struct drm_plane *plane)
 {
 	struct mdp5_plane_state *mdp5_state;
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.c
index 58f712d37e7f..86e9547d7bd4 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.c
@@ -257,6 +257,35 @@ static unsigned update_smp_state(struct mdp5_smp *smp,
 	return nblks;
 }
 
+static void readback_smp_state(struct mdp5_smp *smp, u32 cid,
+		mdp5_smp_state_t *assigned)
+{
+	struct mdp5_kms *mdp5_kms = get_kms(smp);
+	u32 blk, reg, val;
+
+	for (blk = 0; blk < smp->blk_cnt; blk++) {
+		int idx = blk / 3;
+		int fld = blk % 3;
+
+		reg = mdp5_read(mdp5_kms, REG_MDP5_SMP_ALLOC_W_REG(idx));
+
+		switch (fld) {
+		case 0:
+			val = FIELD(reg, MDP5_SMP_ALLOC_W_REG_CLIENT0);
+			break;
+		case 1:
+			val = FIELD(reg, MDP5_SMP_ALLOC_W_REG_CLIENT1);
+			break;
+		case 2:
+			val = FIELD(reg, MDP5_SMP_ALLOC_W_REG_CLIENT2);
+			break;
+		}
+
+		if (val == cid)
+			set_bit(blk, *assigned);
+	}
+}
+
 void mdp5_smp_prepare_commit(struct mdp5_smp *smp, struct mdp5_smp_state *state)
 {
 	enum mdp5_pipe pipe;
@@ -292,6 +321,22 @@ void mdp5_smp_complete_commit(struct mdp5_smp *smp, struct mdp5_smp_state *state
 	state->released = 0;
 }
 
+void mdp5_smp_readback(struct mdp5_smp *smp, struct mdp5_smp_state *state,
+		enum mdp5_pipe pipe)
+{
+	unsigned i;
+
+	DBG("readback SMP state for %s", pipe2name(pipe));
+
+	for (i = 0; i < pipe2nclients(pipe); i++) {
+		u32 cid = pipe2client(pipe, i);
+		void *cs = state->client_state[cid];
+
+		readback_smp_state(smp, cid, cs);
+		bitmap_or(state->state, state->state, cs, smp->blk_cnt);
+	}
+}
+
 void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p)
 {
 	struct mdp5_kms *mdp5_kms = get_kms(smp);
diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.h b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.h
index b41d0448fbe8..1fedeb6bc554 100644
--- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.h
+++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_smp.h
@@ -94,5 +94,7 @@ void mdp5_smp_release(struct mdp5_smp *smp, struct mdp5_smp_state *state,
 
 void mdp5_smp_prepare_commit(struct mdp5_smp *smp, struct mdp5_smp_state *state);
 void mdp5_smp_complete_commit(struct mdp5_smp *smp, struct mdp5_smp_state *state);
+void mdp5_smp_readback(struct mdp5_smp *smp, struct mdp5_smp_state *state,
+		enum mdp5_pipe pipe);
 
 #endif /* __MDP5_SMP_H__ */
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7a842b769925..542d8122a832 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -545,6 +545,9 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 
 	drm_mode_config_reset(ddev);
 
+	if (kms->funcs->hw_readback)
+		kms->funcs->hw_readback(kms);
+
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 	if (fbdev)
 		priv->fbdev = msm_fbdev_init(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c6adf7aaea26..5ade6a0f467f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -20,6 +20,7 @@
 
 #include <linux/kernel.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/cpufreq.h>
 #include <linux/module.h>
 #include <linux/component.h>
@@ -109,6 +110,7 @@ struct msm_drm_private {
 	struct msm_file_private *lastctx;
 
 	struct drm_fb_helper *fbdev;
+	struct drm_framebuffer *stolen_fb;
 
 	struct msm_rd_state *rd;
 	struct msm_perf_state *perf;
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index bb068d7f979f..7d721fd4fc7a 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -78,7 +78,7 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	struct fb_info *fbi = NULL;
 	uint64_t paddr;
 	uint32_t format;
-	int ret, pitch;
+	int ret;
 
 	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
 
@@ -86,9 +86,16 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 			sizes->surface_height, sizes->surface_bpp,
 			sizes->fb_width, sizes->fb_height);
 
-	pitch = align_pitch(sizes->surface_width, sizes->surface_bpp);
-	fb = msm_alloc_stolen_fb(dev, sizes->surface_width,
-			sizes->surface_height, pitch, format);
+	if (priv->stolen_fb && (priv->stolen_fb->width == sizes->surface_width) &&
+	    (priv->stolen_fb->height == sizes->surface_height) &&
+	    (priv->stolen_fb->format->format == format)) {
+		DBG("Reusing stolen fb\n");
+		fb = priv->stolen_fb;
+	} else {
+		int pitch = align_pitch(sizes->surface_width, sizes->surface_bpp);
+		fb = msm_alloc_stolen_fb(dev, sizes->surface_width,
+				sizes->surface_height, pitch, format);
+	}
 
 	if (IS_ERR(fb)) {
 		dev_err(dev->dev, "failed to allocate fb\n");
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index a8f2ba5e5f07..0b20eece3827 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -33,6 +33,8 @@
 struct msm_kms_funcs {
 	/* hw initialization: */
 	int (*hw_init)(struct msm_kms *kms);
+	void (*hw_readback)(struct msm_kms *kms);
+	void (*hw_readback_encoder)(struct msm_kms *kms, struct drm_encoder *encoder);
 	/* irq handling: */
 	void (*irq_preinstall)(struct msm_kms *kms);
 	int (*irq_postinstall)(struct msm_kms *kms);
-- 
2.13.0
