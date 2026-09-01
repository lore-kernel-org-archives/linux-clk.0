Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368FA4779B0
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254724; cv=none; b=R5u0QS8b/+UkY5DcsAJ6150bpcc6JZK1QfHlEvyDrTs13aZ6rLzrNwWNcf02YPmrNnBHaCBNzpB4kRFQSfe6Ve4cEqHlyPjmZcyL0ACZey4/Y6uZT6Syz4ihFyM29a17W71/S2aXSYb9ViT5h1lfEEoz4EC6hJKTYIjssltBN2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254724; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plm9bAFH+myboVm5eFY0L97KaH4+0PXkVZJFkiCTvassZqWll7ZRPekY2HonT1Q3jwG5EMZIf067Hzd0jlUAE4Zy6MLr7kfn9X6+OIQzK5v1tN6550WCaDWeH9adchO46GhSNriJdn0jmZZ0eULvJc8aPML4KolETFEeyFdhJRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WV41PuuF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WV41PuuF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so5133992a91.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254722; x=1788859522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=WV41PuuFeYsyXk1b9gDkCZvvept+NPgbGfwNq7vmNY5NUfB1IN1R+tqm2tEBO5v6bf
         g7UPol76z2GU/PrHhb2AOsLlkL5REtm2SRLQ4boZPKb7m0SzKVqKXo1gZrzGEXyx5KXk
         STdsSWDoGVa8AXP2sYfJDASS1XoRRtwQ19za3eorBsEs4IfErBXr5ZI4WTmydv/3n3yb
         bq42BUIy0UDroNqvQ/lqEUXwG8kjbgYi5nn2qxzeimac3mX4mYnUYuoshyxekABJCrlq
         u6YDkmeXKJibA8Hkv9466DRTAop3FtowvDn3J4uD9sqJNQspO6y57MlbKZosVQns5yR2
         /7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254722; x=1788859522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=gwrpyd2NoK8IZ+87uYc1xlnaqteDOBM0nqUgaiw/bLyi09PkNeCcJ+/0NdJqu3T1Pz
         VcZXbp2u6NdR/CTZUeuVdD0iiyIVpbU0+wDQWX1kvnBSLid+jrcPtncQVsIE8wQ9ok2t
         fdhUD6lXqdi7dBHoRgXKFi8keMymW/0BucoqsiDiGCoOwYdSW9cNnGYdnXYUv7Blf5sO
         ++ke9WQ5JY5c5l2gQKjmI7qdFCsJQyS45mStV3YM9zQElqLvYRumUShIBeZqqro+AjKm
         RTCYBDoQ/WGmvrzfPjdg65Pw4jSezE0tFrP30dJrTZFDvcxFRXsFF+XpPBeuGBCxte50
         67OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHumQbk/zgqtZiLqBDjR38elRDN0AiGG4OiJD2IHLaMIHC1MERiAZeZYkIZUY1zXFkku/1iltCpbg=@vger.kernel.org
X-Gm-Message-State: AFuF++nl5lvMgKEMRFsubN6z2IzSPrVDubWrjV4DUmPYmuqeNrjovDcB
	JD2sa8SPnsYnkRgvXWQhy4P8InboKVF6Kf7LwAL6Z4eGWPXxWM4hoyVh
X-Gm-Gg: AYBFou3wmcgyDQC2+qOXJsBnyDKIpGOB6fzgafx6KNo5dOXjHuvrIRuDhM10p97ySD/
	0jfKOKYPD7FC52YohO86gv1YsUpiu8PxmUrORs5OyCr1z1jPAE/0U96X5XelHE7+Ms9ARznbmw0
	0bTXRPxUCR3My8yRYvlMudEKq19agDBfHIj5Y29jyxBiCGojjz3R43etdVtZd0kWOFFjaQT2J3x
	LW0xiogjYsJz5vwYkvfreIWEVCvjrFgphuo5U4XBW+cTMYXQD1ltLqBridN3H2s+e2wadjZr9g5
	dYfP8Mdi0l1KS/x6U6Bm0wdaVwpQqiM/i7ibxJ/25G/JFR2iSTg7k5lzBJ5m6mCvBDpMn0QJoks
	uqjG9Yi0q9oKFbPV0dp+OnU+kiSR95Z4w3Cnp5fm96vQ/huyTyDPw26+z6/L+T4SNq7UU6RITgv
	s6/738NhwEfnCqOPdNB5KmEGwgkCOyqhJVIPl8sRBCuiqIZSRBmZUTMEkwOjCf/PYmWmY4OTXna
	PwHWK5ifAtvq0Kcz0Bxtuc=
X-Received: by 2002:a17:90b:224a:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39907e0f9c1mr9051888a91.15.1788254722293;
        Tue, 01 Sep 2026 02:25:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:25:21 -0700 (PDT)
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
Subject: [PATCH v9 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue,  1 Sep 2026 09:24:36 +0000
Message-ID: <20260901092447.3028-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
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

