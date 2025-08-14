Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F5E2E9EBD
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163103; cv=none; b=fYPFMCcW4IgoNdkjemjb6aHM7tK+O8wTRmjjdu+44TR2MUpTFxjVabUroHP1qI7pswo7KrdXxIkosms1DV3M9Vc0LEMgKLnP0NXMid768FVmIBE16N22PeF6DAnTMghjsk5bktMUwYRxieZSwQFgHf7H2Rukm44ELSJ7fc1qbeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163103; c=relaxed/simple;
	bh=rHzxROU5ryoJgm5jbG0atVnTjdbnBgsujevNDGx2vtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5IuDs2aBnXJSs70tF4pe5Wezh1Rd9hOrqP8IzugsryBhTLL4694bKxNvMDV8PwXkNAclV20k+WVpt64F9/u12WgpQdr/i4wbeRNi8msGH5z+7QQf0u8MSMayup1fh7dCFg72v/RbYPJeCb3jCUjLaBaiIoMjG/zTGKGd34lZxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+Lig8zD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+Lig8zD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so4526835e9.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163099; x=1755767899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAaDT/OUbXmcuIyI0UD5MRIk/4NCc8MDaMt6MhGlz8c=;
        b=i+Lig8zDYzYzs8M153W9h7U4UoAccDfTerkDB4LC4hHj+TBjJ4V/Zn+JZL2xU4hxFU
         m7P5ghzGg3qeDD9zuAU2NLZZIqac7F2IKYscBbE4BeN/xosGs94HxBIhkjf2mfz5ERgn
         b808wUFpWaFwfaCbupBWnzamNzO4dKbffb3RvfrCDCCHE6m0DKfYadfoGix7rB6CBeSV
         SDK2qE2TjEuJVWKnjfrDyBrHnKsEtlU9Txj/NAcBlgkJKJwCp3hXoSglxEqNpD9qGI0N
         0VN6yLIvwtfVRUZPD5KeezQ73h+mTMLYEPKlY5DdpXbxEmWFOW2aMhcUMBvWbdSUFTlZ
         6m3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163099; x=1755767899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAaDT/OUbXmcuIyI0UD5MRIk/4NCc8MDaMt6MhGlz8c=;
        b=rtSaSyMOhgHmZIWeR0XqBhyrN3AEgy4T+tA0wKxOzdv1knw0gtJrPChyKIBlxzoY5c
         j2J5lR0PnlGByoeHuhQwB0x0KP66XFLcYbOTaQ1DK0J5ORnGBVyItd/T6tx6hGbGknjt
         eCucIri51NGhElZ4LiagCaKUahrqqpsAuau24Oknk0NNoNqZHA/2mVs5fODKj/Lnn7M/
         5LgYYNqB+XbThqFxkyKeaQC3Mgt/bZ60z3WgBo2LMRyrnlDd49rUC53pRi8e4ecIOLZ5
         oOYyAimcbqiPLo5ww3jf24VaIw8zWt9r+d++Z0lTiNxhXZneW5U+5AC9bh5kXcogyp6h
         pBSA==
X-Forwarded-Encrypted: i=1; AJvYcCUeuBAkTLa8uX+fxjvcREa6448zMF7V525CjKweLy/W7tjXvt4U0quKvr0GR4qebXO3so0Te3dXmyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtA4IRoPEwJKMoX/TwVXSeOhth9aZhDOzM9PVWIVNjJSvmeIlQ
	n6IohsXCvCpnSBqTeJk/TkRyisqGRVuEiA1A2jISzu0LCX78gpA0obkzeOoKjoVF+3I=
X-Gm-Gg: ASbGnctsSvzrLpsChSxvkhDwioCG+bpxK8XrMmPowRnejP1mK1i7oMp3+4RZq2Un4QE
	HFrIZHNE0nEXWG8BAzBxQ7NjYbnUqENxQj9e/LAOpp6ipJxs0qmIt4qA3OIysPWEQuAstepRbc6
	CH2Jui7KZpiRZpHxv670X2kOgB8qwBQbR61kZ0D1Kmwvdi4hPd7nd8omltvbtoByvaqRQPk6u0G
	GZNOBfrVYpavW1CHIeU7LKDeJWTSWcxdTFVDG5G2Zo9pAQ99yx1HOSvhXXnV04CIkftZhC9XGHb
	gMQctEmpV7hQPDD0n/AOqpEg534u/cRpqSzW5MfkJX+w54digdRlMIlNDKlh1u7NGQhTCWURCfa
	HV9Hh0H0WdspzZXREAwLZl/xs5jD0C5XyyVAo
X-Google-Smtp-Source: AGHT+IEja8CLfTSNlKR5f4WfpXSN4rOwyS5Xo1KeZ5Yr/TOyUiNzdSQo50qDF7mxVImYpzfwRhB+ZA==
X-Received: by 2002:a05:600c:3503:b0:456:ed3:a488 with SMTP id 5b1f17b1804b1-45a1b78645emr16883635e9.1.1755163098783;
        Thu, 14 Aug 2025 02:18:18 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:ea13:2485:4711:708])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c74876csm13861925e9.14.2025.08.14.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:18:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 14 Aug 2025 11:18:06 +0200
Subject: [PATCH 1/2] driver core: platform: Add option to skip/delay
 applying clock defaults
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-platform-delay-clk-defaults-v1-1-4aae5b33512f@linaro.org>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
In-Reply-To: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Currently, the platform driver core always calls of_clk_set_defaults()
before calling the driver probe() function. This will apply any
"assigned-clock-parents" and "assigned-clock-rates" specified in the device
tree. However, in some situations, these defaults cannot be safely applied
before the driver has performed some early initialization. Otherwise, the
clock operations might fail or the device could malfunction.

Add a "driver_managed_clk_defaults" option to the platform_driver struct,
similar to the existing "driver_managed_dma" option. If this option is set,
applying the clock defaults is skipped in the platform driver core and the
driver must do this itself when ready.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/base/platform.c         | 8 +++++---
 include/linux/platform_device.h | 6 ++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 09450349cf32364bcb3c8dd94023406442ec204d..c7278ace71d3f6d473fdea35bf79bcf80a56ee21 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1392,9 +1392,11 @@ static int platform_probe(struct device *_dev)
 	if (unlikely(drv->probe == platform_probe_fail))
 		return -ENXIO;
 
-	ret = of_clk_set_defaults(_dev->of_node, false);
-	if (ret < 0)
-		return ret;
+	if (!drv->driver_managed_clk_defaults) {
+		ret = of_clk_set_defaults(_dev->of_node, false);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = dev_pm_domain_attach(_dev, PD_FLAG_ATTACH_POWER_ON |
 					 PD_FLAG_DETACH_POWER_OFF);
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 074754c23d330c9a099e20eecfeb6cbd5025e04f..fa561dae2f106b61d868a870e10d9656542b1c7e 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -250,6 +250,12 @@ struct platform_driver {
 	 * to setup and manage their own I/O address space.
 	 */
 	bool driver_managed_dma;
+	/*
+	 * Skip calling of_clk_set_defaults() before calling the probe function.
+	 * Use this if the driver needs to perform some initialization before
+	 * clock defaults (parent, rates) are applied.
+	 */
+	bool driver_managed_clk_defaults;
 };
 
 #define to_platform_driver(drv)	(container_of((drv), struct platform_driver, \

-- 
2.50.1

