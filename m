Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15B63B8958
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622365; cv=none; b=WGib6L7+tg/WHJsYvWjaOzXy44Q9+0ls7WVVTzg9cIJHnO2vhGghQpeFNCHXL7qE6UEwZuYI/f8Uy0nDmyv4UP4LBBypOyCBgg/+Vfs1TD22FRSKcymRE6SkpVMDDdMjm6cBw1h+3Xg3rFwq/NUFXrZDIJMPGHKQ/X3g27pXgwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622365; c=relaxed/simple;
	bh=1vLHCU8lWJSitlPYnCaz7byT5JPQIj0L3X0Yw58PruY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwmmJKEEV8gXfrrrb3mb7Riqk6tElEEfWfY+yctVE8okp4vGlfyLizzF3QQCz/4Rh4vJhWWXTjLW/u7ibUkgR9X6nHsGsaQMO6L2lTvvsJFYm75zOUZisK5KEp1WaGmPwjWZrPE03Td20abA01HQ9b2rJOotwOhBGATIXgnNZQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4957eefd361so15199105e9.1
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622359; x=1789227159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n9Z1qKT7EogtF26L5TwSpOWlLsafa9aGvAtJ1Qh1QBg=;
        b=jMqUzOsO6tD7N5YrpoD9eVfKSPUtJDxnAaMVQj4Jlq89YMGWEfPghqabkvgt86HmLY
         Ak1zzFkfcPS3oU52vevy2L1igHWncxjHBy5SiQSoxiYG2S8RvB3RXpu6CtSeHSMWmkXR
         QxOOOL1dtpGhY9yTsBv6e1ORooSKz4yvoOL/L2ZNT4fbmXB3/Jduqor+C1e772BQA2Tp
         quoJPcZ0qGsYlL9X7svfHTtJbOhSrjOTqzvoIPvgQPx3cvJ2E0KNuc/WRKzO384UlEZB
         VNRYN+Lep87aXzKkv1r0eOIwQKJep2hbh/ba8yRVCYygehJydIUiLmHNVg9IxSZ3IHqp
         Urtw==
X-Forwarded-Encrypted: i=1; AKwUvBzEvCAUWsjO3rvCxe3J1CQLhmBZntRyp+xsoLm+r+XppdMNX0dTfv8s6W+YmBJb2PpzBMqj2dn2l48=@vger.kernel.org
X-Gm-Message-State: AFuF++nB1LaH8caMCRvMUNhIV5XSB2I8bREHHdOD0fRB4ErDw20GmZtR
	1eqvR2NfnirBWkS/q0OzDaCGiWZkWXCL+ESry6qEBkuLV/GfsHqoPno2
X-Gm-Gg: AYBFou0ok6ogE9W0u9NPnb5zcdOWN3sRqB25RpWQ9K4zG7fF79TR0VTvUfspbhE+jcW
	qgLvTjNIJuwsfZqgLJ+um0fHo4SPRNkbes7fc+dlWEzuxQw3x9U64EpBsZWtA0SAEStLOzh/OU9
	GmtLkfN3ELw8CgBaENJ0+7InDEHMLt6qfM4066u+EMbZ9q+AEYXUcgNTi4zTwEvc+ghWetY1oBY
	1OTmYlIx+MAxIrdwVPNKyFO8dgh9RJ+sIgEFdhCMESHf+rNuOd3ibmpTz3AxyGRPD9MhSCA+CGC
	UCQwul35VjZ+EiNVlibdBrHjV/DtrXFNVAKgDlqdtQb9LSbuJ2oB5n+d9vmSwKmTAE+oLMUIx6I
	BC640ridj/RwQKZs/NsxQc1+xfQvlVDWwb2Oi3uYnguQAEpaVs4ySl4pBnMyR8fmPR9OrVa9+qO
	Yy5vIeKOXDD7GLXlqYmkDJp47qDP69Zft6lBAtj4Us8T7rNoRJEDLyqdjdEGEOZejoTp7acfg7C
	FPcXB6HSmGpYUWUeFqyahJLNQ==
X-Received: by 2002:a05:600c:a0a:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-49cf820ccdcmr130205405e9.7.1788622358693;
        Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
Date: Sat,  5 Sep 2026 16:32:33 +0100
Message-ID: <20260905153234.133217-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SD/eMMC controllers reach the DRAM through a pipeline stage that
the hardware design inserts in the bus path to the NIC_MATRIX fabric,
clocked by CLKID_SYS_AMPIPE_NAND. When that clock is disabled, a
controller that starts a DMA transfer can never complete it.

Reference the clock from the three MMC controller nodes so the driver
keeps it running, instead of relying on the clock being marked critical
in the clock controller.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c3dc479b137d..dbb4a95652c6 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -730,8 +730,9 @@ sd_emmc_a: mmc@88000 {
 				interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_A>,
 					 <&clkc_periphs CLKID_SD_EMMC_A>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_A>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -744,8 +745,9 @@ sd_emmc_b: mmc@8a000 {
 				interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_B>,
 					 <&clkc_periphs CLKID_SD_EMMC_B>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_B>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B_SEL>;
 				assigned-clock-parents = <&xtal>;
@@ -758,8 +760,9 @@ sd_emmc_c: mmc@8c000 {
 				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_periphs CLKID_SYS_SD_EMMC_C>,
 					 <&clkc_periphs CLKID_SD_EMMC_C>,
-					 <&scmi_clk CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&clkc_periphs CLKID_SYS_AMPIPE_NAND>;
+				clock-names = "core", "clkin0", "clkin1", "pipeline";
 				resets = <&reset RESET_SD_EMMC_C>;
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C_SEL>;
 				assigned-clock-parents = <&xtal>;
-- 
2.55.0

