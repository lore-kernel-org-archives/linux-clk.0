Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B665F2C21F4
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 04:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124867; cv=none; b=JIFqc5mmftlBE34qoSmFJlLe5L84U4wgvENz7Rd9fOUBaNWHpukz+wXiQQBcMrs7KYcsIyqUmFVwHuSECHyw7wG6f6euJW6Ab/yLJyHroCLfG3zM+fHPwNxl3eeEMEwRzyH9pM6maU3+hXT509jKlAU/gh9RdOK6jSbTwJ+VXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124867; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rt/L3t6a/j7A+sGb6vQXQ0rmn5UsstI4CC3vQnkc1KPBjjo/RT/mLjHQsitqf2a4vEAaiBDQkdzKMk4mxlpJOF9dCLVqAA0hvzEimi6gYquO76FWoCqtGWUObTpNHW/cG1jbOzkGETcD9Dc7BxIQQruYRGIkdoLULTlmcRT78R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qE9XFzBl; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qE9XFzBl"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35ef6b49813so3359098eec.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 21:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124865; x=1792729665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=qE9XFzBl9jyqW0qjMgcap3bqgVdBXPoEBrfDfWilfmV5PorLJ3FWrq/VqezFhGqBPD
         QUSXPOAhyETm2SawYS+NmOpbg7H7FiEyQ2YhE4toQyxzuYLIKSxdWx9ylCvQ8bhWckOt
         RqHUbrCpcc4UKTbbJEAU+/ix3JZDcxlSzKd97QoVeFCWG7W6EHBP7C+W8t8G5dbSDWh4
         g9G9KbWaFaqQKf6CqeTrPBlI7UhqoV4ZPJtGV5TeXWDTAzLLe6QR2Ab1V4My+Zqo9vmT
         Umxn4d0sz4+ebloIx8y8XD67YjuNGL4USKsC3lamrvzwe6gpCtueeTV0TfbaVhpC5W8B
         YstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124865; x=1792729665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=pMXCUzwaW+n5YGkeGGuRXD+PpMbLrACKQPW3mAQKBJVhutleTUwnvpTYya5A+7G2Kx
         L+CYoMq/+Z36Jaou3X9Y5rUQs+BqGi4KRDmGN4lf+o0GWws0FEvCEV2RH+j1axwunXbw
         YnfM64w1AYV4i0IcawiZpr2zjdm/yVnEDs/V2KfOb2LM37UHTo+1bW4wqcl8h5EvPMaV
         EWml/3zGJOE0vIU/Ytj9xm0xf2NPxIrN0Bf85eURqclNmxk6Jgz+ZPZEtMJAIUJkbhpo
         3WxOJiz7+TW8Z8dyvxr8BN3UKRWY05TR4jlegWcVqxuOV4CHbjetFficFVO+AspMi0pa
         n8uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBVt46NbL+5fU53pLfDliuzK2FmcbMrFq0njSQvxdeu3FEnhYl8/gmkxXmYWm1h6zUTb1UhERIDi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzS+p9YkUk2wI1xdKEPnaF+H7uRl/6VtSw9qUlvnKEObCzdxaX
	NuWMRVzbwZ7MFgDfAWVnhLuBjby3UuJSeXnTdrfXLhZ4cLFzl40Vnsaf
X-Gm-Gg: AYBFou3fGZwO27jKknVVs/B8ltCKkMXO0G20SD6PfBvMaBM/zSez66b9xgMeHmXqSqS
	TQWzZGIJBidVGuQjvA0oKKSpVXM3AK5au9KdsHrKpE/FwRYEaPlFh3PkWaNUT1bQrGWy9Od7yhy
	GY+nf2rCZGmq2JGSEaBcdhcFY4i9uiElcT21Ifo7HYPTANxLppzKXNO1OL+O/aLD764fKjQntYb
	EosnQA88H8iD0hO39M7Ju8Uw7ZjIEFDSUjUqtzAFd0h4AD3uTMMXGffnsNI8tdpLr7DD8iS3X8P
	k7m5YSTgndVhzX46LA/rEru1DSZylrRyTxlPFpzVlLfodpZg2q6uM7xyU0CLBALO2MZTYqYsC5F
	6eMYtN3OAzwhQlHyFM+VL4BNlG2BXz+aGYhziNVDdVBOl4A+P83WNLoJSiYgkj5fhmJo2q8FwD3
	Q8YONSt79YirNDfajciGbSM/Z2oBaek5l8z4BabSGQ7SPaOjq1SDoy88nthlBIlNRwXLcReyY+X
	svTkMscxEgOlEWUM3DI3KFmGwcCz2K4HaECl162EHquT9ebkSb8wQ==
X-Received: by 2002:a05:7022:ea56:20b0:17f:7280:134b with SMTP id a92af1059eb24-17f72801559mr6984891c88.30.1792124864684;
        Thu, 15 Oct 2026 21:27:44 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm2644712c88.16.2026.10.15.21.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:27:44 -0700 (PDT)
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
	konradybcio@kernel.org
Cc: danila@mainlining.org,
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
Subject: [PATCH v11 3/5] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Fri, 16 Oct 2026 04:24:30 +0000
Message-ID: <20261016042432.824-4-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

