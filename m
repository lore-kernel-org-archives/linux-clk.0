Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704789;
	b=jG3Re/Te95+tUQyT9aj2hzoo8gXTGuJQEj837Td4HwSmQGJA7csjytb2OUCu6e6M5zdy
	 u9g2ORC2/z1S7CEQbbrQpFFTIC9b5H1UxF1k5FoM/G36WacGTZMdGcaPVMese37IuHXnO
	 XbLTafNJcZAR2EN65dLwzvN0PABmi7lqyaN0wYHCG0epxbu0RchP/TI6P4scUbmnPpAkT
	 RheONvs9MuIBeF4WOsHxNxEnnFm4D7mjglikXsbOhadNXqi3NWoA/exFCARaAgaYKc35S
	 U3LX0qW+ZkEWQs5eC0DSHDUurNo2DhbqjRyqVFX9XqIL48pXwN/P0swgU88y0S/PehQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704789;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=fVOKfsYN02kg7xQpJzOoRQV4jxHetRqNQ291WfjEico=;
	b=ozzrXjZghTXhYVMuM/p7VMHC6KoJfIs0QWpGE2Fhs2YG0AAOqM18aNBhvAvXb4XfoUQM
	 ssgRNILyjLyCQe5mbZnaeKM4esS9fWrYVYEZQirSJtl00R0P2Sgvce5IRYgWNpl+T2YUN
	 C4mfLsjlJx8//di1BBTp+3YjUwwsOn6toEH6LvUr3cN9+rV8vqITTCuCJTZog2C+IswqW
	 NJOLUDZ214WXaCzzatpZYTYzCtcQ1J7zl7+yAyDE5Zkfa7i9lhMuMwrOQ1mvl/UOZSn08
	 B6s+ksiyDInxc6+gZY/EfSzwK7eZlc9efvKKrbYq/3EFqP/OKgzUY9EfDCk4oJ9J6NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mx4AKRHB;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EA7606A6A6;
	Thu, 26 Nov 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7EA7606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mx4AKRHB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704785;
	bh=rWejNj0WULrcamHG6/BgfWQIj0iuy47prHNASyhZiss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mx4AKRHBYsZdqBmiXia390eB5kSALaHRUqRD6mqqvyX4BX1+bwkqQaYHGZzToIEJC
	 c52xe91UZ3QJbGdSVZjqTnKZCYVylfPJ3gpKtcUjd0fqVVVkbYqPVZOx+8cVDgURPx
	 +UWSD1xkPowKL7uxB/g7VNwMsFpZTy0vjjQ8gaERKxT7w6wAIVsnF518R2u17hjqQI
	 xQuvAD83Bnu29NtX2ttsy149aH2y+dcTZmFGoDJKSVLNlqnbgAEDYE58xjadS1D886
	 iUbO8B/dApbq/NHQGzjDJaTQkpOlIUU0d5ZW2zkLEzth6YRAHI6OJYMTrKzjRElYpu
	 kVS62GEA4SiyA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01C4017E10BE;
	Thu, 26 Nov 2026 15:53:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 68E4C48003A; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:41 +0100
Subject: [PATCH v3 6/6] arm64: dts: rockchip: add DFI node to RK3576
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-6-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vUsaOq3T3uYpbdnRFLLSmxxz/kown/XAk7depW4TeBI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9B5VgGHDMZWPpveGCLv/m7bykbFXTXYs
 J36k78XSXTzyYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qaIVAP/1MS06kTm5J60by/w5a8Q1VEVcKu/8E9X/bnLgLQ01vMKFNIRs4xoezL+IPC8LF2lSu
 sNvAfpz6qTFYTjkDRFzgMLwcHQeult5weca1VfNaFSqoFLBUyQl87+1x/1bHUssfo+NBD+4tmAQ
 O+4bo7zkbB5aeo8CPD3r97Yzoxz/+mE9/cnYjykRntGyZ8luotG7n2ZAkBduHupHMy5yamrh/Ob
 x6oLvUQygThgwknxtq6pf+95bsKt2TN5AuZwOI6XTSlnQNLBEessge8lg9+DVBIZoiEsbP8B3Pu
 iwbD3KOZY2O1jvOpEf+w2CiLyE9LE/Hv/qJ3TscEp2lHRGKURjWUF220xoTRU9uLL1FgHVbQ3hp
 mpdgc6zsQ/JXeRaHbS6ezI5J2DLfivz8mz2ZIpYWm9zYTB9xNOXFpq+QLsvloMZKK10yxEveXzN
 KgPa/JVW3LlgoqQ8ku6bKdI6X9hW0raa2P4r7/hN0vNU9yLYxX9VTi81jwUNY7Wm2d5BBJtWojh
 0FJyWS9SklUQBycCJiO748GDBrVP/sgFtHjx6Ls0YBnRvSs5TgPmrDELKjCKR90wT+jnco6TCLh
 NkvvfbI/cNYaxNYNqSUcR/JZ0Pp2AI/nw6ts1z4K38kwLVS7E1uxDRS35ZxQuQSnTtJxQ0VFNJQ
 DZ3UJoC8yPHK7tKtcwVAx0A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Like previous Rockchip SoCs RK3576 has DFI hardware to measure DDR
bandwidth utilisation. Add the node for it to the SoC's DT.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 6f5780af4192..f8bc79ac47ac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2057,6 +2057,17 @@ qos_npu_m1ro: qos@27f22100 {
 			reg = <0x0 0x27f22100 0x0 0x20>;
 		};
 
+		dfi: dfi@2a000000 {
+			compatible = "rockchip,rk3576-dfi";
+			reg = <0x0 0x2a000000 0x0 0x20000>;
+			clocks = <&cru PCLK_DDR_MON_CH0>,
+				 <&cru PCLK_DDR_MON_CH1>;
+			clock-names = "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1";
+			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
+			rockchip,pmu = <&pmu1_grf>;
+		};
+
 		gmac0: ethernet@2a220000 {
 			compatible = "rockchip,rk3576-gmac", "snps,dwmac-4.20a";
 			reg = <0x0 0x2a220000 0x0 0x10000>;

-- 
2.53.0

