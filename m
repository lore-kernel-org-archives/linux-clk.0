Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9387A1F949
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 00:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733876874; cv=none; b=S5lQzSbUTqXOLYvBQHSO6/7DwhvjTwBQ5LZyyz8ziLz/0UiE2JORZQQtVCjG5Z6QDopA+/Du5APkEAzUmTuVIlwHAvlT2/EnDHuVikVM5wYF1aBZoU6rJZ3LpMpfmSvYvLN5miqjCTM1Kn172nw6PwOS0sn3XlZDAhtVlRZUPZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733876874; c=relaxed/simple;
	bh=/f9lA72X/ORQ7pcy2S3XGqJGhHnwd9S3RJbZG1bW+c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7tUVSQIbuIpx+8GKnT6uQx/PVE0RjzYTGAOdsyOgpvqFVKP5iBwmsP+EbscF0ri2lZGKv0iZxw1blQOcMTjB/B2wD7T4PgaAg69jEwKffl9BIgBU8oU0WDhhaGQ1TR0yqtE8NCkRQmBPxal4kVAhuJRQnaa7+l4Rir+Lh3jYTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IRG6qk+i; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IRG6qk+i"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so5170659a12.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 16:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733876870; x=1734481670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkkZ+w95DsCr21/2mV7KTwZ4aDH2tLnISRljFlMlIBg=;
        b=IRG6qk+iZgpbkaUtrOOnfDLoiqteLvyhg0jcHeD08es2uEClJ3jhTyzf4RubrsMVgn
         x5v5nsQswB8CKVNaSwDG1i3Xhhk/zb96hQietTNsWATA7OXMQyUDS7RciLc+elHYb1gp
         MQRfEZI41xXSBUQ1+qRTwkDBwKglFiqj0RNeUI23OhIE8NlcQ+lF4+Mwn+ff9Fpw2MlN
         g0+3AB6HVQrPnymtTCVIr2rPU01r6gVyQk9Cjvp6m/uTBZs3z+g8Rok3TmXRoMzWAWoP
         JI+TK066gQkE5AHqGb9BAoBYgb6Pskob5G65GZnE38zy2jHJDmlA7msNB2wmniLopIn/
         vroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733876870; x=1734481670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkkZ+w95DsCr21/2mV7KTwZ4aDH2tLnISRljFlMlIBg=;
        b=l/FGkUxqvkty5+JPxP+iUQQRQjKfH4MoGJqwVFbTLXCF3dh+3DB1F0lNTTJpEfsr5g
         Tknz85GClD2v3RNLab+HIsIz8PGusDRpEZ2K2AxLBN1nomVmaFp5SUJs8L5bKmG8fcG1
         MCzBk2AxiHS+mWJpI98Cv6d2cOjaQFDC5EY7t+EiPBoWEvxyzeK04lXZRU3bLKsSitRe
         Pk+I21pTi5W+yqz+0k3BY30zai2Y8i6+Ym8QuZvulxQ1b5Yg9vPY6JUkIGUciuAB/aBk
         KSBrMwReGeZMFGWZXEzOPlQvatACgc9DztA2SzLBWw9G67kCNqbEgwfLuty0fypm3auc
         AU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEvCvYPW+nMSmQv4g5pwSihv728yjJAxpkwZBDlfsvcLRPEl2qD9WAukZcn2N0JQjtRJW7yBpKEs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7u59ad8GCutM0jyTkBs7avi0jNJZXtSIES/iQWaUOGQJdATDY
	KppvJrX3NUnnDr1vBVm33sr/aiN/tt0xfcIlgVC18ld3ZtDtumc4QQYFSIo/ME4=
X-Gm-Gg: ASbGncsCFfR8g4bGm8tCM0uI1pYFTDGfUVNFeVrbU0NEU+KPUyBSxKAW8ayi3r3436f
	t1fN4NzgsIN7HnoXNoBaby6owF2vUrwZxt+wYa2y/5C2pSCR9DUIQ5JfESUMNKZAl5hlSlKXmHq
	d72MiURUb319IjxCYVs7dFUUCFGfpeW9TpL5a6+QhASFkRtvZ5nMuUU1uGl+tfabOPoD62qN2Mm
	sDw5Mum1WGyc9UahUbwhcJV7tKzeuWS3sg1q9aqaajQML0l8R7oDnZNXgzfS/U=
X-Google-Smtp-Source: AGHT+IH0weeSvXJZ9/fmaqGQogcxSdDJXMNlLMLnXqel/oLpKq3X+9N8DWE1od1gJ7+OXEZh1t63Ag==
X-Received: by 2002:a05:6402:4011:b0:5d3:d7ae:a893 with SMTP id 4fb4d7f45d1cf-5d43315d980mr760873a12.25.1733876870026;
        Tue, 10 Dec 2024 16:27:50 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa97asm8155530a12.73.2024.12.10.16.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 16:27:49 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Dec 2024 00:27:42 +0000
Subject: [PATCH v7 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-2-7e302fd09488@linaro.org>
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Right now we support one power-domain per clock controller.
These single power-domains are switched on by the driver platform logic.

However when we have multiple power-domains attached to a clock-controller
that list of power-domains must be handled outside of driver platform
logic.

Use devm_pm_domain_attach_list() to automatically hook the list of given
power-domains in the dtsi for the clock-controller driver.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..e6a024e95ab5f4b0776ffc6c7b3bebfbebb007fd 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -294,11 +295,19 @@ int qcom_cc_really_probe(struct device *dev,
 	struct clk_regmap **rclks = desc->clks;
 	size_t num_clk_hws = desc->num_clk_hws;
 	struct clk_hw **clk_hws = desc->clk_hws;
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_names = 0,
+		.num_pd_names = 0,
+	};
 
 	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
 	if (!cc)
 		return -ENOMEM;
 
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.45.2

