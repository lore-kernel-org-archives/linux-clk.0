Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5276367B94
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583755; cv=none; b=jgL0fATAfOsYwaAYE5GWFINRXJGbcxh5Ncw9FNdDooBtf5S/fktBgcn/Fls8Qz5EainDEjY8lzZosishmckCiymYsG5Q4gKlmnnInrTznkJI/UX+fKlmDI1aYy35q73UO//QhcEks6SH7ynN90wHMHlx7wXk8qQb8Br+KORr3Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583755; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbH2A/RBUo1l6XCqqX91N+/wzPP21MFyRuS3SFP3JSnI7ZwMvldL3QZlv06ECT+g5HlsFQR+uXuKZai+yhseyFOsOGEg7+jzyMTd8Tq/7BY62reLduG+QJal5VXuAH9CybGPTVbe1JtmugKnsnUWxGELGHS2I0u6euvLaOQDKAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGFEB0Im; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGFEB0Im"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3141814a91.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583752; x=1788188552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=sGFEB0ImFn6eCf4biIshmumdhAXhU8PeRpGBdOgr1yq5wOau0nfXFQQP5vJgI6qNCY
         rWHKP3At/VCAXDitIjCmQcNzAsdMhvJvqJbtVt/08p540i6sJAuePrMDJJy7EC2jOTNd
         oFXkbHtbrVAmNM80+zAiz+Qd1RHda0YPyyYnRCtUEDkQbrldFHgisjtPFknfmpQb1lwp
         px2dQ26mFWqXO22CiYISor810tyXsDUw9Ldhp1aqNUfxARVC8Dk8ASev5f5yfqeOp/9T
         irW089K0d444jtVGmodWMwSlYRiPWwD14GT9Kcs25MXEqGlQ7T6f9YqkEQKugNVVB65u
         kITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583752; x=1788188552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=bWJfm7eDJzIO1v8me+ogSrKMNVfDUIdXiRQXHyH3eImL5z1vgnREeKy7n7p5F0EYcJ
         swn6vfsf0Y34cxwL+RwsYJSrtjYbqFqEDFfjNWrub0vl7YyagfwFrKoFUnM9wqaUR1zA
         8waxUwltPttTOo+bGk4w2i9Ss72P6cOBk5rYorqdGoyq0EVKjF7qYA1VRlqjI3xfQucw
         yffJgIe5obNCIevh/gGyOkzRI8kt2L0gMU6Q3q8aIf4Axxe+WIWBMh8+XnOliQlobVkm
         rwZVGMIgb0RGUsfCAl58OXrr9o82MbjsNETkU6/zIVbjmdKU8+YwMM8+d7ORAXeji3bF
         r+uA==
X-Forwarded-Encrypted: i=1; AHgh+RoTieb/GR2m/QiWdddFq1owOTw3qTtQeTdo+7lum6ZTy/M2Nt6IS0pii24kJGEvZ1+U6HW141T4Yog=@vger.kernel.org
X-Gm-Message-State: AFuF++kmbLgq5uLnp956IJGQKZ1uKKxFnZwttU4nhVT8l53VwqrUIegL
	UbAqadZpD2vArqaZvPKmDK5xJsmkK32fo1tmfHsStyOfhgZBP/iVIi9l
X-Gm-Gg: AR+sD10HHN+3PUWElxH+2zrlp+xdYeZl5rGrMM4khNff11aATDY/fxr+qjsvUHa6LD4
	9N0MCzn9CIWehvf+5uvQrsE3Qr0HlpvLjR7VioUIW+i9+405XLi2Al/GQYWu/c7v5z+DOeB01af
	1LbsrBHKeFmUbCPh8gj3ZqHQRpeilwN18cFUj7YLX/b1bISRqtYwocmOV/JtVSpgY3Oa8d4Efr0
	ULzgI3Ki4CKhJ1JD84jvT0FEt3AAsFCSLKgh9gB7xgZkmbcCbGHEEorA5yIJaqJcLLlCe0GnNLv
	8IAqyACBSMBeFJ7t7Q0Jo0KQcnw6fFerwHVhGCvrZAG3PodugcrjMiTfKkkmAZfwD6hJO6/aCQs
	ENJv/izLDI9Fv1UldG2hv2LaA3raFxyteotmRR8hV333kxpW9/z6GC61pQ3vzi7fO65QyOvhI51
	TFt5p+kZmo11qzJJDDlp+LU0VKsAX9+4dbIn5hFOkkmEObyyizH7oyv9Wz1unQURCNBQ2WIIgPc
	iG7jXA4bUhZ
X-Received: by 2002:a17:90b:3945:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-395c37199b7mr51357783a91.15.1787583751929;
        Mon, 24 Aug 2026 08:02:31 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:02:30 -0700 (PDT)
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
	taniya.das@oss.qualcomm.com,
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
Subject: [PATCH v6 01/13] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Mon, 24 Aug 2026 15:01:44 +0000
Message-ID: <20260824150156.1310-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824150156.1310-1-sreeshankar0910@gmail.com>
References: <20260824150156.1310-1-sreeshankar0910@gmail.com>
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

