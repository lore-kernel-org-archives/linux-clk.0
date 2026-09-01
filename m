Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1DC479863
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254767; cv=none; b=BNgGr1tNJoAwj8UTK5M1VFPFxlLbiPKeWJqB/t64mYslT1+xXxeKqAC5T6Io0m+zLRHH8FuZirqosZ3owRCT80pW+cGbCSW+5KvDEu+Y208dPAYiIdFrNoUQIs1/gqzcXoYHCLXKSd5K/RzPYWHmMSqOzo80vSRHmn+IWG8ugIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254767; c=relaxed/simple;
	bh=ifqmFvQHebUZje8XaAAuBMN9RaGf9xFULb+csDNh1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTN22Towmv61fJXR0RZfUjFypI3Tzmwl+sQ9RZ6dw5Fa3xXCifvSHg3vN1qRJamudyVvzstzfVjw2lnW/Uah5Ex3yRLLfPYK1tIl0uis9LxpkcOGz6wyKzHExEqZRMrV5/3cmlwRJmYnjGvJUSVVrVCiuAlPcnSEh9wEtp4iwTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zyc+zb4k; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zyc+zb4k"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca12086c06eso3628191a12.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 02:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254764; x=1788859564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=Zyc+zb4k1LF5GQSSIxH8qNodIGxCNU4SxdlhgUkRaMnP2ZI40y4H46QFiXiSZOxcRc
         iiXV2nINb0cs3+yF1Hcl2y0x3D5dH51uQxNpk0MAwZHQBNBb0acO2s+7pdZtSurS0jA3
         44FAIAXDLSvC2U1/143rnhHbG2bDuNQYASzByJJvJmw1nfXgVblmRyKFQ+qCeDIOTAyz
         OlYGoMA5Gi9tn4oc8jNtw8u4z4dRh+TZtZtZDsJ0YO5IVx4pEN0qjpVtrERmTeDy1EGr
         FMla81ClcEEyBb5Y1K9HrRwjh93MO9WuVoJyOvZ0f5kYv1dqHQsTpxU0uyoxoqBU4BAo
         OmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254764; x=1788859564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=Ihjn2btQfKz24rrn4cyPWq7qyv1ed+jGzHVZlcM+zisgqMXCPY2F1jq/MN4eRKfP4u
         pITBHUAbat2ooJkw5RZnfBKqfU4DHkqx3JC0Uhofg3iK17LPk1y2u2lx7MkhdsAdBFBe
         eIq8vGNC7bszJpeFWuG8/7ZjJh55iy4gLl5W08TzinwwKP3STNzltjOTmmWmJoa0NNty
         CXhTUgRKHtUkS95lefZuwLETfnyOQ7giy4NbVNAeeuHatP/hDaySw2KAYMh0htMJYLX7
         hSAmOv9ISCW/CFMfIk5GPBIhdThxDk17F7UPHxYqq+ljXISXQ7W36xe02T9E2evdV0q2
         PZcg==
X-Forwarded-Encrypted: i=1; AKwUvBx50OCrbmQffM5fOovoK9tbQHj7/vDjsubp7M4yJ4VubyJLy6HKb67ISTCC8HVVxw1pPFMiILumupM=@vger.kernel.org
X-Gm-Message-State: AFuF++lZbqGHEJ/jgrU5WSLBeBUEpV53PIb5DrpblG18sx6ZwWrQ4SKB
	cbQS2Hp4h31bU/tZnWeydATKjvqMYF8LBTB4jFsjV323Odtkbs9s/VOi
X-Gm-Gg: AYBFou3qp9QDLjlmYACiqdRiUo3Kcrw0gX827egjnCtBZ5uTJmW6UzMA+kvXQIhI7FB
	FAa+MXjAJ/Dw3X8OIsrlNCa8yySqzPGksp5zl04ceIM3GMjGw+ks3HtOQTZHfMG+AFvHxqrEaz6
	HdUXScSGDj5oRi3imU2V8cQuANcZ0YDe19m22au5UV/6fMwuAWIlHWe/t81b6SlJmFTARHVLhYP
	JC1HT0dpu1ddr3qn1//T5muXUDZqXTlN5OIndnStoG13EqwWiOqnjCNJ3UAQfYW6NMCaBt1GvFk
	gcOiJPKhhpRNtAGYpogz7GR81OjJFG0yvx2E+CwLXX8ZhhTgpAXJ2L9ywahsPM+noJczcADZ33I
	iyWmjv58fvOwjCJcoNMnlBCr0UHD8u2TyMSSs3vk4y4AgLYwPjWsNw93XtseXDbCLfivqj6M+9T
	BT88NX7u1NUBki+8F7jWqZCAytw2HMrZtUIJdCCEzgbrBsxhePYIr4qxWnZ9PNUeodF+hdq0Eue
	2IqdbPggW14
X-Received: by 2002:a17:90b:538c:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-398d6e68870mr24005130a91.25.1788254762915;
        Tue, 01 Sep 2026 02:26:02 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:02 -0700 (PDT)
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
Subject: [PATCH v9 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Tue,  1 Sep 2026 09:24:40 +0000
Message-ID: <20260901092447.3028-6-sreeshankar0910@gmail.com>
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

