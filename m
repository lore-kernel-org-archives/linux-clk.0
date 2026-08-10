Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50A83EC823;
	Mon, 10 Aug 2026 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364194; cv=none; b=Vps6TAfn6BS1QfnYZVjqqTJbAn8PZPxSfaG1/VMAywtlluRMWsLu9OwQaOL2KMrCG8+4dxAQY6FGJODNRBgD8rmbW9LT11Dxldkiz9R5Ju2JXo2Lnyogx2LW0pllwZQb3cqgT/SrFLZi8qRHg9vFBu+YpTs1ZCmcmEmDOcC9kDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364194; c=relaxed/simple;
	bh=//5Luhk7Q1co+UT8/FPgq+Wn0X0axEbKWWcBwfkbrmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grCW/Iqa9glo88m00yUtkTyRQeh8mq1Y+WqrOYRO4+tlzpQwpPPIO3sdgl+WgrLF/fqDxIdp4QvYveYM0k3moq+wPNVtDLa/NPsFyXvYsJ8dlf31O+8sGZobqKngYheiYxdANvEMCytUvwdyv6urNcwVU4WwYWZxWoZGL86/848=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=X6r2N0uv; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="X6r2N0uv"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11777C0514;
	Mon, 10 Aug 2026 15:16:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364191; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9cR5q9c8zxs0kvDwMYx9QuXfsTPCggxiJ1S/eoJFxgg=;
	b=X6r2N0uvMlSwPEGhnKwGUJ9gpJSyCW7rZGh9JrII3qrGjaYx12Es1+zGl7DT0Irs15qKxq
	Q8HSAn9Le8rI3AnqF6eL0VMGneMiiVVlRvKMyTQfMHJk0N5Blct8kMOSb8G0HQyOh7BisR
	dDkMEkYDsvyk4BrHF0jxaQp9jxitD9uK9E/ZzKi0nlFn67vZfbfkuSW3eqOWKuqqtxsQFC
	tZrSVzfMeo5vBTLq3hTKGLhrtZmVqBRngbb4v/Z3zbj8RDYHD4tqTQcrcj7ViGfT1Vn/hR
	VQBq6aGJHxSAinGUW1X9gd4rSXaCxsnE7wvsup3tNTJlft/q+lBz3smJMg9D6g==
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
Subject: [PATCH 22/25] ARM: dts: rockchip: Add SDMMC1 node for RV1106
Date: Mon, 10 Aug 2026 15:11:13 +0300
Message-ID: <20260810121121.210040-23-vlad@zlab.su>
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

Add the SDMMC1 controller node, compatible with rockchip,rk3288-dw-mshc,
matching the existing eMMC and SD card controller nodes on this SoC.
The node is left disabled by default and can be enabled in board dts files.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 5db640a6ba90..b31cdb1c19d4 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -450,6 +450,18 @@ system_sram: sram@ff6c0000 {
 			ranges = <0 0xff6c0000 0x40000>;
 		};
 
+		sdmmc1: mmc@ff9a0000 {
+			compatible = "rockchip,rv1106-dw-mshc", "rockchip,rk3288-dw-mshc";
+			reg = <0xff9a0000 0x4000>;
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>,
+				<&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
+			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+			fifo-depth = <0x100>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
 		gmac: ethernet@ffa80000 {
 			compatible = "rockchip,rv1106-gmac", "snps,dwmac-4.20a";
 			reg = <0xffa80000 0x10000>;
-- 
2.47.3

