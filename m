Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7A9C2FB
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 23:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761090329; cv=none; b=hM2CGkFMEvcVUYJxTioIBmdoaleY7nNDd4/mnea7tR6x15Oxrr3N85h7mblCJUWfUjP42iicWJx/YgXulnFxSPkrJA1wFjof0Icz3vTK+nCOpqNnGYdyGaLEHWJmpzahxE1BmRwkXHwdg/20w7bBDCBdZACBs37cLoktsqdwCrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761090329; c=relaxed/simple;
	bh=/bIMNZB8cYnkCwa0a6Q7efTtWvhnK1S4hUxycemXvp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNNOmZiyYDypNIADCs+W+REZV5YfU4BlDFqWUb2W746qVdj4FM2xZ5R7vHF8nLYbg11dl/nT6tUuEqNlu89KJnnSpNWhwm7FMaucgPV+FkQQE1etkvyH0PkUyEq/BenOEvijoYXD3JqB5Y7xk7JK6um0AzgVtGVwXAL3pbgesM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HuHXN2MH; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuHXN2MH"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57b35d221e2so1581922e87.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 16:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761090325; x=1761695125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmySGO+B/MmieRszAxDcHcpwhvqMsE0PTZQEjVQVLrQ=;
        b=HuHXN2MHvY+7cypbe7YuSCc8BYHn9vOCyWQXO2shIlsFD/td5wVfNrLPsiiyslxpqX
         UR4OwkcMHciszTZoZjWzuPGdvrTZrQWtbtcDFGM4T5qAC6mAIAz60ean0OkoaUww9V4i
         i2qjfCfOUIwqkw4zIQjQIJ46JhlOZL7KKCYGCEB14m4kzbfnkugJw9UfzkrATUi3feBK
         a7/ojj9fQcV5IAExcGq1TKAG4SAePLk7LPbP22FB0Mj99uJ8+JMXeM36aWoEtUE6g+ps
         LDqK+X/jkYfz0J68vc3+h5cLnDoSJcqyJ5/2L9/PN/LuFDfWpVmNXKTph+zf+74lSKO/
         H6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761090325; x=1761695125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmySGO+B/MmieRszAxDcHcpwhvqMsE0PTZQEjVQVLrQ=;
        b=Oc3ioyPBgqeNg/9b2WHnzkEhS4g5iVQCw7wS5JHEmBDtsY3gxVZ3u/EMLdKrc7hBB2
         ApBZ42xq0uUwfA9ncWgQf917teF0tXEFd+semKqu7oShj0VgjnXk9ykD/vpd1e+94lWl
         c3HJdhCrip1vhjX5oyzeBxDcYC90uP9GsWy78sv6+xI3WJSnxMMIuS2nkqsBQF8rq3oH
         pfMAfxXaj0tZ1PVbZlrPfXkvZM6DnABB/eCff7HejrNz26OEzf1fph8wZqV6cLRlyg44
         XHvZFQA41ZJ1GfKRxfq2zrbaknxyzXmu1JgjaVgA7nApZXoPWujYZDrrv4scGNMc4sK8
         9IUg==
X-Forwarded-Encrypted: i=1; AJvYcCVEnJwYTXkD4iiughYfIGbF7bjU+GWLGTvlugVuH1x3Icew7NWx/f8YQ+UGWblMWIZ7klUivr6nPEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzl58BvcccRWyqUGa6m2XxAi+IZuyO3edkh5kYxnj0aceiFDZa
	feT/c/0FDVBn5ylkX7HfnUfb/mZ0QY51nhWWEKRZP3oZGGJuepqc9xm6m4CCAU9Qhuk=
X-Gm-Gg: ASbGncuVjpWC6MllKZqVCbSAV9z/2Grk2gPRdUATmWsL6+4EV/61NA56Qtz/oWVl0+e
	z/uT8hHitoKPHFtU9Furwaknj0KnDVaDFFIzchswenqeDvAxKBvk6kv/CfEkxvYZflMq2RR8jmV
	NgT3B/iRt7DYGoFLcAnhAx2bDGKI3/mf6Mz6wYnUJnb5XVOgvNLV+s8tsaOtonPNgexFnszawHm
	Ux95+al7thc/151LRjp5+hGPb+LRGgo1Ih9Oeg2aXa7iRCktlzd/vP+Vzyo8ZuCDZFo1lyPPEyA
	ys4AxjCuAkkn5viCMaldn40u4FaNVwD8TpPc+F1FWdrB0pCFWimR/aoWJ0qNvEvcps1K4D+lZAJ
	ZyoyqzI57xVYdbCgL39l0nj0HnvsooDywtLzN4zZMe61xoeLJYR+NLRsNv/TdMZJZfz1bLoJgMv
	Ek/YsUO+8IRz48tr4HtLJjOyJ5HqWhVN09JhTmjstDHHyvmfV+zl+jt9+amqBZQFa0
X-Google-Smtp-Source: AGHT+IGT8qQm72MH4N/KV/5pSWCcFg8v2M28ktxDyD4xjiYjdumKL2klCN+ekO0/+aP9ptjSGDv/Sg==
X-Received: by 2002:a05:6512:401b:b0:58b:212:b0b5 with SMTP id 2adb3069b0e04-591ea30a314mr971900e87.7.1761090325313;
        Tue, 21 Oct 2025 16:45:25 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def160cfsm4076397e87.76.2025.10.21.16.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:45:23 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
Date: Wed, 22 Oct 2025 02:44:49 +0300
Message-ID: <20251021234450.2271279-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
References: <20251021234450.2271279-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a consumer turns on/off a power domain dependent on another power
domain in hardware, the parent power domain shall be turned on/off by
the power domain provider as well, and to get it the power domain hardware
hierarchy shall be described in the CAMCC driver.

Establish the power domain hierarchy with a Titan GDSC set as a parent of
other GDSC power domains provided by the SM8250 camera clock controller,
including IPE, BPS and SBI ones.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8250.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 6da89c49ba3d..c95a00628630 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -2213,6 +2213,7 @@ static struct gdsc bps_gdsc = {
 		.name = "bps_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2222,6 +2223,7 @@ static struct gdsc ipe_0_gdsc = {
 		.name = "ipe_0_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2231,6 +2233,7 @@ static struct gdsc sbi_gdsc = {
 		.name = "sbi_gdsc",
 	},
 	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.parent = &titan_top_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.49.0

