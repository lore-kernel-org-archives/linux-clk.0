Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA3C1F55FF;
	Thu, 16 Jan 2025 23:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070600; cv=none; b=srDSDSu15j+3aDhh/XZXSazlmh1ZjD/HEJBoepB2rSgHEhcNCtcoX18UAdmXN5grmlQcw1sYggubJwwW3iaZRFNJHd9rr7CT07UD4HHd2W/MdJWrih2tLdGxwXsXpYo6TiVFgY8gAi9O3GlkZ30tYd6u64QJ9oJQDtrIEWe731E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070600; c=relaxed/simple;
	bh=5wePT90yi3ucOZhN6NVx0y+s+V2s4IXFxN+SQJtlDMA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tfa274QDVjgtAk7VDBqFMoWbeIWAq/nX9Z14ubvcGRwzncWOKpaoEfeDHr+Ec88uXa5JVXcvmz0byW1y2mw8o7T9LTWoo+OWfo3pPeJSMNnfi7XkCAB+te8/uYWxe+TiH2y1D+05pvo2ttpHGDhf5kk8tHICIgTdgD/ZrEa77eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqzCE8E6; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqzCE8E6"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d8983825a3so2077666d6.0;
        Thu, 16 Jan 2025 15:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737070597; x=1737675397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sfv8QQLnfCoziTyUiFqKJkBABoxadOCGcGOJl3EsCYg=;
        b=CqzCE8E6W/lmZENyNTAio9A82CSa68Ql/E7bIL9Dcg1BeZBGehCpExuVZBLCSkoyun
         V5ptbKdeCnx6T60UM8MXj1ad9MzOtR8hPb4kmPBSG/hT0n6V1Rz4kUUJEWhsoM/0RGmE
         84atvcdpC1v5DW6IN8QueT5epTVHbDnlJbmfV8DLSe5S1PvS5yjvFQVY8lQp0nUETC57
         I3duqwAesomTJ8lv/Aolx02znrwyL9PkK7DivRp1lf47DUWDuN9cBe6ekCTByEnuiQ+J
         8wt4TxGimKBtI+UdyHBxWF7OVaiXbMDzccm2V0qHwnP5k/eyL2qMdJpUVMhZYX4VZjhX
         ioew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737070597; x=1737675397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfv8QQLnfCoziTyUiFqKJkBABoxadOCGcGOJl3EsCYg=;
        b=YI0vKvAIW8MmiDkDKDB0YH09LlhvTDHJujrHEzvDxrP8VNYWFvvz6HpeGQk50cEwvG
         RaHc4MRPCN7SdF/ZNEUXdVSpZ/t+dONT48oEuAvPwx5083reqofsc/netAjWk79ss1Yt
         PyHrJNpTuChXCwrUenzIa1Op2WEr1H/aoNRKMbs9nuhdqSbHZL4h2fD0KCuhBvvzcJCu
         d55NH5jdynMAmj1/dbvD4LLiwO1EcnoI+v2HkTAidITGcKh0jRQs2mo6w+J4iVGbS5qF
         kO0JxzVf/G/pG/AF3TedJ+nUVBqFe3Uw42zaml0zVzgmE2fIEuD17Co2Cvc844KihmOG
         /Okw==
X-Forwarded-Encrypted: i=1; AJvYcCVShQ75MJZ2PoBSQWLX+DA3Qb4592M1llCw3Pqc4YsFFj2yW16vuZ+HmtPuv9JV5aaLQulPhC/2f+brd70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdr0wNUu28bX0nC3oYz0fsDhp8r+5/u/vowb5p+qee8JQAKdDZ
	GirCx232VVrufKOi0IAxntgnBX+rJjV7rZeS/5KfJ3JdJYkIWaVS
X-Gm-Gg: ASbGnctUoQl2ThKAPrAUz+CyRABZE1tDJ14TZxtTXfwuhMyycSb+wf2E6xmRAqhNIO0
	voInumLcr5DyY68N3u/t+mplgWTiEIvfkL7tbLTCAZJSR0XJCSafDSH/KcDe4ZFR03vYGZiauyI
	97TWJtFMGE6ggFcWSwIWvnRWjfS57aLCow5/SEAYCqWK/q/W5sDfntuYjByImkug0r2YGwCkzgM
	xg+lQT/umQzM4j9WAwMgqnske4wDXB8ArDiLdPOY0CHrInR32s6WnGF1hX5+BDrxGhiXoxo+IO8
	a14fkCUPbYtsIJhbQyD0C3M=
X-Google-Smtp-Source: AGHT+IFrZjaQ0wSI/IUN/div6ff6mCehoyRFpFFuj6vr2SRDdpnOlK+087OrY32q17217b8E8lCKWg==
X-Received: by 2002:a05:620a:2588:b0:7b1:e77b:26dc with SMTP id af79cd13be357-7be6324e2d2mr42397185a.10.1737070597234;
        Thu, 16 Jan 2025 15:36:37 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:201e:e96d:7e92:524c:e5d7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be61487328sm58033785a.58.2025.01.16.15.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:36:36 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH] clk: si5351: allow more than one driver instance
Date: Thu, 16 Jan 2025 18:35:42 -0500
Message-Id: <20250116233542.1610163-1-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The si5351 clock driver creates several clk_hw instances to represent
the internal clock structure of the device. The names of these
internal clocks are not unique across driver instances, however,
meaning that attempting to create more than one instance of the si5351
driver will fail due to name conflicts.

This patch corrects this issue by issuing a unique name to each
internal clk_hw instance. The unique name is generated by prepending
the i2c_client device name.  This naming convention was borrowed from
mmc/host/meson-mx-sdhc-clkc.c.

Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
---
 drivers/clk/clk-si5351.c | 69 ++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index a4c92c5ef3ff..dfdf58ca5260 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1440,6 +1440,8 @@ static int si5351_i2c_probe(struct i2c_client *client)
 	struct si5351_driver_data *drvdata;
 	struct clk_init_data init;
 	const char *parent_names[4];
+	char parent_clk_names[4][64];
+	char clk_name[64];
 	u8 num_parents, num_clocks;
 	int ret, n;
 
@@ -1540,7 +1542,9 @@ static int si5351_i2c_probe(struct i2c_client *client)
 
 	/* register xtal input clock gate */
 	memset(&init, 0, sizeof(init));
-	init.name = si5351_input_names[0];
+	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(&client->dev),
+		 si5351_input_names[0]);
+	init.name = clk_name;
 	init.ops = &si5351_xtal_ops;
 	init.flags = 0;
 	if (!IS_ERR(drvdata->pxtal)) {
@@ -1558,7 +1562,9 @@ static int si5351_i2c_probe(struct i2c_client *client)
 	/* register clkin input clock gate */
 	if (drvdata->variant == SI5351_VARIANT_C) {
 		memset(&init, 0, sizeof(init));
-		init.name = si5351_input_names[1];
+		snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(&client->dev),
+			 si5351_input_names[1]);
+		init.name = clk_name;
 		init.ops = &si5351_clkin_ops;
 		if (!IS_ERR(drvdata->pclkin)) {
 			drvdata->pclkin_name = __clk_get_name(drvdata->pclkin);
@@ -1574,17 +1580,25 @@ static int si5351_i2c_probe(struct i2c_client *client)
 		}
 	}
 
+	parent_names[0] = parent_clk_names[0];
+	parent_names[1] = parent_clk_names[1];
+	parent_names[2] = parent_clk_names[2];
+	parent_names[3] = parent_clk_names[3];
+
 	/* Si5351C allows to mux either xtal or clkin to PLL input */
 	num_parents = (drvdata->variant == SI5351_VARIANT_C) ? 2 : 1;
-	parent_names[0] = si5351_input_names[0];
-	parent_names[1] = si5351_input_names[1];
+	snprintf(parent_clk_names[0], sizeof(parent_clk_names[0]), "%s#%s", dev_name(&client->dev),
+		 si5351_input_names[0]);
+	snprintf(parent_clk_names[1], sizeof(parent_clk_names[1]), "%s#%s", dev_name(&client->dev),
+		 si5351_input_names[1]);
 
 	/* register PLLA */
 	drvdata->pll[0].num = 0;
 	drvdata->pll[0].drvdata = drvdata;
 	drvdata->pll[0].hw.init = &init;
 	memset(&init, 0, sizeof(init));
-	init.name = si5351_pll_names[0];
+	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(&client->dev), si5351_pll_names[0]);
+	init.name = clk_name;
 	init.ops = &si5351_pll_ops;
 	init.flags = 0;
 	init.parent_names = parent_names;
@@ -1601,13 +1615,17 @@ static int si5351_i2c_probe(struct i2c_client *client)
 	drvdata->pll[1].hw.init = &init;
 	memset(&init, 0, sizeof(init));
 	if (drvdata->variant == SI5351_VARIANT_B) {
-		init.name = si5351_pll_names[2];
+		snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(&client->dev),
+			 si5351_pll_names[2]);
+		init.name = clk_name;
 		init.ops = &si5351_vxco_ops;
 		init.flags = 0;
 		init.parent_names = NULL;
 		init.num_parents = 0;
 	} else {
-		init.name = si5351_pll_names[1];
+		snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(&client->dev),
+			 si5351_pll_names[1]);
+		init.name = clk_name;
 		init.ops = &si5351_pll_ops;
 		init.flags = 0;
 		init.parent_names = parent_names;
@@ -1621,11 +1639,15 @@ static int si5351_i2c_probe(struct i2c_client *client)
 
 	/* register clk multisync and clk out divider */
 	num_clocks = (drvdata->variant == SI5351_VARIANT_A3) ? 3 : 8;
-	parent_names[0] = si5351_pll_names[0];
-	if (drvdata->variant == SI5351_VARIANT_B)
-		parent_names[1] = si5351_pll_names[2];
-	else
-		parent_names[1] = si5351_pll_names[1];
+	snprintf(parent_clk_names[0], sizeof(parent_clk_names[0]), "%s#%s",
+		 dev_name(&client->dev), si5351_pll_names[0]);
+	if (drvdata->variant == SI5351_VARIANT_B) {
+		snprintf(parent_clk_names[1], sizeof(parent_clk_names[1]), "%s#%s",
+			 dev_name(&client->dev), si5351_pll_names[2]);
+	} else {
+		snprintf(parent_clk_names[1], sizeof(parent_clk_names[1]), "%s#%s",
+			 dev_name(&client->dev), si5351_pll_names[1]);
+	}
 
 	drvdata->msynth = devm_kcalloc(&client->dev, num_clocks,
 				       sizeof(*drvdata->msynth), GFP_KERNEL);
@@ -1643,7 +1665,9 @@ static int si5351_i2c_probe(struct i2c_client *client)
 		drvdata->msynth[n].drvdata = drvdata;
 		drvdata->msynth[n].hw.init = &init;
 		memset(&init, 0, sizeof(init));
-		init.name = si5351_msynth_names[n];
+		snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(&client->dev),
+			 si5351_msynth_names[n]);
+		init.name = clk_name;
 		init.ops = &si5351_msynth_ops;
 		init.flags = 0;
 		if (pdata->clkout[n].pll_master)
@@ -1660,18 +1684,23 @@ static int si5351_i2c_probe(struct i2c_client *client)
 	}
 
 	num_parents = (drvdata->variant == SI5351_VARIANT_C) ? 4 : 3;
-	parent_names[2] = si5351_input_names[0];
-	parent_names[3] = si5351_input_names[1];
+	snprintf(parent_clk_names[2], sizeof(parent_clk_names[2]), "%s#%s", dev_name(&client->dev),
+		 si5351_input_names[0]);
+	snprintf(parent_clk_names[3], sizeof(parent_clk_names[3]), "%s#%s", dev_name(&client->dev),
+		 si5351_input_names[1]);
 	for (n = 0; n < num_clocks; n++) {
-		parent_names[0] = si5351_msynth_names[n];
-		parent_names[1] = (n < 4) ? si5351_msynth_names[0] :
-			si5351_msynth_names[4];
-
+		snprintf(parent_clk_names[0], sizeof(parent_clk_names[0]), "%s#%s",
+			 dev_name(&client->dev), si5351_msynth_names[n]);
+		snprintf(parent_clk_names[1], sizeof(parent_clk_names[1]), "%s#%s",
+			 dev_name(&client->dev),
+			 (n < 4) ? si5351_msynth_names[0] : si5351_msynth_names[4]);
 		drvdata->clkout[n].num = n;
 		drvdata->clkout[n].drvdata = drvdata;
 		drvdata->clkout[n].hw.init = &init;
 		memset(&init, 0, sizeof(init));
-		init.name = si5351_clkout_names[n];
+		snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(&client->dev),
+			 si5351_clkout_names[n]);
+		init.name = clk_name;
 		init.ops = &si5351_clkout_ops;
 		init.flags = 0;
 		if (pdata->clkout[n].clkout_src == SI5351_CLKOUT_SRC_MSYNTH_N)
-- 
2.25.1

