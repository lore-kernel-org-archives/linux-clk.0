Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E0C411693
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542634; cv=none; b=lZliaelET7cegAhDRW09SiHuG5bkRGEkxfNq4rns3aLiRd2tVIq378s1WARQ/PHapx37AyNQPg6SkCySD2Nr+dVzN1smBg0j2VXsvjjbmiASQjLq1WojwUnc3Xn10iIBVRilo8dQL+xowMycK1VNFRLEMVcknSBF++2hnzlPsvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542634; c=relaxed/simple;
	bh=9rgQQt8dY75O2Iww/Qyyxjh8JDNgjK6Qh7rEAzx7jTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rFrqUSlxVAEeiTg91vbDXNwqUT+t1o3wL4dAAP7VkEnPErKcBO/tyaUv6wqptp/Bl5+7uIionOVZRa8mitBd8N6JP2Ug+BIsFP+MPeqatqAZALCgaGqatBN7gRlpV7YNPCqXU6en2gFSqIVf1COr3gC/yYsCku4mnIGbpJaRKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xg+suujg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xg+suujg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso20276495e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542631; x=1782147431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nc7oHU/z1AYI46E7DltDd3RE6143p/yBAx1pHgMei4M=;
        b=Xg+suujgOnDdUcxm6IwqUVY2mkKsJMbGTsW5u+cVH/LhrwiXsRfjzPQzx2iLaDq0ee
         A0GrZ707xXh8ZaAa/Gk9FFD9VQK14tgxBjlsUhq9hGx6Z9K7cGaCVe9ud+cUHPArbkV8
         mgtAuWTyZwTEbed5H5sBxXRWLJgXfqk7I4gRZ+HlODkNs2w3Zg99s6YyVGY+ixr/gFeT
         khRUM3ByrjCj0ubff83O2tptys7vIZDTt97VBKXsoSy0ADpulaU0UgdfjkFJsmJwFIsD
         aS2cIT0JV58T+9EPFVMK6R+rLkL57PJ/0k00XQwkNG2sITIkkEyuN5b1+gtlTht/KwLs
         Upvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542631; x=1782147431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nc7oHU/z1AYI46E7DltDd3RE6143p/yBAx1pHgMei4M=;
        b=RGhDL/2icNRmaK7cxGtpSQSKV7jf4IMpHb0tosUK2c+yVcESKksIBFXJDV2tn/iffS
         M3uJn9eJgx9ZOJ3zNMIGER+Xu6ZaYhKfKtBbA9aNeBjLZXLJs/2oLeFZT5NRK941WHdo
         o7bs9EksYiK7DY/PLWRxUtPZKuDPZRhuiMe0C65AZaXCRDzjHw9DZB2+Kl+OOQaB/nvg
         jJkVfNYx9dufjkqBv38s/1cTI95X5Odb8iSbhA3iULEhDd84s0d5UnoPHUaMJnEQiHGZ
         nX8T4HtrJ7fiw9dP+j1oqnWdGfqlTQ45jjlrHXXQ2HC1VX3we9EENor89LNhfEMCCfRT
         dKbA==
X-Forwarded-Encrypted: i=1; AFNElJ/xVb2RY47vGP6qrT/HSm0DJtMPjNKY192jXsFeLDLdL0143Q/PwTnCsY52pXXDFbbPhBip54ALdU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzIcmnn0zucsqj2zFSBcWHHo4X1UjfVtfTnQlfmM0ThJQ11zb
	lnrnojJHCY4sE5gU+833WBtelrXvgZXYb/Y25xoElk0+oCiuGWi20GVukoD83BwUDLM=
X-Gm-Gg: Acq92OFpV0LllSFnws8y/ZVrYOmX2tRtRgCkXcKcdtJRlK4Nf0WiK6KyScZTM8QDcSC
	7BiX8RHn7khPWKpnBMnyd6T7GvSPoprvCe5SEt/jYM3qBh0V+eTlW4g/2CZqXcVjZyD89deFIAR
	MgBoddLPjqBNDifaKvkSP9ma74dCUZNl0H6X15hhNr7ZKA0kOM36ujE3wjI7OpeQ7cKpyU8SaCn
	8q4ajrdTtXEAGX26ODAgPI1bcfRBowAERYofZRWX9HCX1MEzuEINRaSIZY9nW6pj5zH/qJ83E0G
	CDeHbavD35wSS4ayd9BdjOCws3WHFAHQAlFcpzilx1btf+KdkbQm0XxYwVRxfsdf1h3a4Vnh+HH
	WDQHkVHM1qozPfC09iZymoSJQNSOhZUKFVwbnK+xhWrh5UXNM59qPGITZvbbguvM7KJ2jxD/riM
	GArxK4Lo6qgNAp2MgatZavTu3TKHIRV1COhTWEEdRqSoQX
X-Received: by 2002:a05:600c:a20f:b0:490:e19b:9632 with SMTP id 5b1f17b1804b1-4922fb071acmr3292265e9.17.1781542631492;
        Mon, 15 Jun 2026 09:57:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:04 +0200
Subject: [PATCH v2 3/6] dt-bindings: clock: qcom: sm8650-gcc: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-3-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9rgQQt8dY75O2Iww/Qyyxjh8JDNgjK6Qh7rEAzx7jTo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7hKCn7B7MnKDLpOdzh+dR5GkO+LgN3LqinkeH6
 1xXyE8WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4QAKCRB33NvayMhJ0Y7jD/
 9StGVbsGxd9cM1VsJ8wK4d0CNwNXlYQCINj3hRbeY5JLf/4WiuyYHuxfXbWJXwBVSvO550A5ulvI9w
 UfrRHIQS1iZHumBRpU0eV0Xl14Pj8ZZB8pTZeHtT8h3yl7oAJeRrLXJTp3YFmCCmEoX2/c3xisARAc
 qp3pSIaQA4j1NhgVh84YiOGjsgf9ydlda5a+mr0Djf0s6dw3w7K2xnnpRZ8x5p/Yr5vsJW7AVLba3F
 O1gf//7/xhp4vGxoXTZzmeH2lkTgWYeAMPfKrToRux7qtUk8QRqgVY19FPB1pgG6X6jto50sc2+JYA
 imtunYnPPRcNoGnirZvhTr1iv32cD8F13A8RSi2lro2vSUfaB/9vVSP+mgRG7gd3fFC3bSYGe1mEr5
 U86+71Eat/yQ6rF6X340CUkMRMfzzyowz3KlaZC1IVM0ShuUpCVyo0IvkCsPWqzl+7L+LgE7FAJR/M
 h+5RTCgP70B8fVlrG2Yk+N4mCzJlXmKr8EYDB7QfsFkLvOetq/E3GDPWIrEpdZbqrEon4QGiiLTIxg
 PsxILVZwwizpzcgJNuoO0OZAPQPTabh4bfCAaLl98ffSd+OX8ry204SODaVSKzYR27e5XrGC8K+JQj
 5z29ZRwjauj0wGDZej5CbaG5UQ/+QoTTEQ45n3TKecKAfNda4p/rlt4b5ntQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: b69d932154dc ("dt-bindings: clock: qcom: document the SM8650 General Clock Controller")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..9c1504827cbf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -58,6 +63,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.34.1

