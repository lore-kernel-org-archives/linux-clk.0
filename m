Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84649634
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719216364; cv=none; b=g4wBhReGLdUIr9vK3ghLfVnF6t/JnJRDhUarwch63CbizFaoDAHdG9E/DetVyN44Nxjc4JRc/D2O3fCvwf0i7DbkLWbvglSqFUX2won3ViMIKn8GsC2GMJhcHYTZY2AmhOEhPXx/SZGmY4TGlFJvoSdX4DTqkHbywm1uClYMsEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719216364; c=relaxed/simple;
	bh=U/4kw5IG79Gsn2kPtSO6sfS0IfZ5NSqFkcAhXyCMABw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PgqT5P9d99lhC8VXzpcZVcKZmibiLBT4TIVMY9GyBl1lMIXStNXsAFs62UcK/+MtrsJL5IRqjmQklAcQhjIffnUw3Yt8Vp6VClxqB4ljNNl0acJCneJYCrWqcn9y99iNokrLrpwhgxCkWvffhdMwgwHh4mpSUq7wGlRxyMnoTjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q5u6w6mD; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5u6w6mD"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so45658381fa.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 01:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719216360; x=1719821160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktOl1TdyOiIKzT9WKgPBAfSIkppzwpfD2FA95WZskPg=;
        b=q5u6w6mDlaVVbYDBeFsAm33k4N8L+aIRrCL2bpNG4vDJFxSP0HAoFDsFIGmJiO3RCQ
         1Ke56N0o/OeJIM1wqm911KYthEdKKC0yduO+fDCvEObQcVZM1MN0+X9Lo4BEs47qzmBo
         rPpkH0+GwsqXK9oBvuOtJZOZRNyvLFN6BDMcegK6jCHHFWD7sWZt8DDmFeHl4s89AT5M
         X2SjiAKb0pgJNOHRCG+ToQGytcOcRn5R42selWtYNcBvF1ckyD15lU87UNikL0lUy7GS
         rqeIuEdKdDReQNQevqcCHNHz1Y34HZwBUgPvmHy6Z8hGXfGiuhn/DIi1kYgdszsQf4fF
         M0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216360; x=1719821160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktOl1TdyOiIKzT9WKgPBAfSIkppzwpfD2FA95WZskPg=;
        b=Niqg2qzJTOWP6IY89DF2oB6kWkPCOx9eikH3YzWw2y2SB+Z6WGOGGLj6pJudBbA6aW
         QXQFmRit8y2GOEPKeU9LUwLcFLaWzm521iQWzdVvZc4rQCN8F88uIATFjV+Ki0WAAVbB
         0BxPCq6ICM1+zB1vsPBmjgIJvMaZG6ncrlAnqlplRfVY9ITYY4DN+KDgYMBqgCh60vca
         Wsjz959HDuYflU9kAYCTI8sixL4tWp5oZqm/CiYT0tZM3+HWmUNSgADApOAtiL/17UXk
         gFoLePyLlYh0RZdLtY6HIRzu+es7VNnmUfSaWwc10KOnRWEGrTIX88vBoOjGeH34v9CH
         0B8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9mhQbx2La1XdwTUZ5jZTF2kfkQ1SawkmGde0gY6dt7dQgotBI7GQpLF2GeeZ/vVu2vTYwIp9BcbjQMKPajD0di5BXEAF+c7zf
X-Gm-Message-State: AOJu0Yxb2H4WUSVTZwe7pXXAqzFm9BqSMuXhB6b83QBwFf13aByjlp97
	TtkD8YfcBzkDJfIolIaOOzQp+OFl6Mwh219L4er88tYmNIUhv1+HxjWkfwn+UsQ=
X-Google-Smtp-Source: AGHT+IFikCUGMq0UTL86rjBwiRetioGQQvG4GE/IGZtmz7TODV3GyLgbG4wupKORlCuu5umrIJPHzw==
X-Received: by 2002:a05:6512:401a:b0:52c:8979:9627 with SMTP id 2adb3069b0e04-52ce1832541mr2791403e87.3.1719216359895;
        Mon, 24 Jun 2024 01:05:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b27sm9280284f8f.104.2024.06.24.01.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:05:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 24 Jun 2024 10:05:51 +0200
Subject: [PATCH v2 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-topic-sm8650-upstream-fix-dispcc-v2-2-ddaa13f3b207@linaro.org>
References: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
In-Reply-To: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=U/4kw5IG79Gsn2kPtSO6sfS0IfZ5NSqFkcAhXyCMABw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmeSjjPByt2B3EFJuzbEuiV+a0ElumZUUDhDdwd3M6
 2AiXUBSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnko4wAKCRB33NvayMhJ0UnwD/
 0QQCRTICcNcXK35BooQCJ/xDstdEc5xcmDffrhOcLnyTUZXpW5qf2vfdV8ihWBu0h2JWHu/FEzbPIW
 jL3J1bk0NopRro0jXZA8RPszGtitpG8hZSAOu9RAlcfXItLBDFwjufjtLelv6HBZqPtbzugN1nckf9
 okf+DWzrOovEGwPI/A7NAXBJPjPEv8xufp4l8LJWZtqclhfB+FrkZjlAobrVJ99jVL57GjWQg0Evny
 T31GxGvR7eSQL0lkxFscb1fCLC2fk5KB1ktZP6fhC4TRUnWNcH4eelsxUJoznjnugOHBtNrzKXXA8f
 g+Z56GESEDhpXKL1uAS01CSv60tpsC1aj/dh3VEoUVMuVzh/CYO2Ogyji6FeiZYtHzTYkUouR6Qc5N
 6Zk+XxDxrBQ6LqiSdHTtLkAumlTDZ2YC6XWL45YEEhGPHlyH2bL2LKDCtUElasPHqs2ISPZYpGkUuh
 jIRYPveBGzAz6g7vL/qKUwBrmB3bEUI+fLkz/OlAgzDrsb1wtIkSRRJtYBxp0OY+iBtQLJGWx9LVlm
 hJRCR2zy4eiuu0J8lzc7q0pvIYzkrceFpZIfq1lmtaB1gapQbwvdxb9aG6BgxF3P91K2ldVlJg6eDV
 qd28gyOUWfZkBUz3XH8tn5br1EXd5nsqBEVNxo9pML7I+8Aj8TIESxZxvwZQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
and byte1_div_clk_src, the clock rate should propagate to
the corresponding _clk_src.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index 360b80377ed6..1222a26c45c8 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -696,6 +696,7 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -710,6 +711,7 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 			&disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };

-- 
2.34.1

