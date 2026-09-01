Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077E40960D
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246468; cv=none; b=d8lNRfCX7Hk01N/+BbfP0A5qwCDMxblpxN0i9hRYCtfBm64eogyW8bnW66HrQwTnxEmdOUqChsx0jFXeGHRP3N2o5Mhw5l7WGmLp2yAkA+eisCXegK8EFUSvsGHeDOybHFHOPbMdouCzDr3vmuXbQ6ZfHjsMr0CxvYTHH3X2rn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246468; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaEVOZ3zPGzR4JPE1s0OGH5o94Lo8+TTc8c+gmuIxfhqvrkCuNOIIIWYdqqumFFijtXBJFkS78ipuHRuYi9gAOLKfbu3qHU2OU8uhOBFIeI+B4d8ZOy/IaFESjVxYuvfMJTWigfzkn97fIqufhiudH42xlbeSxxkTHrSu1x9b/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb00GfeS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb00GfeS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso612591a91.3
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246463; x=1788851263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=gb00GfeSlSTVxcbk7DATppkpH7mC230XrpG+2I5v1dSPdan/uOCo66qE1+d/ASGHei
         dfr/yBlAZ/Jb4CMNZUhlg9BdfAxHQyOpBv33fR6oLnf9BizdrZJeRRC4L39uQDRqKdnp
         eriRRaSxJHRGPNH7SSvHjVVyuUzTqEXFLBuJu2nVZC95LjqAwXhwE6uajI9Yd7svt8dB
         qPOZub54W/v2VxyoyS1SecH3dnsel9QS6jtvh4Sc0cAwBWR+8xwwrlcpJb65aZBV7LTS
         UWvSmOyAC/3kLuaMgQJubCQgGn+7lpjc6jVNLB84nmaNCryRpr8MD+eK9K+lFbFomLvK
         XeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246463; x=1788851263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=A8T5gXs3LCuf7BlNc+t+2Bfw24+y+Nt35nAu34hdvNlVQuhpi2OD+qYLSxP56R0/9U
         RiPBT6V8f/kGri0MF1H/C2OX5TpFPb1SpoOL6bz0pD7x10ut6oouhKgfOgdYaVLwPd+r
         mwnESIm9pmg7VabX8pvpUiAA8y7PRFBFzc60Tf35cGD8AQuStUjpNEAJBSav8wid7VG1
         zx9yJNB/uEZZnLzUZyb+G00iSO17tT7IWhGHN9aTeXls95AF028WVfYOOcLA2RRY1S+V
         GISP50GaYVPyIGbqXLetZutiBKpLBsN4Tf8LnXI2sNXgTyRt38fO8AgJoccxBygxMXBH
         FUtw==
X-Forwarded-Encrypted: i=1; AKwUvBxLLtpF2CSwnLSBFwOywwoP1zqtH2qkPQFhFwHaSafGleWzP6vCu0zjZnyyut82GgVcbQu5QbUnLTc=@vger.kernel.org
X-Gm-Message-State: AFuF++n33KwkKwnoZGo5LJ9cQVuindrI/RzK9zFcuaLBdmV8VX2CudxJ
	w1xjKQm4gmsq4gX+y3pEu0Av8hOtcAqyc0zpoxuQV5l7ePftzIahXaHZ
X-Gm-Gg: AYBFou1WFCB5U+DqdobS1dh4hlR8uBt4rFhsSTE8WxHvx1c3xi8PVX4Lt9wIHYn4ZBv
	TNyXToVAQn6ZJ2VqBv03qc5RTA8kcMvdu63gR9Is8K9LU1C/LarxWPNWdlpsm+lgi2aZsS2D7JV
	Glh1/b3DQaKTIOUTUoWTnWQ/NaaP1MFmwtHrxqr3531eXNdiUWo7YSZyXWxJBfaFc0s5OkONQzc
	ShmCt9405bb9JCA++4pgvY0ja8pji7uWTDjJXEN2mEMFXOvZORYv2mSQQNr/wSbgfDSkFF1jvws
	WrwTDehDBtZ4OJ21A0YYllszCfIVtT5Wj2ZqZK+EdPf8ExnX0i4U2VeYgws+4EYZDGXY3sKcjl1
	yfGP3d68itjq4sFPcplFhWjIsQkl3E1KNUBVVj++n03KkgCiTy/u9aqhAiwqy3oPQfVGDSfFdLE
	k3Cja7xUr1UQmeD3nZOzNk5TJ2iIjWJU9uwl+i7P7T68tJL1A/G1bBnTulTeGWfqdoWmZH27ZHv
	gZhKFWx22tN
X-Received: by 2002:a17:90b:582e:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-3989be9acb8mr32700156a91.19.1788246463258;
        Tue, 01 Sep 2026 00:07:43 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:42 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue,  1 Sep 2026 07:07:06 +0000
Message-ID: <20260901070717.20513-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

