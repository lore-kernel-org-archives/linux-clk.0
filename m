Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704789;
	b=bvmubpM4hT1+OYr3eKvkGoC8vXAzZ1mNdfixgdlKj1lKZEAC0wOB/nPB53gmKP64u3SB
	 IQweeRuEqHAjYA5KA7ZnYQ7+HLQHIRFBv4wF68iCdwA2Wafx1dRsosvpXeBPvfXOm7T2b
	 k1juwH6MilRTo9506HjIn4qysn0XL3C/fGb1MXayN1WNFVIPNSpUigZbHMFnsyQCTic47
	 7KeE2dT74MnJ/jSeIToRsDZW186Fmx5KT+hjtWq7hLfatjI6R+UcplsozEpR8ZIGYmJv2
	 tloxHlI4gIKvWi5M+eDS870xaPiC2A0LsIQZUtVL/irjBLMo39GAyDkZnFQVhUcmB+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704789;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=RrOv7CU2NAZPmYfHhE9qmxlo23xuzngVTOTd9duwgRs=;
	b=SWsy/HUr5zzpp82vjkQgpXvjdZGqrUZGISrUaNjRV2hCyrtjgYbkPLA4zSdcsJS/+yHn
	 wP+OLOtCbBAaungE7ZIxjNvcVsH2cRU5MtGzTtnOOYVZa32mJQPyk+drPAszfgSS8uqca
	 bgM3l7cRJwQlupJMmMYpbW3C99tcg0+tB+3hGA6TrWeQn3Hy1pDNwOHT9yN1pz8uvq0vT
	 +vPrqtmyol9bIYjEw49nCwvDEBK3ne3p7XQSWNXCOkFmKJvHO65dBj2yRUqXQsAoy+Jbh
	 v9rc+IH/CIaneJGiR3dDyeW+7XpQ54CV0lrD+PYg3jAH9tEHGTDJ7prfEmG0FRitkBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KdPTUQGO;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9F8606A331;
	Thu, 26 Nov 2026 14:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9F8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KdPTUQGO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704785;
	bh=Bf8dtseVDYyweSiEKFBSZr7qcxyZPpHohYhrJ+QdE6A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KdPTUQGO/Q7WkvVjrHm+lV3AjZw3i/4RqGSO0GENiPnevWNcFbNfAcH5NLGy8rexn
	 HJ4yHNj9UMceVOColJRrWkdxj5j4CxyWWRBGwv9QgYsvuykHhmC4iDiKTqmMxkeHmU
	 TR+aTWDWfMjP9nbXTezNReX+c6hmcUpu1EhGd/V5HTp4ivQHLBHf6hoMlPlGgr0Lfw
	 ZSZssynZ/BkqOnKjO3FNshH5rfEFW0dnFW7s0VQcN3wE2xNpMBz0v5Ye1R5AdPbJLs
	 AoPES+zccsddWlglBggWYPIEUIpGOrGAPDpis0iuxIRwbD6lifJWV5HqD0QbUvsY1E
	 gTbTkwaaPZZ+A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F402617E1090;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 670EC480038; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:40 +0100
Subject: [PATCH v3 5/6] arm64: dts: rockchip: add dfi clocks on RK3588
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
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-5-0f33c1b8df48@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=RUxKo8yjLDpNQswNDTGn2Yq0hb9ptZ/lBMieeJFpQPw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9CrdaNcsU5Jr/JkRVo9MJBZJ4Vwt1KN8
 RccFjsrYzGZRYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qaoOYP/270kR2vc9JNtA8y0CQIqb6xukuYBrYfS+PENLlRu3f7srQ41sxtpUFqodW7CI61qz2
 yCCW9jzcmxT86Vrqj9OlL+IeOH923Hh7ToEbgSjUIJ62ROsjjxMTFCv671zrpCC1C8HuhMvPrNU
 yDEQCHKSKNpoMf3lyFfeLbfApePgi6VRAGNhWsCgv1YjMO6JVV9ggN0LAcvtDFDcd+O1ZLbWmn8
 udXqcyHbbofSK6uYZcIHUsP+5TY7cvggiEfF5R8aKbG/Q9eA1vzbTEXrqbH6Cj+66shiRZRZpSb
 lb09eDBWOaWlqSJdTcoEhJgOQhVv9l87uaDNYEoXU9+G6dwljkQQA4YcxZVmPojGTUm++2WPyoM
 RkJptW/V9TzBOZBiPea4lCxu76bIs7HejKWWa1cE26s5ohQ+l32kInupk9bexkzx7QI7ngP5Db4
 4BKg4/fBvb3UbcN/DfPtNgIyVCQyrQaEEYQGuRvhYx/8P0mgBSyDZvtJsFZIKXGYvVIjYQCAGb+
 neVq9gyisL1vruKN58UUyTmyTOYoCjYcaD+iyKXMH6HLHsxRy3hk6VYLXiOr4peu5kEkhdDwpl2
 nBSZ/z81BaxTBaaipAEga+cxf5LdCyv4eZMslWTmHbfxStLrZWQ6Miucx5SYBaWQtjC6W23uSD4
 r6ay/giZny+g8//h8eh4jZA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The DFI clocks weren't modelled before and the binding didn't know about
them either. That has changed though, and now we actually need to
specify these clocks.

Add all four clocks for all four channels of monitoring.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index d0f364547ae5..ef0ff6555fba 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2190,6 +2190,10 @@ qos_vop_m1: qos@fdf82200 {
 	dfi: dfi@fe060000 {
 		reg = <0x00 0xfe060000 0x00 0x10000>;
 		compatible = "rockchip,rk3588-dfi";
+		clocks = <&cru PCLK_DDR_MON_CH0>, <&cru PCLK_DDR_MON_CH1>,
+			 <&cru PCLK_DDR_MON_CH2>, <&cru PCLK_DDR_MON_CH3>;
+		clock-names = "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
+			      "pclk_ddr_mon_ch2", "pclk_ddr_mon_ch3";
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH 0>,
 			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH 0>,

-- 
2.53.0

