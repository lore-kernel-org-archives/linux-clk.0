Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A593A8746
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350188; cv=none; b=Ekas265U2l8Dk8aV7+aqTbHeVXK7XvD+5iVWZpCrLoi9Vlpfg9wvOxfPTLvZMJ8ZwWsLmeToyo1UA0ke7gkDbpS1fDJZFjCaCLurMUDF/O1YwgdxlSbSJxWKMFOYDHSQqedJ32OQ7TCuxm53buU5VrS2mz3jUNT0y2ldb1stOSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350188; c=relaxed/simple;
	bh=QlgPztLT0l1AgtAQLK4Gjg/iArBYh5F6QfMuZvh8PRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S7XrHQ9gNr+TT7/YsyF7b4LAZNNf15ZavLwmKp6HrDjqKeEEMU1Fkf5+Uo10y4J7oZKN2um0zvE9P3a7B839NV0JDFp9bJINyERrB1FwUvu+fQ1E73M+wUN7YAUJACfDqGwkbnGal0vleGvI2Suf84b3m/s1wKC8Ph2StMxcJM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zlC1x1Fv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlC1x1Fv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso30581275e9.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350185; x=1783954985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qS0oAWOsEneMSjXLs9/+Zw8N2xLjgCGUcrBqbMkqc1c=;
        b=zlC1x1Fvz0AFaDyDcUtLFWhq16jn7mqVgHQWt13ZmcuC3eulymkdonDEo2xdTuvYfA
         18RRsmRRBbvPSv71sC947D4eNX9rNt3AyWlwONFUQCKoWJwCD3+K3IWQJBfEyJwPbtlQ
         uhCRFQgPyGAUbHEAs3XI94LjYBv0YsFdrgOLvHyw6iPt8nGTzHsUgUJ5saoD/tUW7q79
         DgNiqsBu1I3Rfv2SjNYJ7lZHjfbCiobat0H2NbhmzIbFu9wWFnxBpxsD+4BTiRYPyAVE
         FOy99PwRJxQByK4sznfDwtJdiPnN0ql0wxdaT2mqCLYz1itxR3P1dihv2tcpWnmcsaIq
         NRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350185; x=1783954985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qS0oAWOsEneMSjXLs9/+Zw8N2xLjgCGUcrBqbMkqc1c=;
        b=ZHAcf09Oix7rtAURhoO6e/pxeX7V+Fy7a7CaMfWyhB38V5w58nO7AZL5Gc5EeF8DGT
         thQMdlzBR++Zn1yEoO+cfn64gFEYuf/OjSNfaP4prQJhJghDfv4RDShYmRYoFwTEjmEG
         wCnxQu/ginoWqjzlq8neT2fWOZq2nIaWmrdi9v7PqzLUDeYmiKBiqr0qZZqILnbddrvf
         8qz03jmMWkWWsnd9ljW/AocdYNIa0Nd8YFxsCSsj+f6+PHzYoVi8zELk4KGJOAWaG4rN
         YNACELtAxlskE9F8STRzVsmIy/ajLnk0hK3FaTYSNu99l7c5/+UCrg8QHBVtBjO6hMap
         A4Sw==
X-Forwarded-Encrypted: i=1; AHgh+RqfVi4yHGcJ72eWifKO8W6TNWNZdoqihq/ogkJESLkmniKFgNwxQ0ad0q2qETj1H2ovpx9X0u9ACn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLpNGUYUVjPtaCrLBCPdBiONazyWJ5oYS8X3H5ZBdegX9foVbQ
	u/CbuKz9Az51a1tmdE7NBYj75T4zzD4jwiSv1cw9jJilEse9mCAEUI3qjopeS9rjxWs=
X-Gm-Gg: AfdE7cnWbCfAEEl7f6ZBzihMjlNpNTbClDVh9rHggFCncqp1jU5680OSeKtRufStp+K
	zn3YpNS64owceEbIv2gi91qEQYl6+4Z6if5o1NeMIemglH+yejPUpOnk+pHT5giTemwueoPmgCN
	W+Ufup8U8Lu+lMKHVcC7dRSWAh6oPHGpfGZjdRud/zCd8sLRtP6oOHrVkANMVz7FBKx+HIvTzTU
	oI6ovsZ1cUbgLmeorDSKe7pXJ4/jKwQR8a8p70RCpN2kbrfrWjSKv69MiC73nMSCsHlAK7dmlUr
	kDyYwd81nepkw7AUXXyXf49cvqV5Otj9JP4BgNMGx1m/ZLAJzyCwmlkfUIQQQtM6CTIOLkLgkjo
	jku7Jqf9ot/8P0fCHM3Bc+48VhT2XIZsz4+CLojLNnPMR52crDqvkbRQZ96L/hT1ekHDNmMOTXl
	DFJm8sR69F8djT6bq2FHfAT5mJVg==
X-Received: by 2002:a05:600c:8219:b0:492:59fe:4a15 with SMTP id 5b1f17b1804b1-493df0a7583mr10518085e9.24.1783350184808;
        Mon, 06 Jul 2026 08:03:04 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:04 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:19 +0200
Subject: [PATCH v2 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-12-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
since it's used by the CPU and also various other components such as UART.
We also vote for this bit in the actual GPLL0 definition, which will be set
as soon as any driver in the kernel requires using the GPLL0 clock.

All in all, this makes separately voting for GPLL0 during probe redundant,
especially because the "acpuclock" in the comment is a downstream construct
that does not exist in upstream.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 4b749c99586b..2e4cdb590623 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1425,16 +1425,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
 
 static int gcc_mdm9607_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
-	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_mdm9607_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_mdm9607_desc);
 }
 
 static struct platform_driver gcc_mdm9607_driver = {

-- 
2.54.0

