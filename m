Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794290582;
	b=PbpzhzIdt/uOPQ8ZdOTuGgOjQ9tuSEU6wPdSLaxcN4ZRzZJWr6Ct9RkVkwUOAL+GVuc8
	 1uVXKiiXYKMEyM552c/rsVDzNnCejmwF+Ux/ntHlhsmSMSp0vTnZQo4B3uu9WhLga77zu
	 DQue0ueHTMyCjBO8e98+8Z2l8rdbolCLm/W4vBYAdCWg4Ncl+DyYmHCmPmuMYISPrF5TZ
	 J0hhwQHMOWWbK36cBEyuMEW2ek+SBZpDHhQtHuoAQMbRzzMGJ7ec3gjzzbXFR4RCTzSK1
	 X9m8/8Hcns+LuImO4mCjik2VY/i10Ek+R8/E/sCXz3l4ROoJVylC9yphJe60BWlemUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290582;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aBuTrJA+FgdKKec0+ASncz9uD0roe2QTrv+5Thtip9c=;
	b=1QT4yr4u9Noq9pMyKbBSe8R6dnnd9g/OVM3WLMc99MO15Pz/pVYf2nIcDXmZCKEr9K5R
	 Ytz9XOkfSwRodiruUQHTZW3thQBtrGNnGfPxtfpktHdl+5I6KAUWh/E35C+0+IQ94qM9N
	 /oazb+jhdY1BHevCz5sGR/eDo8i/4Fy+OvLubRYfOLbkipNoU7ntt95x7QHUfOuamvj5W
	 ykSnkAhzMVzKOb76ooIFX4i42nfgSITFxIMSx9TQwG9OUSeenlnGBLnRn3Q4H3nohaVDe
	 F1HBBwpbPFSjLhaZqyeMvHmskW1k8sVGj2BXE4DtruMScuANuSGZ6p3w+ukgzs2Wp3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GeH37zLg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B7606A325;
	Tue, 10 Nov 2026 06:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GeH37zLg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794290582;
	b=ocuq7KUvLN6Lna9nEel/ougNICl/K0RGqx9CHhSCYE+HTau1iWK67mRtpkjxPN9kJ1Oj
	 tS+Fnrvrhi1lDdqYZ80v7UZ32KPPI1ka4Iw8q1wrbQnAsHPHykYFsg7vKjhUilh1o2PrE
	 WCxvHW9dPWZ9YobWgu8Hle/WQhTQf8BMMWb1ZZ7J0AIoJjrU8opUh/bynDuV9tnqp/NfB
	 KzUTPQQDXQWvmBX4yAww2uRJWx16KWatavI2SEUCEmxFCXjiCFP+Nrl911XuBtuOTp+DO
	 TOptoY1qfH2LiUifAele6//bAikjt6Zr/5kTI0T/Oe/2wcowg2ES9HmyKNxZ+gR5GSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794290582;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aBuTrJA+FgdKKec0+ASncz9uD0roe2QTrv+5Thtip9c=;
	b=CXetJ7jRYyzQg+Je7hJdInS+b444IbuGfaHAFJ8AGyVwgfb4afqRX7IxUfps4fVxyK17
	 boZOi/wzhtO356otuW9YoRjnHeF+VBsTrxtWlZw+D/mUGxl45AE7sbZKwgTZhsaVkQUM3
	 Af9vdRb9hi1/6pHxN/JtGxjut/mNNz5lOPuCJLjgsENVYfFX6sNMnrSW6wVoC6CR+4oxv
	 pAkP4AceKc16mWzr2FAHYa4B6/rYLVTHbuKiKXylBvdQQeFi8aK9zHU4jsezIxzAT545W
	 R2hi0dZ83rANO7dIc+gUi57weMiaJMeCYzk6+wJ8DI1G3ikh04LIZ0sfk9yhZaRmvcw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C4C91F008A1;
	Tue, 10 Nov 2026 06:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794290582;
	bh=aBuTrJA+FgdKKec0+ASncz9uD0roe2QTrv+5Thtip9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GeH37zLgXVBvjj1YxJ74cdkIewwXe/anc3KkRL95uX0nkbufhjdl5XDOgTugHzBke
	 AgU73Kh0BB2Kk7GCgaLkflfd6trcbkPt0ybJ/UHERb4/fAHLnU7D5OHFgQXD1JbiQ8
	 VfyObIlkAphBG4lSTy4SueYcEdXUb5VJsW/pins7iqiM733aBJ047+21TLpZ1ek564
	 LqGhWrmFeq23vASZEPYOmOQ/x9V60yn1qNyWNRnDR7d1Sz3sXnFA4sYKv+LmQdyc9C
	 y6dJz5/hS3LRcnjDJ7T7jPE4YqI0hvajf4oJcTX4mMHyROw1cujGqkjjoC5Knr2sN2
	 XVf5+GrezQ07A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2CA1488C9;
	Tue, 10 Nov 2026 06:03:00 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 06:03:00 +0000
Subject: [PATCH 1/2] clk: sunxi-ng: h616: Fix the EMAC 25 MHz clock parent
 and divider
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
References: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794290580; l=2089;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3R8NOHaq8WoHe/ITqSr7/Mvs3yLBB/Q5F/fqBEKvzFI=;
 b=jzSAMX5MGax6j/Mgiufd6pZI7rdjq+ZZuAkF5zVH/+HvL4wamDRRPeN1VUPK/621DM58gISNj
 SyCW5lxUvqJBU2BHhv0egJCBCxYqLjGQzir3oElj7XrOaxwf9M6FO3a
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The H616 user manual (v1.0, 3.3.5.86 EPHY_25M_CLK_REG, 0x0970) gives the
EPHY 25 MHz clock as PLL_PERI0(1X) / 24, with bit 31 gating the output
and bit 30 gating the PLL_PERI0 input. The driver models it as a plain
gate below ahb3, so the clock framework reports the AHB3 rate (200 MHz)
for a clock that runs at 25 MHz, and the clock tree does not show that
the PHY clock depends on pll-periph0 rather than on the AHB3 bus.

Model it like the D1 driver does: a gate with a fixed /24 pre-divider
below pll-periph0. The register writes do not change, only the parent
and the reported rate do. On an Orange Pi Zero2, emac-25m now reads
25000000 with pll-periph0 (600 MHz) as its parent.

Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 CCU")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 955c614830fa..d2625fec651a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -489,8 +489,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(spi1_clk, "spi1", nand_spi_parents, 0x944,
 static SUNXI_CCU_GATE(bus_spi0_clk, "bus-spi0", "ahb3", 0x96c, BIT(0), 0);
 static SUNXI_CCU_GATE(bus_spi1_clk, "bus-spi1", "ahb3", 0x96c, BIT(1), 0);
 
-static SUNXI_CCU_GATE(emac_25m_clk, "emac-25m", "ahb3", 0x970,
-		      BIT(31) | BIT(30), 0);
+/*
+ * The EPHY 25 MHz clock is PLL_PERI0(1X) / 24, gated by both the special
+ * clock gate (bit 31) and the PLL_PERI0 input gate (bit 30).
+ */
+static const struct clk_hw *emac_25m_parents[] = {
+	&pll_periph0_clk.common.hw
+};
+
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac_25m_clk, "emac-25m",
+				      emac_25m_parents, 0x970,
+				      BIT(31) | BIT(30), 24, 0);
 
 static SUNXI_CCU_GATE(bus_emac0_clk, "bus-emac0", "ahb3", 0x97c, BIT(0), 0);
 static SUNXI_CCU_GATE(bus_emac1_clk, "bus-emac1", "ahb3", 0x97c, BIT(1), 0);

-- 
2.55.0


