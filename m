Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BB1200129
	for <linux-clk@vger.kernel.org>; Wed, 27 Nov 2024 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732722843; cv=none; b=Qf62qgy+CBVp+Wfzx18Cl5zQ6JFlc4DdFDaN7q3uankB7QDa4Q+q4aGrvvtvXS1cvBgxgMY7B6Z3bja1c/jkAz3399FuF7c2sv4eA8gh+aa3KbSjFiw3NJ+1HSlzyyNLvlIQgcEQkTZHe165NMO5ufxxHVJtVQM2KbevsOOn2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732722843; c=relaxed/simple;
	bh=9DcDIgyiPEQQcegeEN1oWtNvqOat5t+dI1L4z5w/npc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9vXS95/dI+bQWkwtY4srOh/K4CV/1dPyXfRDJeNvyDQbGieyzux7lfDlSZ5JpKA8x6sUGZiXQyAq41eWnoSg3wzHLTYLvprFij/pnrHFTYzSU4Bygio0TAeBSQY+dVRIXn8U8td3v2mv0O3QFQIXpwkoavbEqM2TruWTo7loyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FoRdU7N4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FoRdU7N4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a14d6bf4so27387355e9.1
        for <linux-clk@vger.kernel.org>; Wed, 27 Nov 2024 07:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732722840; x=1733327640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CvPt8QMHcz942A3Oqz3/N9DPxj3tCNq+0xhS6ngyuw=;
        b=FoRdU7N4z/bLNPK3GWhdHpF9I8Qjhg4eE2sv7C1vvXSV44Z+qhWG+ODL5NanTIqJId
         K5CwNYkVDDWNDQPvMsHTR/WPK7pTDvC45CJpyz7N0D9H7FOFALQRF7tnJppyv6BYkgZR
         FHybeX5QOhZyVYI1aTE/8s0U7p0HR+p0jFAUelc3gXfxldExMJZt82DfAdvUPrKoT4aZ
         QwJvJmZxZMO6WRFwHI9j0SXMrvlhBkncVUH4fIKSaiuNsyxbrekra1rvRZ4CdafX47sF
         uSqpFIKPkHyPqnli7bDVhdhGp41CIEeKZdn3U7l9aTN5zV81Wr+BZyV19dzLw1xCmGjV
         Y1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732722840; x=1733327640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CvPt8QMHcz942A3Oqz3/N9DPxj3tCNq+0xhS6ngyuw=;
        b=S1+pLEYJ8OV/1ss8RPw3Hy2O2exxE6pdXAMBX5bJutXbQ4LWanwRKs6FDEuMH62e6D
         rRniWUHl1QAZf7Agk8U1JrSjwGIAOoysTdsZw64YgWm0HlPk6WTsj5kDRt9XVejFv3qr
         gE8qql1Sz+hHTmXPQRd8V/qpgs/ORN9RQeJDDS/otxyPAAk/Iba2Sq4xlrxzSqmWKeok
         6b4CKmMawlTu3B1NJ4bCuBCrABkHnLxUVez3x8SVeS9AtrcCsxAXJKcQ7jH15i6kTNMU
         chc3m1HRvFt93rivg5hzzNa/N1gcJ50V7dAXB0119SlU2B5KSemaDtF59jXeG1G9DpgG
         TBfw==
X-Forwarded-Encrypted: i=1; AJvYcCUqJnO01ukGHC6uG9V0eKCt3W/I7f/2rY8iv7GrJCehXo6IQ0iG0dqXfyqGGeIaMZCI1jqmeKhHXQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwICCmflK+cUwpvx/lavANzMhx8HuioBzSycArIYenj8EelHjPf
	5GSVYHsgzHTcKDK88njUfHNl2gDKfbgpWgps741DnlFRBu1BGwRisjP69gnVEzA=
X-Gm-Gg: ASbGncsJan/2sW+oW4k8nAAnEgfw7wDPSWMRtoRtYlihXAHRENQMEaurRU5Gc56NT9k
	uhVYfLM9HsoWFxV2gfQ4Guty7ztlHdEnwoOh8hBgX5UIJclOuGMsj0hUamymBIXs6eiZBExU2lv
	j9RufAFl/slqd68lwfidfEJwIhKT+9QAzPL9tFVcJXY5mtkLMHsJX8+xXPRE+5lcEm6U0mmhI7j
	B7vACCPmLcUKvAGFDXkRXY6j8y9SJQV5eVf6+iVSUXbTZfjRBhMxcqsJEE=
X-Google-Smtp-Source: AGHT+IHGDQZYsAgi8Ipqt/f4XhqJRd2WRzf+LxuX9QIopr2zx3rLNuUzg/Jh4dFa9IVL5CZPYN2lfw==
X-Received: by 2002:a05:600c:444f:b0:434:a5bc:7103 with SMTP id 5b1f17b1804b1-434a9dce666mr31055245e9.19.1732722840401;
        Wed, 27 Nov 2024 07:54:00 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d1a90sm24795235e9.32.2024.11.27.07.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 07:54:00 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 27 Nov 2024 15:53:55 +0000
Subject: [PATCH v4 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-2-4348d40cb635@linaro.org>
References: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
In-Reply-To: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
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

