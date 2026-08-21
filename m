Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736C4756AE
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306940; cv=none; b=gpPNkyOvPewoIuYZEWYS+byD4YNTNztG8A1AB2Vh19RTtOcmvc/XVwFwhKBDRyfBR2yf4PQvbrnoQlP7OqjQIF9lSjkyHs1t/lOYWGWIV0j7FXdnGMv+YfhE3g7QToJGsUBqQODwB+BqNeJfo5DBqLW+jnj6NlwfzvN2SsC0CMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306940; c=relaxed/simple;
	bh=BciBZVPWsPAU/PAjg84Qxb87AhCg9X5Xz0ffIpsDchc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3tCqtkiGL0gPpnwEKvQ4GDv+50kKVAzqLPU5L8h4zaAT5eAjj46EIwMqI/bjPwsZQ6qsN5nFvvvO52GAsKlbz3Qk6Ykdmb73L+1Qa7E8RlhhrwDcaqFREV5uttGW6bRYVciBYha/oapeapWNZet/lcB0Dnz3e8GNBX+vuLRXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5355A1F00A3D;
	Fri, 21 Aug 2026 10:08:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] phy: rockchip: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:08:40 +0200
Message-ID: <adb5bd47343dd31661748d5de14cb28a2bae2d17.1787240165.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787240165.git.geert+renesas@glider.be>
References: <cover.1787240165.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 2 +-
 drivers/phy/rockchip/phy-rockchip-usb.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index c3d257a0f4a65b4c..d2c2b17df5f340e4 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -1044,7 +1044,7 @@ static int inno_hdmi_phy_clk_register(struct inno_hdmi_phy *inno)
 {
 	struct device *dev = inno->dev;
 	struct device_node *np = dev->of_node;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *parent_name;
 	int ret;
 
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 7d8a533f24aeadc2..e47b89015586feee 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -400,7 +400,7 @@ static int
 rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 {
 	struct device_node *node = rphy->dev->of_node;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk *refclk = NULL;
 	const char *clk_name;
 	int i;
diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index cef96739cf3ff41f..c5a2853a63d3099c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -200,9 +200,9 @@ static int rockchip_usb_phy_init(struct rockchip_usb_phy_base *base,
 				 struct device_node *child)
 {
 	struct rockchip_usb_phy *rk_phy;
+	struct clk_init_data init = {};
 	unsigned int reg_offset;
 	const char *clk_name;
-	struct clk_init_data init;
 	int err, i;
 
 	rk_phy = devm_kzalloc(base->dev, sizeof(*rk_phy), GFP_KERNEL);
-- 
2.43.0

