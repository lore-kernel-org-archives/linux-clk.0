Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0D218EB0
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735565437; cv=none; b=SsaTuDAAvKff+tYysgDisnZrpQDi9AjrYiz2oTiMoM+3VAfZfqJ87qLk/ZD6mTroqDUdTDAuQL8DfovP6iz8NvKxNWhPKHoA3R7UN8ZDqMYdR2bQVT20i+bVjMzGVUr4hXdGA/wn1qicoYMvTFCDAcn+/kV09JcggSRsCbczOuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735565437; c=relaxed/simple;
	bh=BCcVhjXqM/11poMT/N4HvI5IzpguMzkE/XgunRZ0xcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdcmuYlfI2iMDlli5S8QVHCWPnFEkZrAOUWNsCHZShlyaEoD9/gXjhYMYvdzyrO1bsfNjHxyaJTUToTPIIPYzK2TczElm7XctHYwgH1YXrz6ZAA9jzeWgpWTcEEKxOIez1rzNvUgywEMcNWCg0snUnUMpzjARf4dQs2PlwIk9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htZgMWK5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htZgMWK5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43624b2d453so96235645e9.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 05:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735565434; x=1736170234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=htZgMWK5gUHVGEef04/Tj62ee9ttGemK6/p3/yP1a5aqUUD5OxF9uuxttwMxseQ1K4
         Dwk1GLErE24L4RPXnxe1/9sqWw9TxOeHHC41qIOf5mQwQPCuyDrxkfLWzp0aOmFgVBmA
         coQ3dse1y8DqdKn9b/UiArIQK+DUtIsy4dYykcRmElxhsNQeU1ug0PeqNvtF2F5KZ2yw
         A8cGbQrVUhAMU9fRTYxDq94PqeIgcwqK0VUFx9HrQQ5gCO0Nm00OgaEVRVYVcOPf2jHF
         BjxIaC3zc2Tff/KAtD4unETRYzs5WzUoGWQYxRJyprINadNgjf8sCmDmSXVw5aji8O9x
         gqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735565434; x=1736170234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=NKPzUMsfZ49q8xw2+sajcfHlSxwHlkCeJGk5QSkFc8hwjRruA+P1aXBDOI/DoIRnIF
         peWNhLJ8JJPoV/ZPBD9qIKtRGBzUqpGSBfbAAaFvQ0QDkOOwkZN3U96T9UYgtCy+q8Nh
         mfed+XoK1whZjPP7FgQ5JT3Rch7m2fwE48hMJqSIjpPvBXZrOFYDVXmn9lIKBvKUGBPB
         rlaDE/JU7RkkRWRpyjl4OFvPJVcy0B3r7p0GX7A4z6djWN0R3gB4PyAcPXpkFgjvBfUt
         B1SeCNJvpNmYIX6GczPJ3WhniBp5R3SShPcrmttWXq6pEKmXxNMtMPrL8m0vvPyGzhTy
         3p8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7jAPmVDtAMzUVHM2hjbkvIB0o4seCuYXNt5zIx/0bUvwevIS9q0rIqxzh5n0WqdCJhol3Db3mWIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfcaPsKjKqbuXVFi1uz2nQTerEtv3Hv914PceO8sDKaBSfHmKM
	HK83XUCSaSsMYXEToWiRoJzVDGOLQrh5e5rn06pXS60i1u/Zz18tN/oVu8n6Kdw=
X-Gm-Gg: ASbGncvWDz81Aytwo5C8gOT4/7j9jvDI8H/+V4WT3juZLCsXC166GE1lRrTGpOnNquZ
	hgANxiVcPn+hyOZBJEOlj3IvJM8vLkWJTvsX3xhWdy0eryVY/f+pNk/5uxiKuONuAHEHvn7dtox
	NpaB3bfwF5m3hzjI+x/op2fS5bVk3GuOe/B83vz7J5D72iPJ7qPW+Erp7H4Ck+Q2Hc7AFvFpZ87
	9Gj7H/BhvzrboYZOAEOXZpFaPREJzHZe7Tb/AuWnPhDCBrjgsPvMHGJjGwffAtXOA==
X-Google-Smtp-Source: AGHT+IFgdTgzzdlfAxH5jUsIbbaTEC0aRjVWyDVXKTAU9Yg1613Ll11GJA25Ci0KmwfQueuGgmBVPA==
X-Received: by 2002:a05:6000:18a9:b0:386:3835:9fff with SMTP id ffacd0b85a97d-38a22406d43mr32551764f8f.59.1735565433967;
        Mon, 30 Dec 2024 05:30:33 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828d39sm31079082f8f.9.2024.12.30.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:30:33 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 30 Dec 2024 13:30:20 +0000
Subject: [PATCH v9 3/4] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-3-f15fb405efa5@linaro.org>
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
In-Reply-To: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Right now we support one power-domain per clock controller.
These single power-domains are switched on by the driver platform logic.

However when we have multiple power-domains attached to a clock-controller
that list of power-domains must be handled outside of driver platform
logic.

Use devm_pm_domain_attach_list() to automatically hook the list of given
power-domains in the dtsi for the clock-controller driver.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..b79e6a73b53a4113ca324d102d7be5504a9fe85e 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -299,6 +300,10 @@ int qcom_cc_really_probe(struct device *dev,
 	if (!cc)
 		return -ENOMEM;
 
+	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.45.2

