Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AC1F5FD
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731896681; cv=none; b=JVnngeVOGWi865HvHH9hPi5t3wMcYTYrbmbaGtZrcAERV74tTwJHObIUhk4pUQHKCLOL0sv+s/Mvtnrh8XBsfgkuLrnVvz19KUNt5EuUKIekjyfK+eRw36nTZFT6CNdjnQfwpHDOElGfIDB4RpjiewDMRfKxU9HcBinKZOZ99yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731896681; c=relaxed/simple;
	bh=shX2kfmh21qvlv6tMATByELEIKpfpJiUwHfYedYY7LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PsW1oDoPf/erkaky1f/Nv1Jv0rec9q+mDWXWg7o+ReQ5FW74ApPB6ld5sUKnTAISryLNYwwvgRWiwBfn9SJgtLK3Ed6aOkmQ7Wl2oUcrpad6UXPKcfTUG8IUJn+qGCO7i5ethf9Mgke/9OqW5Hf0NgyJ9Qg1pLwcpPWrbpiZINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Info+vqM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Info+vqM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43193678216so33817215e9.0
        for <linux-clk@vger.kernel.org>; Sun, 17 Nov 2024 18:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731896677; x=1732501477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uAgwDoSqBQNwda9c8A09U/nNCzQI5DjCJkCg9WC4y8=;
        b=Info+vqMq4ZdcTOE4MoIeGdCM13THyF2Evc+8RmhTw8FuUnkAHlnf4qOUNlVVjrXXa
         tI21P91yn0DVaZvQusUfZMg7O2VYUrLeaIA/U8aevaNUV7iIjqTt39HFwstpGjnzVZuG
         o0NGzUqNIOb2GX0TvI03WvPj4sI11nS+PxgE5x5QcREc8KcoOh+1hYszE+8MA2vIuZNU
         M3M/dryimRiYB8lSGjY3Qhz4GPoFNKnzZlmtfDlI/X9FsN6zJj69ACcMkUwh+mAi/+np
         K8DPDl/t1dimvkQR54+uxPo1K7RmBHsvxGY/zCG6quPOYhHpmcALBam6S0xPJe06pUM+
         cBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731896677; x=1732501477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uAgwDoSqBQNwda9c8A09U/nNCzQI5DjCJkCg9WC4y8=;
        b=ku/Fm8tOvTcsjGlTCeFyUWvx3MPHVMnh5MEkhSm0wJ8nPc3x+nO3dfOCk36hEkX+13
         wv1NHRtZf0JR8+5kLTYD2Su8eaeUyT0CXtFKqHcQ58XBoyBcFrSPxEFunJUNQ8u/DzZf
         dlvcAEWcTP5krA5wtfIo1em02eu5ahLbXVaVWGjmAooSsFQkuVdfc1zSSMLbQ2bAzlT9
         xCYRnm0odIbJbAkzZsbzEBUqFCLAPjKnTIEJndexmGBx7Z+xX4ufDT5RUqoPvI5yv6pC
         zTudRh1PHkhcDxOG9XSIVF/K6sKBVSMrF0ZkN0JzurEPzDRESV9zx0NTGJf2riDqGnSU
         9uCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJcmaL4K4hlbdOMB3DPNVR+nKu8aVMfQLNJL0iNdzV9f6HQeGuwx6QmDuPu0ot0DyChn59VmSD4gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUVDisuSHZfuUstjGN9geJYMd3Vtq+RqlvkBnuz4VjIByUfpP
	HR0ogrKaoQbHxY40bwJcz7MR3aNN/rAjj/BLNqU7PJCRcPaT96XMrWS1ya3IIQM=
X-Google-Smtp-Source: AGHT+IFWe31hEGUtGQdW0wnikA7Pm+kGTH+e7FHWreYjGM669kTCqSCSwoXnjqCTIwK31qMF2tpcuw==
X-Received: by 2002:a5d:64c8:0:b0:382:2ba9:9d65 with SMTP id ffacd0b85a97d-3822ba9a39cmr6495066f8f.31.1731896677072;
        Sun, 17 Nov 2024 18:24:37 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2e35sm11387902f8f.5.2024.11.17.18.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 18:24:36 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 18 Nov 2024 02:24:32 +0000
Subject: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Right now we have a plethora of singleton power-domains which power clock
controllers. These singletons are switched on by core logic when we probe
the clocks.

However when multiple power-domains are attached to a clock controller that
list of power-domains needs to be managed outside of core logic.

Use dev_pm_domain_attach_list() to automatically hook the list of given
power-domains in the dtsi for the clock being registered in
qcom_cc_really_probe().

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..b4377fa09f7c0ec8d3c63dfc97d04fbb8cd6e10b 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -283,6 +284,25 @@ static int qcom_cc_icc_register(struct device *dev,
 						     desc->num_icc_hws, icd);
 }
 
+static int qcom_cc_pds_attach(struct device *dev, struct qcom_cc *cc)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_names = 0,
+		.num_pd_names = 0,
+	};
+	int ret;
+
+	/* Only one power-domain platform framework will hook it up */
+	if (dev->pm_domain)
+		return 0;
+
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -299,6 +319,10 @@ int qcom_cc_really_probe(struct device *dev,
 	if (!cc)
 		return -ENOMEM;
 
+	ret = qcom_cc_pds_attach(dev, cc);
+	if (ret)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.45.2

