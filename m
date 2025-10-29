Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364B03559F1
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746177; cv=none; b=deXl6ne0aGtMg47FF3M3lzSbynlDUg/YGT5ab24EENJ9ICIU7kzCGAxc64OZECtapr7yEbZ4QZkaQiZBzB4xLDSFwRzVYGvvR29yBBGxjijgjnLEYXLyMlphHHS/flEPpdKWY9sDC7v1gD1COC9gdnGcGTti5NnJ5FLd2rG3dfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746177; c=relaxed/simple;
	bh=jQqYazffawvob92GlM5kKbR1nnskRDKAjAEl8i3gy7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FasSp/6u1xgxVgz7P8wEGc3kElhOGD3YIWmD0ywIIm9SdeoZfLs/GcEe9N9Gi2oFI1VgFrRZXHt5yo6HkzXDZd76jGxaboaRv2jTQDQ+LuLFz9CrKuBpnmkPijyaIAyCNft8Q1+hOiR7QWFSZjNlLLvweE9s2CKaj84MA07lVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGitqUWk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGitqUWk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7042e50899so165074866b.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746172; x=1762350972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0zuCkqo/yYV3kQ7MqBUgd3ahReWAttM1hFVGag3dBs=;
        b=GGitqUWk1oEzka4ff8pIFcnlJr6jflzURB1Z4OAQTqjTW3AOheHhFG7tRQW4woAve+
         WHCovKwggOwyYq3yTk+zWrFLFOt/6Dyv1dxAsP1drbap4cJh5OZ0xEc5PFY9o1B7UR3k
         catgGsw4T2XpxTpZdDYFgcnmA+itYnr2V4pJBCpbDdhYxU3w226hGxna2iY96ChKnqSW
         MxyaDqlsBbpPCy9WEENV90c9h/RoqkpVFqaKgr308uKbAF1DUhKdyvhu0vdEu9reRTP2
         KQht6W5tLd6j2hSqu2weEwvKm/0+DsYea7vmJjCLgQM2AvnVV7IoTQGwQAfjG6JOJOoO
         v99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746172; x=1762350972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0zuCkqo/yYV3kQ7MqBUgd3ahReWAttM1hFVGag3dBs=;
        b=jDXvOsmSSs4WZvzIxAicicbtpY9twFgRgzxknBPAB1uQrlA9O7kLo1/rsWuisTIOf6
         +Woah7D4M2SWwSuURX/KYiRghfGk7Jw4d4tUn7fgS7K2/XITQ7kH1n5oWk2/YQBRGuFb
         SrUL41hZ7HLPupv2xJz2efdzNrNOSu3O8v3rOBoM9usO+KcGxx5EVFKGOO8qA5Ls/kVG
         M3AXOfy7pijDQObufnJXxq0x7Rb7hzaLoGyUeGImNsCCq+zz1ujuUtP1hNd1FDNTf06Q
         4XLqjCcrYT/4+HW+SPrwI1V8YNWOUBvCoZljljmfvFwZJLjxmuYNy0VUl2xFuE7OQxtV
         dDfQ==
X-Gm-Message-State: AOJu0Yy5DZgBsoBwTYpyc0J95fQEG4tKeJfg3aCDAcjR/incHsz2reP/
	GqlPnpgllJNN4gaNqIGwhob9JI6vWJueJWPd3HdLiI9vVzSxPaTZrKiT
X-Gm-Gg: ASbGncuVY8HgCf7138xwVx5/SES6MBXG3w5Dilm+zzkZHSA4KPftZwx1QjzRtijJcFP
	5O8MXXpppd3o34KJoKJwLlS/nXb7tooHdzssw5AHrCWeddvaEY4/aQn0l/oqPeoa1wg1gdqAKyR
	yUZ6nLm2YH1BKriFggfRDAkQTNjZKXtBSJqEJ9Ai78gKz7p3XD5uud2JpTWmj8yL2p0D3RlMsxE
	M1EALrOvgkJs7DHk6Q0pINJ7i6ITIxF4ZtyYW+9S5hxVel+VtDq+Cyyw+/A8aYZQlT8KiLDKz3q
	GPkfMThbv2dv/5fkAkTU+UJNEHQv+9/RuqozGSzeQbLMmzrAEhQ8xfIJcLhA/ooKntUIFqPcL1B
	Tmp8lmhyFJa05K4ZSp4BEq+MU2Q0rRjxSxMUOWWGyfe0HDulGoWD/YWJYQ3O0InBUaENS/8Za1d
	6gmu259uhxf+p6B6cyJEEuPbbK5A==
X-Google-Smtp-Source: AGHT+IGpy31yKKECPj1bORsOgXUH7I+UUx6roxhBJ/s8FggZAtznwZBysb24BP9NWSkwCSGcK2OCoA==
X-Received: by 2002:a17:907:96ab:b0:b46:8bad:6972 with SMTP id a640c23a62f3a-b703d492f2cmr271816166b.38.1761746172314;
        Wed, 29 Oct 2025 06:56:12 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:12 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 5/8] reset: imx8mp-audiomix: Switch to using regmap API
Date: Wed, 29 Oct 2025 06:52:26 -0700
Message-ID: <20251029135229.890-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As far as the Linux kernel is concerned, block devices such as i.MX8MP's
AUDIOMIX block control or i.MX8ULP's SIM LPAV can simultaneously act as
clock controllers, reset controllers or mux controllers. Since these IPs
offer different functionalities through different subsystem APIs, it's
important to make sure that the register R-M-W cycles are performed under
the same lock across all subsystem APIs. This will ensure that registers
will not end up with the wrong values because of race conditions (e.g.
clock consumer tries to update block control register A, while, at the
same time, reset consumer tries to update the same block control register).

However, the aforementioned race conditions will only impact block control
IPs which use the same register for multiple functionalities. For example,
i.MX8MP's AUDIOMIX block control IP provides clock gating functionalities
and reset control functionalities through different registers. This is why
the current approach (i.e. clock control and reset control work using
different locks) has worked well so far.

Since we want to extend this driver to be usable for i.MX8ULP's SIM LPAV
block control IP, we need to make sure that clock control, reset control,
and mux control APIs use the same lock since all of these functionalities
are performed using the SYSCTRL0 register.

To do so, we need to switch to the regmap API and, if possible, use the
parent device's regmap, which, in the case of i.MX8ULP, will be the clock
controller. This way, we can make sure that the clock gates and the reset
controller will use the same lock to perform the register R-M-W cycles.

This change will also work fine for cases where we don't really need to
share the lock across multiple APIs (e.g. i.MX8MP's AUDIOMIX block
control) since regmap will take care of the locking we were previously
explicitly performing in the driver.

The transition to the regmap API also involves some cleanup. Specifically,
we can make use of devres to unmap the device's memory and get rid of the
memory mapping-related error paths and the remove() function altogether.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 91 +++++++++++++++++----------
 1 file changed, 57 insertions(+), 34 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index e9643365a62c..3f6d11270918 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
@@ -42,8 +43,8 @@ static const struct imx8mp_reset_map reset_map[] = {
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protect register read-modify-write cycle */
 	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,26 +56,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
-	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, active_low;
-	unsigned long reg, flags;
+	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
 	offset = reset_map[id].offset;
 	active_low = reset_map[id].active_low;
+	shift = ffs(mask) - 1;
+	val = (active_low ^ assert) << shift;
 
-	spin_lock_irqsave(&priv->lock, flags);
-
-	reg = readl(reg_addr + offset);
-	if (active_low ^ assert)
-		reg |= mask;
-	else
-		reg &= ~mask;
-	writel(reg, reg_addr + offset);
-
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
+	return regmap_update_bits(priv->regmap, offset, mask, val);
 }
 
 static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
@@ -94,6 +84,50 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
 	.deassert = imx8mp_audiomix_reset_deassert,
 };
 
+static const struct regmap_config regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+/* assumption: registered only if not using parent regmap */
+static void imx8mp_audiomix_reset_iounmap(void *data)
+{
+	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(data);
+
+	iounmap(priv->base);
+}
+
+/* assumption: dev_set_drvdata() is called before this */
+static int imx8mp_audiomix_reset_get_regmap(struct device *dev)
+{
+	struct imx8mp_audiomix_reset *priv;
+	int ret;
+
+	priv = dev_get_drvdata(dev);
+
+	/* try to use the parent's regmap */
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (priv->regmap)
+		return 0;
+
+	/* ... if that's not possible then initialize the regmap right now */
+	priv->base = of_iomap(dev->parent->of_node, 0);
+	if (!priv->base)
+		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
+
+	ret = devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register action\n");
+
+	priv->regmap = devm_regmap_init_mmio(dev, priv->base, &regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "failed to initialize regmap\n");
+
+	return 0;
+}
+
 static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 				       const struct auxiliary_device_id *id)
 {
@@ -105,36 +139,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	if (!priv)
 		return -ENOMEM;
 
-	spin_lock_init(&priv->lock);
-
 	priv->rcdev.owner     = THIS_MODULE;
 	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
 	priv->rcdev.of_reset_n_cells = 1;
-	priv->base            = of_iomap(dev->parent->of_node, 0);
-	if (!priv->base)
-		return -ENOMEM;
 
+	/* keep before call to imx8mp_audiomix_reset_init_regmap() */
 	dev_set_drvdata(dev, priv);
 
+	ret = imx8mp_audiomix_reset_get_regmap(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regmap\n");
+
 	ret = devm_reset_controller_register(dev, &priv->rcdev);
 	if (ret)
-		goto out_unmap;
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
 
 	return 0;
-
-out_unmap:
-	iounmap(priv->base);
-	return ret;
-}
-
-static void imx8mp_audiomix_reset_remove(struct auxiliary_device *adev)
-{
-	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(&adev->dev);
-
-	iounmap(priv->base);
 }
 
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
@@ -147,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
 
 static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
 	.probe		= imx8mp_audiomix_reset_probe,
-	.remove		= imx8mp_audiomix_reset_remove,
 	.id_table	= imx8mp_audiomix_reset_ids,
 };
 
-- 
2.43.0

