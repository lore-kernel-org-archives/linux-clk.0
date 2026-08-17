Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC9D4446F7
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 19:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994805; cv=none; b=SXRP1/rGK+J53M3jVbOHbaqxa9dLoLk2SH0XiKoGrXWDNTFUeKIOS9oEzw6MTofhYFljpm43tHmBChxfAPaScec8jCzvdqjQxOfuMNna44/cdjVdyzPQDzTIJZ/v5CsMRxGxjd1Cq9lwlwSnGXJ333XnNwAJ6rR2EnCMSHTiafg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994805; c=relaxed/simple;
	bh=NdEBnCUmI8vcYieObvf0+R8QSjffR1RfAbs59Qz31Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JiFHT1+kEoNzrlyBRbghPhFbOlY+/RN9PFm8crWByKpf4wU11O00Hfx84j6rcftKAC6KK3tHruuuU6sTk2/Rqcw1oImi8BPgHI7nqyQFRq1azE/Ntx83W4SYwEzsIHTZFg9sEAk+xsZr5eK/sQFiOu14VbPgQgarsPhluYF+FCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jl2dhQhe; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jl2dhQhe"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbeea240819so2114625a12.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 12:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994802; x=1787599602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JDfCvRVlnDBvbOdUSOi/Q4nr+3vb687RKt9hvjxArk=;
        b=Jl2dhQheuNrwubvdWus4MPnDpjK1XeduDhXOesEw2fqw9i5gr17+OjVam1Rg3UvMkP
         aeZcoLX/avqt8ScGTubj/gQkXVs82LSanCje1Smi+kaN8zc/JvfPMyxH7G47TpSEDexy
         JAYG640Cb0fBtrSdCss9Lhk+QeIYBqn0lbFMGnrk5rbVFAWSHrBLQgZgZyUO2SX0gs2H
         nZbjrQu9we6s4+GmL00DKT8HbKKVLDNbIQEhwvFKUyndK5YqsbMyO0nRqsy8WbJmA6w9
         PCfmCWkQsNMHKvF4VKdcKHARtvgKRfvVCzWCTqDmTDVLfHcrJoKyV6vFSqJdpAk7F/1m
         xRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994802; x=1787599602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JDfCvRVlnDBvbOdUSOi/Q4nr+3vb687RKt9hvjxArk=;
        b=Q6NtzxNam4J+yO700+8uaSI9KY3tATyNX8BJxyTpE+QpaPfLnr/Mrr30tp8yBAwq5w
         nPPxb5o093x9zXm+TduwsiOunwvbLOHF6yvyXBdA0dnIieSS/Xg9j1qCbhS49jZpiFey
         3s1nkA+eTN+oBu7JpdXydAUQ++DYifW8+R5dDRKURSj6JGfHJg1Bi3yYwDwYXaI7bIr+
         qYfJ+r/T1MT14CNrSQdlnFNx8foCHEwuPp3NP30VIbn+aLVOImhCh5uBnBBj6oKA7sAi
         wq5e+PyZ8xWcg0STL4g7Tuw4NSSJ3KD65Oy18cXxkZCH8p6Kswt5qT+oxrGzkmrKOBcj
         Z9JA==
X-Forwarded-Encrypted: i=1; AHgh+RpRoopgWzQyc+3V3wkeg/KINBo/2irrZytW9TI+y804BWH0VYpWmIESOHs7tNvIbYa5pT4wmYae8/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNASJA59U01lcvS6auPud69tsy7xTsDveU+3G4c4FR73bdEkv
	Z9le8W3GbdCu+VNEWlDvIBcxSZI9s3C89Hdgb+Eg74PPxaMmzGrSlSYA
X-Gm-Gg: AR+sD12XSAl5jIoFwq3c97HJeyGN1gqGqhwUluzf5tdMYwsRhsxUkUVCHCsPKhfHZr1
	OSdahe8Y/AO8j+dVih3FZrnu2l8JHg9P6Iwa7ZbRP361D3bI4m1UbL69fq6pTphQ4NLANiDpPPL
	CgLS+/rNeRspK9uwNGnYY1jypURz4TYzytZuLUMUmE91LNPwBy8aJhuBnKxVHQmfj2NWZs1ELnn
	b6zbiixqCVpp4NR2faFPQMCt7FlCau7NpkX8F+lwrsNbTWWQawFeThkkWpztsFd6yMxFz+Ne2eE
	auDqpvDNwf+IQ5GuAnjmE1WiyVEZN2C7gocIHWq7gWEmK1jO984kkVSGDw7i0hmLSnZNQG3T7OM
	fjzsjfvL60/fsyzDetfBJVExd87tMliqOue2DTPZl4D/vtL3X0UDF6GiqUQorUo+OZ1lQBTvB8L
	XbLxL7qnEQoes86G7WXSsDmTXxPjVrfnCeDohL606xzRMvPojdgD4srJHYCgcJVETb/zhNbPuh4
	wtxomK561nHHa/5myuLi+5Toy0+8WuRIRvU35aX/cGjc/tPPQkk1qRWU7lpLMJ/Jza2aCprJfTo
	qxrNs9sQ6A==
X-Received: by 2002:a05:6a21:134b:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3ccda403574mr3047275637.8.1786994802009;
        Mon, 17 Aug 2026 12:26:42 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:26:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 7/7] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Mon, 17 Aug 2026 20:25:40 +0100
Message-ID: <20260817192540.423994-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 813bb0cb021c..3ede2e89cf67 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.43.0

