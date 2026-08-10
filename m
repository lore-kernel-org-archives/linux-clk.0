Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557753EC816;
	Mon, 10 Aug 2026 12:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364192; cv=none; b=AlxxnMjggwG9OtmlL4SsRr6KnEe3yS1WSt5Pd7EzUalTOnVXtmxBFoAZGRKGsrQReIAIjRwVKeZxQ7oi7iuATxUtdnFww6i2iEDyHj8pJ7cLPg9olyYiVtlc/x52SlGTAy8YI8rUit6jgwZgN+OHMHM196V3z3Lo5Kkp2/TpXIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364192; c=relaxed/simple;
	bh=Hlb3zGiE/jTTbqr6GH01A5CdzLPFhNzjLR7B2UM6ijY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEQtfo/Vwg5dTx6yzyskaCEOvA5qgwg21Ao86r5Y/UwGHQXc9+aNlzfa3ZdAPSGibziA2bFJ4xCplzOkWgPZzLNbhfskCypAKdnCje+RZzQb53zd8Yv/fACOrF1H+i8IZWniJhoew57d8I7c3R6/viWkxeGP6WT72sgEhZAKtC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=pyg4r4ZO; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="pyg4r4ZO"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E46DEC0519;
	Mon, 10 Aug 2026 15:16:27 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364189; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zmEzOagfD/gxsGiGWHAJSJv8bTNucnmIbKN5W/YS2eo=;
	b=pyg4r4ZOIP9A/e3kdcpDnIlTXtmyR5dwMrmgno9ZP5ew3iEcFwaZVfRNk7YOiaZyLQtYCb
	rzNSDfG6tyrz/kCInE5gSG2ccLOdw2WGGZAEdIAkCJ+c3kI9H18aLFHKl54NtX0xijNA/R
	JosPeXsGO+0aMDEM99TwER0f+2rH8oiPgEq8eYfH0lFCFxYXI4WVKtkmdqwDFv/FmJg6Gf
	LFhaImskTfnvKKDQZuAfBsT9Lf194h04ZYTMnultP+paLeSH2zIA+rCJy11tNsVKQro8wR
	I5E22s/S55vXFpAjM/+smuqrwfBnBuc8hiSYRQX/BnSFiBTUkbW4Px0p8uujIg==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 21/25] ARM: dts: rockchip: Add RNG node for RV1106
Date: Mon, 10 Aug 2026 15:11:12 +0300
Message-ID: <20260810121121.210040-22-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add the true random number generator (TRNG) node for RV1106,
compatible with rockchip,rk3588-rng. The node is left disabled
by default and can be enabled in board dts files.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index ce2f169b1acd..5db640a6ba90 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -255,6 +255,15 @@ dmac: dma-controller@ff420000 {
 			arm,pl330-periph-burst;
 		};
 
+		rng: rng@ff448000 {
+			compatible = "rockchip,rv1106-rng", "rockchip,rk3588-rng";
+			reg = <0xff448000 0x200>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru HCLK_TRNG_NS>;
+			resets = <&cru SRST_H_TRNG_NS>;
+			status = "disabled";
+		};
+
 		i2c2: i2c@ff450000 {
 			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
 			reg = <0xff450000 0x1000>;
-- 
2.47.3

