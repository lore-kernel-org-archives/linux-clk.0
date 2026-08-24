Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B6B41F5D4
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576797; cv=none; b=Km+CPQjquJTnaBJg1m2VwgKl5SB+TZs6Vuqac84cASfFAYou91jRt2/AiqqXzH/PjZtHfUuWpOa2RyoOkWDR41hW5g/K6wLg2b5FEN0pcBhH/vxkZMrwOxumzdWBGHkXz2Cq9JzOjwWdUF+q8LMHQUeKOQN0/Uvsm+Gfpy49Tyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576797; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLDzjFYR2RoXwxpK7cb0QaEJ0SvTe8scrkjqC7+JgALV8tbH/k363sm6aMsuJ5a5KtHB84clphsS6ayjeUqcqmd0Uny/4q3fKmD1c3zdTlA0BqEjsNw/dgCOviz/zXrwgigQ+XznRp1ocbB7Mag777ZuHIOasNL3N+B9DN9GuqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOn8zvgx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOn8zvgx"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2535487a91.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 06:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576795; x=1788181595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=BOn8zvgx8OR00F/IRRPkOS6UfJx55Fwk5teZsIj/GZyVjxbqpjlwH9f1bUTGpVhTPM
         PistBs8F0beWFzNyfvjNIFCRbVuPBF2VL6FvCq+OkTatN/VW0j0g3TMzyjGGVPRMKDSi
         QBR9V910IwdUQxze+YHHzgvooFmNWU0IKMrl2DQBY//EGA9fr4KBpSER8C0krBkHKBbz
         5r853GF41gRmBQG6mzSkO8+I7NQerUYB3kqaIl7b94TrCP25hWt+H24jEuCMy5mDSFPP
         wjZYgSCnELUXOZTUKQ/jAV/PeWsBEdqC+IgofyVCDBI35ziTx93Xmg8La5FXrI+Omhhj
         uyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576795; x=1788181595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=tPeWxhLI4F/QepX0EYljs/Lr59UbxUSZHbX3lGK28DYTIlPS4ALmPhftG1yOmMT7te
         rIw6Z5POjWCHeHKXOkrdCiTOyoUCJN0arH4gYnzV7N89Wi2hGK64L884WpqBIW0Wiz7u
         kev5zCSLPB74/ZvaBzijZOd5kNDe67aPEx4CzaPQMdFUVjeWJ2kTvKzSdfH98rgB5gwU
         s9SsC6jWCIeS1OEaFRQJbalRvQbXpz+vNdLxOcMPv6PuF4Tfhh4fjicUyasrfFoBOjhZ
         NqCq0vIb7fAnr8WQO7PLf34cgytsga/h05Njv8t9OsgN5hN5noIuIIXSb+7C+jCNmPJX
         4kRw==
X-Forwarded-Encrypted: i=1; AHgh+RqBvK86gbUcwxr+C+3fZ1qXlUbxe72lC506amS55B7YlgTH33R4cqAucAZnrcgnCK1nGnWTWajbuX0=@vger.kernel.org
X-Gm-Message-State: AFuF++k3w2qBra+2nyDzYmv6XOCB71udyCtAx+gGRg22m+ZWm4Ccl28X
	oSus0y8Y2HmFT+nMvRxVSfVjI7s49KsG+rQl0uN+lNB98xrHr+EuNYeb
X-Gm-Gg: AR+sD12rdbbcm7v30pPlUQ/uXSf+TlPzRrovMJmFT1zBW8LgBuAewmNf33R+EbMuDXY
	dWMbBG4USDO7QN6fS7A8bd6OX29os2I3vI0o/u0vsfiWrH+EvpPkkZtDe3EPG4cT2w+5ZLm3tqZ
	ve7J9pBczBbhKjRJ1xH/Sziyq5OiJT9aABv84ugnuA5l5N82C95WrpdoI3a6uR12dBXrNdaypXH
	43EQHZItUh9E0c85AgC92+WGnnmnuViS3chaHh7uExdhYbbX3YJV0vCVqt6TQYxw4PRwh8XX5wn
	qkPKTIH+H6XA/xANj2vLmSyX3HYSoYIfbjMWLsG30Jnp4AZgH5qDC0RXFDPMdjF4xOJMNB1KBsz
	Hm7jkQJeccHHxCehK0rx8cg3Ee/kp2ASLZBPXvzNeV9+wv5rwksj2fHrV8QDGeBdjAImQMnjnfp
	Jx+sBKwG3uclsBfMkyE8Up0h7Dsv3QVyElt8MaObEFA2pbfwvxkuYUXMSeKKCtKTUAaG0aXRfZy
	mu2Qgmk/NnE
X-Received: by 2002:a17:90b:3902:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-395a04ea8f7mr37077108a91.8.1787576795390;
        Mon, 24 Aug 2026 06:06:35 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:06:34 -0700 (PDT)
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
Subject: [PATCH v5 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Mon, 24 Aug 2026 13:04:33 +0000
Message-ID: <20260824130437.2771-10-sreeshankar0910@gmail.com>
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

