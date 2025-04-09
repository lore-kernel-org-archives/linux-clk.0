Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695AF214225
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233472; cv=none; b=WAjSKv2BO8gF4Vij6ShprlXP//KxzhgdvZNPG+viDWQ3vHV2diefvjacuFhhj4z7hviOCwNtDra8Xqn2EUQoUv5Q/wKOzdkdGVf22LljUaTBgtHcYqyfV6AXV+WG1GroCW+e+F2XwPLX+eJv1wFRAZX8HZVHk+3YVWGoX948/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233472; c=relaxed/simple;
	bh=xu/rmbyAwS83GsCFaLxaM7ZFQXHgPwGGt7mhXq7PvRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KIkxWhTANK6x3NNKfYoht634wKV9118OQ9GZdF3MEggCPMOtV+bh4eiMPZ8SHGIAkgFwhweToJ77J7a1uowrMhLimjQkVrnLuRv5eUnBl7VbMpRqr1+O2vMvtRYGLrYXohWccaLk6aU3KxXyXcmeEar9MetkkkFx/Is6NsnwqF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0jT97Ew2; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0jT97Ew2"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85da5a3667bso5300539f.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 14:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233469; x=1744838269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vaVE3Er2gRm6pRja50190vA7NVtS7/61eybF5RG2eo=;
        b=0jT97Ew2W3/NjMmJwMWDDFe0k0nNQyiXACTEuPOUFQKELmKfKDg7xJZor4xs2iUzO3
         y4GTQ/VtUV06ML9ZVHfdwpmheIQ4/jcheFXQI93BBGpiGp4DfERbd1z1MzVhgzFSWRlP
         8RH9dlSX11OA1/xApoqOkPBjoX6rNu7ZKoSgfGK4VCnjMMWnjUHVpx/tShVQ6eYwTDzM
         HENObMzXDLYcAnC+9UuUSR2Wo+g7QhRvwAEojBXr9RkACpMuOtBjBr7pxER9HCpGMO5v
         0blIEIIIfhm18J0iw1mtB+Is73j/RfIy7yQ3aUAO2Lf0EVGZ9OHCUT7Opq8y/KgW1GAT
         tJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233469; x=1744838269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vaVE3Er2gRm6pRja50190vA7NVtS7/61eybF5RG2eo=;
        b=hay6+7vYLTx0M+6btI3aIfIBN7NYRJ/Ros6cBZnhue8Oxcr/dxgdnTXYR+pqYdBp65
         qpX6E0uqgj1ewA5y+kVtEIEC7H3xvDUZfPLpwbz/AKYxrSad4/6OpUMm0HSsmbSmSbz9
         WOXrFMWrM2IaXZgxfxeyQIajq5MY1dpEvLYv210C+pQiISniu6FBfq120GLdOqe4Bhfs
         yr+e1IA78UKmwIbuhJq10J9nMWbE6oc0XidjFFIxjxgC81rJAbGUFIBWQ+TsoA6/ACOt
         kgK+0I9srCMcu4HFIAMhRccNO9Qj3G0uepeUoSFRPMpxXjPl0mR7trsMMEa5/F9VV/bl
         fWGg==
X-Forwarded-Encrypted: i=1; AJvYcCUlBlsrZVxnL3IQweU78fq0O2YS1xECeUXACuaMWHs+KoG8VZyCnK2wjTcoXgZfittNRxGkChSOc6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SScqcN9N7qg8RaWwdLVlV5w90ftsMlbYikIIv2PHrlDoqP/U
	/GwJE9pzfSM5Dd3VijtB3fA0bKFXZIxD05uGxrUoVoxxb8mYaPfF2zbXVtLKqM0=
X-Gm-Gg: ASbGncvISKOSH/Uzd499HHpnclBVxnz5hRKQWKvEtDyw2Eoak8qaKQPjh/ohjID/x8C
	SCa41vT1jYTwD7vERiLG9bmOilG9xiSrK2mU3+G2Dofzi6IorP+Ust8tKDOjfx1/orO4j546ho3
	QlvWQMyMX+Wi51aeo6oSWqq0xQXiCdtv4NSlvBbgKFkqSj02JPJ9MN4DEBq//t3DVRGQMNHkYKE
	5/LIs4Bkaa9RUpIVHpPkUbR4uMYwqdSWu7AVSIz7Cr37I8q8npGkYK8DAXoCf8m4Lw+PqNcQ7l2
	rIogeZ2MYBuWXSL5Uh8gsy7Kcnt0fLU0W5ZVLFBUX8irchYQRaAgLo5gqmJvTxZOKmF6xW4l5/9
	vnvGCv1JqSX0eTQ==
X-Google-Smtp-Source: AGHT+IEBY6acRolvlf2WpeIkQxW3UfG8KM2JL9zhL0q472AEywVb8BQfsGSSvLHW9BgVjXxwqB9IyA==
X-Received: by 2002:a05:6602:370f:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-8616edd5b9amr43972339f.12.1744233469422;
        Wed, 09 Apr 2025 14:17:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:49 -0700 (PDT)
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
Subject: [PATCH v3 3/7] clk: spacemit: add reset controller support
Date: Wed,  9 Apr 2025 16:17:36 -0500
Message-ID: <20250409211741.1171584-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define ccu_reset_data as a structure that contains the constant
register offset and bitmasks used to assert and deassert a reset
control on a SpacemiT K1 CCU. Add a pointer to an array of those
structures to the spacemit_ccu_data structure, along with a field
indicating how many elements are in that array.  Resets will be
optional, and if none are defined the reset array pointer will be
null.

Define a new ccu_reset_controller structure, which (for a CCU with
resets) contains a pointer to the constant reset data, the regmap
to be used for the controller, and an embedded a reset controller
structure.

Each reset control is asserted or deasserted by updating bits in
a register.  The bits used are defined by an assert mask and a
deassert mask.  In some cases, one (non-zero) mask asserts reset
and a different (non-zero) mask deasserts it.  Otherwise one mask
is nonzero, and the other is zero.  Either way, the bits in
both masks are cleared, then either the assert mask or the deassert
mask is set in a register to affect the state of a reset control.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - The spacemit_ccu_data structure is now used, rather than
      creating a new ccu_reset_controller_data structure
    - There might have been a few other minor changes, but generally
      all that's been done is a rebase on top of the new clock code

 drivers/clk/spacemit/ccu-k1.c | 86 +++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 8a8d228b46c3f..2a8c514be4b2c 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -11,6 +11,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -129,9 +130,23 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
 struct spacemit_ccu_data {
-	struct clk_hw **clk_hws;
+	struct clk_hw **clk_hws;			/* array */
 	size_t clk_num;
+	const struct ccu_reset_data *reset_data;	/* array */
+	size_t reset_num;
+};
+
+struct ccu_reset_controller {
+	struct regmap *regmap;
+	const struct spacemit_ccu_data *data;
+	struct reset_controller_dev rcdev;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -1200,6 +1215,39 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static int spacemit_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller;
+	const struct ccu_reset_data *data;
+	u32 mask;
+	u32 val;
+
+	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
+	data = &controller->data->reset_data[id];
+	mask = data->assert_mask | data->deassert_mask;
+	val = assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_update_bits(controller->regmap, data->offset, mask, val);
+}
+
+static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, true);
+}
+
+static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops spacemit_reset_control_ops = {
+	.assert		= spacemit_reset_assert,
+	.deassert	= spacemit_reset_deassert,
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap, struct regmap *lock_regmap,
 				 const struct spacemit_ccu_data *data)
@@ -1247,9 +1295,37 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static int spacemit_reset_controller_register(struct device *dev,
+					      struct regmap *regmap,
+					      const struct spacemit_ccu_data *data)
+{
+	struct ccu_reset_controller *controller;
+	struct reset_controller_dev *rcdev;
+
+	/* Resets are optional */
+	if (!data->reset_data)
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
+	rcdev->ops = &spacemit_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = data->reset_num;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1278,11 +1354,15 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	data = of_device_get_match_data(dev);
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_reset_controller_register(dev, base_regmap, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register reset controller\n");
+
 	return 0;
 }
 
-- 
2.45.2

