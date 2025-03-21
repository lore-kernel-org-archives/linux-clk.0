Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6E1E5732
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570321; cv=none; b=O780aml1mv68HrUfI4Xd11vpnl5wWqt00lXrGT3Na2MiADRnc7lUvq4FyxiOJxSIHb7PHHo//WZp07f5p9tsb17IpY/Yzw9vMOm04FzjwWHvbS4h4wZBHcmyyP8zoQOwztuhgrp6LV0sTDt0rnUpxVQTQMNKDYEwsnsi7Og0J1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570321; c=relaxed/simple;
	bh=lhzOWVrb/W5aWFiPKapeZ+c2qWJP4p7yGhuyvcKYsOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bg/gbXFzKa2hSzax50ChlRsEKYo2qCCE9N9vTFTnRoV1zO+aeKbKeTqZ/39EbZCcmVvYL4or1jasP+9g41JmeqPItY11IIT4qpw7d9WzcaApKw059y5+7uvnIO/rzdzX6luDjRrnVeqicTpOuqqxBI4AP+ziJ+5ZZF3Nk0/W/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ljdzM5ov; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ljdzM5ov"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso72011239f.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570319; x=1743175119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=ljdzM5ovW8+/yRFi6YRmMNKshkeRlKDkKCYanQgBYJW0au0m3DjXmgfeEZhDAKOG65
         Nx4e1YZdKCelEslz78JvjlAAQMj3JtuWlMSp0pzVxK2HHpCWBq5KlYSMt3G0n7HeqVAJ
         jag48xF0rQnWthvXzVTF5JCxm0pgRr+n6LIwxXaen7gpn/kMHfMlOsFJMTujYCohnOlb
         AWeT0pZ9Iib1Dvq2w0XqbA/nbnTvGMm9Bqa/nG1dRBh/DNgisL6x/9V+Kw+HZN1CcJ8/
         OyKTBvTWpp3qU9XgtEpU8WwgTXEiz8PkTOj+EsSzTCDa7EjDayoFJt63/5DQrKdkTt24
         JYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570319; x=1743175119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=TNcEc3vn4IkE1RHecO1bslgJqVVYro8RvNes/IWyEN671+D52NE/bIo6Okt1b7TNAO
         b8PdUR4/n4pUxMQvBjBhfeLrDcwt3tw+QIbaiKzEjTSPYL/x2hCiUjDlICUJRP1rTr9r
         njE6VWY8kBTPm1FTwYF0WRM6BUK++es8QfDy29SRJmBfQZ6YKDH01mIINFcP7CIAQyvp
         DC/x1Ese42ciHExCje9Zzr5tosowfUCzbZIQdYur+09CNnWWyLvJah2hRm77amqsJlcW
         WOF8YqFArPcQN9FsFg17XjZuiDVV7DhOwpaaHJK6uKjdAi5+RYuIyLkMlEOYvDFi3WKR
         xJzw==
X-Forwarded-Encrypted: i=1; AJvYcCUJSIfo9JlssRGdIF3IccTCq2Vt63uOjvvAdE0XK27UUuwvpl9due+dnMD9GHTJ/INXOEO58V3Wpao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaRCIeZ96pfLhFFn5kjhahm+1VDV++PP4lf/J2ec8Y6hJW14A2
	Th3P+4qnndltA5DyEUwoisJ2166TQMie2uu6pCrPJ4XD2S/JvC33dbVFDa+MlVQ=
X-Gm-Gg: ASbGnctlHIcH21dr0QuUhyNkVnX3sSiS2q+iKi/S4152Z4thpuG4isSXz81HrgaO2W9
	K2psR8STA+MdHP03bzofqFZsJkMV08ol+leux2zW2F0CnAziez+BqasePl+1QDJ8Ro7tCcuq+K6
	a6Nd9+C7r3Xv7KUCiEMaGGF0y8R2cUPFI+b9UXdr5ZHIPzc/l2KzRAU73V2+fLp4G5CEVbkEP1K
	BKqr+2PfxsI3LMPkhuxBoj9poErMSBYVmOm97YkWT1FwYZMRoiJy7eDdgejB9kFEDtlCvvsHeHC
	ZaPLRZB/lME3uEGl7jifxUmXeJs3m9xDPJIt65j1LK/irqLz8pv3+vzCAADsiQfZ58D3C1qqwWx
	xGt8br/s8RBFYgT41TExvw0Ks
X-Google-Smtp-Source: AGHT+IEUz8WMBAG/xaa2+GBBPyVyyUIOG2h5tJRf01KFeJERuOLi2IrXGmMUndsyBqpsB4JMvQ48PQ==
X-Received: by 2002:a05:6602:7410:b0:85d:ad56:af88 with SMTP id ca18e2360f4ac-85e1ee299f1mr849828339f.1.1742570319091;
        Fri, 21 Mar 2025 08:18:39 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:38 -0700 (PDT)
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
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 3/7] clk: spacemit: add reset controller support
Date: Fri, 21 Mar 2025 10:18:26 -0500
Message-ID: <20250321151831.623575-4-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
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

