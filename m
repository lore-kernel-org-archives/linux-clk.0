Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726F41D217
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040549; cv=none; b=bnl/vJgRB2CEScLqSVDxOCXP+lZl4SrQG6iU0muf43P/NC9FpuNSJ345K+es17NUVe23LrNADOpoqPoW0QD5bLRDhX2MkbeUGwTlX+vAbq0MLoqT+GpOvzQrubsLJRo6CPemFfMr2XafOdePfuYZ01eLpRq7tK+h8axy1BgMnDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040549; c=relaxed/simple;
	bh=9lh6SnLl8V0+6EkqXPMHz3NbVXtbKUgYWv5JtTJxcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3a4lWKX5jn854cRz0yO3W4ch7dxW7Jo4K8/d+/5vhjbrI1hjvLQobU1ED4oIVuOle+FPcaqUyMXi2+mQS7hW/QcaCkvdxaftE8x8/bY+Umlm3DfxZfslP2f+6DEwd5MHmJgLVNBTQUFn0NV1/2r0fdECa0DchMqPVY1UZ+OOEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3mAW38B; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3mAW38B"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacb8416a1so41709985ad.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040548; x=1787645348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=h3mAW38BsYjZeHUgtpAJqG0AzgkNFFTZlrl7UcAxllu952+AKrEXOd8Th1rzGLwLJ1
         akMsfwOVGolyAcDf8RaLje6Vh25fXnKfg2MUktDBuSPz3Ia3YluhJmX2+DswYjZ2Yduu
         Y7PUULH98cIbQvs/b+UUzYQTKBpM/H27yepQsFG6aC+QAr6VukzY6ihHcq0Ezcgm0/N/
         +ipa7vsyULKl8v3EhpM4CtAoebJr5eSifAzxKsJfYU+4i304KMD+aXTLI8GBO6umqCwG
         0TLps4l2wj93rcM+82fp2FYYmemyLS+MZHKdCfjdWLYmC+g85YLZGrWhLWGbQ3jt65tJ
         kn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040548; x=1787645348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=ZlvthQpbCIUSd+ScqMwin7VqmkyFJQs2DO0ACGu0cck8ZGuBP1aGeNDaUR3eeKfGm1
         /92iDwljWqTGZ9Q9T30T8K/3Ot611TniuCHsLIFPixsZ0sXOu3x1iEyIuAoKPUqVFKrg
         jKe7sNwIl6Nk9sLuf07OoneJOQC37MD30L6nK3RjkmmtS7Y4Imk13LrZ+hzFAFWiKAAs
         pk0Pxl/LvVM4sHPJM0F0ozCtgB9swVgYjr9+LC7jY9CrdcnTQoryOm8PiO2+JMCFYDwi
         3BQ5ldAydz4YFQbO7ndq8VqAj6R+bX3FH93EIOl58ezWPfIxORG3K6oy5NEwFU7r4f8V
         7bOw==
X-Forwarded-Encrypted: i=1; AHgh+RobcZx8aspO6xo0a1dS66/XYUKqT0SOVZsxL1kD0qWPmTPhjfF8OVTNHOy2+uRb9Nfb2VmjYVlyIrE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz37b1qjqY6Qa0bV6CD2hV10IK4IUvE51wwVoPvFCmVGittqCsS
	hZ6e/hs3bXPrkVmbVHNsXbPlNmaIeHX/Flb0v4rkTOnyqw6nGMZFPpUn
X-Gm-Gg: AR+sD13kN3oUQdFyZTCWmf/DATZdDlnnTwsLcsKOJByHQcIZ/f3Qv16qaddtijfpLfq
	0Qb9wmZv1Ri56kbhfR0ZlojEZy2h4DmhaWOyey3OjCeSxOS9rHIIVKEDFcEJBcZC+zVr7hTOIhZ
	PZHMlCeLdlXVV9XI5TzuKqBHMMjTtMeFt7EXcJRgLG/6+r96Bi1/XLCUoFmJ7YWZq6RpbUeglQ0
	wZBjm0pLlKECj7YdV3U7ltLLwjE5hy/fe1DXDq/TBkqANs+wHhPd6crFlJ9S/zoaqg1abFikist
	O3fxDf++jKJ6qDeLYR+sdpnwBe7dcq9T4fRpJIiDbM5WpP86S+E/1MHtHjQ7XZRvZsQNAUjyeAl
	dhE8p0BhoOLLj4tIRCMGpFLm7LDJXKorIlE48/FOmG4hrB+LD9nPkNzCzJSEbqHJhw7MwLzN+TH
	zk+lMIrr/rv9f+YPpn75/0iwxfG3JiI5FNNEAdPlMf+UOHPZO03AmnuHnywPwYSxd0ULIqN4+BQ
	/Lgeh6xt6xL+J/T3pWVBA==
X-Received: by 2002:a17:902:cf03:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d3b0b1f7a7mr335017295ad.7.1787040547743;
        Tue, 18 Aug 2026 01:09:07 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:07 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
Date: Tue, 18 Aug 2026 08:07:47 +0000
Message-ID: <20260818080754.4362-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

