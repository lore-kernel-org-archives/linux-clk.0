Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F735203A
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326866; cv=none; b=L6xwKV+SbxXJY1S6lQ4jOW4Eio6z/yaXuufQlog+x941ST78LBexQAVBi/kUrAfDgGS0i5v4k+hHgyjo2v14PVqeRe2ZfCRbl2+ekjEkbzZwO4qjKIK/XaTuMt1a8lj2wxAEZ7iSizznj6Kw/MUdxK09x4xEU8DZsXbkFldIjao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326866; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GpQVQcqa5iWzOoFe3+U2WU5AKCeItHFajOD/MgaIrsUrTkyYyNGMI5dDD+1BWrXnra2elU+hTLw7RbEqy+bAyIygjFTex7VEjm/NdtJDDBQ/qX4Dfe8grP3WGjb0fezcf3CUIwDEj73vObG08Q7UVDF0j90clIjuUHLFs9Au6l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxRjeqEA; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxRjeqEA"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1422317a91.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326864; x=1787931664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=KxRjeqEAIkNNnWXENVGWsdPpwY1eVNOWrVI/UkpAoi0wQD/nHcqMvKn1YWRbWAznyF
         TqNoTn9eoQyZWf81m7Ui0+xIbmNrtF2rUsCPDgndEacLiJd10S/ogmqOJHkjTmTJ7oCj
         UsxSW+qPwpy2exzQ4xNeo8B/RT/sdMivLJ66SjX77jDxAiI2ptVxAGx+WjF2ch6etaWF
         UJ4m19Gqhmlm8EEF39bb5l9yqN3Segnq4AT6VRvwdPDRwQoXXnv8UZ/5wei+ESw6FKM5
         IV+HYbDnc+uPuQHcvNHfKj1qShTlKtjkOb4zdGPpcNb2VdJUrQ8nkY9e7HVoyjx0njoR
         zCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326864; x=1787931664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=jRyESzy3SBAUzoscxBUQbyiLc/vyCitTkkPYWripx0Q/00qbIomnxGD5npgN2w0J/N
         j4YI7d5LvX99zVXUCmmhlDDMWjh6KRFn+3Ss5EJQiudICsxrv8Pyes5j0Z3nD4VPMj3f
         bsBTitukP3UzgZKygkeLzfyjK8IIDKIJdEaxEMh4qQuvbKsAdpuSVAq/LcMcQA6gRPMn
         9/XGLTfOBkL7/KAztIA/511VWGtjJsppD8TrTGjcCVWQ5anzrNYNbunG5mCCrhxV+STg
         uNjvn5h0uUGN621s9mq2gvbTina/JGqdDeb1e4XHlwLcT3uod6zg/zZP+UY75guEr8oS
         F2Rw==
X-Forwarded-Encrypted: i=1; AHgh+RoHXcd4icqq1HWh9zr3uopyLrutZbCY679ynbCYTIn+ycMuKXeYm5Li719eX5BHEkceXjgsboz2JBE=@vger.kernel.org
X-Gm-Message-State: AFuF++kCdnBTYsE+sSF9yS+chLdDMYKkDh8ZAj+VFC3G9TOSTG92Qw4W
	SbuJokOOv+VvGlZF2+ygINXu7/brn3wSthf0O360yORWYoPpH4S423D+
X-Gm-Gg: AR+sD13IJAUgeWrSpfng6BpPSrr7HDUnHk8ma7pBmpJnnpWEaGsrGcrMunoNgmxAoEE
	F9IhAntsM4ceo57XkYtRhV0hDTC69njuSfqOtiJffgifIAATdy3Yis/CBNF/Xp1zUTmJpVWvB3m
	FB1li0xjHP2qggXF3urcpwjtmLB9rlk/QwBODNxf+I9yRYmFTCaGoQX1JO5rM2TBk0clh9n6fhT
	uk7mMG1jlW+4D+XawbqQPjyntiGH8n8GO3Uln4BVXYlxFM2buQXwAO3g/uKPTKpHM7ZfHYtevAy
	PjypLNxa49hoUXO0cln7guJ6d+b1Mw3PXASNlNVWJ4Vv/aEdPM4Cjmd8kwigXvUOaex6JMWkEO+
	l/G8ltVgwsBO6lCZpFlGSil/HzOONnf5pHK7zxabGMphkod6KMkPOBawD6MjjMEaSYvyj9hxS3b
	9DMib+dGoWysfeiiLs5WLeX8EyXUMdzzm15ZBJ9fRP3uJGtSKkY2lD5gaqZ8WW1BKVEM4SvfjQB
	F8jdF90Q+mf
X-Received: by 2002:a17:90b:1d49:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-395c3566ba6mr14771965a91.6.1787326863798;
        Fri, 21 Aug 2026 08:41:03 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:41:03 -0700 (PDT)
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
Subject: [PATCH v4 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Fri, 21 Aug 2026 15:40:18 +0000
Message-ID: <20260821154030.2514-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821154030.2514-1-sreeshankar0910@gmail.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
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

