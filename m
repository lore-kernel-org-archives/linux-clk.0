Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759A31F9432
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184243; cv=none; b=SXn1nhckwkGTvVy571Pbx4WNBGdcOkhqkwF4L8ubquy4LD58//okH9U5UTj7yO/DfQEdvF9pdV7ES3sP8p3jcTyP4iqe1fllikVkb80DyGuTVjUklm3MS2rjvq2sGc/354dY/Pq4Du/Eq/VbWXoFPxO9mSOW4MIF8MNrc0RZc6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184243; c=relaxed/simple;
	bh=t7hDrtx4kJ5DeVsIbZmhYCNSETknrAFehSlgXsa/aQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3jcXx/ggGna+DeQVKVPza48mnlKGUXwxVWCD0fw/Bhg9KlKVpXetts6sxWH4z92Rua4QErsahHFUIispQ/97UC2uqBdaoxIl74CxJ9lYpxPxDeJD9qxaa16Lr+DICfcKiEavnyIRxH4t3+N6fn9TeTIS7saakPuJRYy7/1n90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wYzjG2cf; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYzjG2cf"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so1436743e87.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184238; x=1729789038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUEt9TXBCKzq7zig2rJbZI6eJjpDUgZF5RCBfHnO/I8=;
        b=wYzjG2cfE1PtDDXEf4iQoTFJRG8aE5flZrwKDZenLO7mFU5kDG6r/fcdrf8ust/uf0
         ikQEEg9HSl6XMLX47/94GiFOAJpX92hqhDL0dWSZO8P4Ir+J1DksNfeTsqdGVoGBLDA6
         I9tFS92R8QhyA0hk7NlLhRmBKOSaoZHLKxeYUTW5VbGn8t/uq90UhTp7XgCUs92cSGLe
         k5zemYNWBp0ZYPYcvVwrIE+chFOmMOerzG7D5teG7hGKemLZSQ+MztHtb/O0MEoNqBva
         2e4coCSaaWv0+OvdVLumCiH2PDPXvDANl23k8Kj/muCkkW5dS5MIlDIpCKQVeatRxCcD
         +4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184238; x=1729789038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUEt9TXBCKzq7zig2rJbZI6eJjpDUgZF5RCBfHnO/I8=;
        b=l4+NEoochVfhwbPGXvdxD53ImR4dSrES9sQ6NWbXNrl1UdfD98ImA6xsaSvtP778BG
         q5QRP3iAQp1wT9HcwNHRkdaDmbLW5Y3gD905TIIrMFZBEeBcakRtaf7DV40cE1sU9T+V
         IqUZcLAFsdV0bDKPEXGASI0RNVrYSycKazSgdiIkOK5nXP7Yn2fJN1X+Pad2F5lSny+G
         HjAguG7voQ89Oua1Cnb2DB1EzBJfZ2AtWQFx7BQg/XS3FRhiVK+zhboUK5N2ScorlUgq
         KAQgA+ZkUkD9BwX+g35M0acWKhbFxe+wWgFVuCCfu5yzRSne+tTSWbgOBJTzhDyTQ3MT
         9i7w==
X-Forwarded-Encrypted: i=1; AJvYcCUgMj0SL0gYwwVbyoTOO1JAskoA2xbbnqlQEUlzCZNy6YSRHygQHwBl0iKPv6ekS90ilqO29yJCWFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIBxnJ1H4PbYhXPPSzls6gPt5RBoGu73pUVlqoWRPvK1efL4UD
	9at0/aEr13e6aSilimBKpkCycen6KeWdcHAOsAPBk4yotXBZmF+UTTwFPscvNyo=
X-Google-Smtp-Source: AGHT+IGOWUB561YpWd2tKA2ndsbQ0khheOBYIP3sTwBbZ59vgcrCXMue15aZloAAQ/GDwAeSAU8wdg==
X-Received: by 2002:a05:6512:2313:b0:539:edbe:ac86 with SMTP id 2adb3069b0e04-53a03f0739amr5883447e87.10.1729184237543;
        Thu, 17 Oct 2024 09:57:17 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:56:57 +0300
Subject: [PATCH 07/14] clk: qcom: clk-branch: Add support for SREG branch
 ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-7-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
In-Reply-To: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalpak Kawadkar <quic_kkawadka@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lk5Jzsxf7Q9DWyX31WiRZKJBTl6ko04MqIlsJap0u5w=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHbBZPdRgefZdHDDT5GfTwUsmLMj9DYGrvuj
 4JJYFnfOtaJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB2wAKCRAU23LtvoBl
 uJvLD/41ycyKcCJzBRuYDx7+AZNHXyvhVcbB6+X99Ny43LGteSj8H9z9c8SVkOL6ZziSmGXq7tW
 HmpipYEwHdwUH+2tKUro7XoEwfLDN/DzTVnBr5FQmWdwH/+FPMUwVHK1xsMXtjCDam0Vhmm2i76
 VJw7rCU2HfruUuxBKuUg24TpEPxHX0KelUtDxozr98odKOhHW454zNWlmMAgp26RMVoRh93+zHw
 snxEFxaE4xV4P2MVwwX9XZmThwxZgocUxxupDx3EV+Fey8+iH0sJcJxDHuw/xvR8DmWJDte8I2S
 Dw+po1Od9c06k5KxPSLkF+LSNc9//gtzzxOI9pd2nDwZncmvGkmQQ0hY9WAXyEf8WdQ5I9epUg5
 CORLDZ1A6pGS3F5DTw5+xG1e9w8O7bfY3h05cE2uzz97eL+73MmTLOYl9bWBavNlJKhYROZsc2z
 jKhEbtUpfK+Zg4CjIeVOUd+juoGq9vH377vCqN0GqgTWVwlqfE+NXmQ+5GcT9LeWta6hd8P5yHW
 46hV98zIOA5zcqfViQB94LPx4YOpwZ+Kn2K4b6tk88FrU8mKBGxVHwcqGgb9JQc0QOqGGJ6PC1+
 V6WZnsww6S15D1jJEboMq93JvWLEJL7HKsSqNeXa4/CW4sz6YiUFDAmOThaPyQ3WNzRgj5UI5S1
 luye7dxSMGDvhmw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>

Add support for SREG branch ops. This is for the clocks which require
additional register operations with the SREG register as a part of
enable / disable operations.

Signed-off-by: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-branch.c | 32 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-branch.h |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index c4c7bd565cc9a3926e24bb12ed6355ec6ddd19fb..9142a33b6b3ba72a7dd9ff80a64c17f2a1746e8c 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -170,6 +170,31 @@ static void clk_branch2_mem_disable(struct clk_hw *hw)
 	return clk_branch2_disable(hw);
 }
 
+static int clk_branch2_sreg_enable(struct clk_hw *hw)
+{
+	struct clk_branch *br = to_clk_branch(hw);
+	u32 val;
+	int ret;
+
+	ret = clk_enable_regmap(hw);
+	if (ret)
+		return -EINVAL;
+
+	return regmap_read_poll_timeout(br->clkr.regmap, br->sreg_enable_reg,
+					val, !(val & br->sreg_core_ack_bit), 1, 200);
+}
+
+static void clk_branch2_sreg_disable(struct clk_hw *hw)
+{
+	struct clk_branch *br = to_clk_branch(hw);
+	u32 val;
+
+	clk_disable_regmap(hw);
+
+	regmap_read_poll_timeout(br->clkr.regmap, br->sreg_enable_reg,
+				 val, val & br->sreg_periph_ack_bit, 1, 200);
+}
+
 const struct clk_ops clk_branch2_mem_ops = {
 	.enable = clk_branch2_mem_enable,
 	.disable = clk_branch2_mem_disable,
@@ -203,3 +228,10 @@ const struct clk_ops clk_branch2_prepare_ops = {
 	.is_prepared = clk_is_enabled_regmap,
 };
 EXPORT_SYMBOL_GPL(clk_branch2_prepare_ops);
+
+const struct clk_ops clk_branch2_sreg_ops = {
+	.enable = clk_branch2_sreg_enable,
+	.disable = clk_branch2_sreg_disable,
+	.is_enabled = clk_is_enabled_regmap,
+};
+EXPORT_SYMBOL(clk_branch2_sreg_ops);
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 47bf59a671c3c8516a57c283fce548a6e5f16619..149d04bae25d1a54999e0f938c4fce175a7c3e42 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -24,8 +24,11 @@
 struct clk_branch {
 	u32	hwcg_reg;
 	u32	halt_reg;
+	u32	sreg_enable_reg;
 	u8	hwcg_bit;
 	u8	halt_bit;
+	u32	sreg_core_ack_bit;
+	u32	sreg_periph_ack_bit;
 	u8	halt_check;
 #define BRANCH_VOTED			BIT(7) /* Delay on disable */
 #define BRANCH_HALT			0 /* pol: 1 = halt */
@@ -111,6 +114,7 @@ extern const struct clk_ops clk_branch_simple_ops;
 extern const struct clk_ops clk_branch2_aon_ops;
 extern const struct clk_ops clk_branch2_mem_ops;
 extern const struct clk_ops clk_branch2_prepare_ops;
+extern const struct clk_ops clk_branch2_sreg_ops;
 
 #define to_clk_branch(_hw) \
 	container_of(to_clk_regmap(_hw), struct clk_branch, clkr)

-- 
2.39.5

