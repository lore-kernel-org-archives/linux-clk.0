Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH 0/2] drm/vc4: DSI display output support
Date: Mon, 23 Jan 2017 16:38:51 -0800
Message-Id: <20170124003853.16418-1-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

This is a resend from a month ago of just two of the patches (several
are accepted at this point) from the DSI series, hoping to collect an
ack from DT.  Ccing the clock folks as well, since this ends up being
a clock provider.

Eric Anholt (2):
  dt-bindings: Document the VC4 DSI module nodes.
  drm/vc4: Add DSI driver

 .../devicetree/bindings/display/brcm,bcm-vc4.txt   |   35 +
 drivers/gpu/drm/vc4/Kconfig                        |    2 +
 drivers/gpu/drm/vc4/Makefile                       |    1 +
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |    1 +
 drivers/gpu/drm/vc4/vc4_drv.c                      |    1 +
 drivers/gpu/drm/vc4/vc4_drv.h                      |    5 +
 drivers/gpu/drm/vc4/vc4_dsi.c                      | 1725 ++++++++++++++++++++
 7 files changed, 1770 insertions(+)
 create mode 100644 drivers/gpu/drm/vc4/vc4_dsi.c

-- 
2.11.0
