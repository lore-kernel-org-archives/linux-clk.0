Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DE76E614
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 04:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715057859; cv=none; b=cIdFijj6diN5ufyRUU6Lu4qZssKR2AJnMxWRtaxFmZRZwt2keUIsqn7Gr+sKdfO8/W+wusKgOnObNOfR0Hc36bbCQLrQnmNda8w9INz1Yug8T4HEHDTa+1fO5x3aWsLi925ltOa9QvW0gyw3lu5CFzuP5y4VFdL+N6LcWwfC1z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715057859; c=relaxed/simple;
	bh=52sEPjDrM2eROoC2nwe3EiBnyP8Dcq8Rt5meeISouww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWDthu0ZqIYgSNBFdDOM+ZOlNDZXWbrd6rmNPsPijH1K1ZRlytZyonzhVGnBxsEDJ0C9v2u5N6L7ZJlMLSS+x2FQ573uTA4heM8qDhb/uF4m9ehQJgaTClxTrvvrQvlQ+NeUHLF9QJAp23k1r65+flj8zuH3C6BOUth5LH0+t7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=GCFBDfoU; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="GCFBDfoU"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61be4b9869dso28429907b3.1
        for <linux-clk@vger.kernel.org>; Mon, 06 May 2024 21:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1715057856; x=1715662656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV76EE0lGVh0xzAlFnhOqZDL/IraInUMutR8RQKZJGs=;
        b=GCFBDfoUU99n51+rVxpgK1dhimTAVosBYe76vQ3eOgGOrU0HRFG/8fRt1tvs1VPtkd
         cgDHwxyfVhShe49vL1jgfdItjoPGUnbwUx2hukBVwVBmw/hDFZ8Zj+qDQIFm2kZP/Fb+
         J1CvdQgqJJHepwyK82jTc1eaV0XCeK3fXzqwxLkdW8yzfDXD4orr9ZiT5DX7sc0mDvfv
         u8gQoGxp6x/eEw7Q9syzgOkBQf+M+du8Z33YVjvEu9E/rtCbF1/tEviP/ZZfBTBG1hWA
         KSQxFWd1kvrycS6Fezj88wBiGaRv2e6+QN/QfojaDJaOrUb8xxwa0L8eQbp3WltGQ1tw
         5Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715057856; x=1715662656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lV76EE0lGVh0xzAlFnhOqZDL/IraInUMutR8RQKZJGs=;
        b=FPcN56gsbDlWiXJyNujtBOz47amlHSwidoFZwGQanNf+jw/86WFxwjUkaJ3Szxk7AX
         R/swKhPPWY8Kp6AR7Id5w27ZftS+pgb37A9cZY7Vo7sZ4Q533Zs2MivYWQ8jy8lf4Jgd
         kU4u7nXpncMFe7GWuTTB9KAuLvsCbBtGPfRwWuJvFXgHDkVRoyCMRq6Ef8TRaqJiSpe/
         YwHjwPASGVYrneblgGzkaU/dfHex1xX3N9n8DhVWC5cJ+iZeemVDHgR2FRg2PJFMoyjt
         MpfsySD/SAHXmL5XZM+xhd/Tyc9y68yv6rz4UJIzKHN2C/rNEIRgGkW0dOU7hsn5UJJV
         Yrqw==
X-Forwarded-Encrypted: i=1; AJvYcCUtUkhddPEIgzyKjwD/bVMS/H8/WRsxvY4NgGB83Tij8wZ+fYq40BlKq+OWBLnhT5KB2tAsUIfSKxfSes/C34RV6siSJTAMCuJF
X-Gm-Message-State: AOJu0YwL7nmHcwtJVE1p4GC7xviposPONAyrC9isVEu3y76KI9Fp1C+7
	4MPKOJ7jhm+YmxGdIb5Mk8miG6KaQZ5PzdW43kfqLiuRc7VUk7GU9S98IV+ciXw=
X-Google-Smtp-Source: AGHT+IHn3CGUiKT0eCJa4EZLbe1UYY3849cLrpLUve0RTVfZ9uR7rnnwR8WOzgqSjFGllwczviF4tg==
X-Received: by 2002:a0d:d883:0:b0:61e:124c:e73b with SMTP id a125-20020a0dd883000000b0061e124ce73bmr11735126ywe.28.1715057855467;
        Mon, 06 May 2024 21:57:35 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:6870:7119:e255:c3a0])
        by smtp.gmail.com with ESMTPSA id o14-20020a637e4e000000b005f80aced5f3sm8987249pgn.0.2024.05.06.21.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 21:57:35 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 06 May 2024 21:55:18 -0700
Subject: [PATCH RFC v3 5/7] riscv: dts: thead: change TH1520 uart nodes to
 use clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-th1520-clk-v3-5-085a18a23a7f@tenstorrent.com>
References: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
In-Reply-To: <20240506-th1520-clk-v3-0-085a18a23a7f@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715057849; l=4110;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=52sEPjDrM2eROoC2nwe3EiBnyP8Dcq8Rt5meeISouww=;
 b=HmEeRhWb790IkFfO3C5BC2jB3AYXLPWOY7mhRD44oal2XW7/ZwuGHe1i92UCCZqb4bhapFIyY
 XN1gFmAudK9C5BUsbr5GFCWbE0xZbA90aO1ILnVV4OMXti18mT5HORG
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

Change the clock property in TH1520 uart nodes to a clock provided by
AP_SUBSYS clock controller.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ----
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi              | 24 +++++++++++-----------
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index d9b4de9e4757..164afd18b56c 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -52,10 +52,6 @@ &sdhci_clk {
 	clock-frequency = <198000000>;
 };
 
-&uart_sclk {
-	clock-frequency = <100000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1365d3a512a3..1b7ede570994 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -33,10 +33,6 @@ &sdhci_clk {
 	clock-frequency = <198000000>;
 };
 
-&uart_sclk {
-	clock-frequency = <100000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index e193f8d9ab8a..963c786f3c53 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -141,12 +141,6 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
-	uart_sclk: uart-sclk-clock {
-		compatible = "fixed-clock";
-		clock-output-names = "uart_sclk";
-		#clock-cells = <0>;
-	};
-
 	sdhci_clk: sdhci-clock {
 		compatible = "fixed-clock";
 		clock-frequency = <198000000>;
@@ -196,7 +190,8 @@ uart0: serial@ffe7014000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7014000 0x0 0x100>;
 			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART0_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -233,7 +228,8 @@ uart1: serial@ffe7f00000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7f00000 0x0 0x100>;
 			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART1_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -243,7 +239,8 @@ uart3: serial@ffe7f04000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xe7f04000 0x0 0x100>;
 			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART3_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -325,7 +322,8 @@ uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
 			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART2_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -387,7 +385,8 @@ uart4: serial@fff7f08000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xf7f08000 0x0 0x4000>;
 			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART4_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -397,7 +396,8 @@ uart5: serial@fff7f0c000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xf7f0c000 0x0 0x4000>;
 			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uart_sclk>;
+			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART5_PCLK>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";

-- 
2.34.1

