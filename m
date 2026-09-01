Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF7B412C06
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246507; cv=none; b=p818E1+ubfUA7emdpb9PN55Axp1hUg5kAWNXHvxJ3ASkmCUm0bi1hSS5g/CwYWKLJ84k5MlCkWS9f8iw6P+vQOHoVCYWqgSIEuCks3/dZigLANL0RrYBWQUK/QKA+m9U1W6vNUpO1xgMJCw/0PfqtXEppLbUS3MXqJ6JbOi0C9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246507; c=relaxed/simple;
	bh=ifqmFvQHebUZje8XaAAuBMN9RaGf9xFULb+csDNh1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZweYdUIlyOwMgRKeAf7cWIflVaaffDUYtqbG9Tq2JvPnCCfYzWaznMwALeLqQjj0mGVwDq5ryuAbc19skLbWbqVDcbTJbNeKAQRf/gcmcYsyBcF/n0U7dbFHF0NL8qb26fy3EYUFJivIu1XMLBrg8gjKvBjxKCJBUphEfIKbM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0ViJIEW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0ViJIEW"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d5cad1a6baso42066295ad.3
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 00:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246503; x=1788851303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=U0ViJIEWb7M2VDGUGVNM2fvVDwg3cRWWP99I8Ms/4cI0FcZncO451oAiVevtR7hKLX
         5BbNOk/iNYBPmbm/lsAC/sl+uGE2YHkhV/fzsWTnYEpc/pa4UXKdPNRfdAI+nUjTvq6X
         /WTre/0uC5zyhDCyqJ4wuRYofsZwAw1dNf9bPNynTrg6a1c1d7sr92XkxrcOuwjFizzG
         ricfPMp9tPaDFEZT5anvYfNDQxrU9uhXr1xdjLqVVJhLhhgnfh1shs8dnozi22svS92a
         bGuQyE7UDrWf2zEal4X8sZxhr2kLrU+wr8ug5Vaf9aEyfW/si6LhLhM7pAceg/vtWfzK
         V6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246503; x=1788851303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=r8bnqP0MGTeF8WCSGZqw/MgZqpSAUboODAb9HlZfcB0KbFc/BSMMoMGg2SsVbWq7gR
         pS0VjRylQBaoxIZePMdOGSFoi1A0bwbVBOb5T46xJl9m2NoPmuZeZ43IqyXtiBkExs1J
         cQvI8xAmdtNQv5xxYY7agqei2gKnRLGKHuFIzrUzxwoxBqdYwk2v+5GdOdyoreSXy/AV
         m0Ns4ja3tF9EHK1jzz4lRhp183N7S4uHOKCTcKL3kVGJgMqwytcPUmyuBmtTBHluIbZ1
         egrRvB0vzTGvTaxNxQJ0Rr4qB5280jeGBxM4qB3mryYKD33h38/owXMAPf25pUrfmpsh
         Y69Q==
X-Forwarded-Encrypted: i=1; AHgh+RpvyAs7zqrA4w1e1xrj8UPP7IpREQpObqtmDxzNCmOa+cWmfwuD0kfoy+bLYLLWO+QgXUBiTqRZnPM=@vger.kernel.org
X-Gm-Message-State: AFuF++mFHFDFdDiHVSLfiCwRWy206XJRUCB7ArBRDNvD6wLNpkExuY7Y
	TssMGBlotL3ecADbxEXJlxoSucqNokC0JL5rNz+G4EB0cBeLDPF1LJ6R
X-Gm-Gg: AR+sD13wDN6rKHTfL9pFIUnJxg39b1MFnEdDwCFmk2NLRUkjL+2P/tFM6Leexspvf6x
	T9s1E9UC1RlCTRBubAs9mLBhBBPpeNrYIgP2Z6aGX/Hsv9NwTlSynLa+bTYjFKauRU4oaO8/TLQ
	8ZS7KpCXDdrvCvUtCdUwRtDLe29tmRuex/3aiPqYZ9/I+AO8yao5G0PQcVigzrnFdtx6OBysT3C
	arSr9xYvnh4YiMeqI5w18/so+23iCjyR2vxuCn5xBLVFE65FPIv4teSV0AtCwlGoP2k+8x75Rq8
	xFBzjjdijMEcwS9MZepaBc+imqO0n5BPvs6ORJGaiNjB8s1UD3ztPQgh8XMAM/s8gdw/zNDZ15G
	RRFKKZvy1wchi93fIo9Sba/bxK7xxIjDdSqveFSMY/UFBhnc6RaZAJE7I5NkABUxFehJf6hnsnT
	NgC41FW5uvNYRZFbtIDerKiQTbz87KIP50FxUdsTmdMQ7BTg3h6cyhfm2AlloK+txof/1fhR7Zm
	5tBVg69fsj1
X-Received: by 2002:a17:903:40c6:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2d94a76c15cmr81011965ad.9.1788246502985;
        Tue, 01 Sep 2026 00:08:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:22 -0700 (PDT)
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
Subject: [PATCH v8 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Tue,  1 Sep 2026 07:07:10 +0000
Message-ID: <20260901070717.20513-6-sreeshankar0910@gmail.com>
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

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5..45d3cc861 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sdx75-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
+          - qcom,sm7250-rpmh-clk
           - qcom,sm8150-rpmh-clk
           - qcom,sm8250-rpmh-clk
           - qcom,sm8350-rpmh-clk
-- 
2.43.0

