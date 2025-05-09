Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2646D28FFE9
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789646; cv=none; b=htp5X2bqvjT1AVz+5GFj36F7ljwJwPDTUo2nci8uWjse7VKtyBYEkJEBcCWL4kne69cXMjt+YetNwd2oHQXH5keN0/N1oZGrwkf657xZA5b2helIU6yreo7KqmKRaJaQcqSdlI1pqxIo9pkczgtVYjsp0JWeDwy/85lTAdyS2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789646; c=relaxed/simple;
	bh=16T8yAXS8vCC/ViYqptNqxep4o7K884mVL/SLGada1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OX5teUNiCkqdrKniRY3DlrnOXSl6Q8SeVCEGeQj42I3efFJahWxRt7D20XPTwaDAhaApuhUurtL26FtqkUYRxDXDLAVkqbDdeij7pzi1WlbU/mEVPtZ7lyzT4JhX50RkPawwhM6Y7MCZjwRyAS0nlPuAc78np2hVRpkKpcrOsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=LroRHEx8; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="LroRHEx8"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d9327d0720so17858815ab.3
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 04:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789642; x=1747394442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALLcarQNFDeeiNyZCIkx4Oh+0h6y7K/lB/3yo0qpRaY=;
        b=LroRHEx88r+Cg+/KyrRHa9VHFPg2Rn2JHM2/W0x5f3OU1+0WxpMD8rr5S8FsJN+iIL
         I59OU/5inXUwEv8+cdeFeqMugi0wf2IgNo3GS2P7OhC86zYKGLOFNdyVAhWWRL6g0wzA
         WInYTjQ/rnbB37SxhyyFvOWYUPr/YGjHjkpzPn/ZM5tKJEMv1PImu3CbkqdBgZ9EQv3t
         DZ2L3pXn4hDIQMEmdRNHxnqti7Q602UKnI9F08MsPXH7t4ozz7XqJy9lD2VScb+Od+Dv
         e1Rmjf9OgB8rYWZ0xrnRnez+6oN/BmVCV9E9Mr4MsA+SzMfVBLWUPlFn3foF2eJiTPqq
         08VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789642; x=1747394442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALLcarQNFDeeiNyZCIkx4Oh+0h6y7K/lB/3yo0qpRaY=;
        b=k9+TwZJZM5a5Msql1NjzSXhafxX5C8WwDg+nC0RYDPwuQpragZPP/A9vPw6+ORQsWH
         iJMFNVCTFoppj4Z0bWkl1BMjvK0E3XVzhCbbDR7+o3OtV+IelD8qRMCjVT/DbygYPZAL
         HuBINROl8o/VBrEEQS2vFVwHsK4cJYOtrQod3oa4flTf/1jC/tXQnV/SwMIksZgZQkzw
         qL09dIp/N+N4QvIhzlQfRFuyYTwoR7yYLQwunkNoiuYzoWHLXTM/qEuOI+m36MJZW+Vk
         2UDy0Q+ruv4bls/VLtR0r4G/4tRximTG5nyWx4ULnlOkyIFCXO26IdNBGcdfxMErEmlQ
         GVeA==
X-Forwarded-Encrypted: i=1; AJvYcCVALBJwx6EhOfeZVrPj3CbOJxMMY7sJV/ssKuMH4vmOMYMmQqd9XDvptk+1iQmletP9ZXawg70BGC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYahdJ9CdvIpoElb2tOtpP/8jwETTpn9HDtXs8QbAK+/V3V3Ds
	8hXh5dN2beZbSAkkqgpwekFjXET9mEs/dKppuKTsPTf50XcbXWLEj8QXBzilRNY=
X-Gm-Gg: ASbGnctRCXxYdHlG8rKPXiRdPJj47JH1or2Bc+3ZbOgibFYAdaQ+IRsxs96CViC03Kj
	5NfVyJpwukijCxPX96tDKtFaTetAw8Ptii4SJvXvFuTOFb2safe/hXiHRQ8dRWuDp5TkKmiPEQE
	hMjVGLdN8M6VLTMJ4yBVQoNkBJ2luNgAAca5ycatHLbIau0ZrETRIb5ehIdrEjjC7YbygX2nbhU
	d986NiBsLMTB5+ADR29+o3A+VEnpN1URWsThBcZyYWsKvqNIybprQYk8bITKNgLzGHtPJ8qpEUZ
	AH8tA5TMe4/1oh/jrZSBj3TQ0zqmPqBRM3WHoQK5Hhchi+4xOXiNvluSxXhF5KebqMOl4OqE8hx
	OGNfxZT9pkfObQsO+Wkmrgv6q
X-Google-Smtp-Source: AGHT+IGaOzNNGziKbcAaE+WJE3Mqb2ZE3yzP4LVo1rEGwpjX2+uYXY1PsrPJ0vfJTdsAfE1fkWsrfw==
X-Received: by 2002:a05:6e02:1fc6:b0:3d8:2085:a188 with SMTP id e9e14a558f8ab-3da7e1e2709mr38555745ab.1.1746789642222;
        Fri, 09 May 2025 04:20:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/6] clk: spacemit: set up reset auxiliary devices
Date: Fri,  9 May 2025 06:20:28 -0500
Message-ID: <20250509112032.2980811-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112032.2980811-1-elder@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new reset_name field to the spacemit_ccu_data structure.  If it is
non-null, the CCU implements a reset controller, and the name will be
used in the name for the auxiliary device that implements it.

Define a new type to hold an auxiliary device as well as the regmap
pointer that will be needed by CCU reset controllers.  Set up code to
initialize and add an auxiliary device for any CCU that implements reset
functionality.

Make it optional for a CCU to implement a clock controller.  This
doesn't apply to any of the existing CCUs but will for some new ones
that will be added soon.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v8: Allocate the auxiliary device using kzalloc(), not devm_kzalloc()

 drivers/clk/spacemit/Kconfig     |  1 +
 drivers/clk/spacemit/ccu-k1.c    | 90 ++++++++++++++++++++++++++++----
 include/soc/spacemit/k1-syscon.h | 12 +++++
 3 files changed, 93 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
index 4c4df845b3cb2..3854f6ae6d0ea 100644
--- a/drivers/clk/spacemit/Kconfig
+++ b/drivers/clk/spacemit/Kconfig
@@ -3,6 +3,7 @@
 config SPACEMIT_CCU
 	tristate "Clock support for SpacemiT SoCs"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select AUXILIARY_BUS
 	select MFD_SYSCON
 	help
 	  Say Y to enable clock controller unit support for SpacemiT SoCs.
diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 801150f4ff0f5..551df9d076859 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -5,12 +5,14 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <soc/spacemit/k1-syscon.h>
 
 #include "ccu_common.h"
@@ -21,6 +23,7 @@
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 
 struct spacemit_ccu_data {
+	const char *reset_name;
 	struct clk_hw **hws;
 	size_t num;
 };
@@ -710,8 +713,9 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	/* The PLL CCU implements no resets */
+	.hws		= k1_ccu_pll_hws,
+	.num		= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -751,8 +755,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.reset_name	= "mpmu-reset",
+	.hws		= k1_ccu_mpmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -859,8 +864,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.reset_name	= "apbc-reset",
+	.hws		= k1_ccu_apbc_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -929,8 +935,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.reset_name	= "apmu-reset",
+	.hws		= k1_ccu_apmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -941,6 +948,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Nothing to do if the CCU does not implement any clocks */
+	if (!data->hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -981,9 +992,63 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static void spacemit_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(to_spacemit_ccu_adev(adev));
+}
+
+static void spacemit_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int spacemit_ccu_reset_register(struct device *dev,
+				       struct regmap *regmap,
+				       const char *reset_name)
+{
+	struct spacemit_ccu_adev *cadev;
+	struct auxiliary_device *adev;
+	static u32 next_id;
+	int ret;
+
+	/* Nothing to do if the CCU does not implement a reset controller */
+	if (!reset_name)
+		return 0;
+
+	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+	cadev->regmap = regmap;
+
+	adev = &cadev->adev;
+	adev->name = reset_name;
+	adev->dev.parent = dev;
+	adev->dev.release = spacemit_cadev_release;
+	adev->dev.of_node = dev->of_node;
+	adev->id = next_id++;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1012,11 +1077,16 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	data = of_device_get_match_data(dev);
+
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register resets\n");
+
 	return 0;
 }
 
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 039a448c51a07..53eff7691f33d 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -5,6 +5,18 @@
 #ifndef __SOC_K1_SYSCON_H__
 #define __SOC_K1_SYSCON_H__
 
+/* Auxiliary device used to represent a CCU reset controller */
+struct spacemit_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct spacemit_ccu_adev *
+to_spacemit_ccu_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct spacemit_ccu_adev, adev);
+}
+
 /* APBS register offset */
 #define APBS_PLL1_SWCR1			0x100
 #define APBS_PLL1_SWCR2			0x104
-- 
2.45.2

