Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376C13BBFC2
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231354; cv=none; b=T/TeI85G9Wio3guDfYbO00VbSe6Lwt0G/yOvMKSO5Lr2JQGcO7sGbpUxJRc5uJOt8NIC4CmQs3U6+NkSHaxjbQG2dHqecCkvcBvgNdp0jghiU31EhY4PV1YqMsN6dMHFi1Tl7fdmcW2JdapfdwDpm4jrco8LhWQPLztsa+fHGMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231354; c=relaxed/simple;
	bh=5wHZsmRZJkX36FzDROcwG3gCmz+4LTBOmCoFC9DNaFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qU/Ekn1c3xif/DuP0ruscGytWY6rBJXqguIRt0RH9JSmcGla/e178XXnP+22ilS99IiTCa+vD3uwIMSmhKHAB+FkQDfbkBH8/4GKBMtYHH+Alf+LS++j2ioIQReg3NWudPtMP5pPPFKi3nr/bi8QuHokGNGQWcbqKjV0q3cQ5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8PkHBGT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8PkHBGT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f75f7172so30707075e9.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785231349; x=1785836149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJSm/JnxrKE81FhHQMmn4pN/cUcvRnDeftlQtOhibp4=;
        b=n8PkHBGTcybZOz9v1m62kvkR1jzg6M7BU7Zf63FjwcJPH7G76Ya/bBGmN13mSr5I6G
         p189/GhplhMQcmGHdx7k48LLOgTfz5s55xAbpLELPkPcdjo4CyUGmpIEr8XRIC9PvsGB
         JDJw8OOmShcsGrLcccSCjfY0gBE8fk4/Yrx0H520pGlexyWWkDSGs9EIb5DF6qXktQr5
         XIaVsqx7D6QPNmb1eQwOaCCbGpUOlcd7AhUM6xuJNQ1HnHRu03Ucre1KH9cqqg+2/wc6
         gcx48K+dq8gdyYpzBYw0O5FwDfm9nEUxwDmcG3cS6QD0MRmajPGAiBxlF/NLg4I/xVHz
         gnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231349; x=1785836149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJSm/JnxrKE81FhHQMmn4pN/cUcvRnDeftlQtOhibp4=;
        b=Joeu3thVVTp8VAewI5Csc+nGxGyU4PaldJ9h6Mzk4zA7hlIrpsw7tyCVXao1QgSpo1
         XcbPmw9f/7UAdbNYG/Lwi8nCQWeCYn3dHm8xXsvuGIZY9YqqMTnxSZY3pKDDslFqoLhq
         /gUqXMeF2d5AS7j60+hvjGJ+//AwphJcme3XoTwLC2oqzzsqj5SzgOcn3L3DLZ0pTMkm
         +fjd/mbx9TYRUEDvg7aE1ZIAqss6pOQ96tSTAiL04vxOtkX02cC81hsG5ytZuLWi9H2f
         TReywGkrpaZemeK3eEzXB1/V+6pKh6B5t0pVZ5yWOsebUOBQa/zyjb7dFnb3O1ehKKOy
         37Ug==
X-Forwarded-Encrypted: i=1; AHgh+RoXCzx3bVJAI+jDZujT21WPnWVmkhUOjadBhMeJ7ClMxse6ocgD62p80cuYRF7iQJi5itFjwmXBEFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxx9wK2U0P/y5drJVEOxuZ90LcX0+W7lmtEWmx3v3z8rQEvwB/
	F5d77ksvfqAcCWTSpn0tjsLPTyAxAH2AwJsWAwvihJT6gke6miAvWqC3PmcYcl3fTtU=
X-Gm-Gg: AR+sD11xSlyjBM/+mjzTs+KTtnqHR/qte3/1p3q4y+7Nw/jFK0SpDhV0cyAAuaSzPo5
	P9KQOeiS0F1eLvWSu1RKs5DSqHkJgKO1GIXrKrBFCNhnS71t+XwfP/8UacY/lCATKSjkv7p206e
	WXJRUD8zihvRpMO2suV0M7JrvJkNZ+3d1QIVU+5tPiWT0b7eMAKxcRdLDO/WRc4BDTORfl8mcZE
	feOaeNjlYUTxR86kJuQL9ATvNGJJ9QKhuLJktoRjilN2lQRH9Iqa+/dQ3Qe5meG8/fMhhptgENG
	twiEIv+uxGokLBwHUhaZY8YjBYeI2rZD7GepuAAFM/XF1DWiddT+Xfi5SxHX2zTGL3BTfBgbXft
	X5m6KAtweUCXeMPqrmXGhvA0crCuhDkIrNxuBqF+rI72kXWwX5i2GAnVafCXm/iCgaw2REVYcsm
	+rpkcQjuOMg0u0JqnehtuWILc=
X-Received: by 2002:a05:600c:3103:b0:493:f278:ba2f with SMTP id 5b1f17b1804b1-496c643219amr16527625e9.9.1785231349157;
        Tue, 28 Jul 2026 02:35:49 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm68190825e9.15.2026.07.28.02.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:35:48 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 28 Jul 2026 10:35:35 +0100
Subject: [PATCH v13 4/5] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-4-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=5wHZsmRZJkX36FzDROcwG3gCmz+4LTBOmCoFC9DNaFs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqaHftKWpv80r/kd2OEz0SwpuOlD6R3IYkWLa1/
 UqMkdNx1TuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCamh37QAKCRAicTuzoY3I
 Ou+qD/9XJ9Kr2dtNDMp3LaXCqRgLwCUXh9WHlrVvWg0IEUWaEpC+qyd6w4rm2xFbsJXMZ0Cv7LX
 uBtcCNSqIDgb98WTUHsRlOCIKcV+N7Zc0DDczm9A0RR1ui19cgMcKZaY0dl6Tk2E3NpgZaOTXoq
 MVcpByF+yJBRETBwq7kDhVMEqOIPiszmPlrWCgT+aoLZ3980RwZVrIy4d3wu3UlzoFGtYRyjFTu
 0irxHZfSOipWleivf/17UYZ/rkdb+ekKGdaQK0XAcuTlcirOXtmhrGOSw4EsRKFZtC6J4tTJh8w
 dSh0whpXzhKJLmPtKSpq/iCL0hE5/WX912Jaap7RUjVR3AANyTVyC+Ud+MMQNxBNRLzDJq1evau
 1gpGTKQifnZs8NYzWyAjUJTF6UIT427qD2F410/GfVYAFZE4dGhiR9uOQTqHO5a6PuSpdma0H8b
 fYW1wZY/ebjcEKGRxWa6w5FH20Ftd5WTjrf8sUc0ge1LCa28Cm/4wAKA7dJ5k/qheaEtp0/ttOd
 fOlP4yBr+2PQ1IERSdxYS+Bq9K7twWG2rJ8KX3bWx6aSJLqfgDvx0BzkUZjXIqc8DiO5Ds4uEO0
 Oifi1v9Xk2RNYux1Q0KT25uOybo2KDQExNIn6XaMDN9xM0cMfGuHQN8eaeCI0OlX1vPUPvezEt+
 5ShgyElMc0/0bHA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..126400772d028 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.54.0

