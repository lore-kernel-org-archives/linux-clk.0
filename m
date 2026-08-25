Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DE3EC80C
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651457; cv=none; b=mkyA9iC5XvUTIN7sCjgVzm0E7xsg5UEnwodcQqaFECQgeaa/+64Fd8elOJFan+4ICaPPEDPWoZJ6smJi6F9ZcFp+9mCTHN3IhCuEIsaTOcJfju1eSUZbR8A4DnxbbacDcbaKd6ty/K2PCi1Slmkaz7P337vqhTdhzvDgL77q6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651457; c=relaxed/simple;
	bh=RonCFWguM9QB+tsj7LxTnDeL1gzB25YQrYnt3USxdCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DvTN5Jb6xsJKVa1QWxpF6ZoTGZff4UNAukdpWs+BmhPnM2fjZEzXO6MkLwMZhoe+WiPPyayMvMtnqQgzCj01Hu1YzUKUkPFH0UcPbeaFuAwThKuMF6Bd2J5vAAYV5nMvLVWoLBUEaDISsuaz0MzrEz+rfjRA4RqObddw4H95XwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1C4QJ7Y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1C4QJ7Y"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso704263566b.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 02:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787651454; x=1788256254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68EwW3pZKwKEb3seN3E4xQ0aMTamXD1nvobPFU8PL44=;
        b=L1C4QJ7Yk/f6/lDbT6q0hhIXjbka5ezxXdIFdh7PX6+Jn0aNVeOJ7N98yRU8QYDdIQ
         dptdgmo2pTvk6EACcfwmCSMbRLuwV3/lFO5qqCZGYTzcsXM62+oeWWMEzDh1RBGtlsEd
         YVQhfmMclC98geRCDWoDbamKXFcr10Zyh3Qf5Dyb5AyoVYGA3j+EYtrxhxlVOe6/xJ4F
         hgeJAktSim8AvRrJEH3BHJtCjRJwTmKRIFglKrVzsjK9HTTKNtRiQ7OFQlIss4XhaV0f
         tn7jaSy9XCGaVtXUwOmg4sknF6VLM8g1GZ8yu6qmVO36sX4NgsW76oz8rIqXSsFlJ32g
         32yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651454; x=1788256254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=68EwW3pZKwKEb3seN3E4xQ0aMTamXD1nvobPFU8PL44=;
        b=NhmrL6Y7cWz2axaJgowVVwoCjfY7gp/vmJLtJvD7sVEKBS4HkSs5y6J2/lHBDoV7DM
         et4yd+ofXBpw7r5wg4g1+EbHPRDpTgBLal7eT2UFHWH87IvwWWppk/UNXgHkmNHad6au
         v18X4+HmcOXPD5fvnMYZR8Wt10g4JenGhHXcC/9vdys2kNMUMC73gK4KnRUUbxvpor7y
         /XhImX23zdfsNPriHtob49wC0QX2YqOuwygbRj4hWngPcKi3pkdGSnmUtBpBeGDdVM4V
         crXRMd98nAcoFxIogWLEseFKgRjHAtmW81NclMnnJgx9OfUD2/n67F2D/vWTlzFIWHvu
         dumQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8hLLk8Ug4l2pt/3xw1qS3j7JI+HAwIwQ5Xb7igmVVFutqdHGNC68nFDRFmdrdsU5gNGB+YRJsDbg=@vger.kernel.org
X-Gm-Message-State: AFuF++lZvQM7bX1YAi5dgCEEoHWjQkWChjAuQD3CniillEwq3KO+cBvN
	qU80/YYxzPHuEwEEUJzgQkA6IKZ5WJrV+LLmzohE4Iu6SUwTF+uzJ+tD
X-Gm-Gg: AR+sD124NV3tplJeNJayzOWSHElUb/5oKPKWAuYeybLFgSQQ+ANknQ2uLGwVD0yiZc/
	ctt1LSUudl3h5PK34fv4SsuRMnm8R1Ex9aUuto75s6riUk11iF4elXokBxFSKM636tFtRQh2CkD
	zfepU9WOdpGChfClVhtuTH1oN+hG+etLSB/ZWQRO/+iAwwk28ZDRQJ97H1o184rWoRNYVb+0vl9
	WAM6jmLnxJF0sCFyvfZYnUNApzkotFPZTIs422E+MzrBRu2K0A8L1tikWdfHHOEfqIqX3oUnCGR
	yUkp4ORmCGugbAkjv4nwO+pRC1raMmiKmHPzizP09VEfb76EStAwwhVaJ6dDndSQLN0ZH24/TgV
	ZxW2mZTlWhJzVXhIjsqFeTRrNvcX5Z1auRCtbflvHOiFaQl1NZUOaM/QeP5lIs9df8cdNVEDZh9
	eL/xzDswhH/Cml4LZgRc+zRbu4/hr48GpC+QEdYby5N5D9ZmJPxwqLIdP1LqN77nMEW7vi6isQX
	qv/nARIQGEJ
X-Received: by 2002:a17:907:d649:b0:c21:818d:e97c with SMTP id a640c23a62f3a-c246a2ceccemr3765915266b.2.1787651453543;
        Tue, 25 Aug 2026 02:50:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629929dsm1749320666b.23.2026.08.25.02.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:50:53 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/4] clk: renesas: r9a08g046: Add PCIe clocks and reset
Date: Tue, 25 Aug 2026 10:50:41 +0100
Message-ID: <20260825095047.9971-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the PCIe module clocks (ACLK, CLKL1PM, CLK_PMU) and the PCIe
reset signal for the RZ/G3L (R9A08G046) SoC, along with the P8
fixed clock required as the parent for CLKL1PM.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 5878423db151..22821321a1d3 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -335,6 +335,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 		    dtable_8_256, 0, 0, 0, NULL),
 	DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
 		    dtable_4_128, 0, 0, 0, NULL),
+	DEF_FIXED("P8", R9A08G046_CLK_P8, CLK_PLL3_DIV2, 1, 8),
 	DEF_G3S_DIV("P13", R9A08G046_CLK_P13, CLK_SEL_RSCI0, G3L_DIV_RSCI0, G3L_DIV_RSCI0_STS,
 		    dtable_2_16, 0, 100000000UL, 0, NULL),
 	DEF_G3S_DIV("P14", R9A08G046_CLK_P14, CLK_SEL_RSCI1, G3L_DIV_RSCI1, G3L_DIV_RSCI1_STS,
@@ -558,6 +559,12 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU2, BIT(0))),
 	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
 					MSTOP(BUS_PERI_CPU, BIT(6))),
+	DEF_MOD("pci_aclk",		R9A08G046_PCI_ACLK, R9A08G046_CLK_P1, 0x608, 0,
+					MSTOP(BUS_PERI_COM, BIT(10))),
+	DEF_MOD("pci_clkl1pm",		R9A08G046_PCI_CLKL1PM, R9A08G046_CLK_P8, 0x608, 1,
+					MSTOP(BUS_PERI_COM, BIT(10))),
+	DEF_MOD("pci_clk_pmu",		R9A08G046_PCI_CLK_PMU, R9A08G046_CLK_P1, 0x608, 2,
+					MSTOP(BUS_PERI_COM, BIT(10))),
 	DEF_MOD("rsci0_pclk",		R9A08G046_RSCI0_PCLK, R9A08G046_CLK_P0, 0x618, 0,
 					MSTOP(BUS_MCPU2, BIT(7))),
 	DEF_MOD("rsci1_pclk",		R9A08G046_RSCI1_PCLK, R9A08G046_CLK_P0, 0x618, 1,
@@ -633,6 +640,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
+	DEF_RST(R9A08G046_PCI_ARESETN, 0x908, 0),
 	DEF_RST(R9A08G046_RSCI0_PRESETN, 0x918, 0),
 	DEF_RST(R9A08G046_RSCI1_PRESETN, 0x918, 1),
 	DEF_RST(R9A08G046_RSCI2_PRESETN, 0x918, 2),
@@ -671,6 +679,7 @@ static const unsigned int r9a08g046_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RMII_I,
 	MOD_CLK_BASE + R9A08G046_ETH1_CLK_TX_I_RMII,
 	MOD_CLK_BASE + R9A08G046_ETH1_CLK_RX_I_RMII,
+	MOD_CLK_BASE + R9A08G046_PCI_CLKL1PM,
 };
 
 const struct rzg2l_cpg_info r9a08g046_cpg_info = {
-- 
2.43.0

