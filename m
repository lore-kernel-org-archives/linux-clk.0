Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E6C480DDA
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153277; cv=none; b=enq3CCiZiJWED3iTfRZRolHwhQt+7f/tw+dUMGcg62WArkgHbSIs0NEWeqSK8wUxLh6EfUnv5bAkdexWUNUkrB8v01U1iHdxHeBYaKpn1+YM3EOl1B2eSMEKgNslE/gY+TF45XOh7orw4g/BftrFcowJad2NTRgSY9ZnHmz3nzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153277; c=relaxed/simple;
	bh=gGRs8PNvl8Xi/tUIg8+pD+wbWYIKM4YMN8DIqhxVxmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJxbdrkUd1zFp3Gw+/huJNHLETKn511g3CFnjWtXfpK8wcl5znuwAwUGazorp6navZh2gI3M7UxPIa3wusbN5yNa8p+e+OrNNHaFdViPwKOVCqdWEMW2L7MELyHOz/MiW5rqNjqxjoA7mEAhesg0B338PhgdK7ZawAoCp4d4qc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0sUoFR6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0sUoFR6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caea3f742bso16841645ad.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153275; x=1787758075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4p0M/MEu5nAOoTIIepmDuyjSd5dmIXE6lm7R/SDctT4=;
        b=N0sUoFR66sGylAFgSLXVGwyEJ0UH83NTRMp46/tToh+DFe9hRIxE/12XgHDm6COQJO
         5uRBtQdYiw7xNSWTDjHOC/3Ak1jfJGR7yRIGsMQjIW/TpC95I4L/xWqwEWKnX+q0aA72
         LrkMuqQY+MDfp8Zq7Eeda+btl3dPvtS2VviI8bjlguPrCW6M6TunrVn29giuIfhv8mUH
         QIdclDHjhXuZswK2YI5nG7Ks637B3CvNrNCPrNVqBbArsOCIA/nlrWXZ3nZVQzohY4L1
         Ba3O64Bm/g/gAxU2Tx8sIZKodD8x/6sl0cok42tb3d/9MCBXZpJuvSrxCYYPrxddDI2p
         R0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153275; x=1787758075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4p0M/MEu5nAOoTIIepmDuyjSd5dmIXE6lm7R/SDctT4=;
        b=dfxU7wj8yu3txG72vTl9aAGekAKuSjWoavZulpbThy/KOTC+KSfQLiI1GchaRCbpn2
         TmIdubv+DhONewJ2qEDJLNKFyVxThAb6Bqqfrw2JgsUp4WshkJK/Rfe1BMxH+Sl5nH3f
         Fid+AhcwjXXAk4x4YWcPQCKbOP1ve9L6iMZ46LxiXOpqGGiiuO6XuzKDH03sHRBrWEGO
         SagprRZ4lJ/AWPyADs+OnIEUDUszWJ8PSK1uOHiBwRPSZJPdXQohzNftBDt6C8ieFkkN
         v+tK7wcTXDYtkEaf/7cMFIie86/Dr/n5uq41MWPuqhy6L132fxABtmUKAh7Cf+FEU3vJ
         4grA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0bX4rxIs7n2h8IrPfVppdkE4BL9ijuYui7ne1BEMUAwbsqjCS8OstHuKLEAodeO2GYRzrW5Uwjz0=@vger.kernel.org
X-Gm-Message-State: AFuF++kCPlR4aCriE4Il/W6rX/aKsytMKMYcaQS60IQS6f+K03fQWPwH
	jl1DnrI2m72U9FcafrJnKytBy6RB5/VTWgtqJpICA4vjJK2DGWsw8aCj
X-Gm-Gg: AR+sD12QlCCk75Y6eCcyUdlkelmmYnT9IErjvkJl+8mLD8ePABj5Agn4KHsXi9LbanD
	xvxv3TjjcdxFl2D2yEsyjudM4fqpBYDDk8jPtMXZ7TpYyZgOBZVmCnYGocz+FrYZ4daX2K3Lgkd
	jwPDk4FfDA/bNxzae8bfgYdrVe/UK9cn2j/9m0PTiTEoZomgnklrUXNGzKYlXi2HpqlMSzu95Fq
	XIIGCRUmQfFfswOay8GzN2k8XPkNiIPBex8CEBNqC57tPzkv+7er3Tn8smVCuWgt9cNs96vA+pU
	Vf37cHSksmBdJ+B+FMuiYgioGYzTE0UeXiVjGS5LPIGSVdz7iyJBCD2vBpO0YNiIj1IrH9Yg6+5
	CDSa73rI+rwbjHmHhDAOS6t71KB+9IrbHyNdZhYvGd2POq60vpB+YVglD75eckKYQLLvKykS6jX
	S5iNcj6Z2yyAnrAM4a+xhUZ7gHFMsCnmyeHhvmV848qsSMVGB+Xmg2l8ajGGGnyERlSpVKCFxqy
	I8tQcCUoyw=
X-Received: by 2002:a17:903:40c9:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d60197c4c5mr109473845ad.12.1787153274724;
        Wed, 19 Aug 2026 08:27:54 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:27:54 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 10/13] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Wed, 19 Aug 2026 15:25:39 +0000
Message-ID: <20260819152545.3934-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 24a49613c..c8f92de19 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -73,6 +73,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

