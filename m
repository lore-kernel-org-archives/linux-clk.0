Return-Path: <romain.perier@collabora.com>
From: Romain Perier <romain.perier@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: philipp.tomsich@theobroma-systems.com,
	klaus.goger@theobroma-systems.com,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Romain Perier <romain.perier@collabora.com>
Subject: [PATCH v2 3/4] nvmem: rockchip: add support for RK3368
Date: Mon,  4 Sep 2017 10:51:18 +0200
Message-Id: <20170904085119.25981-4-romain.perier@collabora.com>
In-Reply-To: <20170904085119.25981-1-romain.perier@collabora.com>
References: <20170904085119.25981-1-romain.perier@collabora.com>
List-ID: <linux-clk.vger.kernel.org>

This adds the necessary function for handling support on RK3368 SoCs

Signed-off-by: Romain Perier <romain.perier@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt | 1 +
 drivers/nvmem/rockchip-efuse.c                             | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
index 1ff02afdc55a..60bec4782806 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
@@ -6,6 +6,7 @@ Required properties:
   - "rockchip,rk3188-efuse" - for RK3188 SoCs.
   - "rockchip,rk3228-efuse" - for RK3228 SoCs.
   - "rockchip,rk3288-efuse" - for RK3288 SoCs.
+  - "rockchip,rk3368-efuse" - for RK3368 SoCs.
   - "rockchip,rk3399-efuse" - for RK3399 SoCs.
 - reg: Should contain the registers location and exact eFuse size
 - clocks: Should be the clock id of eFuse
diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efuse.c
index 63e3eb55f3ac..eb4c530c2564 100644
--- a/drivers/nvmem/rockchip-efuse.c
+++ b/drivers/nvmem/rockchip-efuse.c
@@ -178,6 +178,10 @@ static const struct of_device_id rockchip_efuse_match[] = {
 		.data = (void *)&rockchip_rk3288_efuse_read,
 	},
 	{
+		.compatible = "rockchip,rk3368-efuse",
+		.data = (void *)&rockchip_rk3288_efuse_read,
+	},
+	{
 		.compatible = "rockchip,rk3399-efuse",
 		.data = (void *)&rockchip_rk3399_efuse_read,
 	},
-- 
2.11.0
