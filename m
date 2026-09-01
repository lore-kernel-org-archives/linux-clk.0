Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCD14446FA
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246567; cv=none; b=aK2qYnaAUVMB+5R6zqM3l0QfbtKVo5kxN1/LBQiQuIjlmGIcIKaDT8wkmRfyjUCRK4cXOCQ2nyuxdQ+nfUmmPi32cZpoL77mGpV8+TkmjqlARTpISyp4hXEFg36Zl16cp2fe+LS29Bbtvry8T4ZYHuiLxWI1ynxngITX3xe44qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246567; c=relaxed/simple;
	bh=0S9ZiRaNeD0ONuhBWck3LZ15qfVQqVd9GHb68v++sEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OL+YClhhlv/M3I04RbTmp/2CQ/8rC6MlMFUm1OGBvDO6wsH0uEjyJytZ6G2sKmiVF58B82T4UaQbd+m+qlHBeYISuNGxxQIjeWtU+JK2nt1+gy9EoXH3paO+PEoLLj8YpUoC0gfMBe1YacaGdi9AEPFnDGw8WtEnVdy8wAYPYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPkjIEQK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPkjIEQK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d8fd3b729dso23818645ad.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246563; x=1788851363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=rPkjIEQKdxLZ/sXl1sfckXlub5hLeRHLy5Vf7DydP0RRWgPmVtiTv/Bs5OF1SHHaBe
         +GXv5zKI6kNnmpMTKhFLFuPmVZhPsAIXJ5NJdeSXvRP2wZqh3mQPp1Uw9kb7Kvwrk+jF
         QlSSicUyzhoD5f1DKA0uT95cHi819y4UQOnh5Dm60fE9SM4K4LyNYJYkU1VfOufhSnZh
         U7gWpE4+g/UGi+s7G4sueh6/dTdiP8jQmc1GTZmV3XUr9/ENTel1GdJ/BMRjnyTxrD3b
         iHRG5tMayKi17hOB8HhCiIjuhCokVNVKlKjxNSruGE/mqBaQm8f0ukqVhsNzuMGc1ABu
         sm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246563; x=1788851363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soaPR79MMoowv6/4e0ZCsyZJkdHPPam+XR34R/7HHt4=;
        b=QRrAurKivR8Sklklsu3IuCozEXk5+IS8x0QdxCF7odRSwA1DFicRspU1ytIaETv8V4
         wyRHLuNag+2fEPtL2aRbgGWkKLmINMejKAkSwtPAuBwJiX6zGXQZIRoVa1BpXDDALJrI
         Pbz2mZvx0WU0p66AOMCIMCfGfaA0Bwg16jcZhJbO3u9jcaeZQ/p2qZGW8rQvcTh/308h
         3I8qz0M06bfjEbiKgk+6aYjxZWxJhZ+77/13H9Shni9Kme0er/KWtBCUugqLWij+9O9g
         z+44sR7AubgG+IcTmGy6yhb7Fg+bhZp+kINXx/baKOXh4dw+30dNW9GkKtGSDn+yQbQr
         wkog==
X-Forwarded-Encrypted: i=1; AHgh+Ro47zzYFP5z3edvFM6XsBJpoVxXXqBteI76x+TfNrJXq3Mdpcdbxywm37R1EzpFYYe8LZaEmf3pjuI=@vger.kernel.org
X-Gm-Message-State: AFuF++k9K+HwJWGojHIYLLa28YnfBA6BMk5/a6yvK0MYfC56xXCV+EpE
	I3Bh4NgoxAL/ZIJUusup+9Tsr9bT2DlJALXogyZSlRB6TUR9Ed0wQ0VP
X-Gm-Gg: AR+sD127qSPm1+kg2ddsfLQto3dG8RxlbypS9p0G/BJT+Mn3d1rYZYT1iwQ8r3CJTVw
	qzxVl0+lw0iil9/uIsUIPvZ+TlZSSz1geebBoirGEguZKE6UBggSX7CTy6Nhnd0kxVRLCz318sz
	t/TXhHo6rxpYTFf3aJJrOBvbvRasccppQVI8KYJ6bt/V55Rm+1ou1krBAJhRn2IHSD0/IW9YqCe
	pv6SgO55LNGt+gTsN+RqB2Imue05O9WaZLNLy2vd4+4gFEpUSKs8bvBHYwD7UiJWUGIWHqUM5Tk
	9R67ynyDPd/HuSCwlq44BRDfv627ZovVln8rzAFN64RNXxiHMk+SwWEecfNE3LynhPPvAFNIkdH
	oFnk+8ZcO+12Vhyub5gkOLy542ef3OY6/kOIMF4bXnlH5jfhgLDSUA0RTcbTZFQXXwSHkPCOzqj
	mnDnMdz+pUPaoGuQee57rTOrEObtF2u8wf6M8fGMsqFcyt/o5ibdLdW/sNLiwnJBUHhAhw2I67r
	36awjNw4mWl
X-Received: by 2002:a17:902:d48b:b0:2d6:e401:9676 with SMTP id d9443c01a7336-2d94a713d37mr81458035ad.1.1788246562799;
        Tue, 01 Sep 2026 00:09:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:09:21 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 11/12] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Tue,  1 Sep 2026 07:07:16 +0000
Message-ID: <20260901070717.20513-12-sreeshankar0910@gmail.com>
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

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
-- 
2.43.0

