Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF13F41F5D7
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299969; cv=none; b=fvpgnUQcIWDebZKzzkYOmuDc/UbJihUJ7RSn4KfsjoNEcNXkn8Tar6J1bfVedxgG7gHJ3ywpRHvMWXZKZsq9K0gbwjVpy8uiHC0u2TYPoJKEwlbI6uZu60ItQxDoS8XzovenB4qrucFDvvGk9oJnOT7EQpEay5akjfnhuu4/m2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299969; c=relaxed/simple;
	bh=KyU8fbc7e+jGln1gvgBbCQwRZ+9nqq3IhPL/wCHuXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRgqrIA6+WrEEFjoEbxx++LMu7Xk+Pja4LAVDEuH51EpT/HCYW24eyZKZbShJr+9vXjeOJa7L33YTqN5QEVFYlMhMaoVNIJgwKp+Z6KmpOxQPodBHeLInUVhHtVpfOhDhaTFzvtk+snDYRm8n1qBwmQuB4Ab3hoqz372eSpWg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scASW0vp; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scASW0vp"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso461556a12.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299967; x=1787904767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=scASW0vp31nf5qVKfqyVi/ygjtkjr+we5uVdhmP/o7Kf7EumwHmdsPXH1th0JxrEvn
         eh5ULlEA9n+MTw1t9RLf2R1+H/xFiVwy/RlYxIFy++f7xY10vXYHcFLQBIQX/jpvLVUt
         BCMXLEvvlpaYyVPboRA2OXKU+lrVgWyl35cUtHZq2KJNVHWG3gcewa4Dw+r0Kn4CPILt
         D/q5qfht85ns7deLgBmbNZoFic8Jcvd5LjfcxdflzEku5OnCf3DIR0vFnCY1dFb7xblC
         0VG9AmDQFbOyBOMcRrgZuyQa1FcXDsg8c9yKnc/wJgb5BYl+bZsTfm2TC9tXP6OMmn4k
         CCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299967; x=1787904767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=L21FYvKoJgLh39tUD2xfFP1lyHg3YWKrhtcaDkr2GT20eQZB1KuE9oNNODLv14exJm
         IZjWc88rsYu7jyYLyvD9qOnH53fHRb0afdr/zYQFsu2gATYAUSL+/7JImHlk9FcOMapV
         75hjlEHpO5D3+UO7e3XGe3JEzBPybZ0PMbLxVU4WigFkWkvubrOr3U4OC6bWZFU3q5bd
         w7VgK5t6uFTydiSVp3AiBXmRPDOtZAXpBQe55h8UelPpFqMBskrV9PGUeN1LylwLQkXi
         45U+27SPOB+mxE9r+baOfMbmbJnYDRM4gr3U+c9qNYbdognDYZiJlX2M6KYf07DGcGxm
         pYVA==
X-Forwarded-Encrypted: i=1; AHgh+RrzVWaAlQJj7B7YZoxDabGSy7MNJrnnU2RFihbzW7y2zsYm///dDvOKsn1Br0lGEZGZuyeOuZs4Vk8=@vger.kernel.org
X-Gm-Message-State: AFuF++nPo6qgMI4bMOd8HR3aGK7G/PTBFT/9k5lTuRJdbKleRQuWWMyz
	760JZMD2zRpQLyn31jh0kpPmn9glTDBGIXPM9G24QUSOBgeEn91BDfaL
X-Gm-Gg: AR+sD13GxP94CI9owCtyT6ASpRbFdyqT0RLN4lDKYU0RR+5s6X7ResCTtL5aCmByvlS
	Nidg1vX/1Ai2D8OO47TvanHtLE5n6ZH6QlJsy2g6ETvcd7+0ten9u/WTXv2AttUbono8GOB82AJ
	s/Io4E4za2lMZ2TsQjgpc2NtlxC3Jcd7NfBfnLH2zjabhv27LLddBreE769+hO+tOzjGLylxaa2
	Y6ngAfMebxWCF6o3sl8w7zsh55+68Q9sTKjDbSW2V2afLKSzUabluWgYQfwsP5luU+9FoO8ZLd7
	W6RpwTSm/xa3EkaLMlxsTluw5ocDtn2hD5k3I/acQkZ9rXO4qS6IZOlzghmv2v0acBWPhETLsTB
	Kj5a8gcr00TXV7dpTUPMOq1fWTzMZJzAI/t5IacqDwu+NAlyrxcagwg1Pr7CdUevDMUGekJrEGF
	e9i3pOPsROrEw4CTjlaycVuFm7aOluUruK8iLaihEWgE0fZOaYYXb7uvPAx2MuWyCobzlp8egZ0
	3Cglz/9ZfnH
X-Received: by 2002:a17:90b:580f:b0:380:f389:447b with SMTP id 98e67ed59e1d1-395c386d163mr9033418a91.11.1787299966990;
        Fri, 21 Aug 2026 01:12:46 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:12:46 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 05/13] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Fri, 21 Aug 2026 08:11:17 +0000
Message-ID: <20260821081125.4522-6-sreeshankar0910@gmail.com>
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

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

