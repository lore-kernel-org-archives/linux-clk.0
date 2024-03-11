Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31B4EBE
	for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2024 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710117212; cv=none; b=HHs7IvH5YSpJjbBmdX/cTMMfE3es4MAFBQMZF6JqOSvvsY89m57YYH4N8OiMty+WxvAXKA1a40rhE2r+CLVUf9B0T2TObw0h9BkE484yGfD9hXG7buG5jEUh835v/oQLvGer3Xb6T1ZRAxgWr3uMG4tQr5SxXsBQLIc32riAnwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710117212; c=relaxed/simple;
	bh=6x6qS+PKks1vssAtWEk+UCzHzvg/Y2i8NzHpUWJh/NA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIr5u6vinqpMt69/6ItYgcomsbNmLdMDpfHRptMzjD3Q3rTNvfSpjo8nCK8xNvCsOITXpoDiQh9ijVcmKUQ4ac1lw3VqGshutVKHQQ5DBAn2CyFW1e819UysRo313GKROrF4FrRrreLnskRULjQfQ6hkJSJsS/uSQSDdkWjkSTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OQ/UuWHR; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQ/UuWHR"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33e99b639e0so45674f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 10 Mar 2024 17:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710117209; x=1710722009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmOvVR3ukklFbxgndRD6p5C3vHUYb9SXByhvwW6S0L4=;
        b=OQ/UuWHR/H1urByBTKhgfsnxTBLFhqC24oxmUzFZx7iWryimnE6nYSjChDfsPARnC4
         EbgNc+qwRtFe4WHQR6xdBy2UkpohNv35U7LyZOq6qUd/+gHhx3RJy8U/h++s5tQAgUFP
         zLH/UJ0oN0EvnFAzeukaFFwnxP4M/AgtAz1/YKkWNPBmiMhhWMiGnA67Qbk+11EOKrkV
         6zqeVE5ygz92s9j+j8q+NGu7oK+MfSYkZhJiNgrbDk7Jjgp8rH+Sduw9uP3XNNcmNwrt
         bhM47UnheMoJlz6l0GKEibfUaTppDwgymzWlK+QsWtEw9MNa+/JssOVWlRpsmOFjQK5y
         KaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710117209; x=1710722009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmOvVR3ukklFbxgndRD6p5C3vHUYb9SXByhvwW6S0L4=;
        b=oWjOLRZn6JFNqoDTKU8GDkhjpK7FGa/o92wDVFmFDwtDKwy0JvVr4r+RyiRkk68TEe
         IAY7CO2dtFbSjUu6/vDP8BgtY3hjo34wFcE5HAY2VK5GbfySOQKDWRCaXXkA6qKC7cV6
         ZJQRt88pRUzhDNrR0ir240vUHpzr9+yq0kDGN/jx0PK74dqSyJ/sYhr4Qs6HOuHMapOP
         r2O5Ule6DVmPzRTQw32Z5FsBUnOMLPYCYWErYFwlPHvZBVP70JVlJ1uOqNHLycPt9A8d
         kiyCPwfOso/AZRgydHUhrQ/8LF+GOEYDEcU25v8ZsefwyoN5inx7CzQDz6OG99hMekSW
         vRgg==
X-Forwarded-Encrypted: i=1; AJvYcCXxjqDXw0Qsf2sX8Qn7CqoH5Pt6+Txry79AxfmgRWksxRbk1JosUfl+5tfYjWzZKMbSc6xNMIU7mi+ptZk5JOzQ5AzfaRBiMBmt
X-Gm-Message-State: AOJu0YwcvmzyrlpG+RC8jz5vDbdYlR9T6OIfZZUD7nzPQlfPAfdHXoeX
	cmIh3OZ2G2LfhrCfnu/HSt6iUFMKZZ1RYvnR5huXRWY+8b3zFYj9r2vFdtgeirw=
X-Google-Smtp-Source: AGHT+IGAOsSKPQLg9syKKDEivpOtvcSvGyYVNDz7m/SWNDIp2rQb3GsY0k/im7Dh+YgHiW31v6uUBw==
X-Received: by 2002:a05:600c:3b23:b0:413:286c:4fcf with SMTP id m35-20020a05600c3b2300b00413286c4fcfmr1340405wms.32.1710117209267;
        Sun, 10 Mar 2024 17:33:29 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id m38-20020a05600c3b2600b00412b6fbb9b5sm13881720wms.8.2024.03.10.17.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 17:33:28 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 11 Mar 2024 00:33:26 +0000
Subject: [PATCH 2/2] clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the
 parent GDSC of subordinate GDSCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-linux-next-camcc-fixes-v1-2-d126ae0b9350@linaro.org>
References: <20240311-linux-next-camcc-fixes-v1-0-d126ae0b9350@linaro.org>
In-Reply-To: <20240311-linux-next-camcc-fixes-v1-0-d126ae0b9350@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615

The Titan TOP GDSC is the parent GDSC for all other GDSCs in the CAMCC
block. None of the subordinate blocks will switch on without the parent
GDSC switched on.

Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/camcc-x1e80100.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index 46bb225906bff..d421da57697a2 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2212,6 +2212,8 @@ static struct clk_branch cam_cc_sfe_0_fast_ahb_clk = {
 	},
 };
 
+static struct gdsc cam_cc_titan_top_gdsc;
+
 static struct gdsc cam_cc_bps_gdsc = {
 	.gdscr = 0x10004,
 	.en_rest_wait_val = 0x2,
@@ -2221,6 +2223,7 @@ static struct gdsc cam_cc_bps_gdsc = {
 		.name = "cam_cc_bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2233,6 +2236,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
 		.name = "cam_cc_ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2245,6 +2249,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
 		.name = "cam_cc_ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2257,6 +2262,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
 		.name = "cam_cc_ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2269,6 +2275,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
 		.name = "cam_cc_sfe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

-- 
2.43.1

