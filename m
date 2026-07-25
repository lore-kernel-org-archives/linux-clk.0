Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E1635DA55;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955084; cv=none; b=G/2vNq1jfFUuHoQBHOyZZlt+T5v3847c1a2CRnnpV71JIC2XQtd00oCA9DkH5hLlZRCr9+IAB2dyFROSRH006aFIEYtlHAm/LOeqvnewkS1h7aCe9wrxyh9G9D1C6knl+3oq12fK65fKBRMoAJou1qiWcp3XtMqpGu2iNpSbQ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955084; c=relaxed/simple;
	bh=/R+Ze7oA+NGDLhKykSAKmraPAA3sz7rWCl3VRgG3utg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIoyhovnNlM2Caep6qORM9ewZu/dowItGnK2UynDJyeSabTc5G9/G2uU7QP7XeMq+GAp/e//54aDCvKlcf8hG2Hsa6inauDjLVY1zN71mTNXa6lNXx9u4gGE8ueEAKtYdEwrt/FYSXnZlimYBQHF0T/Z53W/FPc8cUjIacI1/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sjnh5Puz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sjnh5Puz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 710F7C2BCFB;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955084;
	bh=/R+Ze7oA+NGDLhKykSAKmraPAA3sz7rWCl3VRgG3utg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Sjnh5Puz1BwE0K1oTDFRC0/2ZT0NX0IZzD+hjoBynLvYCFRxx/4PrGxT0Ff8ufZxU
	 FgWzvOiBNl4cG2yUPH4E2itUL6OuCqjghxc7fIuEwRzoaCFfsLEez+azwivANACTnA
	 lGq/AdNGpbUhvDKa9NpjOnF5OkvYNFhsJjStFpb3OUQESFy2KsSgI7IWKJgWuV2OFn
	 LBcTIsWjTf3vnN/XZwP+Abf3B7yoj6tQ4Cv4bNhzq8WCgZG3SLYiZ49LaCdWEQDr2G
	 lXNjqpXhI+Ejq7gdUVU5NECdHJ4H6UjkikXq+P0xb0exySFTCrmo4kxIGf8II6Htf9
	 VVyLAo2w5Z2AQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA0FC5321B;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:15 -0400
Subject: [PATCH RESEND 06/17] clk: spacemit: k3: parent eDP/DP pixel clock
 to the PHY PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-k3-display-v1-6-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
In-Reply-To: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=1251;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=qBlMtjoJcxolZr+biObNXORMiyzxuZ3oViPL72enT0k=;
 b=v/5hMmXSPdG7RuwCFLMwvBdFD/XDdefDTpm+DpkHAFg3Lhu3i1GyF8+eKgnyAfu+UxaMRft0F
 klJhAZ+wUlsCIa067pvDdkWtL2YIt/EzbPNHEKsCHylRD3er9MWWh3B
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang.hk@gmail.com>

The APMU eDP/DP pixel-clock muxes were parented to a placeholder, because
their real parents (the DP PHY PLLs) did not exist as clocks yet. They do
now, so point each mux at its PLL and let the pixel clock reach the
controller through the clock framework.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 drivers/clk/spacemit/ccu-k3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..afbbbd797826 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -937,13 +937,13 @@ CCU_MUX_DIV_GATE_FC_DEFINE(ufs_aclk, ufs_aclk_parents, APMU_UFS_CLK_RES_CTRL, 5,
 
 static const struct clk_parent_data edp0_pclk_parents[] = {
 	CCU_PARENT_HW(lcd_pxclk),
-	CCU_PARENT_NAME(external_clk),
+	CCU_PARENT_NAME(edp0_pll_pxclk),
 };
 CCU_MUX_GATE_DEFINE(edp0_pxclk, edp0_pclk_parents, APMU_LCD_EDP_CTRL, 2, 1, BIT(1), 0);
 
 static const struct clk_parent_data edp1_pclk_parents[] = {
 	CCU_PARENT_HW(dsi4ln2_lcd_pxclk),
-	CCU_PARENT_NAME(external_clk),
+	CCU_PARENT_NAME(edp1_pll_pxclk),
 };
 CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18, 1, BIT(17), 0);
 

-- 
2.43.0


