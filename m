Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7DE1DDC2A
	for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988055; cv=none; b=CVeph0Db347V14BxQAy25w70Jry2wV2hk3cexKY+tQH77asDDyJvC6wD0CUtrXd0bgMQ4EahxiVfu/J0zeP0RUWURLmPiEzRfbGUfAf1RMwgS/dXqy59ohqO+Es7fo9DJA3F3xwBEX9KcduHYcLGD4I4rKGAa3PEAjTQ1VTBnLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988055; c=relaxed/simple;
	bh=3KIKv721PqG+eP67ee7eJ136Nr7DLSBs/2xaIwc9lW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXFyM3p3lWFXPTn0o/Esni1EjkteOV/wb78+XmfVvNuPEZEPaOvw3vmCTqMybKvJyjuIT/7X6duMrWDy8UpD5sg+CxnzwpY0mpXY1ueDpI46RmJNZLMOV+AoyFXrlhrY2eN2YbHk8bIcqHg/mJQjAVDK2iBJTUN6Dsel6Dy+FW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=j5esR5Lt; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="j5esR5Lt"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476b89782c3so21804571cf.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988052; x=1745592852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/LZIDJ92Tz7awYomEWjt5hmUFJrb1ca7bM/MgIo4+s=;
        b=j5esR5LtkBVu6xZYJVh47yoRoy3QBLI9iOTmwB/JNUvX82vwNueajKGqcsuJJluO/4
         OLjQOacEIeYcORXHbPTQCQjp13VZWh5UTc1GhTc1dpbKd7AH6h5Fs+lweCFjimW8cmmS
         uSl8xIH+UwFKz/M7LQJqf5w3iyDSc/jCeXm7f/haQ/rhsw7ysOKz5bFUihqq2vLsPPl7
         CqR39EqPEsco9nJF/ij265yvAaq8HIP+nSm98/DKcr0T8i4XtXyc4i2GjmAUzDzj6Gcd
         wvPYaSQC7BaGu/rPXofruQg8+t+0F0k09pgSjvuy+rUDIuKHJO9bvXDd2DURgK+tBGIl
         /twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988052; x=1745592852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/LZIDJ92Tz7awYomEWjt5hmUFJrb1ca7bM/MgIo4+s=;
        b=Kecfn9Ev8/CjJ+NHQ89vfoZv4u5d3MpWK0d1rRCtgaDNBFLT0HC7hdYuygmD5tAW0q
         ZdsXSmnuYTYOBhp/aIN0W9D282rm0unj61FvgZ2xlPCpb2FehL76/+8thuirJj5EbTFR
         psAjrGxvqNm63VuyqtadRo1yIIy7nYuhK3Dg+T482n3SQ2fzjI92HNWhKsNTUP6djdp5
         S1v1vY1u3LhIah9b7TlDcKwKp52+17+ORhFgPcy/xogENKOduneaJTeS3tKOoxQ4104o
         3NXlHkmX82BoAuNH0NRq5Q040Sg7Nizg3j1a/RBpvRewQAv2ujTaZQAzzmN/Y1AymC1a
         pWIg==
X-Forwarded-Encrypted: i=1; AJvYcCVvrJ/jq+lWo1YshSMQQWJYj9eCikWu7LGDVNz9mxiXKJUN2ypiFbp8lDPTvhKouz3QxSBsVfucAKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ID12/VBxZYjyjmId4DpPzMSvjs2SHS9G7s8HGJ38OQ1B8VGr
	Fk05K90b55+It+fklR6zNoDcP5AhrTzpGlB+xVkLxQ3KCho0Lifo3D9ybnQTArI=
X-Gm-Gg: ASbGncsUBTVlvj9CFQoZ+GVpR359M4Lbf1ure5zW6Lsrt0Og4BM9rrZj0QnX5+iO0iE
	MKV4oGSndOsRLkOJFQQBmxmIPP+YrTLX6hCnSUcKWlPs+hHk3eKcNJS+crjH/YFrb/tiAD2N/NT
	9Hzhc6YLCLmYFwGBSTNt40HTwKej7U4UblWZ/YVRyZrG3O8JuVIzviPcaj3w2tAobsq7muG4of6
	gC5ELBimOzCcD5gWWPcmoQKLm0TseMRorQetAtsAFRZl4Qa/T5UobQTv44LiLx8jUHU09AahmAV
	dpafQ5PGMhxiC00/F1gVTWoj5XdYaJ5DLXSpFtg1xVGqtS452fBE+oLmI7gFC74n+gYoe6tkUmR
	+se10nCAfYwawMg==
X-Google-Smtp-Source: AGHT+IGPcEqgJbzZ93z5saI9RMTu0Jw8MVo7LvC1jCgugrgygiGJsDA3Rj1DL7+viV5SSM/phg0jGQ==
X-Received: by 2002:a05:622a:1a12:b0:475:16db:b911 with SMTP id d75a77b69052e-47aec4d072cmr54371041cf.52.1744988051878;
        Fri, 18 Apr 2025 07:54:11 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/7] clk: spacemit: define existing syscon resets
Date: Fri, 18 Apr 2025 09:53:56 -0500
Message-ID: <20250418145401.2603648-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define reset controls associated with the MPMU, APBC, and APMU
SpacemiT K1 CCUs.  These already have clocks associated with them.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 120 ++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 9152cce00ce90..ad5f41695f8db 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -136,6 +136,13 @@ struct ccu_reset_data {
 	u32 deassert_mask;
 };
 
+#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
+	{							\
+		.offset		= (_offset),			\
+		.assert_mask	= (_assert_mask),		\
+		.deassert_mask	= (_deassert_mask),		\
+	}
+
 struct spacemit_ccu_data {
 	struct clk_hw **clk_hws;			/* array */
 	size_t clk_num;
@@ -836,6 +843,7 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
 	.clk_hws	= k1_ccu_pll_hws,
 	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	/* No resets in the PLL CCU */
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -874,9 +882,15 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 	[CLK_WDT_BUS]		= &wdt_bus_clk.common.hw,
 };
 
+static const struct ccu_reset_data mpmu_reset_data[] = {
+	[RESET_WDT]	= RESET_DATA(MPMU_WDTPCR,		BIT(2), 0),
+};
+
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
 	.clk_hws	= k1_ccu_mpmu_hws,
 	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.reset_data	= mpmu_reset_data,
+	.reset_num	= ARRAY_SIZE(mpmu_reset_data),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -982,9 +996,65 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_IPC_AP2AUD_BUS]	= &ipc_ap2aud_bus_clk.common.hw,
 };
 
+static const struct ccu_reset_data apbc_reset_data[] = {
+	[RESET_UART0]	= RESET_DATA(APBC_UART1_CLK_RST,	BIT(2),	0),
+	[RESET_UART2]	= RESET_DATA(APBC_UART2_CLK_RST,	BIT(2), 0),
+	[RESET_GPIO]	= RESET_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
+	[RESET_PWM0]	= RESET_DATA(APBC_PWM0_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM1]	= RESET_DATA(APBC_PWM1_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM2]	= RESET_DATA(APBC_PWM2_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM3]	= RESET_DATA(APBC_PWM3_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM4]	= RESET_DATA(APBC_PWM4_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM5]	= RESET_DATA(APBC_PWM5_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM6]	= RESET_DATA(APBC_PWM6_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM7]	= RESET_DATA(APBC_PWM7_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM8]	= RESET_DATA(APBC_PWM8_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM9]	= RESET_DATA(APBC_PWM9_CLK_RST,		BIT(2), BIT(0)),
+	[RESET_PWM10]	= RESET_DATA(APBC_PWM10_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM11]	= RESET_DATA(APBC_PWM11_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM12]	= RESET_DATA(APBC_PWM12_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM13]	= RESET_DATA(APBC_PWM13_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM14]	= RESET_DATA(APBC_PWM14_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM15]	= RESET_DATA(APBC_PWM15_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM16]	= RESET_DATA(APBC_PWM16_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM17]	= RESET_DATA(APBC_PWM17_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM18]	= RESET_DATA(APBC_PWM18_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_PWM19]	= RESET_DATA(APBC_PWM19_CLK_RST,	BIT(2), BIT(0)),
+	[RESET_SSP3]	= RESET_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
+	[RESET_UART3]	= RESET_DATA(APBC_UART3_CLK_RST,	BIT(2), 0),
+	[RESET_RTC]	= RESET_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI0]	= RESET_DATA(APBC_TWSI0_CLK_RST,	BIT(2), 0),
+	[RESET_TIMERS1]	= RESET_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
+	[RESET_AIB]	= RESET_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
+	[RESET_TIMERS2]	= RESET_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
+	[RESET_ONEWIRE]	= RESET_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
+	[RESET_SSPA0]	= RESET_DATA(APBC_SSPA0_CLK_RST,	BIT(2), 0),
+	[RESET_SSPA1]	= RESET_DATA(APBC_SSPA1_CLK_RST,	BIT(2), 0),
+	[RESET_DRO]	= RESET_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
+	[RESET_IR]	= RESET_DATA(APBC_IR_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI1]	= RESET_DATA(APBC_TWSI1_CLK_RST,	BIT(2), 0),
+	[RESET_TSEN]	= RESET_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
+	[RESET_TWSI2]	= RESET_DATA(APBC_TWSI2_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI4]	= RESET_DATA(APBC_TWSI4_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI5]	= RESET_DATA(APBC_TWSI5_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI6]	= RESET_DATA(APBC_TWSI6_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI7]	= RESET_DATA(APBC_TWSI7_CLK_RST,	BIT(2), 0),
+	[RESET_TWSI8]	= RESET_DATA(APBC_TWSI8_CLK_RST,	BIT(2), 0),
+	[RESET_IPC_AP2AUD] = RESET_DATA(APBC_IPC_AP2AUD_CLK_RST, BIT(2), 0),
+	[RESET_UART4]	= RESET_DATA(APBC_UART4_CLK_RST,	BIT(2), 0),
+	[RESET_UART5]	= RESET_DATA(APBC_UART5_CLK_RST,	BIT(2), 0),
+	[RESET_UART6]	= RESET_DATA(APBC_UART6_CLK_RST,	BIT(2), 0),
+	[RESET_UART7]	= RESET_DATA(APBC_UART7_CLK_RST,	BIT(2), 0),
+	[RESET_UART8]	= RESET_DATA(APBC_UART8_CLK_RST,	BIT(2), 0),
+	[RESET_UART9]	= RESET_DATA(APBC_UART9_CLK_RST,	BIT(2), 0),
+	[RESET_CAN0]	= RESET_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
+};
+
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
 	.clk_hws	= k1_ccu_apbc_hws,
 	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.reset_data	= apbc_reset_data,
+	.reset_num	= ARRAY_SIZE(apbc_reset_data),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1052,9 +1122,59 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 	[CLK_EMMC_BUS]		= &emmc_bus_clk.common.hw,
 };
 
+static const struct ccu_reset_data apmu_reset_data[] = {
+	[RESET_CCIC_4X]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_CCIC1_PHY] = RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
+	[RESET_SDH_AXI]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_USBP1_AXI] = RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_USB_AXI]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_USB3_0]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				      BIT(11) | BIT(10) | BIT(9)),
+	[RESET_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_QSPI_BUS] = RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_AES]	= RESET_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
+	[RESET_VPU]	= RESET_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_GPU]	= RESET_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMMC]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMMC_X]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_AUDIO]	= RESET_DATA(APMU_AUDIO_CLK_RES_CTRL,	0,
+				   BIT(3) | BIT(2) | BIT(0)),
+	[RESET_HDMI]	= RESET_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
+	[RESET_PCIE0]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_0,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_PCIE1]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_1,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_PCIE2]	= RESET_DATA(APMU_PCIE_CLK_RES_CTRL_2,	BIT(8),
+				   BIT(5) | BIT(4) | BIT(3)),
+	[RESET_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
+	[RESET_JPG]	= RESET_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_CCIC2PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(2)),
+	[RESET_CCIC3PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(29)),
+	[RESET_CSI]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(1)),
+	[RESET_ISP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
+	[RESET_ISP_CPP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
+	[RESET_ISP_BUS]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
+	[RESET_ISP_CI]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
+	[RESET_DPU_MCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
+	[RESET_DPU_ESC]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
+	[RESET_DPU_HCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
+	[RESET_DPU_SPIBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(4)),
+	[RESET_DPU_SPI_HBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
+	[RESET_V2D]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
+	[RESET_MIPI]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
+	[RESET_MC]	= RESET_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
+};
+
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.clk_hws	= k1_ccu_apmu_hws,
 	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.reset_data	= apmu_reset_data,
+	.reset_num	= ARRAY_SIZE(apmu_reset_data),
 };
 
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
-- 
2.45.2

