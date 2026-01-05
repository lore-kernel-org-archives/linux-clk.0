Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FF426D4C7
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 20:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767646058; cv=none; b=NoQkqtdyxub+codWfewgj2SjUBMgDrLHJm44j14zIDT+5lBTnP/ZdJms2dwCpX4wCU+KN3/NAbNu08CRBiz9e+UlQ1nm6ACmLu3o+xVWX+ebqWKRN8FW7mdxEjz2u018UzU9iZv8GiYP/0l3PyzcPN41Ugx2LkYmfMPMiXSkXBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767646058; c=relaxed/simple;
	bh=7nReUWnIK+5M7ZN5i+O5JzR7QSNdfOBwiVz/I8wLhmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcSyT4ykbmucdaRCUO8VkSTnejtJfbdNWvn7nx0KzaqOsa66NSPr1A2DVLoAO7zO6VeH0SbhNMxMF17M9dxdTHt9I84Q5bVI8SzjrIEAQR+5x6fpTBy4WqfvQCx/SnMeNz/yiUxvrKFStcKXs7zS5boyzwj4ygUpo87zyUpWLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Ou+qtwh3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ou+qtwh3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so395468a12.3
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 12:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646055; x=1768250855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P8LBmvGnTOHrkGqJNJYNGnVf7vFIplFOGVmqZklygM=;
        b=Ou+qtwh3TYFXodD4h9yJWXFsZWaCxMRwMI3axRft4ZCOXHryjNzwGCZ6L34L+nHnNR
         /qIYKcwejzREqIfH64Gn2q3mXennUY7S+r9rT5c0BHCmqR10fQvC4sZHfhaD3wU6Maly
         Fws2g3HVty9dNfrhceKsTmxJf9S1uf1LCRK+vIKeIgOPTJyP5Y62bgXTT0xIDPfyaj/q
         T7KBxkMUf1IegmwRE6BXkJNPy1xwJYSGnxkId0gr4wLZDgEvEtxA0G0yk7BsEAvj+6qS
         PHb5ZYwoXmehOHUttybPRWiJ2O4FPTGMPEF+A9i5Fir+DbWkf+rzAckZmo4u8DabhvXD
         vZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646055; x=1768250855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6P8LBmvGnTOHrkGqJNJYNGnVf7vFIplFOGVmqZklygM=;
        b=T4EXLWxTD8G8esa4awJ3UZUmmqfGW25iv2v0iVTdbPSjMNJdDkOYc41H0b0kRAwQmL
         Szi6WUwc9twKReFjTfP8e3RvwsCbwjDyaOqH5UjZdtuARIDRiW/hIroNv2y0u0kpY9ce
         3/QvJoN8Z+FZQu17LE1flrLEIC54MJT2lw1V4yQd8atP0jpxbo/tShjCnKNL0yCSgDT6
         mDhZAyAqTEVshpg3d/eM0jNygrAuBe3CGpmMm2upeO5q5wdVkESIGl5HAHRaeMXGzgMZ
         g79v/lUT7tUtv9sCamGSEBFo0SPADhyJ4UXhRC/pw8PkYxx9GQLeGNwSFwEm/XQKykh3
         EDQg==
X-Gm-Message-State: AOJu0Yx0hW+wtXYM2Kk6+kmp4ynTAmjD9EOh/zpACuflQRDI93TOHfW6
	88A98U8BO2JButHIShek1c13CbLdCYiztvHEk/MJWEytYR7T3bxW4oMH
X-Gm-Gg: AY/fxX7h5Vw5fC1IzD8ESERVRfictfpKHFeb/Ow3pG9HAaX7uXCfDjwKoIUF5lA/6Ka
	z5j74yfaw5DREH4EbZdOxSgPUnyBH6L2DDLeJ3MOGrBnALO7bAOS1ZkbBi1qh7UtSlljff2xQL3
	PNUeXqJQcBl9cRayVOwwe4uo5mFweBW2zgv5GfyoAM7AmUaeHcPAg3XLBxjkAO6otY83V8C0+Jy
	jev7i1c/FfEYOCzggoPHz1/Q8+J0S1zAX4E3zsmyLwCK69uJJlHUKPK7CkJL3YqMPABdNS86c8X
	0ufDexEfFmREcp9JZLkH1QaQRJ/fhDYLmkDKiYUtI7xi9t+4xfso9HiiEbcWg7LrDeccF0LythL
	Dc30INnvrGtr9rp0NYAozHlI3vUlB6zVNJ/gyd2pDoMEvb+ReDDQQgrsMWavvPmh4Ab5G4mez3l
	IEyvy3kgua1dLCMdzaZFZ8aqc0/v434ovPB5ywFOZwvrn7mE1593i4J5jfRGQJE01wxl7tdiSy2
	jztlvs9JyODkFHp3qM55sm0rwgdrTzotTk8RrGnFQ==
X-Google-Smtp-Source: AGHT+IGG1LQBfEPmFlrxpYd8DB9+gcGLWD908SEefSfmMK/DBGdhRfme546/4V60Eq3pmIsZOVk88A==
X-Received: by 2002:a17:907:944f:b0:b83:13c3:d495 with SMTP id a640c23a62f3a-b8426bb91abmr96266166b.37.1767646054735;
        Mon, 05 Jan 2026 12:47:34 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/3] clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
Date: Mon,  5 Jan 2026 21:47:08 +0100
Message-ID: <20260105204710.447779-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GXBB has the HDMI PLL OD in the HHI_HDMI_PLL_CNTL2 register while for
GXL/GXM the OD has moved to HHI_HDMI_PLL_CNTL3. At first glance the rest
of the OD setup seems identical.

However, looking at the downstream kernel sources as well as testing
shows that GXL only supports three OD values:
- register value 0 means: divide by 1
- register value 1 means: divide by 2
- register value 2 means: divide by 4

Using register value 3 (which on GXBB means: divide by 8) still divides
by 4 as verified using meson-clk-measure. Downstream sources are also
only using OD register values 0, 1 and 2 for GXL (while for GXBB the
downstream kernel sources are also using value 3).

Add clk_div_table and have it replace the CLK_DIVIDER_POWER_OF_TWO flag
to make the kernel's view of this register match with how the hardware
actually works.

Fixes: 69d92293274b ("clk: meson: add the gxl hdmi pll")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 5a229c4ffae1..0788b9b1ed21 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -349,12 +349,19 @@ static struct clk_regmap gxbb_hdmi_pll = {
 	},
 };
 
+static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ .val = 2, .div = 4 },
+	{ /* sentinel */ }
+};
+
 static struct clk_regmap gxl_hdmi_pll_od = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_HDMI_PLL_CNTL + 8,
 		.shift = 21,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = gxl_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od",
@@ -372,7 +379,7 @@ static struct clk_regmap gxl_hdmi_pll_od2 = {
 		.offset = HHI_HDMI_PLL_CNTL + 8,
 		.shift = 23,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = gxl_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll_od2",
@@ -390,7 +397,7 @@ static struct clk_regmap gxl_hdmi_pll = {
 		.offset = HHI_HDMI_PLL_CNTL + 8,
 		.shift = 19,
 		.width = 2,
-		.flags = CLK_DIVIDER_POWER_OF_TWO,
+		.table = gxl_hdmi_pll_od_div_table,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll",
-- 
2.52.0

