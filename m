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
Subject: [RFC 0/3] drm/msm+clk: handover of bootloader display
Date: Tue, 11 Jul 2017 14:20:05 -0400
Message-Id: <20170711182008.28298-1-robdclark@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

So now that this is working (at least on a single device), I figured
it was a good time to send out an RFC to start discussion about how
to do this properly, in particular the CCF/powerdomain parts.

The first patch adds flags so we can mark power domains and leaf
node clocks which might (or might not) be enabled by bootloader and
which we want to inherit when real display driver is probed.  (There
might be use-cases outside of display.. such as debug serial port?
I guess display is the most common/complex/useful use-case.)  From
the CCF/genpd standpoint, "inherit" really just means "fixup enable/
prepare_count and don't automatically switch off in lateinit".  The
rest of the complexity is in the display driver.

For display, there are two different cases depending on whether the
display driver is built as a module (ie. probes after lateinit) or
not.  If the display driver is built as a module, then we want efifb
to keep working after the clk_disable_unused + genpd_power_off_unused
late_initcall's.  And in either case, we want the display driver to
be able to detect that display is already on (by checking whether
various clocks are already enabled) so that it knows to readback the
hw state.  (And not try to do things like clk_set_rate() on already
running clocks.)

Right now this is working on 8x16 (dragonboard 410c).  I'm not sure
if we'll hit more issues in CCF with more complex devices due to
separate GCC and MMCC clock controllers (a bit fuzzy on how things
work with initially unparented clocks, if for example MMCC probes
before it's GCC parent clocks.. and in general I am by no means an
expert about the common clock framework).  Certainly I'd like to
hear suggestions about how to procede on the CCF/genpd front.

I am aware of another similar RFC[1].  Although on most of the
snapdragon devices you can in theory enable/disable the bootloader
splashscreen via a 'fastboot oem select-display-panel' command, so
I think whatever solution we have needs to introspect the hw to
decide what to do.

The latest version of these patches (plus various cleanups/etc that
they depend on) can be found here[2]

[1] https://lkml.org/lkml/2017/6/28/188
[2] https://github.com/freedreno/kernel-msm/commits/display-handover

Rob Clark (3):
  clk: inherit display clocks enabled by bootloader
  drm/msm: inherit display from bootloader
  drm/bridge: adv7511: deal with bootloader lighting up display

 drivers/clk/clk.c                               |  18 ++++
 drivers/clk/qcom/common.c                       |  28 +++++
 drivers/clk/qcom/gcc-msm8916.c                  |  15 +--
 drivers/clk/qcom/gdsc.c                         |   6 ++
 drivers/clk/qcom/gdsc.h                         |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    |  57 ++++++----
 drivers/gpu/drm/bridge/adv7511/adv7533.c        |   3 +
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
 include/linux/clk-provider.h                    |   1 +
 include/linux/clk.h                             |   9 ++
 30 files changed, 591 insertions(+), 42 deletions(-)

-- 
2.13.0
