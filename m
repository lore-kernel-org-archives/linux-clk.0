Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C601DFE35
	for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 23:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664677; cv=none; b=TkTbPMl1NYsCrVrOVsg9MZVZX40Wl99dkMRFwYp+qswr+w4YlxpU04vqrnwosE4bKBgss2+URSdU67peTpjAOJ+Ucza1V6TWX0Dg0M7dnRbZHNyJqZX/9ZWkVPI+Oo/522+QLwwGqVy3NvbLRSBUgjX4dJmeD/z3kH8Rg3TmbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664677; c=relaxed/simple;
	bh=9DcDIgyiPEQQcegeEN1oWtNvqOat5t+dI1L4z5w/npc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXcH1ZRzh+j5M/lB7YDuK64DHXjks9lDfHmY3tCWZyqxffM1AbLHd/vBd22amWqZ6KXabdKdcTn+OukNoYGJ45tdsJkAM6Wd/CVqXHrd7l0EZSutVEVcBcFWITRtgLJkOPdsXlIkZLcJ+9MLzTv1a/o/KAQuvJ/fUsejlBSzXV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f6AKDNje; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f6AKDNje"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-382442b7d9aso4704287f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 15:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732664674; x=1733269474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CvPt8QMHcz942A3Oqz3/N9DPxj3tCNq+0xhS6ngyuw=;
        b=f6AKDNjeC/ddGcJ/pTrP7RqmpxnNaWdSofMYY3TPXNbF6hvkg2of2rKa+C/GSW6vjv
         1RpNC3zm24hAhgBtMYpuS5yw1/4wgsw8q6cLrEdBu6mfyWb+Dw60om71rEIDXWRX3tKl
         YTOc0PLpO/QnFAe0jXk5kEjZqzd3RZXEWS+vb4egTeOurBFnMD+FNO0XRr06vFHH73Y/
         2Q+a2bBF+EEVOP0Oh+hHKUx6HxDwWA8mCcGoUCyhbAPfIYBjWmjr6kFViBQmCEXoFoO0
         qMMMoJf+hYMoA0cS9BaV6mYied2HpNCRbEm2e6FQwYoFytnngRksEp2aPwoX/VSnGkeO
         lGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664674; x=1733269474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CvPt8QMHcz942A3Oqz3/N9DPxj3tCNq+0xhS6ngyuw=;
        b=aX5PwsdZh3Xy9uV4QuTEIL2ZK8UCPYtjx7vczfQ1yowQtILbq7JIVgb3Ai9zx9TM+U
         0Av6aOcNDwKdImE6aFZitqT+41uFNYcTpAjUj3nhNIVApYJznkxJMhxPoDP/xPgpfHw1
         lXj/6u2th1XujzgIvRGJGuVLLtVYSQZSnxH4W/Q7zjpM4xmuwqGduXCUOtWJFFVP34ry
         hbGrtpEz+Wu7uc+7hjGxiwdCHYTDmCbnF1uJGqQubKLoqYLHXt4Cszgyx6ZvShy8hyLZ
         MowOuneQUJ9ZFIN4GZuO5qjbYCgHMGmo6Zs/yArqUGNRW1xBu1jxPysQDejIuvFYzxj8
         CRRA==
X-Forwarded-Encrypted: i=1; AJvYcCUVME7RQPxd5CkFpSI4sPqDA4EaCMQRvmTSQ0IFQ/KwBu4MIoApfQxivZ+/dP2meLNWJzF+5tsBtn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc603n5nBq7XSJGUKnPwSO8VZ1DC2qCt406nBM2KrRIERNS8GW
	VVZCD4O2sczOIBMnCC9URbNDl0ftU3y9fUMcYwmPgzIVDBlFMKfCIvo0zZqPHHw=
X-Gm-Gg: ASbGncv+YT6ykF7WehhCja8ktvIIV9H8tLhClx7KM4+c9NKuFqVe2WdUIWATgxkmZJ5
	q0Fdl6vYWSHeDY+rMHgpOSWu8ql6fQ9f9sbg8fAzrhG3/OhNFqF3t03tf1anROuPRZqnvNQ/HGX
	XClOQqgoY9zFWfuqAgJ12B0Mz80q408y/UScQ3NYypDU5J18ePs8Vcei1zy+2arMPinbM4VSyyQ
	KIJLv8+bdys9ei6ImBMsqfR32bYv9CtYWD4139J7sTHzkJnkSx7Os4Z6nU=
X-Google-Smtp-Source: AGHT+IE+Oglm7E2t7Ut5iZpBl+SAvEqAXWb/9nqHNfrjK8E3TwWYDWN8olld0Ah29+gOrPXAKM3mBQ==
X-Received: by 2002:a5d:5888:0:b0:382:4378:4652 with SMTP id ffacd0b85a97d-385c6edd47bmr520166f8f.45.1732664674376;
        Tue, 26 Nov 2024 15:44:34 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe338sm14482899f8f.33.2024.11.26.15.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:44:34 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 26 Nov 2024 23:44:28 +0000
Subject: [PATCH v3 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-2-836dad33521a@linaro.org>
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
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
 drivers/clk/qcom/common.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..7727295c57c8f6672d46d2380e1ff5ec2ac68d42 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -283,6 +284,21 @@ static int qcom_cc_icc_register(struct device *dev,
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
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
+	return 0;
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -299,6 +315,10 @@ int qcom_cc_really_probe(struct device *dev,
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

