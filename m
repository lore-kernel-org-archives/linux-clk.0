Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8401341A55F
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299925; cv=none; b=FJDQ0O3JD3lDKF4o/ZaqudGImkeudQCPSi7p+WQ7pgo0+Cs2YxyRhrD0Y1UOn6MBz+wJRZYLtn0QmZc8LtGpT0ztj/6DPk1xFeNFd8cyap2xTN02qUGr2TIKjhQ5Zw3nEKrkNdlueX/UV/CdBOTAh/W6kc6UoGAPMv4R3LexdRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299925; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiN3ptBYv30MPm+X7biWjFnvGcxNm8j5xMR+p8Dz1vJKQyi7+r+xVcg+zSYp7UTm3FDUKrc/nwZ6PFo1XidK8ypUskBTeCU9uDzxbt9psvIlKqrKxvh9gezNv34OZ+EgMozvyrXZnWa1he7gS9n3cubf+TDiEBHHKOjfyKNJWJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGq/HyY3; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGq/HyY3"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so405978a91.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299924; x=1787904724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=MGq/HyY3MnZKxveRrcIzbnWrjqUppqiVVrrKF1KiHvkT+rXFPB7d6zL0V8Tatw2qxk
         kREhUP7ZryQUcZI9NByYfZiL1DqP1Yz1jtS5UBoG0CnerIF1t/nbD3jHW0C+xx/5DcXH
         mnnphyn98jfByy24RH990KdGKAu3Nw64IQV57PEJRY2tRaOFdPrR5eq3qVW2nqnXqjS0
         O0ZA+LJxoOHyAYJqgBR/B1EUNr8wEhsJhII5Bn9+mQDJ5DL6YRoTKFx1E2nu5X2KyeRV
         PNKrvJ3uFWS+gWtM+ST+o46tCdPidN+CzoXU507V4FWOimOjjN59QfjP0rV1lvvCSOD5
         7oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299924; x=1787904724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=HhnZnurR9u5BIVSd9qJH4VoqerLZ0bpd59cgRPzkGsnuEBw4g/I3sd8EzDaxNEt5ZM
         fsWs1X0rdjbT4bNqwOlRuqu1OxdsZpi5ZO7nlEIf4KFB4ZYLTATVnfrI43VbS0bT9+QX
         e3YbVLqg01mRZu3wvzAYBXNGjErl7Z0N/dyAaukX6+Y3yiH00ZOjNar5cWYujR22O0nF
         BzdMi1v/8u/6gxBxXCXfsGO0LIiinWoaJ6svuZfhXtj2+RNubzwFTKzrMsnagiCfGUV4
         nLiw2RQvwyShlpQwtAX3jd8Gd9RodUdf+a/NtBn6bOXvB5gBWfhXq5UvX8hN+nSvVpXc
         f18Q==
X-Forwarded-Encrypted: i=1; AHgh+RrFZFMhNPsQi3GzqabUjlrfGYIXrPRtU4ca8+n6Cng+BwUf5rAfAOTUIfo2d3ZgV4F5oOPTj+xf/90=@vger.kernel.org
X-Gm-Message-State: AFuF++m2kFKetxyb9Cfg8MOpokAUkYNKtCXd3JymG+wXrvSmIohU7uOq
	efzdjRPsaVvNTWmedWeue+PPTl4YvFdUOvzJYfu+b/WwxpNpDd+xXlXx
X-Gm-Gg: AR+sD10/4tFtKQ7S0ysGmmDL/U8X01HVDsEYPqez4YnBRAmEtO3N2KwJmQmB8yOOguG
	fEJFPZ/RVj0RDDbcHVxBfPoYdY/DarUD41lqMDK0AIaDDki7sL3ZIZVlzZEq7WVOOy/bQ0ObUNS
	PXZs+DME4YQa020AK0oZFFFB6te70JdDoZuVrrNqHqHtrPfnz77TrTL1upJVDfL+EycxRGCf91D
	DP6VKTU9jjLiLHEIP8etIenI6AQBJUGMdwQbf5Z8XOtsac4KYMoEcjlFG+EqI1P1i9BXKbAPUNp
	MCI9dF+xAOIbWCOn5VtdZO1ZVlLnoaOrQ3IZHsaFL6elvZvdVcfjAOsRkd9f1yAzoAlxE15HOqw
	DAwjYtAvfGHZ7p9K/V4UICaEWK4vdQ2S0esrNAr3W7GPnRIzLuFQsKPtUyO5c797fIR9mm0yV3f
	q3Dwhl8X0yGY2lkREXEsQrFWlnyTGvdCPst1OsbqNHcb9Ei2JoYNBXgxJ1MDgpTEV8sImthUVk7
	4EkqaKOfqd35iS9qjJWbR0=
X-Received: by 2002:a17:90b:1b03:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-395c39cb2damr7818751a91.13.1787299923915;
        Fri, 21 Aug 2026 01:12:03 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:12:03 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Fri, 21 Aug 2026 08:11:13 +0000
Message-ID: <20260821081125.4522-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
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

