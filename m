Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF453E559C
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 05:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041653; cv=none; b=ELKZgnhFhLIK4bu0ckggVerMjyVbtCDuVmqrIgXSNrzg67MIA8rL1b6Hrj7Ab/zteR1lhjsfk1i/rrbot1ZQVmKLcjW8bLsgQvfWulmfqX1jnmeD2yv7qXkNSnHQs7e8Nd7erznZTdno4+41zKd2BkUhrUSlmJAHm25Ogr1ufCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041653; c=relaxed/simple;
	bh=6sYp6gwLdM8q2X0kWDCuDxQHrC8+z3UsdjNuoTgAQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6gGGh66tdqDd1hmv9nWUKN6DzbwInUaOycsgfWt53ToTUZzb5XztLdPv5TV4PfJCU0+TfIHtnuwelkzxl87EkE1JgpXwlVfcjSk6/8Tjrvg1iCTNo6Y0uDnMUKcChp5Jt4jjpPW2rsS+V5Gwp1IXq6Hlauk9Ql2n5S9juk3BC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTDZn2Mk; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTDZn2Mk"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-354ba08cfd1so8155767eec.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 22:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041651; x=1792646451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=gTDZn2Mk/PS1sTuvi90n4mjXrrr2ikyhlmgrnzrZwnoZYcCVtBc7Q8gy+YzYHp7czJ
         gEEjmVsTjcC/Hccd7L0sIBTkahQcrRlb/Y2SvNN2/ka4U2GmKbpCbBGnyNHO28rRObwW
         E6/npQwf2X9LyWggYeQYSbcYND1k3JGwovcam5rOHvnctN/mpEemfuxu3T5ChrEXeUpm
         G8ZO8UVW6QCbGeSmr+i7E2tgl1iKK6xlrhvovZWeMVZ4FCV8ZmIDhZqqvgIoTOBuwvVO
         KmDtf+1CUdxS6cwN+Z05FMaDyb5TG2wBKTqXcV8Kh2HFYFyhTQMn+hA+MGLdVxR7NiXb
         mXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041651; x=1792646451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=NOTpl56wT4Ni6uthRfsNL8bwybkUF2uUCdPuBf9m2Tj9OKY2ipGd/hIHMxtObBzGat
         Y9pnjg4sXAgSiF8u+7FHxXNJ6Mxc9PEHxtZUr0DVOSD96YMY5RZP3d8CE/iVWIAyh81Z
         0CN/zgJ4FXlJSWO1guB22s4GV8whFFGhIY0vRlwhZZ1o8sRc9joktG17JrtHrQeNSLfp
         msL67A0NnuKN53vHQa/QKgPbXB8eGgkrgM7W0nePd3Uu4TW6sBw1sd3ABm+fJaIWdfj3
         6HOpQRyIOrngoFScLelP7NJzsYNgy/STLMxwtExoujwst4fCwcAaoBM6GWnE00s9cFgQ
         LRww==
X-Forwarded-Encrypted: i=1; AKwUvBySxkHqCw8RNzhfiiaiU8VP0bOCd7KmLeNt845KMp38nJIQ61LvB8c21B3qRxT0ugf2XnLIAKChPqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYITIhjuRYq4nlYbAIqQOkhRP9buO7gKkAoV1bpuaSunbFVqA0Cz
	YBb1CcatZ8oTVN014NSamTc/E/7Ad83GH1VNXO+qZaMOtkwjJOmMJ0EI
X-Gm-Gg: AYBFou0QmShXKo6hs5mSVafGJZFrgfypBMhkG2E7n/Cj6FRdlx/n8RdrX2ThGbi4D4c
	phjmH5X3s+AcYjC8BnqRR4vdjLmg9fJgJb7Xr3hCpuyOnpuvP3pYV99PvhrhSdX27AI46exNWNx
	nQqHMVTC4e+b/vM/GVis1mTPYE7byAP4Qt+HUlCsXhNFChpmNgYaB74pxFS8txe/Gzgy8dimior
	9rdBBRYMON3VQnkjduatjso4xl5MxXIIAOi0qI/Bll1bb5V4X3+RFUu7YW2E3vIk/Mmi+HVkZX6
	/QoD3eel/nv51OdH8GHJm+MhWELd7svkSLl1PkcwnpFAnNLgVBdWK43sGcgOcI3bqxijzzWgIs2
	OiM9VX6wWXTKRrSJxkA+N43tLUI9/vTW2ewWzmw+A++r6kxUIo2r5QA1Ua6GgfQMEkp270NOJUL
	b9yf+aeBsOp2Ne8PSPN0F8/FnVHYAAuHAW5vCMk70vzSJfFuNqJ1Bk0VKHnMufSBXRFux5cVhgl
	dLB4j43adr54zMRP7JOjF3WNlsyUN7lJXFkV1lP2p5WnM7ke5geDoY=
X-Received: by 2002:a05:7301:6e98:b0:33c:e74:4624 with SMTP id 5a478bee46e88-3537e112919mr25527157eec.27.1792041651470;
        Wed, 14 Oct 2026 22:20:51 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm12923112eec.25.2026.10.14.22.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:20:50 -0700 (PDT)
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
	tglx@kernel.org
Cc: radu@rendec.net,
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
Subject: [PATCH v10 4/6] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Thu, 15 Oct 2026 05:19:24 +0000
Message-ID: <20261015051926.13752-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015051926.13752-1-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

