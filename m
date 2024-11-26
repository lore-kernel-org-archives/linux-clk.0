Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA41E048E
	for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 23:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664679; cv=none; b=n9U1c149T6i0eDRfPnWq8GuefO6rJkimiCLy8SwMLuiFZ5KUgOq/5DDf5ALsol36Ov4JkdjN1LMPuZ516dzlE7nx580b3oWEoTAtpZTpdH/7xGmKvqmlttM1o/TS94zpbn2nsuZvEG3+SeHcyNf0/RFCiOIcHIx4wfRGs2lJIKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664679; c=relaxed/simple;
	bh=nVHGEOrRUdBNA5gRWj0sFzT9xtelcZ3Fgi3g7ZZhzww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ClQUew+AO1t+FoQHZyIGaK+a6vtdp35fRymx0jg8XnZWyWMGSMliJi7Iy+2yUZqGpnRYSvVw0dnjRKG0mHmFqm2CIoFB9azrVl04qXdLcxY5Tm28bROY5ZIkzhhzNCMeLgmCFCP9NyqvyvWUGXVaHIXjXXdOV15j1rZBM248kcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JxG539p/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxG539p/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so57035435e9.0
        for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 15:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732664676; x=1733269476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK080mMzdkSHpObUIjIterv6PuoIM1SQM8FNf9+Umao=;
        b=JxG539p/bnkKA/TwZTCcEQ7syyPsoN4yl43pdhfBegBFA+PKgVZhZdVR2Y2mPySnMN
         ENWByUqYgO9C0WRp8eJJKZ9TGUjQ7cxsNerfLjnsbI0ZZzOaT3yNT6AO57SGRIwuPEqV
         C3nfzjSQzWW6H0r/Zxq8RGwJ6iRW2kSeVBl1RG7Rr9oRxmam6LW7eZ/qd6neMQqHWkxp
         Tw7ehbmIhzQ9d6GbgStisa8NmDzARED90SfAeJv+jbzYP5ndHUggVD3RiaA7NhS+m8F/
         /mRkY195lWjO9SHEntCsA3vS7V+RJO9gqqLyNGNE1pnzq8RZIDQ72mpEeGwVB26F00g6
         wJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664676; x=1733269476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QK080mMzdkSHpObUIjIterv6PuoIM1SQM8FNf9+Umao=;
        b=puwBLDsbirdNUbkIsXiNdwe09v7EMV/uv6uZO25Bds/ximLoa31Y858gY0jhZWM+wY
         QpWSJAd5vj+KvoyH1vlEvJDDKI2sDSTXDOnZCYlF2RgOZTIQJOIJGd/Sf/EKc411At/G
         LMfuLDcO1rVEJc3r3LR7akC/Sm+llKQ5vNcRGBRo4QcQueLcfPglUgJc7LWy6Yg0TVep
         J1x/E0d6eod7DPNh7I6OT37J0qPLtnA9UdgJeCiXx1ddBWwGa+erabzwt81yc4KYIhGm
         26A6HsPKgCrtUNTm8Xlrqy50Mqd8Ep73lfGPKefbR+zSfF4fvn0k+VDe1q7Ul/upGycU
         qXbw==
X-Forwarded-Encrypted: i=1; AJvYcCVOfcCgCsA8Fz2Sxk6tcjcx1Bj5noCS/H/tpRCcRkLUxLFzv/IGtD7ifF0nFNGBcTAWKL4wRN6k8V4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ObqlNjTfrhb8KHu4H7JeXXMB+UStF96fNjFyi7KVc6CJ9nA4
	L7kHKF4Zd5hseg/PQutveJ16duc1UDr1iOT97yrXQrlJCuTKHdR90ABXj+Iht1M=
X-Gm-Gg: ASbGnctRyy4P+FZplYtEsdR1OaIt3wgMBKA+v3c7evYGGBOsiaQRCog8cTAuT3AO85W
	gJMFev4DPQRSZXHZrTVjv4dc1SFE6FTXjmJoHjTvcNlRs1xtle12c8HjDAR2P3A7ZV+9T7/dhfB
	YqSl9nwS+CMG3hcH9eBGDwPWiJsijqCbfYQt/HBrzBLXQM8rzKZhL30jYabzehceW9Wh2rLiFkJ
	LxaXXXmc1ixZiFedRz/pqOLfwhTWXjRlr3/cMZnrlpDDF2tHzK4xJPYQuw=
X-Google-Smtp-Source: AGHT+IGd+fjrVRUKvsVcA1pohdHvtSxuhDJA0UKE8GpD7PEO4QQLWsNHgyLqbxvvvkEfp+17KqBElA==
X-Received: by 2002:a05:600c:1d18:b0:434:9936:c823 with SMTP id 5b1f17b1804b1-434a9dc694fmr9606295e9.18.1732664676497;
        Tue, 26 Nov 2024 15:44:36 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe338sm14482899f8f.33.2024.11.26.15.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:44:35 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 26 Nov 2024 23:44:29 +0000
Subject: [PATCH v3 3/3] driver: clk: qcom: Support attaching subdomain list
 to multiple parents
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-3-836dad33521a@linaro.org>
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

When a clock-controller has multiple power-domains we need to attach parent
GDSCs in that clock-controller as subdomains of each of the power-domains.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c |  1 +
 drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h   |  1 +
 3 files changed, 37 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 7727295c57c8f6672d46d2380e1ff5ec2ac68d42..58a8397eefe51da237a4285d4e7cee967e19948f 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -338,6 +338,7 @@ int qcom_cc_really_probe(struct device *dev,
 		scd->dev = dev;
 		scd->scs = desc->gdscs;
 		scd->num = desc->num_gdscs;
+		scd->pd_list = cc->pd_list;
 		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
 			return ret;
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 4fc6f957d0b846cc90e50ef243f23a7a27e66899..cb4afa6d584899f3dafa380d5e01be6de9711737 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -506,6 +506,36 @@ static int gdsc_init(struct gdsc *sc)
 	return ret;
 }
 
+static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
+				   struct generic_pm_domain *subdomain)
+{
+	int i, ret;
+
+	for (i = 0; i < pd_list->num_pds; i++) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		ret = pm_genpd_add_subdomain(genpd, subdomain);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,
+				       struct generic_pm_domain *subdomain)
+{
+	int i;
+
+	for (i = 0; i < pd_list->num_pds; i++) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		pm_genpd_remove_subdomain(genpd, subdomain);
+	}
+}
+
 int gdsc_register(struct gdsc_desc *desc,
 		  struct reset_controller_dev *rcdev, struct regmap *regmap)
 {
@@ -558,6 +588,9 @@ int gdsc_register(struct gdsc_desc *desc,
 			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			ret = gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
+
 		if (ret)
 			return ret;
 	}
@@ -580,6 +613,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			gdsc_remove_subdomain_list(desc->pd_list, &scs[i]->pd);
 	}
 	of_genpd_del_provider(dev->of_node);
 }
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..dd843e86c05b2f30e6d9e978681580016333839d 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -80,6 +80,7 @@ struct gdsc_desc {
 	struct device *dev;
 	struct gdsc **scs;
 	size_t num;
+	struct dev_pm_domain_list *pd_list;
 };
 
 #ifdef CONFIG_QCOM_GDSC

-- 
2.45.2

