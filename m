Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF0936A364
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 06:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245076; cv=none; b=eMrBNIn+g/eAW64itYQdj4GxG8kb6pT79vUbAzDlTz4NMqKbR4dzbRHaGl/UH5UPEj1Uz+QRttdV4AF55rLGJp5CEPtZOUuzPhjmZ1MLqemUkB9VfYQ5Wns/Aoo1zl1rM/4acRo9vvKG5GmhqrNsGxEiW8o6Y2yDmNc24/jeUtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245076; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUUjOd1p/A5RANbmjuoeg1l0IzdR93/YOOf89vuGk2R4k2tNvN5nks/NBS99roLLrnYw7bRzR2gL7xtrOHy1jONH0xk7/NyLFkZAdjOI1mpgXU+CMlsKuUE19wPOCqIUBSKUoE7jKT9ADxERmQBfBD5r6bJyANfOFBX9VI+VtbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuoLZkhX; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuoLZkhX"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-85377c8bc96so4108159b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 23:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245074; x=1788849874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=kuoLZkhX0FoMYc4suTNrfEeEZbvOSZehTD2Hk5H6lbITmNxG2Qg7Udeg7xHCVzDJ4F
         j+NXxhuW9NoAGYC7DwPJqTESYk2a2dUJ3VVoluJDIF+SPCx21zyL1Yln3pwo8+W7K5Vb
         9AYP0tT+2J4T3tNGIonZ1s1TSCbTpRF12LeAHEmqM4zBNOWDFxt51MdgaKxdQK3nv7Ez
         LExnTlHQoNm9uuVxpZ1GJXNIFF+pcbleJwW77QNY7jXkakx5kp0k5SGIR0FxoImTgifm
         eFdCfLla9FEejyiHwutSw+amQzHXOvhGbJJyBAec2jZNMdaDx0Odb+ypba0aXJpczh//
         1n1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245074; x=1788849874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=RTmQOKaqk9HkllzOZykUWcvm0efBSm12xTJQRenmEoyvvG/gNRSToNoivfS7xjhn6G
         x5qe4lFAOD6neYk0nIKtm1RCrf7BVLYsmiGlar7207msf09Qxz52Z9enKbSU4cTWtoZR
         6WWjOLEKq+E8xyaure5+az7b097SoAHen9+kahi7ii6tBcQaB8tWcI9aipSwK5ZP8ZVf
         Dxwx8/AlWCiGVPQ8NDvZVRSen9aorT6ETCOJEJooxsPwfZJxM21/8qQ9fge1TgQ8zqPt
         tee8vL5clltiX1rlPUR0iIIzi3UAIUodCDIlWOibpctT+Vjux64Zdez5LUyNtaiqB6S8
         Z4HQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqqqG9wyCD44hsokmMik6gnJWO64heW9mkTmARSjv1rb3uyv6b+Lym2saRR0AVBiMHfZP5f8D3ZG0=@vger.kernel.org
X-Gm-Message-State: AFuF++kLakg31NxxaA3CEC5L91qIy54tbLtPQIJLT1SHQBOlpq+6s53+
	fAJF9Rp9Z12Uz4rEz+K6P0JNzuaJPWXz4bt0z6fdWCcD8Qt7am2pvify
X-Gm-Gg: AR+sD12ipINtUI0qD4kFnSqPJ5dlBS9hnCpuab7/j4XqtsUrnyc3TLLxA6d+74aL3Tk
	av0kIaonm9jvmL+IAQQhlk3igvT/RbBxlxdQeYe/XtEWRUbkMZwXfLmNe+Ok8hLeUYrxVI5nF8I
	TFvGg9TINtCnVvehBEJOwxm+o0FG/rPa/m0+dt3ts17m4R0nhfBhCxPC2f8vID1wOcL+RrB5pFy
	qQcWLrH7chPyElhmYfX6qdOqEDx7BxjQ1z56qIGkRVjHIgLH1ufidwYi0qNBeYEV2+sOy9jiG50
	1EceIn1Emw5AsmVwUAW/ltLnRAekSJ75bMm3MbEsBTySReYHGOsF0a9JSsxqIu1eqdkJK0it6mx
	ZTLCRR9ru4q+VZf6drCAUKf2ImJYJVFugestUzTpWFyV59SizylH4jmmaa1X0H63ElHG4MuNXHy
	5VIol32S37tGL/WEQdvhcmL6mbYA+KGxWvM5bx4HgEJqSsYrSPum3bR78+d+SdkVAvY1na6QrNA
	XcVGIr/GvncuQvbqk4n88lD
X-Received: by 2002:a05:6a21:b8f:b0:3d1:54ef:e8e4 with SMTP id adf61e73a8af0-3d2688bd7cemr51274908637.17.1788245074075;
        Mon, 31 Aug 2026 23:44:34 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:44:33 -0700 (PDT)
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
Subject: [PATCH v7 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue,  1 Sep 2026 06:43:46 +0000
Message-ID: <20260901064357.20055-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
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

