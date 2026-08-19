Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571E5481652
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153297; cv=none; b=GL7XclDSz7Uy4axEmZBA8oE0KmSUqDhbFlsrMwLSaIKqbGDitn9W5POPDF+tU5P4HYzqbZjry1iSaDCIeWB/7xfc679fmPO22kR8+IeRXx3qs5kB73wfB2RHm4iHe6dTIIhXxyMSBQAXjLFQLvUVLTTo+p5hCmO4pidDHe45Mog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153297; c=relaxed/simple;
	bh=u2Yu4YBYm2njILlYS8QED4Q5XuAaD+AtoFT/SlvHqq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxgbp670oGyJaBDh12HF+R4qBYgku0aof+ERnCb06GpQGMUiSv37AdSiQ14p023KHcyQRVVsk7nz7w2/ZbcbeOJcQJFf7KB77uFb6srmySTyWghvLWmZs4Yk01PVIXmiddWsn7kCAbnHOn3iBaL1agCf527Hyz1Oh9ZOzymFMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f87GJ0F9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f87GJ0F9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc61541f8cso110925ad.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153295; x=1787758095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=f87GJ0F9CgoxS/V3fp0BO2vgvBXL4YUzhJqblmGRG/tFQrfZq6UuqdRPjAvE8LjnfL
         VmjYP+RKg28MJf+GTTls79ge2iPw6PJc++/RdyAb0LP3RZTPTXQVUYaD/PLNzJMVSzta
         UOwV08k4VtLwCi6kdAYRgWCPz1mzaHesFGtgHgeIV60IEC0lwX+Ojph2youlTf76kD4c
         aGlXAUWGmkeXECo85hcyohfDMWOjk6lIxhXs68L8Xbi4/LyaydoOJ7e0goIbMlFRGKoS
         NYsqyHeU4BNS7Q6iQXeCsoo/LtfTccg0KaH33zq6z6t7GLM2lnX506nXSSxVqMa5+t7M
         XHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153295; x=1787758095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=UIKk9IgbNqlvypyouT5AmVXolhsGVVLfu9cNdWgAevGdtGn+luH+rBH5gzRdyRTnAG
         o3GeuZtTFyEYy3LQV7ypk1B2zSEKFHBFWy695ArTqKaltCpHRXvVhdMCZJFSaJsrermz
         x9GyhFmxL1rfFkSK0LTmD27X+mkDFj+dI0pCd1Y3aMVOw2viU4U/O5cXfXJP5QMTy8rt
         STqRL/Of8WePCeVb7ROjs+vCtpyMMCZS8YwlS9QP3LCxnfeL3Rbwf9lQO72fj3q7ASHI
         ZvUGq9rhQBMVBrL6ettpKdM10Qo1T47VcNE7GwxlPhy4YFLfL7gVXd7kkwMctP1CYXKi
         kGWw==
X-Forwarded-Encrypted: i=1; AHgh+Rqd7wGPMJ/ictpUJ7g2EZ1tJeLCSuYm8h4/uO9Rfodg2RvD8Mn1ndQPOewHu6uDZ21vme46LQM4TiY=@vger.kernel.org
X-Gm-Message-State: AFuF++lhqDzL/POKeo4mqVGZwSHfqjJ0XYnyv9jAnIDxvhK48xGABUi5
	BWWy2JVc/p63CK2cHPRSme2Ptf12M7qi9py4CaM401+HBuaFeJTAdFsu
X-Gm-Gg: AR+sD10ow++YAiAV+yK0onczxxkZkCHFb5Hu5Qf/V20dvWim+zHIywgC32F+aWZbCIQ
	WpAg+L2YkeBCKGjCpYkeYUfMWm6uUT8zNTmyCQ1YdCqZjwqEZ6GhadChgpRzHsaHV3e/Sig7Hxj
	WRIdiJaWPGEptLhmd8V5AsGSEv5TqqOXHGhgn7BkaFUvBqDuYB0D15Wy5bPBGVrQnNMZcSo79L1
	T4ov+9jAqzE44FbcctytiPNz5S2oBm14xH/p0EN92JTA5x7Myi3qxHPaN3YvDs2mWrFfumz62DM
	1dMdRgnXZ5iRacRvRoediQ07hbp5LquyMl01AOF9+lS0y6i6ZsJZAVNCx+dVvZAkq0sax7fIC3w
	A78nuYXCqjmqLRnMD2unRXoN8LUTzFOnkyHV6y4na9Bnt7zcn3r1dYb85dDsdtFhrlP5RUcR921
	an/5TW0/389Wqh+Xdv0uGJ4YTa0CIO3zwCQP9E5KunqN0kN+FrJ9BBGrrVc7NY/vCmBzIlZjlUh
	p5JkTIyFAg=
X-Received: by 2002:a17:90b:4a83:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-3957f8f49c0mr6838442a91.9.1787153294591;
        Wed, 19 Aug 2026 08:28:14 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:28:14 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Wed, 19 Aug 2026 15:25:41 +0000
Message-ID: <20260819152545.3934-13-sreeshankar0910@gmail.com>
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

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
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

