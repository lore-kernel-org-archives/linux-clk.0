Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD4438F95B
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326946; cv=none; b=m8iJ2Cc6QfrMo0o5AGxJoZ4p/ycRVEv/R3ER0vngpoh5asln0glA6/3OCOpcYdTxxmcmLh10CjpfH1h3Ug8r9oQImy3nakuldzym5RYdBvQvnjGPpg1EXGW2CXB9eBVIIAbBa3xSDPqE+LqosY+V3XkraiZVZFZK5uRrDtw/qEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326946; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyydMgkT4cwJJNaiKLqs+y/2VoJmLjiUPKw8ugqNlTTUy75MK8w8+AYs8MOdEOHFOkX7ghsK7BzSVia6Ryn+qHHApiMcj8qYUzPUBf9256eADL/wDm7S/SMWkBdE3qLQufVyHHiyR9kJo95d7zdUkXgv0Ga0drzVeaj1+a+YlGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1tHq6Yv; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1tHq6Yv"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1407350a91.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326944; x=1787931744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=b1tHq6YvPwXtf5nW7b5uSWj9XO+kTtJ/2lNdtA54MYuJaDu+vqHIdmUCeJrTNxhWqk
         N/vfTXI3kLTGzd7nrDzKsDcgbpjfrVccjGAvh0JKGjYIshjzYh0xEQmmijwGeDzJooXC
         UioHgEj6kX3fPMAmH3XrSn6v7++LMIlcUs7SXzuKIj2UeWrRDiatF7spcn+CRjcWLIyy
         gF3M9IrGC1BHSaRU1uJc9mcUasZOLCLzxHENxeKO7zl3V+FjjTHRmANPWfhIhCmDlIyl
         iv3MCAk3Mqg3+/nqeKX+mrvq6k4lizwAYNYrmYRBo3fT48lmbuM6uVctTJACvYheTsBa
         ZNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326944; x=1787931744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=k0hPkgYI5s/zTCFtXwRHZupvAc8sfrfsrxb6BHUcgd9AOyQllWwsIBfmUL7qqIl3/8
         5+oKtrbGY1GvUhaCuHgruLcMcX9qZ5NESz6PrIa8QO0l7qpILgTB7yOcG33gQK6vvX2N
         aTj2hkn5x6MRMLzdMX5cbrK4SW3lLZvCvBnWQdH+tCcVKMIhjDUpr6yT+6L3TTmgiFzK
         eJWf5D5Uo431/KW3fz+HMqjFz9re9kGjM+BjRiQsQzD2BLrcMc0fBWHfgF/d1ILtcAhx
         p6WY/NhvkPnIHCEkA5G+HDApGTI7VO5L3At9rlM4bu1Ptk5kj4iFP+gl3Vht/Lv8ZllA
         M5tg==
X-Forwarded-Encrypted: i=1; AHgh+RpGm8noMI6H5YzGLr4SaOV33YrTfPbEx31id5kuR4tEwpkxnkWnWZj5LWkaBJDdtvPASX+rVQpI0J0=@vger.kernel.org
X-Gm-Message-State: AFuF++nT0V//Mo7/DQtpiUx2FY6oosVtm0eZqyxae3JqvSsHyhYhsyUe
	DK7gXZIjWBWNJ8dJRsV5jx0cHxA2/ONhOHzrNkwj3xzaDE/01zxW6b2o
X-Gm-Gg: AR+sD11rTMx+2/63i3hu3zxeCVERZU1RSKy0zLPqQRpxwz9cDlcRAbTjDc3DNtQeJ5K
	jAVtmw+4tRx9/XWdwoQ0wiJcb+uej4oBwaZdg+SUVS7wor3iOsfxW1CFYWpmWouWFLeY8m69hNz
	xJbMRDl+rFDWAeddZHjIKOFw8D7X2zJKO2LBuXuy3qc2rHI9GSK8w3NWz6/XXBaqzlmVtevrvOX
	fJ/F30hSbl1FeGj3EyL9IcNnhVv1djuuruHrGqSvJLoTdnBQ1wwUGuiDUHAVQi+bnUsP/3MQ8RI
	xr4h7CT/Ec4HsiYuAfghkJk1IGqM38yeQMRhVJosQtT9N4GKb7vSUQimcUKRUIHlBAqk1jKdYcm
	3SSPwE4F49BBCZGEYUUroaV/52/oQSgrm5Y1NdAsnMgfxdIxyB4zUslxWzW/Zjt2f9MQqYj3yVr
	zh1t70OzAkPwYerdiCy5KziVGVdXbz/G/3XPee3XfI7SDoIbHns+zFMmMq5XgqjHdbyTy8C2sio
	t+Y5n1paPLe
X-Received: by 2002:a17:90b:3142:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-395c35e27c2mr12635806a91.9.1787326944265;
        Fri, 21 Aug 2026 08:42:24 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:42:23 -0700 (PDT)
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
Subject: [PATCH v4 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Fri, 21 Aug 2026 15:40:26 +0000
Message-ID: <20260821154030.2514-10-sreeshankar0910@gmail.com>
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

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

