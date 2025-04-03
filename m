Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55FD243968
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670747; cv=none; b=gUu6XOvFtuuBt+hE8jKEn1XIgF7+TSVo4FQ42wRqTX+2lTOoa499mc1q1eQ2dBH1WUh8utpm2vNXZ/AXBZy/0nXOg9WWy0QvsNNlyYw3AAxBFFqJvFiX+vOxTczFP1fCqWlSz9FPCccnVrV/3vzZrbfzES1D4DWXdrLKB0W7/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670747; c=relaxed/simple;
	bh=3ZuAbxXX06ozk3Tfj9ghYJsYuA9BYsa2OTFam90KOhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSYnnZOAc45Rhp6y60UoKM4du/WpuIC1uPP7GGv7MuvfWGoqEvx26tlGVLwA3F8gJcoZDNmF6CCEfgNN4IaqcYz5eC18D7i5nL28mArJMK23UhnlSF7f1MSIlZx6dS5vx9KraPG9sAl2rfZJnSjqgP3oKHAVWF/kl04AetB9YQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sihtSJSP; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sihtSJSP"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso1103711a12.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670743; x=1744275543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=sihtSJSP3ON/aTv636TQbOvlzBGpOe/n6JQef3T6U+e1+0o188jAM7AHpZsef9yAzR
         CD/PpZa4iM2RRS7Tgg1n2oobGtUAV9dTwx61Gmj4LglLUZz8twdRNcCu87zVDqpAu+BD
         /l07XXBx/GUjvjRZ3sAbVCUTwrLRGNr+bLVwUZDems0gKQLIb40HQGLG3eKsPiXZ+6so
         VjaUp0s2s7pS9ldY9EALtPXSvUcd0Dk4Tas8rzEGzssQWvcIFZ/Kvp0nv1Z0zMHMXR6r
         u6UQJZHgvtIiCI5gCCpNv9cYPhzDhzCXJWPsjx6v1hSzF6/TbttXnKf4S/f5YdUxtmXR
         /7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670743; x=1744275543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XJ0BnP9OZ8bJehCr0mEgQXneIq2z0WdureacdI7Rno=;
        b=qL5PVs940wPaafRGL/qV23cZMyh4EkBr2OLY8pHFbPdWB1mdW6yzv7Gw8CE0dG+x1V
         lKxsAloKzriqgGh1Q//EqnzFXLYW8voZw1ejAsgY+MI+lu3HyeYVBwwAMS54Q14TUeR4
         TwY6R4jfnOkIGJxHZFI4RA36ukZ8j1VEECF491AjgRhBijFC3gmZFtPK2ROH92GRyK4U
         POLvtmJVxxWjtuFc+c3ws59/fyHcl5krA+56Z0y2fL1ulJ+6YSjvobZ7ruSJzJWMWePa
         39dh5ozhIJWGTA3R3bAp5vjLazgSy/yETfn9o9uUZ+/FeZ5KhMwmnshZ2HJ8iaCv9OPJ
         oiiw==
X-Forwarded-Encrypted: i=1; AJvYcCUvnmMq9fpq63632ulZf3sdPk2w0fZ68X32J0XiUsbSQkU46lbVWTfv+Il4vO4qxTazfp000C2YKso=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRE36/f6pBLqablj8NePtQ18iqstBNNnIPNvxVNgGsPY/E7jfk
	17KmCDQwwBrsU3MlZzbgakrYxI8tyJuUo2mrHecJRjHc4L90B7SMV2EvD9NPXng=
X-Gm-Gg: ASbGncvhdl2qbL03b4b4hI3vEkekv4tce7HQVq8v7B+zwYBWkUHVhLvp9AyDyP8fYHs
	U2zAa14nm2OVPbsLyYxzDTH4XfmA08eE81nEu1p1C0TbIbQsHsb2DElTCuPKR1i6lY4Yt/2XJRm
	RCBiJVP9f+84+192yBp7CXKGdQnzmQTzR7EAutt9RaslO2U9vUJjtoj/lMhjkUACY4a84wjrZR+
	Ja3InxHOcSrHHsw6kWbT/+nXTJUeZPHQAGBng6ADmLRxWmxKSJLdzcqOionalzxpPAK45nvXRcr
	cSlEIK4WL+hKUFQkUmgpVZ6gEvavxqrHphjXaychBLWSxRRPVepisOJ67eRwdxZ2/hqQQdAVXMB
	u3FoljXD3DJ4j/HsiC9MnisBpQPpX
X-Google-Smtp-Source: AGHT+IGkZPSWp4lu5rUJK3n+QeS/CEFX/u4+R1iSLBAES5mqBRreTDwkWOuPbVChNdfUaTLO5xi3fg==
X-Received: by 2002:a05:6402:278b:b0:5eb:4e69:2578 with SMTP id 4fb4d7f45d1cf-5f04eaceb11mr4573614a12.13.1743670743004;
        Thu, 03 Apr 2025 01:59:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:02 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:58 +0100
Subject: [PATCH v3 06/32] mfd: sec: update includes to add missing and
 remove superfluous ones
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-6-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This driver misses to include some of the respective headers of some of
the APIs used. It also includes headers that aren't needed (e.g. due to
previous driver rework where includes weren't updated).

It is good practice to directly include all headers used, which avoids
implicit dependencies and spurious build breakage if someone rearranged
headers, as this could cause the implicit includes to be dropped.

Include the relevant headers explicitly and drop superfluous ones.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 7 +++----
 drivers/mfd/sec-irq.c  | 5 ++++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index e31b3a6fbc8922e04a8bfcb78c85b6dbaf395e37..b12020c416aa8bf552f3d3b7829f6a38a773f674 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -3,9 +3,9 @@
 // Copyright (c) 2012 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,13 +17,12 @@
 #include <linux/mfd/samsung/s2mps15.h>
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s5m8767.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/slab.h>
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 5c0d949aa1a20f5538d8baf7a8aefc1160ffa14c..3ed2902c3a2634a6ea656d890ecea934053bd192 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -3,7 +3,10 @@
 // Copyright (c) 2011-2014 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
-#include <linux/device.h>
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
+#include <linux/dev_printk.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>

-- 
2.49.0.472.ge94155a9ec-goog

