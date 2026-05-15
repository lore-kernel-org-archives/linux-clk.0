Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B14E43C074
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837559; cv=none; b=l28+aiIBpfiqKXy79taDpetx+n3Dr0S0vqqiLHxMYNKSBvhNRLxlTrEls0c5OioyI/nAlnc6Y3vrHMJQ5qtfBhUENjkWXkjXTuquj5c9PluCcZdMac3jU/1Xzu3DzdVVGKgYN6YFg21xo4okO7esvcauujqsVSw5pfSYlVPpM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837559; c=relaxed/simple;
	bh=V/zAmCJSjPS4lESeLMnCYH+wKme4wcn13reVAfH2wSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAhn8/Ky2eOW1rOiUT9iyOiJ7sHwAU5FI3DQodHHsEAaiGNUqgNLa9d/Qh2uH9M4DBl3v9BRS+NrCUA0e4ulwIdu0eg9jV1EEzJGOX+StBz6Agn9Gm0lfRugznXIXrC9vWK5QVV5L69vmLHqW9veBHONemUAByMHgYYCgOt0MlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HWs9zKPd; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HWs9zKPd"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8fbe18b1dso3318096e87.2
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837556; x=1779442356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAYzurZY50V3hmmtsDULHaTPPUEpyOSaAQclTNRWi04=;
        b=HWs9zKPd8M0tg/D8xHPzwjUF++R4Ie2fvhiqKnjEoo8zRvOQGqYr5e7sL+gnQ7XjUf
         VPn3Q9QKqVM2WK1oE1qPBwsJqkWTpnqFJSdAnIyNtogtlv8pY59Sws8k/JkVatF8LfwK
         LoOf6GBTDSTt30Z0Q62fRnEz1NhJCDGMaJoFHrSkIo9fOOPzC/6RZsoGttxSUM+E81xY
         cNPsAErEBPER9xzPdBgbiadlRo9vonWoLOXcCaydtcOrdZWB3wkJhOFigNUmZQYFzTvt
         Py08jVeEBKlKPhRNVYq+TwIqlV+aU0WxsFOjK0klpVOZ3U3qcUg+UL93O50OlRpOeZ43
         hN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837556; x=1779442356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bAYzurZY50V3hmmtsDULHaTPPUEpyOSaAQclTNRWi04=;
        b=cver2XGpNgdkzz+/aqcLj/pT9lEEIRtGufrpbt8QcXDVV7+7xLDtznAQ9ijh4bcdj6
         PdLRJ98lEadkoWoSePwlNcprtKHrCMTIjyV0jY/lryhKumG4SFQhkB83sBT3avBY2WNk
         Ufhdd3B5/SZo3k1oPvaRCT5UuXWEKdPNQcP2Uv96bkDlAZ+LhDXdGlKVydvWgp+SL9p7
         IQ8EFMS72DkguySeJ6NpI2tWXMgQpNqJOIS5RVZhi+MTjocFaT3FuIL/8jh45H29xa1I
         CIvBwQ1nRqvVkRtktwZqBX6EYqzRWHTzcCC7YKAxTI67yleDDQ5PS13i6lullyps3vL7
         BIfg==
X-Forwarded-Encrypted: i=1; AFNElJ93eRDeB8bG4fWKH1is/XtKeWSRzSTeeZC44xlEVY/A8XKZFWwrHXTNX89NJMZkEprVff0yO5WezbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWk6nSNzxzE6IVOODPe+nt4vN43K5T/GzLHXwGZxP2QhusBSsJ
	iS391krm9qiuUCIawJXoOa5LIeFP+hPeQHPCRyus/kwpNIsICs6AtAbTemNE6rGZZqY=
X-Gm-Gg: Acq92OF0eBljc+Pmoa6RllOjgWPTQ6t7ZHuCu737QeKhlf8hPVRMjqanyF0vJZYgGLN
	ihQcz8o2qPYoSqK8q4QyxJsBq2Tk1ZRZ3Ws1ZmhkI76f4wku4pcMicz36ZbXOtJlbPbyxay67lw
	i/0Jec7itTjrzAHYv8IstTK9mNNCAh1p2bZuZ67dtzRZeMmgTCT4gSGjSBuyggj9M1G0qlEXFI8
	4NbQLbvzOji4bbNNSRy7NBpYiuFVWNXWjQsPH8GIEIJaesH50pSyXIAkLHL/tpsHjpZ2TJOGvmR
	pDHvgP0mvDc+QlDfQtQRyUfwD/FgqAjEpWzlKGvCKSt35mihyd17QQp6me3xp5WNXQZEbKDdVC6
	eoqLLllVdNQZ4ij1ZpgLKnjEcSsJL4HLGDwIuM9UbRUrjdIKq5X/7G9s+bo3RjHuD7DUs/aAo6D
	+GsjJWisqh3pQurBNHKlNm1RdJN9Nf6vWSnMjcATsRoCgNSnCk1n1x0K/7yutzyt5MBcjdaJEbZ
	cBwtngo
X-Received: by 2002:a05:6512:1241:b0:5aa:b6a:7a8c with SMTP id 2adb3069b0e04-5aa0e7755fbmr794712e87.43.1778837555450;
        Fri, 15 May 2026 02:32:35 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:35 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:30 +0000
Subject: [PATCH v2 6/6] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-6-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=3069;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=V/zAmCJSjPS4lESeLMnCYH+wKme4wcn13reVAfH2wSY=;
 b=InTs9KReVdF2eoMfw0/biWdc7G3Bd8Nh8MxuA9Gg5UmfB4Osm6mTlKpQfuXozSCoIiHD7QqQe
 acV6BXVoUDbCnqsPo4ZPDSLBCkon0f53ViIX/VdTjIn/a3bkutA2HBs
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Introduce devm_acpm_get_by_phandle() to standardize how consumer
drivers acquire a handle to the ACPM IPC interface. Enforce the
use of the "samsung,acpm-ipc" property name across the SoC and
simplify the boilerplate code in client drivers.

The first consumer of this helper is the Exynos ACPM Thermal Management
Unit (TMU) driver. The TMU utilizes a hybrid management approach: direct
register access from the Application Processor (AP) is restricted to the
interrupt pending (INTPEND) registers for event identification.
High-level functional tasks, such as sensor initialization, threshold
programming, and temperature reads, are delegated to the ACPM firmware
via this IPC interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 2cebc5456968..a663e15fbad6 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -857,6 +857,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+/**
+ * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
+ * "samsung,acpm-ipc" handle.
+ * @dev: consumer device
+ *
+ * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
+ */
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	struct acpm_handle *handle;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "samsung,acpm-ipc", 0);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	handle = devm_acpm_get_by_node(dev, np);
+	of_node_put(np);
+
+	return handle;
+}
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 08d9f5c95701..83cbd425b652 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -71,6 +71,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -78,6 +79,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.54.0.563.g4f69b47b94-goog

