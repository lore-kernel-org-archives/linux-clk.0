Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BEE1E8842
	for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506659; cv=none; b=Ibn7Su0fh7d3rO+Dga8CIUBFRei5QI1G4vji+QtEbvgqsqlgUVlMiGXVY7jfZnl60W1gdYRnpPOEm1KWHzuYrkZESlKRFHJ7PnKVYl4p0/7CJS4NRAtAdy7j7+/9PBLz+62rSBawSMGms3+aKiy1G/lc293ueb9kfklhE9Hky9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506659; c=relaxed/simple;
	bh=DWgkCUleQv61cF52XKRC6NW3EAFyFKJ2O9J1+CznBwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqyVnWjFlOYDGWnyjiQTKFYMD7Wz3M43upQjg+B+k7LINTzbLgTxg+VxCTlJTFLpAVYHEGa5zYM0KhZm6scGHqoPPbGm8TPta2Y7aHyju2cUBAFwm50XVm/K3QbiMeHE8pi9eYtiD+tWmkrl4zOuedmvq2qS/TXcdEKJ4pxNjGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bwOCtnw1; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bwOCtnw1"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso62561181fa.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 03:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729506655; x=1730111455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWbqeFeatJwTSwfIbMsvs+JYctmC6KE3I7fU3fJLjdw=;
        b=bwOCtnw1HJhLX/pNtHGb1vlT7npnbaaRMvg8MoxUjMNMg6BUJLA/t35bQooOUq21iX
         xOCfYiQ4lSm6/U5hJ4BBzKhN1bTYqvNmr7/93RfXk7As5wy7rQM1uHaBgzjIH4Ar9SbL
         dlvueIXfGz0u2VAGT6jc6LZIQ+5Yds9SHgmJSHdNzIU4CULFWQHz5YKPGui7nHn2yCPK
         mrmsuFmwPveQT38OmWDK61M8qMKIUdxisPThCF1x8J16FtxxJJCz8vTQgmXeZ9AB4+Rn
         TJsSGszovo1sz7o+4Un8oZA4IjjOFOiUxeYicT1yiwQztir2gHt/JPxIdx69p3kC8arA
         RurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506655; x=1730111455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWbqeFeatJwTSwfIbMsvs+JYctmC6KE3I7fU3fJLjdw=;
        b=YZ24ll0svIXpx0SUkkEdSZ+eyDplkPvYnv+FPCksRt0XqBMaSkhsYZuetRRCGg5PXC
         wa7+MKkGs90+zUYOBk6IaaoA7D1LtdZVvPbhLfRfs6WgJsSLF7ZeCaM8BgMPUSckmI3m
         PFwgvScdjp0s+v3JzznvT3CiFgMAgIOyiGrCphnGoyETEw40CyIsnH99K207IF/H+Bz1
         nGWLv3BPbdFxwBeSsGmLldU3gbT2OFmm46wRFJkk0lb3ILNjEUEj3gEKl5o7cF2sEU4b
         x8z+UW9nAN/NXIQOlvxx2W19L1HbSw0l7Hjw2R//aw0axdRcMUTdjzW0MlBR38Ox1EkD
         bCAw==
X-Forwarded-Encrypted: i=1; AJvYcCVjm1hcfG/HFCUKqitUL3vr2AnsFiR0ahQgTZSuMruXHkZaT9EBBVf13RuRt2MPC51hm8zdjVM1zkE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/37Z/fJoSZ14ea9/S6LnPI/hgtyFKlzRU/NWR2cl76KA5kbV
	Z15puzhDoCb2mrYg6rwoQMz+EfSqiwwXOew94i2ZONkYLGbgv7BsYNXF5E7++zU=
X-Google-Smtp-Source: AGHT+IEGVYV0CpGXX3NDt4/VAtk8qqXvItVMr2DCv1PebDcuKb6dxvFu/JDxXiHjHkTrvs0EBi9Z2Q==
X-Received: by 2002:a2e:f1a:0:b0:2fb:3960:9671 with SMTP id 38308e7fff4ca-2fb82ea2802mr59499631fa.15.1729506655002;
        Mon, 21 Oct 2024 03:30:55 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae1217bsm4522711fa.112.2024.10.21.03.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:30:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 13:30:34 +0300
Subject: [PATCH v2 06/11] clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-sar2130p-clocks-v2-6-383e5eb123a2@linaro.org>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
In-Reply-To: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DWgkCUleQv61cF52XKRC6NW3EAFyFKJ2O9J1+CznBwg=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnFi1MQ2Ipd+tTV9WDyl9EtJM2+i1I22xIpjYrU
 KlZXCxuxcWJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxYtTAAKCRAU23LtvoBl
 uPXlEACa+0RhJT0HNTAxSjY3RM0BSTLqmhbWmmkugaWFt212lagXY0jQX3Zg5uxUJM9KBhVCHsR
 APcIaftyxAin3X7MK0fNAVqyDsPPfnHFgTQQPV/qFgBiftAt3AphqUvhg+UWrkP86GLICTifb22
 TyGhRSI55ImdO8gZqjSQklxIjqBOlFKG7uGJMaQcA79RQ9FPnIUBBhOyfbuoZQIi7DZzvslvt03
 0FdssfQy/uNSAPG3wnqpCzOxHNQtLIpcMLVbcHxdgenUE6tqTO22Y7TUx229obtz2HxeOYv+ApT
 wj+zkxKqW4umgmHT12TQR/FfAesymX1wq1+5BdmTjGPc03SiR4jdf7KW1zRfPrEZFCneqrb6eHK
 zq6e+DxWbAK0cwCZu/0sgXWosJclqb4PzjtODPFJ2IV2rCdMFbpe8I4+V0npbmPvRcj+J438cCS
 kc/+GgkzKwuZr+xAvjYYXzjYd5sAIfch3T0fSXa3etWKnCtxltLLxvqO5jxHNOgDll4EGFJLRA2
 infgMFKLIQtiWAUtrMAj+AO6XW1wU9qHLdIT2qoYTu6xCUdvwtCHin0MTCqeqiTAzlC0P6Yzikk
 5V/Yq5u17TzCV1POe0x0pkfRZYzWQB4V2ScFJ62VuDXQoRN+U9PcrGXO8DZFl03+RLSK7ZXfiUO
 ntGEHPIO0q7KXIQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Generally SDCC clocks use clk_rcg2_floor_ops, however on SAR2130P
platform it's recommended to use rcg2_shared_ops for all Root Clock
Generators to park them instead of disabling. Implement a mix of those,
clk_rcg2_shared_floor_ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 48 ++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 8e0f3372dc7a8373d405ef38e3d5c747a6d51383..80f1f4fcd52a68d8da15e3e1405703b6ddc23421 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_shared_floor_ops;
 extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
 extern const struct clk_ops clk_dp_ops;
 
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bf26c5448f006724b447bb0d9b11889d316cb6d0..bf6406f5279a4c75c0a42534c15e9884e4965c00 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1186,15 +1186,23 @@ clk_rcg2_shared_force_enable_clear(struct clk_hw *hw, const struct freq_tbl *f)
 	return clk_rcg2_clear_force_enable(hw);
 }
 
-static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long parent_rate)
+static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate,
+				      enum freq_policy policy)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(rcg->freq_tbl, rate);
-	if (!f)
+	switch (policy) {
+	case FLOOR:
+		f = qcom_find_freq_floor(rcg->freq_tbl, rate);
+		break;
+	case CEIL:
+		f = qcom_find_freq(rcg->freq_tbl, rate);
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	/*
 	 * In case clock is disabled, update the M, N and D registers, cache
@@ -1207,10 +1215,28 @@ static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
 	return clk_rcg2_shared_force_enable_clear(hw, f);
 }
 
+static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
 static int clk_rcg2_shared_set_rate_and_parent(struct clk_hw *hw,
 		unsigned long rate, unsigned long parent_rate, u8 index)
 {
-	return clk_rcg2_shared_set_rate(hw, rate, parent_rate);
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
+static int clk_rcg2_shared_set_floor_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
+}
+
+static int clk_rcg2_shared_set_floor_rate_and_parent(struct clk_hw *hw,
+		unsigned long rate, unsigned long parent_rate, u8 index)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
 }
 
 static int clk_rcg2_shared_enable(struct clk_hw *hw)
@@ -1348,6 +1374,18 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+const struct clk_ops clk_rcg2_shared_floor_ops = {
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_floor_rate,
+	.set_rate = clk_rcg2_shared_set_floor_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_floor_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_floor_ops);
+
 static int clk_rcg2_shared_no_init_park(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);

-- 
2.39.5

