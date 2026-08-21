Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0341823AE87
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326906; cv=none; b=FilZvT9YWW4D/EgIqkchWdxI3wqNNpuLOEFcbqrQKtKZOReCKz+A3DE9XpAKa5WphBb3pdryJTurQGUMSzSF+rDfbMiVu1JGCB17ip5m9k2TuilUf77STJCazYd4nbkSw8w7yzTAbI6c0kn/0a/fMi1a0bnyVa4a6ZeTQIkwPIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326906; c=relaxed/simple;
	bh=KyU8fbc7e+jGln1gvgBbCQwRZ+9nqq3IhPL/wCHuXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGgdqdEfCVdIUp4H1QcIdeEBnlg25XX9GXnyQp+l2PKfUlFl/8Vnj/boTC2YfUgzigp6OrSnH/ZIBz6M1wwaImdo2kzY4osFHCdDhb7mixqVfGNZNAZtO/BkpUiu2YIarTwZAwMhMHrZgWWP1QE92AeJOe4ngGdJUg1ugSB8fFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfZa8lZ9; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfZa8lZ9"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38101f85591so1779570a91.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787326904; x=1787931704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=IfZa8lZ9PycC8jSoR907fRDQyTjFQABCttu0WhztUQRphxNWZDMAdIOyAqHrQOeG7s
         nK10sco6LjDjLW+wLXVtq3xUT9PVqP1jVxakBHusUZYw604X16/AWU0Y8RIeXhOFPZd7
         minTh2fHdu+Urgg7Tuqz9+qDkcLv6mHUVnv1PQwDxKUtgiEZUZ/V4nH/UaUSHH9Te6Cy
         znUEocWz0fc/4TvIvP+yfhXKi/IpuAM5d+rIIxnCLXmRaq+961QqQmrIBRjU43C/JUNT
         HH56wz/VLQi0hV4xUcXSuE1CoXpTgBIJe3O9jHZ1s5/ihuDOXGETpQMvJT2lWwHkIJ5A
         92mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326904; x=1787931704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWJvev8rwDkHrWVtePCBv0HB68OwkWKr1ifArwWeRlE=;
        b=bTo88CNldoWixRWG1kwkJZP3ScEez9h9MEia6xr0qrKwzQaMG9lROu7b8OX9mCY2tb
         Sovr8Tqd0x7kFMv1xzOFsOwThRvUH7NKqtk6x7CUG91TKeR+glFqoYYwtkcJUr/PIRS1
         AY3ApijPgZobwTyNuBE+DBaUnIJNGd7LYFI76pYmKtv80hov81k6lr4u8Ijbl9yor/DI
         FzxfzmYdUi1Z2O1h+XNDBk6ivtsHpP9qCnZ9m/t3wKSNXumURFZGT+Aqm+WKVbNc8uVg
         Qx755P5Qo/hwnT16zClecoGhPKJg3KqFHEmJNqEmpAf/SrhTXCQ+hwaZr7qM5dg1Lxpi
         VQvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHc4FeVNoQCyHPy+irI/httVaK+Jz0Nd6Bih+5XX9xbNrmM5ZQIFYgepY0h9qG+zdN+AUqi1KFAZc=@vger.kernel.org
X-Gm-Message-State: AFuF++mkL00DYFeWwbnc63ZF51duULvLDyO2pkDplRYZEGkn/TImtZK2
	JmblcK8v0w7jFixyQCwnxIfLGAk+5d2yE2O/0qGCNimbjLAqeIn5C32M
X-Gm-Gg: AR+sD10cPxtDvrKPVK/tfWLmOdOUEURdrtPDqW0NPiodcpjJHjJ5r49lxch/DhQ2Ded
	qH1QYYux0cSCrbG/FUF42ZPCVJEbOqRb8xxmQj4URnyTI6g2dAyyWvjCPK349GPoXwztKxvJgjz
	MW3P1/jte8fLjryip6NVZdA7xomOzAUgSAAutW1t26MRsLRWBu9MboWYQe6U8gpZX5jPt+TGQ+W
	Pyck/hVE1DAeDBkpSiraJ1aBSmlq7qG5TgxTslmzenE+bw6A6bVGmulqctqbrdqYQ/p9x7lF8bH
	bO0f8NTnRk5cEg6iOqhiyJ9hUExtKuYQKi2NeQ5Q8z4eMEL0mBKB/tdYvZf0IhezpmKvBtNZKE4
	Rh6OJog9UBeLmv4TDlsGBf4MuLDOlu5wmDyzXKAiy7v8VofS4Slzq5rfV5utkRtGhWxdGuzIGH/
	k9FtYdhQmdhiuJ+4lVmOJR0g6HBwNArVn35ptqIF46qtXb714sXDk3vED1qVABYT9UHewTIF7IH
	i/F/aqB1K5Z
X-Received: by 2002:a17:90b:3902:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-395a04ea8f7mr17227356a91.8.1787326904238;
        Fri, 21 Aug 2026 08:41:44 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm42903185c88.13.2026.08.21.08.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:41:43 -0700 (PDT)
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
Subject: [PATCH v4 05/13] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Fri, 21 Aug 2026 15:40:22 +0000
Message-ID: <20260821154030.2514-6-sreeshankar0910@gmail.com>
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

