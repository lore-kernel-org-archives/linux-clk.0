Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265530B50C
	for <linux-clk@vger.kernel.org>; Mon,  8 Sep 2025 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337186; cv=none; b=YADajxY57H67UZ1PW/5Hnh9iWKHelXh459FZrSNCbOYBOaDtmX4Xx+mqBPFoBtvUNaoyJcY1OX78gbgdASqK1r+q8o90AGFHxdMN0eq0PwHO3fPxn7LoUD7TOxF2mK0xx8WH9R++ssS7JNzkp55TqFP4LmMTlRu3zH6MttagCFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337186; c=relaxed/simple;
	bh=pOrwHMUpTRHTOWnb5cnnDdzeM4ESkRCjGNVfFG9Nc7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KgqRmnX8fFr7b4SmHOzKwIBOrMDmMM8DryJ1G/Y+klMBLN9rOrRbFXZLlA2pwLFX8Q7nkZwqLb53Gz4Xn/Rwl8pFwYg/x5TWC4ryXCozGpspXRt5VXa+hbsQLJU3ZH8Qy+GRkO6T6qbZn0r7O1nUbIVbV6xD50YhnHTTco42SSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qcVRgX83; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qcVRgX83"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so3040829f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Sep 2025 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757337182; x=1757941982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VURWIkfuPan7bcStL9p1ueaB35kinp1F/svGb9kGJc=;
        b=qcVRgX83ITqAlqXs8msiHonhbIDa57HTNdkjHH5mTX9t2Fgj/oz9aeeD41KZKT5fh2
         xR9azaHhwESL31Lbpfm0kNONnMD9TeJfWw/VVTiSQCqtgam8ueO55c3YXorMzVXzFpO2
         0b1H+OFTSRuTYVkVJ1uw+6KDQGyx/Z5ORkNHmaOfM8JWpVSLoxTCOh69e5/qMkoi5E2A
         /4w1nDLckdZV+hhbZCckE8RE60xatjQLbrwW7tjd18Z3xYjsX1kMjBV4/zTo5zPFOsCk
         RCILDba74IZoyUH/zOSJpmXwkXB4XgBanP9HZsHxsnq9mJ58TvvslKecRD4G4np6seVI
         TgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337182; x=1757941982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VURWIkfuPan7bcStL9p1ueaB35kinp1F/svGb9kGJc=;
        b=hLDzmN3Lh6zgxv9BWWZjEGwslypLkCoYutPVRZJdw8OntkKAkT7kHxBmxdreE9kQdY
         U3zH+lZbIpS0OepxdYp8U3p983Q0QeJCHsdTW8Ih9eAIuFGQU6Y9jLM3CKatKWWfBiNG
         6bZ8lTDzQUTCvIp35VBqerWRLEMy4Jl7J3zSZh2k2ATu7UAxN42Og4BvKMj7NnknbJz/
         P9/RWBmZW4l/1rEy99swZBafam80Um8y0wUfOaQ1c1WJS364crVPkLDCybwZHrZFlyQL
         ddmUDcWkP0mzZeXKAyboUY9JcRvqPLLRs2fmVz5gBnPW/QEAtx+DqZagDfOMFOUYFBxC
         oFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3qpBHPPkwRu/hrRVA67RB6rg32qygrM6D6Yo8t42Ow2mRhqtWoJvtHa41u97VQ3SQs/AOMa/+zcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9t4d6YZL62d84rFjKIBGZb3jZe87K3Y2WHXKXjIE/DN5WKr0X
	nkSRJJrsInGIBNvZkwcRGvrgzJNxAgxx6cv858YkmNnCD9b027Hpt2E1+l9wAKQCtho=
X-Gm-Gg: ASbGnctfKVLVoSw/6l56aIVgeSanE7Y8SAsE55tB2MYl47F1McDVEC+V4lAkf9d/5iT
	rb0fgk42JCJdWxhzzmb0CBfEwm468j4aF1EhHQ2pd6sn5ruCaR7t3voZHehjYKb0Fwzk+t8eV/8
	gxwrPq09WMDal3USExhDU0b+1iJix1q9ksjn20+ijhN3FxpBBnmS4T70mwKQZHM4NVs7BFhE5pw
	FuxZ06F5pZAC5Izii7rOE/RRZjcW3h6+8FyJQdru79DluW6fBdHpknSYIJ+lcCfHQnW537wfFPN
	XP9QR5mW4WrbbJSULWU5wLMeMZJ/yI957pmNznEwM/kJomvkghraHEkwvbMCDfSlJ3YRCnMiGF/
	8dX+dwoYORjtNmg304WxhdZRgMT7GModvNhgD/KZXnhXv0ZJoSYSDyMjrW4nv9/QFdiYZpn/5uq
	oDhw==
X-Google-Smtp-Source: AGHT+IF7+1AW9gZi8VQR2eAfB1khonQITj9xmbUIJb5Ssirri3fDS6+tN+4m3PJu5jGzW1eTe1Ha4w==
X-Received: by 2002:a05:6000:2681:b0:3e4:74dc:a3bb with SMTP id ffacd0b85a97d-3e64bde9298mr7276281f8f.40.1757337181458;
        Mon, 08 Sep 2025 06:13:01 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf33fb9dbfsm41650181f8f.43.2025.09.08.06.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:13:01 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 08 Sep 2025 13:12:44 +0000
Subject: [PATCH v4 3/5] firmware: exynos-acpm: register ACPM clocks pdev
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-acpm-clk-v4-3-633350c0c0b1@linaro.org>
References: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
In-Reply-To: <20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757337178; l=2606;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=pOrwHMUpTRHTOWnb5cnnDdzeM4ESkRCjGNVfFG9Nc7M=;
 b=UTpAb+oSnFVBaTobsje5fgi9yvKDrERYAhJexCt3pEL95FZ5z5dw1g464Yv1noAWgt1hsVIOP
 AMaQN6NW/q8D2uKwG/IM/JHV9cOncEqoKaD8YigxQkmL3ikjGunTHUd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Register by hand a platform device for the ACPM clocks.
The ACPM clocks are not modeled as a DT child of ACPM because:
1/ they don't have their own resources.
2/ they are not a block that can be reused. The clock identifying
   data is reduced (clock ID, clock name and mailbox channel ID)
   and may differ from a SoC to another.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 9fa0335ccf5db32892fdf09e8d4b0a885a8f8fb5..0cb269c7046015d4c5fe5731ba0d61d48dcaeee1 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -177,9 +177,11 @@ struct acpm_info {
 /**
  * struct acpm_match_data - of_device_id data.
  * @initdata_base:	offset in SRAM where the channels configuration resides.
+ * @acpm_clk_dev_name:	base name for the ACPM clocks device that we're registering.
  */
 struct acpm_match_data {
 	loff_t initdata_base;
+	const char *acpm_clk_dev_name;
 };
 
 #define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
@@ -604,9 +606,15 @@ static void acpm_setup_ops(struct acpm_info *acpm)
 	pmic_ops->update_reg = acpm_pmic_update_reg;
 }
 
+static void acpm_clk_pdev_unregister(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int acpm_probe(struct platform_device *pdev)
 {
 	const struct acpm_match_data *match_data;
+	struct platform_device *acpm_clk_pdev;
 	struct device *dev = &pdev->dev;
 	struct device_node *shmem;
 	struct acpm_info *acpm;
@@ -647,6 +655,18 @@ static int acpm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, acpm);
 
+	acpm_clk_pdev = platform_device_register_data(dev,
+						match_data->acpm_clk_dev_name,
+						PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(acpm_clk_pdev))
+		return dev_err_probe(dev, PTR_ERR(acpm_clk_pdev),
+				     "Failed to register ACPM clocks device.\n");
+
+	ret = devm_add_action_or_reset(dev, acpm_clk_pdev_unregister,
+				       acpm_clk_pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add devm action.\n");
+
 	return devm_of_platform_populate(dev);
 }
 
@@ -746,6 +766,7 @@ EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
+	.acpm_clk_dev_name = "gs101-acpm-clk",
 };
 
 static const struct of_device_id acpm_match[] = {

-- 
2.51.0.355.g5224444f11-goog

