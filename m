Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9982435AC37
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476373; cv=none; b=blsYdh+4jpd9IIYZZ6uGYKkTk4gLW8XrFImgPGiGtRQPRWom4P52AglCcad8KORWPMphL7clk4wP7J07RXaaFX2Re9Wr2vajq/m65jmnrTGserBpE576Fpd6rOcX9u6v6SG5SfmbwGqIfsPCQbAQJpJLd8DumdtWDYVckwMo6iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476373; c=relaxed/simple;
	bh=5jGm6R10DrzDxLGqPcbj5OkHK+dKNQyDALZppEHj0fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmzBhUqZIop8AS5leV2+Xlsjm/UPXh+FKlaamfEGlSXx7BbqKTT4s4K+CDiZ39zIEqxtI/4B64xJQCoScqdOBn+mMB6l4clnMW0zN46zYtsQUEiDpzFqJRfbNeWOg+pY8f6JJXOWSTqP8ibhHxNrnUYLZKyfjd31OI1PPc8oKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e067e908so371862f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 15:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476368; x=1789081168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhGerqxK/QM75//01MhplOsQVgwGpiUbFZaCJT3sfQs=;
        b=p83+dI6udWcIpzuJWpqwQ9HBZGQlf+4YZhDuZx8srVIXhEFQujg/dJLCenZh5zHbKM
         Sin8gnQHbAh2ulJbec1fhDvVdLqxcZ4gbBls3p7ANif3otlUa0QzwBlxIjVYJLCUBrcC
         vjWREHoe5rPh/V1XJCdK+bgkqVsMKW6e+3XN34VdQpZPhZFhcrxt92KhLbqo/jEUgaEG
         pcUswXjUN+d4fxzYWKXlx3L9SoL3HjM24GhJI7lu+DeLPZOz1hEEbGxoOJjl+9URaBhZ
         ZZ03PJq4oMw72zR/EeMw5xmGkPa17m1QjD2IX8D9qg1SBKGQRNr/QBfksS4mRtVVu2St
         zVuA==
X-Forwarded-Encrypted: i=1; AKwUvBz6G/5wII2CjxbfGklwQIhtH12/jruh0Sc6/BhxMHWLGJeSjyTRw3yc7zqgG52dNdEM3CopZ1yOWdo=@vger.kernel.org
X-Gm-Message-State: AFuF++n/Zd4s7346T+gaHJRQHxmUW/DFqKqoKLeGE0pvlEpgLh6bqnd1
	XaiKH6YfVwpd08dg4EBF29GGGeW+Gw71HoGBikFK2INLtfF9+Nra0y0G
X-Gm-Gg: AYBFou20LIkjL82MdSe+Be1bmdR7VcSAaaFSkr27kDNYAr6GDLLV84ESzvvmuj0woEU
	ALqDE81jQVsZRR4wZcQSp5vHfDANZV1GAA/aXz9hvfZDI1kyv6PDNVMaNtth5QnRn8JpNMpkywW
	n5Ply9TY7t3bGOpASHPX8kbIWd+JNNjg5qAGbBg38OD663COorAwpU3gzp0NCqbzKpNhFGZiy1I
	pI84QiTiaXgRFABd4s6jc4cqqFoUSI4vZIWGucW3vQs6wXXU5K+OHbNDGV9VeSas90mH1lvQjIE
	Jhhr6BS6YAuUeVvUtGdZlHhWDg0u/llWYGG6j89hE10rOugzf8ReCVg3fjyPkNDUP+vT5NDk8Sj
	xHJNrdBdV1sK9jHJrRyR32ctGdUSNlpw4G0LN/yBvqQw2nKxKscZFThU07DDT5aH4fuGq8wNY+H
	i56SGv+jpQYjoYcbREi6WLzX06V3G0yl0UiY+Tx9NdtdOkXhC8wDex+s7M9Hc0Z/dw24+nUvRx7
	IUhHvZeQkWLpDtYDETA6a1OIg==
X-Received: by 2002:a5d:5f51:0:b0:485:8a46:704b with SMTP id ffacd0b85a97d-4858a467215mr292343f8f.29.1788476367923;
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
Date: Thu,  3 Sep 2026 23:59:20 +0100
Message-ID: <20260903225921.2290441-4-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
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

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 719e111bc3dd..8f3f1c0579a0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -762,8 +762,9 @@ sd_emmc_a: mmc@88000 {
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
@@ -776,8 +777,9 @@ sd_emmc_b: mmc@8a000 {
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
@@ -790,8 +792,9 @@ sd_emmc_c: mmc@8c000 {
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

