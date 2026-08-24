Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1041E6D9
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576777; cv=none; b=gf7JsRR+M2MQZVJqIcADbQOfnH2vDGxo3V4VPVP6jCLl/w0KqCfIXZlJ8yVUQ4eckM3xtMSA5P1sLL4rybHJEXYPw+0SD2MQWi8pJpTtKitKrZLrXRuwxbwFPsfpSxd6e9STcq9lieSSe77QWyu+VXIYsu8N5hbquY4TPWrwJGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576777; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkGPiT0foso8mnzd4lzQV696GcuDUH/tAKhb5EdjcEpbpyGz22U5fdDe8bixg7eRBp1jh/h0pG8nklT1MuHmG2+d1qSa65D288ArmoqdAh6LdFnv8z2XxTapvW4scwbDh4IrCilRrAWrBIGYXIZEX/nW6T5kvVAmy6GhrSN0D/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZUZvbRo; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZUZvbRo"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca80d708489so2246429a12.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576775; x=1788181575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=EZUZvbRou2Xr7NLyyOa9VczdO3YZSlEpiVXkPK6fzNAWVUvvpEoUZvFTezWV5v7ktJ
         jFoHb/9DORa8sTyg+yTNAoaXxgugfUDmdNCji3q8lMjHUjhR5C3Ky84112zZ9Sd0BSG2
         iaAwT6u6mXQVshuR2/o6QIpM8gRpoQThnOmtFQqnj5+0ztiSW36YggHoY1IFmsIZ2f3a
         RbnIC8qaw0p/pIi9loXDuIMKkLdVKIHqg06jXLEYg8+NsDI9TWDMxyPVTjGNJeLhL/si
         jxnyrtQkk+whJTMP3lnQ8/E0cB+fECCNSgKSA3y6hSXx8yFq+xEA01hu/Q6gGWYowr3v
         AiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576775; x=1788181575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=lH6gTbInmnfdz5uD/BFYA9ALtQJ5b9132E/PKfZD1nvafAZwxoMAS9Nj3R1pOp5BvM
         vU9kqLzuxe67TmxheihGg57WdXPrO+bXKNSY5+4b1/bv4CMZDBvkqrRlXaDfWMVsXruv
         DtrbApCGw2p0mYuOgo9nMJzWCcGc7LpE6AV2JBYhjMdui5qs/gGJppEPgLKEsB2MoLxE
         znKSrfxbXJmw792reiUttbHkef8x9oZxJk7P/xQkBcy8bppnzQhVZH+8z+IuL5ROVvVL
         occzpPfP+i0PGVtObhmsL74AxXVJNhcTpSOdDOWqol1V99UeQA+cMAg1nbQE9PrkcGfm
         nv/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/1jRmpWqPOvnQl9/wCMfJ+4SyjNa85PBPCvxWKtbefH75C40B7hXnFsGADCyx68FU45WFGC7lm4M=@vger.kernel.org
X-Gm-Message-State: AFuF++k2CysURDWuYYgSCdXUWZtS9o5ix7jfdkiINtH1DJtzFv7VRv9M
	Yxxfjsb/WO256hk7WZFiQDlDQriCdb5O61CsF7aYUHESBZ6m2iGnOlIL
X-Gm-Gg: AR+sD105P1183Zse978X+iAKfoLa2yNZCqzD6hllmDDqs5S8Ud8qzxz9TZqOvLVI859
	hrxmG8qDb07t8F4eTFVd52g3Q7ZecFOPxmG1KfVjXXDoXKAeR7AMG9lUCxXuo5AQ2Gq7gEzL1Zo
	Kw9qf2ZbW/HQlRUFjowCmwwNDfw0s/imCJXqdA10LwIIclOg6uayUTTwO7b6oS1jvmRfVzRenFy
	XDUeuzSI+OrymGKoSiuKqg7YhDzddNFOwHqLbf46kWOrc2xJ7zdJHG0q6s5Nbu+kZ+nueic9tqT
	9iLj55Tz4kev24hjLwM+2TVORjHuYyXdpBtBh82fMVWg4fgga+kbwZpOWZVMvRvfy5Lepdaxwn6
	E4dn3R7SHsAmOlMxmvtJEsOED7gYBMAKMKvnarFT8EU0+Rj/k5lOKaIQSg62rvv9aumk8k6Ph/y
	HZ/ie+SjkIToaCl1Y+jZgWJqih+gflits6RuD7hLhPwVLG3yxPpdsdQxn/uMYf1dRenx9r/mUiq
	kNeTF4kGFO3
X-Received: by 2002:a17:90b:524a:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-395a07022b9mr41041319a91.18.1787576774842;
        Mon, 24 Aug 2026 06:06:14 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:14 -0700 (PDT)
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
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v5 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Mon, 24 Aug 2026 13:04:31 +0000
Message-ID: <20260824130437.2771-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824130437.2771-1-sreeshankar0910@gmail.com>
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

