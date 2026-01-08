Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4433A71E;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852506; cv=none; b=TCZLZTgQfjfKxL1T7t9wHiH2mlrDkZMsdIiGcJeOBBf5Crh4erTpsJn+gM3xyE50ja2piTo3hfbP8PSmizyYSgknR0sYDk8+ONi2tdME23BvAbJ5gIZP86C3r5ynErgE+zRaufGQnIa44PXdl0vJ0o47cb1ek3YJWzkAtfxv0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852506; c=relaxed/simple;
	bh=cVF3ZGBxFw46Zm8/l8bHWG0RQpu+h0lasLVe7zXgkkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TL7Z/mkAwLtUKRf1qN6WzVIlwt8e5+uAbA+VadQQge09ZtKhsZmwB+b+ZT8I7Jvm4dRNAJehPmw1TkfTfx4cnpAu4msDrzMXU7cwwTkBJ0iOfVzFMErvCmwu+uDsWPokH1DdNX/u8cRcLba6U50YcYLjTTylI8LuTrQT0yN2nwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrLV871Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrLV871Y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36F00C2BCB2;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767852506;
	bh=cVF3ZGBxFw46Zm8/l8bHWG0RQpu+h0lasLVe7zXgkkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JrLV871YsN8mmGvrUgPYmymuli1KvtzpBZTLeE1nNbj0lERDYNFB2s93qDcKtF4z9
	 vdHmm3jCLWQRU3qMdKa9UZXqyzDEqQaODrXqSpt9aE8m9HtsIbRYigEc/p2oaRGOJL
	 6vgp2Arq03ljx4d+iwztqsD5Vrpn6IECc9QbPAFaxX39WYcMhHGft7UWJVM59/IIqh
	 j6ZgdTc9P/xrzEnslqpx+u3MFowncdX9Ci1OkNh6NbyiSb6OXttaL/iX8a/uO/h540
	 3rnZH4uFCIBC3LB4JVced0CrSlSg9GWWqSfLOlgfz2i8pqBPUufdhYMr/9E6W9ttPx
	 k0dwlmS7TQCMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEF7D148A7;
	Thu,  8 Jan 2026 06:08:26 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 08 Jan 2026 14:08:22 +0800
Subject: [PATCH v5 8/8] arm64: dts: amlogic: A5: Add peripheral clock
 controller node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-a5-clk-v5-8-9a69fc1ef00a@amlogic.com>
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
In-Reply-To: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767852503; l=2041;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=YYbjhOqv9sLsKL9/6kFNdkCYIVZ6AE4KPrWobMyqnNo=;
 b=7TAnolGMrfAXAp0ToZlWDjUDG5R4nORRDWK/0uC7v/745DyI9WQoksWsB84+Tn7uRoaU7DSjS
 3vcnYKtfK5XA6uRTdp4wQdrRr+IHAnQ3EXlKwBw3tQcoezqzf8Nxt3G
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add peripheral clock controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 43 +++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 70deeab220e0..7324e427ed39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/power/amlogic,a5-pwrc.h>
 #include <dt-bindings/clock/amlogic,a5-scmi-clkc.h>
 #include <dt-bindings/clock/amlogic,a5-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,a5-peripherals-clkc.h>
 
 / {
 	cpus {
@@ -83,6 +84,48 @@ scmi_clk: protocol@14 {
 };
 
 &apb {
+	clkc_periphs: clock-controller@0 {
+		compatible = "amlogic,a5-peripherals-clkc";
+		reg = <0x0 0x0 0x0 0x224>;
+		#clock-cells = <1>;
+		clocks = <&xtal>,
+			 <&scmi_clk CLKID_OSC>,
+			 <&scmi_clk CLKID_FIXED_PLL>,
+			 <&scmi_clk CLKID_FCLK_DIV2>,
+			 <&scmi_clk CLKID_FCLK_DIV2P5>,
+			 <&scmi_clk CLKID_FCLK_DIV3>,
+			 <&scmi_clk CLKID_FCLK_DIV4>,
+			 <&scmi_clk CLKID_FCLK_DIV5>,
+			 <&scmi_clk CLKID_FCLK_DIV7>,
+			 <&clkc_pll CLKID_MPLL2>,
+			 <&clkc_pll CLKID_MPLL3>,
+			 <&clkc_pll CLKID_GP0_PLL>,
+			 <&scmi_clk CLKID_GP1_PLL>,
+			 <&clkc_pll CLKID_HIFI_PLL>,
+			 <&scmi_clk CLKID_SYS_CLK>,
+			 <&scmi_clk CLKID_AXI_CLK>,
+			 <&scmi_clk CLKID_SYS_PLL_DIV16>,
+			 <&scmi_clk CLKID_CPU_CLK_DIV16>;
+		clock-names = "xtal",
+			      "oscin",
+			      "fix",
+			      "fdiv2",
+			      "fdiv2p5",
+			      "fdiv3",
+			      "fdiv4",
+			      "fdiv5",
+			      "fdiv7",
+			      "mpll2",
+			      "mpll3",
+			      "gp0",
+			      "gp1",
+			      "hifi",
+			      "sysclk",
+			      "axiclk",
+			      "sysplldiv16",
+			      "cpudiv16";
+	};
+
 	reset: reset-controller@2000 {
 		compatible = "amlogic,a5-reset",
 			     "amlogic,meson-s4-reset";

-- 
2.42.0


