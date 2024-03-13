Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058601420D5
	for <linux-clk@vger.kernel.org>; Wed, 13 Mar 2024 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710352441; cv=none; b=NXUubFVUaprmjUz77aEhCO0WDDibHxtuF+d0QXCyl9aj9LR5bLrmfgx0R0HOilPgDA3t9elfSbcszpTW12YZQOgBagohge6j9D8xwABnmebbtT/pQ6cTwCvG/Rj2FCDAxmtLpCE3/MXE/QQn3jWs4EQcSZ5wP/Ag+FHRaSvXZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710352441; c=relaxed/simple;
	bh=qm9/pAfQvWiGqGVOwNxlH8gFFbT7JVKsj7HqKQPmV6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z28TSYwXjrQmQmywPalyNlvtlZ76rJUryq9pTaY57fsJNY0sk26MIsUg2t/7xn4qtpxtYbJ8k5arWpwSKdxrZ/c2ftpCUo4upkitptysEZqN4fJbPzS2Ubi+KFATlIRPo8RwzW5KwdF7/pBVxcjefIrn3RDLFMkfev4vhU6Uhxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xsUiuoHs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xsUiuoHs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33ddd1624beso110034f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 13 Mar 2024 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710352438; x=1710957238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KM81aTvQ9Jln3M+e1NoWl9j0TAIn4t8Grh3IDfzWXRI=;
        b=xsUiuoHsQ8qdZC29yszSYghfj0LEfLH22+tXkaGaezo+dT4C22j4JOb2vWwqLMTSc8
         o7tQrYV3nCbyzNNqQnal3m2Y+3Qks8enkUuzc6H/NtegPgnqB8NbeHfAe7dgEVlGFSwR
         rcZKfgpRLSO+cCMqv7o4ljZkoF9Emi/uvsxvwaBz+Us8OII6wv70PZedOmVhW/qYtuq4
         5NHgoOgaV95kVPl2ugRVjltbhi+WUXG1fgLm/m1PpTWtygKvQRULAXkF7JeGLgIEgWGl
         Jouk2yen8u+dtStVxEe8JPUhL1D195MhejhHkrW7WWVkyo0WGkL5BTKwDF9brU08eZex
         FHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352438; x=1710957238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KM81aTvQ9Jln3M+e1NoWl9j0TAIn4t8Grh3IDfzWXRI=;
        b=cKZ9hxKyN7QL9Ne+GetmhH4x/a9FLwuYE0RWV1H59Qtk75YbvcoVHfr5NNR54YsbtP
         +CyMUjC9NxVnepmRYRgC8J9FxmUFmAIYHQpP8ruKYcyXny6ReFHr+LKAvU4a1L3B+MFc
         z+h2pXeH6mrSHl3VwOclhRskS+Nhw9e1uyZBtPQk/gSOYaLZoLgNdwM508293cwH3g8c
         LYVRI9H0wLhH+tCncVZ//jF1VnY764vDg4yrdkDNAYK0Eaoer5M2OczsTFeZQGhA0cyZ
         iUiOGadL0ZKrpIKIJA8k6Fh/mb+6ziLgrUXqYikmHRLO6BQQq0J3Jo+mi61ApJxOekRw
         4QcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6QHHObYcvzdqQDB+lBg94wulLUhL1yBU7oBTMkSjSfsMgTpp35Rcr48FYZCW275rfZH64UnnlOs6NAKQ3zRRRmyArdlaBRdKN
X-Gm-Message-State: AOJu0Yyw+IWviyNLBgHqLJRhX9ZruN16SWPBHIrrn29X7rIch9Nbq3U7
	SPUyTDHiPH7R2Vn8fP/a/40AQRec2ANGaP4kJ6118FA4ThVgQW/w4FiHsBDHCK4=
X-Google-Smtp-Source: AGHT+IFTtMJXFD4nfwVNpeqI+VJeyy9Yl/WRTyR07tWESrF0UzfFkVMdcOIHRLR5tG8MzAvVKVrGSw==
X-Received: by 2002:a5d:4105:0:b0:33d:eb13:9e27 with SMTP id l5-20020a5d4105000000b0033deb139e27mr2526935wrp.23.1710352438411;
        Wed, 13 Mar 2024 10:53:58 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id u12-20020a5d6acc000000b0033e7a499deasm9914482wrw.109.2024.03.13.10.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:53:58 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 13 Mar 2024 17:53:53 +0000
Subject: [PATCH v2 2/2] clk: qcom: camcc-x1e80100: Set titan_top_gdsc as
 the parent GDSC of subordinate GDSCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-linux-next-camcc-fixes-v2-2-9426da94ae37@linaro.org>
References: <20240313-linux-next-camcc-fixes-v2-0-9426da94ae37@linaro.org>
In-Reply-To: <20240313-linux-next-camcc-fixes-v2-0-9426da94ae37@linaro.org>
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
Acked-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
2.44.0

