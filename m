Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206F08F77
	for <linux-clk@vger.kernel.org>; Sat, 27 Apr 2024 00:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714176661; cv=none; b=r0XrdNhdAhAuubG5omn3oOsZKoqVSII1pMFasSvnCC3lLjgr1sgJVFV9e6h+eyJ+qt/9ksbq8lHu+zl3HPm4cD18rAYP8gmgojE+CJl1jxtueqf+6MCUabyiMZAlKVp4bPIyyjnD0TM3VFJigTFSo1UDY4bT/eIUp2qMDuZASho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714176661; c=relaxed/simple;
	bh=Tkyi4QZD3iXRNC9I3Th5GPUlpVYoVqpI8o+66sXr35M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwzQR76REAEwmG3c7tUNaV69tFUrFFxybCRxnE3l+GhNGP8LwI88z5a33keAYMrbU+uEoSrGMpPQxCCaVqAvSrmqsDg9XhMNIeJbpU2osfISjbRaq1k0MMqdwwJ61GCDvTXs7m77RmqpAxaXLgBXnGZ9XADZaRAlodbLCNRIRW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=ZEaWsCQO; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="ZEaWsCQO"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so2484677b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2024 17:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1714176659; x=1714781459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/8O6an2WdHxxonYSgEiYeduIeqZHNZdg71uXcAFpLM=;
        b=ZEaWsCQOKbQrHKEahRxNjkAw4POlRtwAg5WzveZXle1mzvVjAFFx8ypeWEnULdLPkK
         vMPZRgg3R3eDWlf58X2wWy1BgMfAHgosmBq7/FPse8tB9NOFGPFxIHvgckdRQWl/iEk4
         9chfebcre6ViKpJ9ZTmZsEoHjijNkoDMLiXs9ZSQpUP53dpZY+UEPnRexqxlPPUyxDYC
         dwtkLdN9glE4s95b3M0Z8XhPHFSRW/8snwVQaZF5rkH9Gv9RpNSY4DZREWi46UQ0diTt
         uzgyL38cSiCca3Mprw0qule2MyvGmp7GJUJ6906Vl8HNMDe/PNHm/wIpjWrIfKzTXLa5
         dqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714176659; x=1714781459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/8O6an2WdHxxonYSgEiYeduIeqZHNZdg71uXcAFpLM=;
        b=rpmFqHLe/Gincm9vghkq9m9IGDhgTVXo/c0z8HTRRB7GTD/Gcwj62SDTMYGoZDBNmo
         ewg/cWazldDnmVCPqsSaXbZo6KGDUzEYpeHTsdOqDkEf8L72KHJzpF2nHz7Ad83vEjaA
         oyNc6QhtOMMNduZEUxf2vRJogMe6GG/zMG8IxyawwbtNbhfGuB9Wi4k17WFMKj325gua
         1D7kdhDeCEE0SDB9TCi/PBvn/2G3O817gHFyMdpPt/pdUBUGSywPCYAjfPVfFZlNadgP
         kfCLwqQThWWeak+eDMRUD3M3orcv7yWKR26bVv42o1YauX0jq1bfcKJjdNZWDP+W9tj2
         CdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2DrLTdW4oRpUHJFVqWnJb6I/kDi13L8D9pnMJutmItRuuUV5u2kVDhQyNs4qnfucBnblp3LrcRmAG7+Tt4osfP5gR4nemTxhq
X-Gm-Message-State: AOJu0YwyRcEUvhM9oQAyNd+EG7Lsd+XL7AVTyzLpea0/AfqJeXA6tc2+
	xgk+jpevx8N9MgKaC546yGZzKTT5BrdOTIhtJ2KVinF6Guwr9F1no0LBs8EGCZE=
X-Google-Smtp-Source: AGHT+IHYGANP1t640rQDF4TNy0DIxIquUVdYZoD1tRH1yjH88XxV9oq8sxkuJD55TgcVLJd3G3z2gw==
X-Received: by 2002:a05:6a00:174a:b0:6ec:fdcc:40b9 with SMTP id j10-20020a056a00174a00b006ecfdcc40b9mr6286127pfc.9.1714176659410;
        Fri, 26 Apr 2024 17:10:59 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:3569:7ce4:94b8:1691])
        by smtp.gmail.com with ESMTPSA id w1-20020a6556c1000000b005f3d54c0a57sm6061883pgs.49.2024.04.26.17.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 17:10:59 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Fri, 26 Apr 2024 17:10:37 -0700
Subject: [PATCH RFC v2 4/4] riscv: dts: thead: Add clock to TH1520 mmc
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-th1520-clk-v2-v2-4-96b829e6fcee@tenstorrent.com>
References: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
In-Reply-To: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714176654; l=1420;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=Tkyi4QZD3iXRNC9I3Th5GPUlpVYoVqpI8o+66sXr35M=;
 b=i3zE1I6IyMOXFj1bKYUcSwl0Q+FnHv6uXONEvzmZvhfqQFzAPv6ylEPDFIVtUnS30Bx/yo+p2
 EZ3wEbt1Ps4A+ZnwPmEdb/PCw8a64vl7uB541tl7Q8wYln+VeouGe4d
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

Change the clock property in the T-Head TH1520 mmc controller nodes to a
real clock provided by the AP_SUBSYS clock driver.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 6285cdf91bd6..a6f51ec9fb55 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -324,7 +324,7 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -333,7 +333,7 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -342,7 +342,7 @@ sdio1: mmc@ffe70a0000 {
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

