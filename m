Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	narmstrong@baylibre.com
Subject: [PATCH 0/2] clk: meson: gxbb: Add VPU and VAPB clocks
Date: Mon, 16 Oct 2017 17:34:43 +0200
Message-Id: <1508168085-19032-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

This patchset adds the VPU and VAPB clocks used to feed the Amlogic Meson
GX SoC Video Processing Unit and it's power domain.

Neil Armstrong (2):
  clk: meson: gxbb: Add VPU and VAPB clockids
  clk: meson: gxbb: Add VPU and VAPB clocks data

 drivers/clk/meson/gxbb.c              | 292 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h              |   6 +-
 include/dt-bindings/clock/gxbb-clkc.h |  11 ++
 3 files changed, 308 insertions(+), 1 deletion(-)

-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
