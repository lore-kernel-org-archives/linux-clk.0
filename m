Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9522B586
	for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 19:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742499901; cv=none; b=pie8sCnkIFAGwvD5SxRvebuDyt5g/UCaGYXROSB5/EvgnshpWZ93O3z718JJn0/MCBlexbIHkjnPor6IjPo/RFGYaLN/HFO65cHxoOd54cCX+Wg039JUQC7o6F9FgT3RrhjNzQp0oh3pI0py2cDMI3+4WrKRUbRWY30RR0+eW8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742499901; c=relaxed/simple;
	bh=lhzOWVrb/W5aWFiPKapeZ+c2qWJP4p7yGhuyvcKYsOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/uouWxqTxHWJUx9LMoTDmeW9woH8rC3yasEbc0foHM0aA576q3S9oqoZrq8K+PtnvADxwlp3gDMi+TfPwmzDfRUpZVDE+Ddbm0+IwQbo2rJrmDlUu75u1sK95AJg+Fdc1ViogO/kPDrdBZrqd2jNKlxrcdIpL5jbLfAnTPJjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YF5vrJ+1; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YF5vrJ+1"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85d9a87660fso116901639f.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499898; x=1743104698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=YF5vrJ+1tURKY0daScOOk/sUXKdCJzd3oS+bVbHbI3L0uKalrD5UzinkDD+ol658uW
         m1U8ZHo5Z3c10/bK6LzdbO7+WKIdbKYQ8QAcM3Xwr/Z72RvFuj2hJeJwpYv7Zpjfe1aU
         R1ExE6u986ftRA+jAWx00HTpUwVxp4Hf4GZ8Zk+gQP2S8ISC8tW7Hl+04Q6WsBYiHtvx
         1QhFBu6gTIusSRbyzNmWmZ7xJgDwbXEgtRkencHOGCGBbnb56dTBh7RQeI4I+j0SdiWA
         NEtitv0N1aTftsy6MyKub8Ix9A5uteRjsf5tz220YbdKA1xwRU7+N/KbZRvhgVnAYNlO
         yhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499898; x=1743104698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=MqxKGAkTUAqIBBCfnD8oRXnKboyRynU7PzAfXSeNTjF/jhziqZEOqlcFu3pgHG0CDw
         jb7adbtTPiNjg9+rBsmmWHN3XgdG/FplZV429iSaJakjoizAvWIbCeYCnS8SUbapesRD
         veTrveXiOVGqfFCyWvtA6SmrrqE/pCaap/ehojxZLiYLDellrAjVm5Pr2sm6xWYKhbM8
         NiVF+lpQUI/vggAi+5ZTvkze+YWeeFoU1KK97qwdtB3RSXQvTn0lmQRczMmfjq4D+j3s
         kzWLVK3gokO+wUGZNYJbXho+nM87UOoyi7Zrqpa84C0SqY07OsR1LTNS69j9yaTDiIX0
         iLuA==
X-Forwarded-Encrypted: i=1; AJvYcCXOdP9XhM1ixSRLxk1ZQ2loMBZ1A2oGJx8cGtLKgEG+V0EWARc+0sPplZ1YChzT5Kf5Z0B3Kf0PyJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU047oHmNq4u22m8pl5+i/pxBosXZ7Ahx93rDBOuCha8Z7fJFp
	IH81ibuul5COPvWTy/7DFaiNVAtoXUmaQU7yhUlj7wd5CEiUx+fWdjQQIziES1s=
X-Gm-Gg: ASbGncsHE8iu4ACCN9GZNifGm3hiR1lz0amn2iTnk4t5WLfZWs1Trn6RGaDVk8HYC1T
	YG7Rx9j++/0IZexkDyfErbR/D6Zmxjm78rwaD7DbUpfldKQ/MFo8z8pqyoVJclDprzOkrfadVKb
	zsntVnyMOGRSh76qFj3TDivRfu5unmNPqAv4ie2xR4mx3GQUVmqVcN611HbkMVp/Mb2c+bPtCbt
	uA2c+qqLK4bk+MQhZaDibSH2lkprYosIZclLnDLGUTYf4OZlq+Z79QC8TZGNvaeVw+WGy0Dd6JU
	q08KmIpowUNJ+mzuaEZ3h3tDakRiK0fXm1YZ11YqwUKj0XNJlFj/5znjkVjnNTYtXrCT6UjVKfA
	iJWVTnnXKsMuazljt8fyQB0wF
X-Google-Smtp-Source: AGHT+IF5Um4wxnf1VBR2WUaWHAuuXv8maMmB3T9J09ThCkD0kILxqdXmbC6BUXhNgpO/3CkQqObwKg==
X-Received: by 2002:a05:6602:399a:b0:85b:58b0:7abd with SMTP id ca18e2360f4ac-85e2ca35536mr78053339f.1.1742499898515;
        Thu, 20 Mar 2025 12:44:58 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:44:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] clk: spacemit: add reset controller support
Date: Thu, 20 Mar 2025 14:44:44 -0500
Message-ID: <20250320194449.510569-4-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320194449.510569-1-elder@riscstar.com>
References: <20250320194449.510569-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define ccu_reset_data as a structure that contains the constant
register offset and bitmasks used to assert and deassert a reset
control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
a structure that contains the address of an array of those structures
and a count of the number of elements in the array.

Add a pointer to a ccu_reset_controller_data structure to the
k1_ccu_data structure.  Reset support is optional for SpacemiT CCUs;
the new pointer field will be null for CCUs without any resets.

Finally, define a new ccu_reset_controller structure, which (for
a CCU with resets) contains a pointer to the constant reset data,
the regmap to be used for the controller, and an embedded a reset
controller structure.

Each reset control is asserted or deasserted by updating bits in
a register.  The bits used are defined by an assert mask and a
deassert mask.  In some cases, one (non-zero) mask asserts reset
and a different (non-zero) mask deasserts it.  Otherwise one mask
is nonzero, and the other is zero.  Either way, the bits in
both masks are cleared, then either the assert mask or the deassert
mask is set in a register to affect the state of a reset control.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index f7367271396a0..6d879411c6c05 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -10,6 +10,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -134,8 +135,26 @@ struct spacemit_ccu_clk {
 	struct clk_hw *hw;
 };
 
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
+struct ccu_reset_controller_data {
+	u32 count;
+	const struct ccu_reset_data *data;	/* array */
+};
+
 struct k1_ccu_data {
 	struct spacemit_ccu_clk *clk;		/* array with sentinel */
+	const struct ccu_reset_controller_data *rst_data;
+};
+
+struct ccu_reset_controller {
+	struct regmap *regmap;
+	const struct ccu_reset_controller_data *data;
+	struct reset_controller_dev rcdev;
 };
 
 /*	APBS clocks start	*/
@@ -1630,6 +1649,48 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
 	.clk		= k1_ccu_apmu_clks,
 };
 
+static struct ccu_reset_controller *
+rcdev_to_controller(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct ccu_reset_controller, rcdev);
+}
+
+static int
+k1_rst_update(struct reset_controller_dev *rcdev, unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller = rcdev_to_controller(rcdev);
+	struct regmap *regmap = controller->regmap;
+	const struct ccu_reset_data *data;
+	u32 val;
+	int ret;
+
+	data = &controller->data->data[id];
+
+	ret = regmap_read(regmap, data->offset, &val);
+	if (ret)
+		return ret;
+
+	val &= ~(data->assert_mask | data->deassert_mask);
+	val |= assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_write(regmap, data->offset, val);
+}
+
+static int k1_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return k1_rst_update(rcdev, id, true);
+}
+
+static int k1_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return k1_rst_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops k1_reset_control_ops = {
+	.assert		= k1_rst_assert,
+	.deassert	= k1_rst_deassert,
+};
+
 static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 			   struct regmap *lock_regmap,
 			   struct spacemit_ccu_clk *clks)
@@ -1675,6 +1736,33 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 	return ret;
 }
 
+static int
+k1_reset_controller_register(struct device *dev, struct regmap *regmap,
+			     const struct ccu_reset_controller_data *data)
+{
+	struct ccu_reset_controller *controller;
+	struct reset_controller_dev *rcdev;
+
+	/* Resets are optional */
+	if (!data)
+		return 0;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+
+	controller->regmap = regmap;
+	controller->data = data;
+
+	rcdev = &controller->rcdev;
+	rcdev->owner = THIS_MODULE;
+	rcdev->nr_resets = data->count;
+	rcdev->ops = &k1_reset_control_ops;
+	rcdev->of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
@@ -1710,6 +1798,11 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = k1_reset_controller_register(dev, base_regmap, data->rst_data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
+
 	return 0;
 }
 
-- 
2.43.0

