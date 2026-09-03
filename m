Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A905939934B
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476374; cv=none; b=k/6ogu7qOpcTbkW35vrtHxsDCddyLd47ZuhJhVNvC30cqeujXWVBK11cYzlQUBPwiu+G7CC6gBLsYh3LvT6CFQ6IgvYFPa69RleAm4MY2ldBmwIcqM/IFUt2nklUbmy1E4kVydAre7NIoFVya2MjZjIrleVkiJHHE2dIuhXMmtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476374; c=relaxed/simple;
	bh=dBm6wiR4NCMuszCPNIsVX9WFUcZFQlUHejOmhcoyT0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8mo4Jg6rPcS79zE0RD0KgNerB0ZezHGXafaNag6jKrPOYvHmH4on+LLN5I4HcTEkZlAMMWK1bRFD7qUnsAQSn9/wb1tjkkJiyxunIGO4NnvE/0WvQP/qrynA5k2/toTYLl7DRl3Ddm4uhXSuOrotGJdtUmaXWdjHWwYysZWxTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so265811f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 15:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476369; x=1789081169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1SiDePVmO2z41UWzhMW/dfuGDGSD2CkgizPnd7ksWA=;
        b=TVQ/hMVCcBbC6BsMks8lYRwAvPLKLBWa1NR5objfTTgT8OVUvVaof1dSfWeqI55dU/
         E91OI/Da33e4cZIlSrF73kCW40uHJVjMvk3RNamtDo/PUQPPdbGlxFRd85BHAy7qlYLk
         IJpQGNRm5rmZIF/39JjQMscOT2wMBKIyPNgvzwx83d4xD0nCxIwFkG4m09lvRA4dSjM9
         kAg31mWRGUmgzOnGs04iJRrj9kXcOSSg/3sfc1/rskfdiTFLiRWwjMbkl970i5Dc6UQc
         oSKEu5o1uDfQACN3RwJVKxYVyKnFyyta/E02w3RAT40E69hR/qQ011kKxHuMXeevG82w
         D51A==
X-Forwarded-Encrypted: i=1; AKwUvByYa9IHHJz8R35AneArXx3L7SqVVfMm4GmPtZLoE4Ht8zaFWXijX/xqleEdN14ZyOQ4vznrq4eLxCU=@vger.kernel.org
X-Gm-Message-State: AFuF++kI4hOrOdR3hocYOA3xOcd7DbZMmjbY8YGa3um7ms/VV8zmZnck
	NFHEsQzq4q0QR80r3MvlkmGooPdcVvmAk+T/Zor9vBUVq4quiMl8LKL+
X-Gm-Gg: AYBFou2ChFXiXRDtKyV6vnE7qsnPC/DOW38W31JQ10fa90IvGrxrmWAJz487d/n0kKb
	o4sWoNc+iEmryiheYVEISwqXgiR9lC7FNSRtud62KOT/y9A9fP1Iul+sVAVIM7GKR3eRsVfEI3B
	BJv8a3cdXFbFi7gjeaUVOw6B8zaFm6afZHHUt1n9HGqx40FEwTbmBw2DboOd7JrKwnAMrBh8MgU
	5BhA0Z0ABZcLwIWtWD5fTfvnSuc3hUDnlh7JUYQOfONBbLrWu1XxvV2OT1c+4XU0iKS/os4AsmU
	2iyLtTJYHRvV8yDgyj/GL5egJETrXn0Sa1QQVVB7gFAv9PKzw4KzpfPDOFLXdd7/7ncAblSU5aE
	R6cI2po7amnvQtyIn15zz5pk3FoNBzO0XyYWo6VB0TS1WGfQEqUPfTpDziLn8nNOAGTtin2wz1y
	ixcOhVmZtQsc6Cj0WxuAwDOQ6h5UJFmvNAtnMT6ljgsk7FXF9QZGyKgDvdaxW1OJIQIc36wm4Mx
	j8dVSwFpBmZIeH659K0WjEuOA==
X-Received: by 2002:a05:6000:4a1e:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-485870870b6mr4790999f8f.1.1788476368800;
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:28 -0700 (PDT)
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
Subject: [PATCH 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
Date: Thu,  3 Sep 2026 23:59:21 +0100
Message-ID: <20260903225921.2290441-5-tanure@linux.com>
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

sys_ampipe_nand clocks the pipeline stage inserted in the bus path
between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
identifiable consumers - the three MMC controllers - so marking it
critical was the wrong tool: the clock should be referenced from the
consumer nodes and claimed by the mmc driver instead.

Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
have no single identifiable consumer.

This depends on the MMC controllers actually referencing the clock:
the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
clock must land before this one, otherwise the boot hangs and memory
corruption this clock caused are reintroduced.

Fixes: 43e1705ecab9 ("clk: meson: t7: keep the memory fabric clocks running")
Assisted-by: Claude Fable 5 <noreply@anthropic.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/clk/meson/t7-peripherals.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 55d09e78593b..2f429ea86796 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 /*
- * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
- * used for DMA between the peripherals and the DRAM. After the clocks are
- * disabled, a device that starts a transfer cannot complete it.
+ * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
+ * the peripherals and the DRAM. After the clocks are disabled, a device that
+ * starts a transfer cannot complete it.
  */
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
-static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
-- 
2.55.0

