Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5E942051
	for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 18:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tk+nTnlF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40d12b56a38so40401255e9.2
        for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 10:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703012137; x=1703616937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uztvwy/XDlnBSNFvqBS9U2QaM7AjgbLOyuRvg2DsiFw=;
        b=tk+nTnlFfxX08Hh9PkKMpdT2lNMV/Yy36+YvRja5WaGFXM+r07/BnhI6v9aoaev7Bk
         M0pS3KFSxc0mblumBRtTBNiL/fwhULpeDsHV6nsSXw5WawS9DmvlqhBthkAlQ5DLAbAa
         3cSDvRFYknxeGyjW1TB7sov6sTz1aGWpXmA193XZtI6zX4FImANZBryy8CY0yC2Dhunw
         +f74jVUB0TO3st+3US6Lfc6jD2G6+kgdM2O/WSvYPnIoWIcqWNTLUrS51HYyaOA+y260
         A0B0jM3iFdIFtnSAV35ykjpCIph291qoRuVK4hlNm38xZpI2r2q37IKjnedANYzomcJt
         hCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703012137; x=1703616937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uztvwy/XDlnBSNFvqBS9U2QaM7AjgbLOyuRvg2DsiFw=;
        b=qXGWD/woGqYQJd+KpxKCNvWXEt1N7gioZgl7nFyNvwogcxLVoK4UKyHbMJuv7m55hL
         bGp9Hzcp5r54P/OUW9AcXDQYwB+YCJcPJfEMirgJBv35LbPsohXlm4Tzg9wkhEv827JH
         A8iRaZ785B3PVWM+hdHRXNv+DEkgY0lgHu2Hf361it256GP0B+C8opS3d4HPpN+1BBOI
         n2XkQsgw9U0Sz9LLdD6Mf0hCStIGlyCImbkla+P74QeI5CfBjOdX9O17V5SX79tRFlaB
         LGwQ7xPv5Dot1Y2yKaL9TPZEqR6vWH8tVWu09LRKmegfaPc1MasNqhZk0rUSxCWDn7ou
         8wfg==
X-Gm-Message-State: AOJu0Yy1J8bkSaqyFdgzg3To3b51n3uCTT3YyEseoX+n8N9b61VHEbRZ
	4QPErU96yPGqXghYIQM75HLeSw==
X-Google-Smtp-Source: AGHT+IE67AXZ5TO7t33MTp7YxhfurK/K7AVTWL7i+Xbinu8RXRx+PhcHi7HSbQjlYNkRWX3YsEIqfw==
X-Received: by 2002:a05:600c:8506:b0:40d:312f:c444 with SMTP id gw6-20020a05600c850600b0040d312fc444mr52697wmb.348.1703012136775;
        Tue, 19 Dec 2023 10:55:36 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906250b00b00a233a4c4a30sm3782036ejb.90.2023.12.19.10.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 10:55:36 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] 8650 PLL config updates
Date: Tue, 19 Dec 2023 19:55:31 +0100
Message-Id: <20231219-topic-8650_clks-v1-0-5672bfa0eb05@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACPngWUC/x2NUQqDMBAFryL73QWTqmivUqQkcdWlIUpWS0G8u
 4tfj3kwzAFCmUngVRyQ6cfCS1IwjwLC7NJEyIMy2NI+jTUdbsvKAdumLj8hfgWpqqmrnE7rQS3
 vhNBnl8KsXtpj1HPNNPL/zrz787wASelPEnYAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703012135; l=573;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HxwLXDMBT6bR2E+sq2a+zW47p3mK/OitVRZEuWIf000=;
 b=zX/xm/pu49kzAdBKe6qE0j8vztOPZq0Cx1qx99mYp/pDD/p4hCfGRn82sc6dD8EMoZbon0E4o
 LkPdhuMJmBrAsQfS44ciOad7HqndqVSK2JeTexy21TumUFF/untFwXb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some TEST_CTL values were missing, add them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: gpucc-sm8650: Add test_ctl parameters to PLL config
      clk: qcom: dispcc-sm8650: Add test_ctl parameters to PLL config

 drivers/clk/qcom/dispcc-sm8650.c | 8 ++++++++
 drivers/clk/qcom/gpucc-sm8650.c  | 2 ++
 2 files changed, 10 insertions(+)
---
base-commit: aa4db8324c4d0e67aa4670356df4e9fae14b4d37
change-id: 20231219-topic-8650_clks-e45e94ae458b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

