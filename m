Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1868F7D
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 02:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719195351; cv=none; b=KZlmlCDNRd6p968tynqGoH6Y+a1LiAtaUG0g8pBT2pM60RiEGbEOpuLUo6FIGjDmLXO/RI36n7p/sG19ToQI0a+6iovSZlwXu3SfZAO071SPW9Syh/8QDmIi9RIm8AnBTdXTBgqNntprd9ZN9g0pt58U7WbjbdcHSWC0XIqhBaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719195351; c=relaxed/simple;
	bh=fVxaLUMTb3CyDlrBVjs+Sch5+L04pOv+EAfH3Xd/w5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZ2cFct0JZ1jhG135QtPRlNYxx4KHG8KeSI+4OqX2WDzqShI5Oyxf5EdaWAxwKLU5goT/iDV5YZZgFyrB9MQYsLR7qDFUiqKMPWKLbklu5cVKtuMerd/RkylUO9jVMt9S7qIMJzSntC083j6gs4g0bbnJ55/SyDULZxEl8F+xXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Ab1iwlA4; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Ab1iwlA4"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-717f17d7c63so1488595a12.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Jun 2024 19:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719195349; x=1719800149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjiqrN6ZK51SnDznCbj3+gzdRKmK7FOnr/vCNYUG2QY=;
        b=Ab1iwlA45aHvSiJKWVXEbOWW1Jr7n06x/JzweuAu8JHUOx2WSiq0h5Nn3BV5up9Q1W
         V/t6Fzo9g7Cxq5/JoK+0UVS60gZPX5RmTWDfgqYvTdlMZEZhzPiwHIcaI82BD3f+lDlH
         1HvOODNoa5UdhPUvV9/hNezxxucuEn3ukxvtuoVRrYJlOfEnH713NKelnRX77CzAmYz/
         xKBvANbNzFUjTrU4S9V6PEWtu9UsmOwTSinggPO06qc+i65yspAsVgdwF0zZvuh9fpEB
         2cAaK8WFZWOevIgM6+fBekXdDFuT0qV8nLrDP1pO+mbhyAWgXDBLTuwOcS9k0jiDnual
         Z9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719195349; x=1719800149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjiqrN6ZK51SnDznCbj3+gzdRKmK7FOnr/vCNYUG2QY=;
        b=B/Mcf2mEUGPJiMcnT6RGFyLOuB/NHOJ+MmG2BMrz6jHt0GwmJIbPRe5PaokZqFun0O
         jzy/+frhjMaY02s1CWjaUi8VRsP4bxVLNosO55rGwBuywCCf5SNSmDxIjFTwMSX4s8kz
         JHrl7e2OfL0Yovzs6ya4BG5iI474Zf6T38Vhxrnuj/irjkSI7503qijxumTodfPBkabW
         4gCerX68UwHzvY+HbqZI/dRiI0JpOZa9t+SPqX2IYlGWut0s6ufJUnpSJUSVx7kROYNw
         WvodZzeaP9SkkzHxfX8hA3HUeTIZk/iYLA0elf3sssAOSwhbKdfABOkoixnbbfhIi7/d
         67xg==
X-Forwarded-Encrypted: i=1; AJvYcCXb+IVa3YVetQ9TA4UYh4H4Z/JV0+xzF1l5cW1j64QagVYb03Wlaq5sjvCCuKhp97I5Ec4onj51xyzq+HD3/ui68s6ZA4nh50Ds
X-Gm-Message-State: AOJu0YxboI1U8UyjH8RKr4zrYYiJGZ8c2NRU/sYJPofol6Ubp56OdPc3
	JrhVcr9gFo3u1gKNxz7pqGZ+aaGjR3+J5+P1daPb34vw99fsZ41m0ai7+n3A0n+M9Bm5rdOcYKR
	6
X-Google-Smtp-Source: AGHT+IEpOJg5cTyl1rKSokOjaYsq1oFSF+Vg++cvFpeQHqC15A8f7WRXLOQ2rcZgaL+QgOhTSIDd1A==
X-Received: by 2002:a05:6a20:b918:b0:1b1:f0d4:71b6 with SMTP id adf61e73a8af0-1bcf7ff9c95mr2331801637.54.1719195348931;
        Sun, 23 Jun 2024 19:15:48 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1584:936e:5eb0:fab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706511b137csm5071770b3a.86.2024.06.23.19.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 19:15:48 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 23 Jun 2024 19:12:35 -0700
Subject: [PATCH v2 5/7] riscv: dts: thead: change TH1520 mmc nodes to use
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-th1520-clk-v2-5-ad8d6432d9fb@tenstorrent.com>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
In-Reply-To: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719195343; l=2852;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=fVxaLUMTb3CyDlrBVjs+Sch5+L04pOv+EAfH3Xd/w5E=;
 b=HNA4TrACYlPMj2b3NCZ/cUVczsm8my7IqBecoB3JoarAlOInJZM8as4J/k9ayqg7ee3656Zyx
 vC3CHuzDSZVAdmafpeWS9vx0NjCbXL48XSXYgClr3N6mcirKtZ/noTJ
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

Change the clock property in the TH1520 mmc controller nodes to a clock
provided by AP_SYS clock controller.

Remove sdhci fixed clock reference from BeagleV Ahead and LPI4a dts.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts     |  4 ----
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi                  | 13 +++----------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 164afd18b56c..55f1ed0cb433 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -48,10 +48,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 1b7ede570994..762eceb415f8 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -29,10 +29,6 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
-&sdhci_clk {
-	clock-frequency = <198000000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 66df04ceb3e4..ce3a0847aa9c 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -141,13 +141,6 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
-	sdhci_clk: sdhci-clock {
-		compatible = "fixed-clock";
-		clock-frequency = <198000000>;
-		clock-output-names = "sdhci_clk";
-		#clock-cells = <0>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -200,7 +193,7 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -209,7 +202,7 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -218,7 +211,7 @@ sdio1: mmc@ffe70a0000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe70a0000 0x0 0x10000>;
 			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};

-- 
2.34.1

