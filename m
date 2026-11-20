Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185746;
	b=bOS/opjAyyWPMbNc3NFBv80jALyTIRx7xuQ95QIbGBXkTQNSwaflU9ptGsKrL5TXy8yb
	 QOeZJLA3WI18Y2scB8Rn1kVryDAjuC+g83SshMyS4przEIO+ROtT6VLvvzjTg1BXsj2/W
	 ZAUQ4yrkFgFmz24ZFi7aDLoFpFkLAjAnN+Spv+Sm8ufNCxScXF6FZdupnCZ96u1QjmtJC
	 Tj4ukmSh5WjOLtgMYJQmrD5mB6xt3ApbOqWmx04jQdRp5xeTnE5Ftl0E9eCg6+GWHj/P7
	 k1a/cFrUKoO3MREE+ZlGrH9zVCPAcvJO6c/I7G5Sm+XfcDHyCLuTUrAx2uYHIppwl1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
	b=sUGoONB/sXztOUdOP4/gSyBXaJ1EUg7RTK0L3ukwI/sGhIKhNTKXuHLsvTenQQrt8tnc
	 9tdhE7wj5jO1cs/9/PmKP622qTrxr9+S4XAK2uvkG+ccs0i6XLj4G8PJB50HN9wnHVP1G
	 6pAq27AfXgu2ESjMTY+W9xqnYyXzl85bs7XmoDPqRSnPUKsE97Cve/afeAO5yyT/E5LvI
	 gh8ymriowA6EmVFz5CdtO2o9JxE4Gb2CxUZnkBz+1FIg0RJ1eXGYAIBV8M/gTzP+2fpMM
	 NLXMuJ6tVvhVJ5YhjGm3w6jmgE6TuDDKRhAtlqnBe/u6JDm/GvAihOF808ChA1usaxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN53hXGb;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1E606A326
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 14:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN53hXGb
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso506168a91.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185746; x=1795790546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=XN53hXGb74WaRLq1kF8RHZti2Bc64/RJ8lMSPet0uZ4CKd0AhsBtFeOUG8R4JKXqmS
         cM2nnvUvD9lcpDvR4digveTQnii3t8CnO7d35a/Vsx7BuJABaDwrAI3LTcFIToZ6o9Aj
         mOwDdSXe4wps2aCp80kubl+LEGqMSZNZ+KrXR3LIVxV5JZRr9iQ3tLTzg2VHt3zre+Dg
         9nAOGZCHGOfuZH17EWv+QVLS9QMryB5/tFmiDCsGQXEPKRRhzy2Sk4lLxLyx9k2vrbC3
         YYi9LKvue4avVyO0vrcwUDhPBWuwyzUL4BbGZVexDfwm6qrm2isnewcjEoI/zk1j8hhs
         nj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185746; x=1795790546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUlQyjO+S1Bvb+8g1Ae/7d4LlLIZcUiABix0J0NIufc=;
        b=kW3pKmFz8BJDYcqDtgoDrOKPYUH6IbOG6eZWeAQPvHdnt7BPEnTGReNCoYQh8VV5GM
         qW05qaGrqMUbW649FftRdakTFYLdvKpOy88o8l+6UzCoZTFYIx3PhBn6yhjJdGzvx9tr
         P7qOf/VHIYCy9isAihLnWtBJFyt+AopaiyTPyAOty90SC4b4g/9JcYl1k+7ZOjXTnX52
         bRCarUNfeB5zgke0GV8Rp0XH0D/WtGMSOtbdgUXBwabPUud7JBydsWpwyK5z8shNrkG0
         97OaZsUqqy/g0oP+sWEsIBbVsg5WaNzgAk1/JOLwQsllbpZb1JlSBvmwYk4B1n0fC9YU
         aKQA==
X-Gm-Message-State: APuU4Z8syfqjbORAFNdo1VkUWq/l7i+1j1FDbugLFAO6j519xjjI8M+z
	xi/l9rb+U40GLCn8g14YVNjhI9pnDFu9BcSCmXyP1Tgp5Se0vVdCmy43
X-Gm-Gg: AZFdTZdheEs+f8dsJDY07SNsgl4KIv1LGmSx1neNT9HGioDvEHYSUpqWRmJHAfU/743
	DuGDBRSfMBIFY3esavK1TVVk840IPMA18QExrKhgCL7+VhsjxBbz2DadflfR5gGWx+kS2xy1uX+
	q1hHDeKu/IrWuw2/Cy+Mkrj0imKAXoq64l/4NZQLXikrvybuOmDVAsfmX9msYtOC23JWaG7rorf
	s+BZStTynY2UC6lewhzhFlUBGYrdXHN1LM+kh/I5QsBX94bisCmICDiAI/JSp6nurj1mvEfextU
	6iLL2W7wC8cWl8gjgiWH43ndOTFAYb1Qs7VnEKQq9xU1sQZKqnKcYrb7suVDN+l8xwpcxU7LHRp
	GyTY/yWVGpmwLVrqqAdG1O8LmlBPIKzGLHncoX05ywoW+e3Yi4NS3AdwmFD93zqog/4rqH2yfXf
	O142CbTLRkdt/29T8xO3d4GA+ST3Bz+sOJ4xzp5q6sR7hYxjY38rDjqDEO4/o51id3xADoNa1yP
	4upU5rdmsEnQaAjPE664GD8VjtekbkFqQjMTNB+7hv1bnd7fozhlwIfKVbxUFBfagT5bW49LKsk
	/7Vp+/x8e18XfILJ+tP+PqQkBlECarfpQlkA2w==
X-Received: by 2002:a17:90b:1802:b0:3b0:c11a:9026 with SMTP id 98e67ed59e1d1-3b41c95fa0cmr3172758a91.55.1795185745681;
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:25 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:46 +0800
Subject: [PATCH v2 3/3] clk: mediatek: mt7629: add RTC clock selection
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
Message-Id: <20261120-b4-mt7629-rtc-v2-3-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

CLK_MODE bits 3:2 select the RTC clock source. Selector 0 uses the
40 MHz crystal divided by 1024, while selector 3 divides it by 1221
to provide approximately 32.76 kHz. The integrated Wi-Fi needs this
/1221 source.

Add the /1221 fixed-factor clock and the RTC mux so device trees can
select this source through assigned-clock-parents. Keep CLK_TOP_RTC
for the existing /1024 source.

Selector 1 is reserved. Selector 2 is documented as an approximately
25 kHz PMU bandgap clock, but its source and control are not sufficiently
described to model it here. Leave these entries unmodelled while
preserving the hardware selector values.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 517c43b19f18..4843bc55dc7c 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,7 +17,7 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
-#define CLK_TOP_NR_CLK		108
+#define CLK_TOP_NR_CLK		110
 #define CLK_INFRA_NR_CLK		6
 #define CLK_PERI_NR_CLK		22
 #define CLK_APMIXED_NR_CLK		7
@@ -290,6 +290,10 @@ static const char * const infra_mux1_parents[] = {
 	"armpll"
 };
 
+static const char * const rtc_parents[] = {
+	"rtc", "clk_null", "clk_null", "rtc_32k"
+};
+
 static const struct mtk_gate_regs apmixed_cg_regs = {
 	.set_ofs = 0x8,
 	.clr_ofs = 0x8,
@@ -372,6 +376,7 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_ETH_500M, "eth_500m", "eth1pll", 1, 1),
 	FACTOR(CLK_TOP_TXCLK_SRC_PRE, "txclk_src_pre", "sgmiipll_d2", 1, 1),
 	FACTOR(CLK_TOP_RTC, "rtc", "clkxtal", 1, 1024),
+	FACTOR(CLK_TOP_RTC_32K, "rtc_32k", "clkxtal", 1, 1221),
 	FACTOR(CLK_TOP_PWM_QTR_26M, "pwm_qtr_26m", "clkxtal", 1, 1),
 	FACTOR(CLK_TOP_CPUM_TCK_IN, "cpum_tck_in", "cpum_tck", 1, 1),
 	FACTOR(CLK_TOP_TO_USB3_DA_TOP, "to_usb3_da_top", "clkxtal", 1, 1),
@@ -463,6 +468,8 @@ static struct mtk_composite infra_muxes[] = {
 };
 
 static struct mtk_composite top_muxes[] = {
+	/* CLK_MODE */
+	MUX(CLK_TOP_RTC_SEL, "rtc_sel", rtc_parents, 0x000, 2, 2),
 	/* CLK_CFG_0 */
 	MUX_GATE(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
 		 0x040, 0, 3, 7),

-- 
2.56.1

