Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30824205C
	for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 18:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLIHBAwo"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a2345aaeb05so373685766b.0
        for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 10:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703012138; x=1703616938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQ/+As38lBMQtKK/25P8oClZ2C8RlF3hTQrClvYzXCI=;
        b=lLIHBAwoMPizOZ8obpKbyp4S0JlMX2F3GCU8IzzWlLIMyHs424eM8zFFrLJuvFBYdk
         eTr1SxUYXPO520tFHcvhbWKzca8m/uQexOjMjPwR+R/8cUdSSsHISxbx71mmIWTB+GL0
         UI636C5VAE/dyHfdP4c20pcQRpKXV14z2tgRpXpesNGPIQRAAP9bX4SCbr9393KoZv7J
         5c7NLNCNDYK2CAkj+lrinswlQqhshVeE0jXOG7Zfw+s8rl/Y2wexkLW5f2SRlPPOs3zu
         UtAxG38P02guL11bQk6/VLyiCjJGPPizNTQ+20HMQaxjerQndkNrom3+E8vybGIhs8/g
         5BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703012138; x=1703616938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQ/+As38lBMQtKK/25P8oClZ2C8RlF3hTQrClvYzXCI=;
        b=VMPksmB8MGTnAMdzl9ZE12FCtVl+XQbnMLjD+wnL4ppbMbCl5kKaLR2c7cK6ccKd84
         ljRthxLHQjUHRXKgjCWpDRPh9TTOWXM5J06t8kIh0my95B9wYbwIdHr4vRGCoA+OVVSx
         s28zLtyMjaYsq/8sEpwTBw3ZKNBdyH3Ot6ze7dYzNg32O5+ieZla3Q7DQ2xglmTItrbK
         wJOe6lan87YQdEI9ip885H8eJfGWl9jJ7dSoaLV/lCI0iE0llDNDgV+eQdX7jeLDnTWW
         Sx9FFgIEv+qmyt2QOaYRhOvd7uTCHMF+wwzhhAlzGvqp7qQfynqZ616mpdG8lOaEIIgy
         O0Jg==
X-Gm-Message-State: AOJu0YyZX4zq9cvlfbPdnXCGOrX/qLK1gExL4sCBrlKCiruaSNCDlXgI
	Z1G/tUYrXMkE4VhI5TJ3Ov8B+rk4T52+0qXGi+Y=
X-Google-Smtp-Source: AGHT+IGJdlHDraSmyW3JwxaKxJ4FufE/5bHNi+0YdZj9tDuxrhSrMPeJfF5k8KBJwCooVCoWldAx7Q==
X-Received: by 2002:a17:906:207:b0:a22:faec:7d30 with SMTP id 7-20020a170906020700b00a22faec7d30mr5893136ejd.118.1703012138172;
        Tue, 19 Dec 2023 10:55:38 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906250b00b00a233a4c4a30sm3782036ejb.90.2023.12.19.10.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 10:55:37 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Dec 2023 19:55:32 +0100
Subject: [PATCH 1/2] clk: qcom: gpucc-sm8650: Add test_ctl parameters to
 PLL config
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-topic-8650_clks-v1-1-5672bfa0eb05@linaro.org>
References: <20231219-topic-8650_clks-v1-0-5672bfa0eb05@linaro.org>
In-Reply-To: <20231219-topic-8650_clks-v1-0-5672bfa0eb05@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703012135; l=1040;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zp+MxlirxZfTXZcMa6Fu/HzTuCmSGvfkPNhTYEzcqFg=;
 b=1/rs3+CvYSQP7zIJMC0zR6ci2MufS9LgIUcL1e1f3xNZDzrxA0LPTn1a4zmcsUWutvEs/L3K1
 KJ2sH1dhTKfCIr4za4tsO8OmnQRy8mNy5xlxti0Iy8E9wYRuZQHUXdT
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

These values were missing. Add them.

Fixes: 8676fd4f3874 ("clk: qcom: add the SM8650 GPU Clock Controller driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-sm8650.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-sm8650.c b/drivers/clk/qcom/gpucc-sm8650.c
index 5ae494e17ee4..03307e482aca 100644
--- a/drivers/clk/qcom/gpucc-sm8650.c
+++ b/drivers/clk/qcom/gpucc-sm8650.c
@@ -50,6 +50,7 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 	.test_ctl_val = 0x00000000,
 	.test_ctl_hi_val = 0x00000003,
 	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
 	.user_ctl_val = 0x00000000,
 	.user_ctl_hi_val = 0x00000005,
 };
@@ -80,6 +81,7 @@ static const struct alpha_pll_config gpu_cc_pll1_config = {
 	.test_ctl_val = 0x00000000,
 	.test_ctl_hi_val = 0x00000003,
 	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
 	.user_ctl_val = 0x00000000,
 	.user_ctl_hi_val = 0x00000005,
 };

-- 
2.43.0

