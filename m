Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A7944C4FF
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306936; cv=none; b=nHRuPchiKFWU/8CvakfVPBgT5EgtuKurloHsnI7xslCkQn3p6mJrgh3bK6CUxn2Z6fP+zkkLDamNBX+2Wc1jDjXtdZnC2DDKSD27IcSVAZCkrOodCeysneenwIr1/1c17mv1iIEQCgMyAzKdy73uvzFI/adguwqiScaHgKuZ4h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306936; c=relaxed/simple;
	bh=MYfwPBHZDFX4gbPf8qzZSNc6ctGFJ8/kYJcvqtcq07E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKf1R5CkYEUqM8nxNtOJ2wWLP7WOAMoaT4c00nwDb5K/fGho1BNV8tQhUSxGOcJ7WzB304+pWV2oZfwZbq6OSG+9rxUGtgh3ePjZYWZLH88oAfn8TpWiE2rj1hgLG57nkidux6lxU/ArezVjwFDKABYLDJhnbY8/wYe++NOYLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEB81F00A3A;
	Fri, 21 Aug 2026 10:08:45 +0000 (UTC)
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
Subject: [PATCH 1/2] phy: freescale: fsl-samsung-hdmi: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:08:39 +0200
Message-ID: <3c3be1c676eea5d32102864c57643b1573bc0db0.1787240165.git.geert+renesas@glider.be>
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
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index 0f25d81de61bb67f..ded142020e725f58 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -610,7 +610,7 @@ static int phy_clk_register(struct fsl_samsung_hdmi_phy *phy)
 {
 	struct device *dev = phy->dev;
 	struct device_node *np = dev->of_node;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *parent_name;
 	struct clk *phyclk;
 	int ret;
-- 
2.43.0

