Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E743E09D
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994797; cv=none; b=oheFbixmGLXlzms7/BjfpmQErqrrnjPhMTuD1y70CZslLrq/0cHCKNjOiNAxgKdON/DjLCoiNVJb/tiF1Y6mnXeFxJz+9ha7qRIPzb3s98Ch7rvcLpmaL8k+ghGnWW7cSBdzv1/G3DOM0bG39nVdyfRpnqAUTF4eIcHz0ggfVX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994797; c=relaxed/simple;
	bh=sIvlwinupomxM3a2hWMmImtBO5VxdZ7EwFqpLwq+WFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iENCTAFKZ60Ux+etzVq3CPKj5yWgbiHNkam3omnGj3NpxsUr5ahSHCwTZL+L8gMAs36FN6d+Jq5IsOLOCmAcsAoVaChtwsXefOP2tqI11ESM6Hu1MSQzyvcAbIef1bACJ6AvtYDqH/GnpGi95sgy5ozXns8Um7x9gAJhyVodZ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tve+i3WF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tve+i3WF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so49380285ad.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994795; x=1787599595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ami9imt6GO00xjWzOm9H3fAjKzP3fMTgY6VhTdgPoQ=;
        b=Tve+i3WFWTnxLlhj2GPm3LSBnbGoO3pF0i3oRyRtM+T48AmZfrBaY+JbMZd9pAYLec
         xczMVuFJQHE0XsJ8JV66nV9+MV7y4m5gtR2USrLFDnK0Ommh3+flW6e8/dLYuU/f7H75
         PVZTSfdh6Un+QEaLI7uOvT6yGRqKFbOA4rppDnokPS8NMHuICkOXM/ZvI2GUTbhuijAy
         8Iq8eS/V9xnXQXB7wkxu5IoSivcyvxxbcRqNrrtAn7SVxo+GMuFu0xw4R8pr6wtVdM1E
         Hz7RECjZpUG7/VvlWONX3inJCEv2Y/f/PTiNgqM0NlX7eWuoM+VFk2XOcEeaxe9j6DuS
         KTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994795; x=1787599595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ami9imt6GO00xjWzOm9H3fAjKzP3fMTgY6VhTdgPoQ=;
        b=M1nxl4mlQq8ijtREVt8rjPfpAlyByrG9mvU889oCv/mknnynKCB5+3RlwxrQBhbbEE
         4EYW9rnvoL58jDa2TDBKj/U9LAIjwUxjlBX6M60if3z2960kXTrkVY/edg4JTtMOUFZu
         TRPm3b7vm3IH84IuJ1GAiwtVN7Kj7pZgFnIm/PEa8LBMzMbMm4LzwQNUZZep+QjdJmzZ
         NFqfFdcbCKIxuTWmpIlEF/IHAg7MrhE+38Wb/d1wBYpfT9V8V5rEXJj3y9NSlIKRdK6C
         9haDp+tbW3we2I2FRe/6kw5j0BnNLqIctBd/csf37a0m7SecIpUquHG4XJrWRyMUG4Qy
         bnJA==
X-Forwarded-Encrypted: i=1; AHgh+RqBQlGNMvwkfPH8LmIBYivuMrwaov4/JCGt0717OZ1ZDJxYOTm4uspLLi4Ac03BRDqWZEh5esYbVIU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1svq5h6iUpnzQcDqVkwomQLzHSqfgOvSOFm6kL6wI4vXdk1yz
	R7pI62fkJJwUffB63l0l8eFUjamzjUis+r6K52GRlqRwThPzZbPARH/a
X-Gm-Gg: AR+sD11YIu3AetPxl6Fgq1gWd0r0MlqxRD7TrKTscfn4MO83Z5F3oyLd44tBU5IoLl0
	/ZkVDR+KHEflFND65pIiQ7SXwQue1kCR/n1YA1oCIOjbCcv4kiSiRlunLEsXfjp8zgaKZjE5bNS
	P6uzHiUL265uRuMvJNV9jXWY65YlI9HbTQomrAXUT+pk0fMqzAET1dP6hSvp2g/8o1PERvAdJxx
	qgKTXQ70f5JtTzJ5xPxhE9yGm10x2AzB+tFn/lNB2s64haD940MhhkVWI2pLpl8NuhvnfZyijCX
	4i7AkJ9UG/sBOHVpiezuGjwB1yJcOSwtS3fpcSoTkXAi1k1gIxhdb0QNBH9nalnYKU+VdE8bBDO
	2rawKRMNtaxk1UlNVgR+q6r1Sr9dRyhl1nKvAi4/8OxKn/mrQGPsyvcPFCmA8UMCssLIX5ZaMJN
	3Tw5BpX3MkgejDnvpiN838Qxfz/z9ZovviF4pruRNZcD09FosgYvz3YQXMxUQtSrbRdRcCVSt8p
	MHzckxqFVm8CZsqQB8lIKyE/EWJwFbrPVJvslquIEbNJJDX/QeSRMrTXlPToNckG+oY853a0cfU
	4ymhc40bJSQ=
X-Received: by 2002:a17:903:3885:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d3b0d78794mr281621245ad.5.1786994795153;
        Mon, 17 Aug 2026 12:26:35 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:26:34 -0700 (PDT)
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
Subject: [PATCH v4 6/7] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Mon, 17 Aug 2026 20:25:39 +0100
Message-ID: <20260817192540.423994-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index de20bed2797b..80910e0bd977 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.43.0

