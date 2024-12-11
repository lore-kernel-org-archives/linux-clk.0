Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF971DE2DF
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936079; cv=none; b=Pse0q34pHsXOePw44Lz/ZyGDrjEgBrb0qnsaB5jpyCnedFLHlnARrwRKAbCA3nUKx6RumOVYKqmhxCC89blN5dz+WoPOzO+00srwvuhM99LrshrJn4ZP1yoOxUoLG2Bv3ZP39aIv6ef+T1aU6d4u4mDzJ7EGNO1yTPo2kquKU5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936079; c=relaxed/simple;
	bh=BCcVhjXqM/11poMT/N4HvI5IzpguMzkE/XgunRZ0xcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcwNDStXWanY8Smzj1VGcp/9ESYngJsNGwqUoBkbeul7wdcVlXdzOSh5Y0p99E8KpzSgz5JL1jnAxr88NH7e/6Z32ILMrO3Rn4nLj8Rd3I+gZaSuMjmJDQDlEbiovt1hlMkjx4QPZEoLBYzXWlx4INTEiA4CYgjLJxITrg5B1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZiyioXtN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZiyioXtN"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa67ac42819so655467166b.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 08:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733936076; x=1734540876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=ZiyioXtNISlbz54XwcZMzsOFdv54pbxF++l9vpZehqEE9OAQFjikPh7wyTsRTkuvjq
         jgXxTEcrRW834+4qF9oNiQzdw65WvQG4zJ11KKQCHcUB577rmbd5EqmHS6Umtt7irSzZ
         5u3H69oB1ARbPhSUPX5f0f7jIyfWWiqTT/m8KWTkNWAAMRBfTQixzk+VCiRe7Z42UvkN
         mLx1flUYmdaBwlgo1SzJ0NACbVgfgeYYegIn7ZqaOuE1gz9MkNnjtpJhl4IAs/ihTCRy
         DFFo2cciOA7XmN3Ls9Y65TKI1n/eqEwBDOxKq7qqCdb2Pt1CuWYUXKKYlrIhPi/NspTj
         Mn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733936076; x=1734540876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=CLlYuPT0EPLyJIbcg7IKxVjCqkhz7aPx5Xu8949BiJy2uZz3dak/Iv2GUzmrZ8ZTK9
         rXvozcXYbkc4/48fP6ts48hmJ/I/BWr6KAbyWjNETMGA9cqtFpJSfW/+FQpKmnoWy0J1
         6G9U2PqiJsXOHmWAJrdbwXpas5d7YUm8iF7XNzc+PzlMb+UytjbtyTDoLhYvKQdNDLyP
         giyrIF0R2w2DcFX1rTJmOqA0KqqnJTyvtliMP8tLUEl97JaY8giQe0dHWy48nJ4RfbHn
         B/YyuyJp7E4hOCwX6TH0Ly8iho+qBMTDAlenqGRJCwj5Q9URo/oYNFzT90ZjgEbtgJu2
         nBVw==
X-Forwarded-Encrypted: i=1; AJvYcCUQohMXpb6//ojTMQqF3BALytoryhCZCkEiygJPpnRaSoVapeID8biPmELDNDdwADt9aFIawFhBPck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYRSs2xSMGjRjT6IQtXr3V8Pe7UhSHYW2LCxB1rj2gepsFq0yl
	ugfk5WOhCnWAN4L9sk28cOrMRB0h1Cd117huX7uuyD8W00SGYcz6zsgq7f5MEFI=
X-Gm-Gg: ASbGnctGR5zNlqNjLf0y/Sr/QYdQR7d3OLj0TqSlxWeGbDpxaO7xJHyM9dEgLphLv3y
	DHluIfGMe7y1A7AxhB7geepRolRWqz9H+8g6BBcD1TPOvNroD4ouvKi9MghqZLqtgAcw+v7dO6u
	C0A8xw87y/5/aWowKgCGCuKK6dePAU3NdUCY7oKrpV2gD6/Hl2GjimIGeB0DQVSoHbxKswUjWfk
	TppHDlKfWu4I119RyI1HEtdBGO5JZBlMU+YPMMkIDnUU4oDVJ+wJnP59EbegUQ=
X-Google-Smtp-Source: AGHT+IEGmnyW9beBMmVPguYzlZIsjQtmiTPL/wxqpdtxkv2SvAJyTXjCcC0PWY+7jCcfU3tEC9CUPA==
X-Received: by 2002:a17:906:9c0f:b0:aa6:75bd:eb5 with SMTP id a640c23a62f3a-aa6c1d028e9mr56988366b.57.1733936076512;
        Wed, 11 Dec 2024 08:54:36 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66c646defsm651623866b.181.2024.12.11.08.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:54:36 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Dec 2024 16:54:33 +0000
Subject: [PATCH v8 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-2-5d93cef910a4@linaro.org>
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
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

