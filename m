Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53253D3306
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032289; cv=none; b=uIwumWmpzJVPb2QreDBi8vnPHHR8IiDopijbrHk7dq8zwYvrQ0bnK0ZTseJOuYnafWvmerOrpfRtyfmExWnj0S1wJe7bdKPvxMya4P35hgxozAdMCdwfyDTHvOyvTB7kXeTQqPXrbgjHfz4Iyk5YDb3z3s3EQDjuGlfwMgsKlxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032289; c=relaxed/simple;
	bh=foZjVoQRCiO5EiFO0xsiUtYEo9hBVgElUvLSY4ypLnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSqooKK16Fo2k19chjMRLLbcmuxclz0EuL5cDWUjg0yXLyFI2eTC45IJpvfbqfwFBN9k3VOS/8XUacHXXtq/mzX5syf7e0PvIJ4ZcCObDCps481a7EPhZzNZxnO30lxehURPlAlR4ORBaalt3ic7r+an57MxG7Q7yEVMWbVc1Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vO3UMRGG; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vO3UMRGG"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso52009975e9.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 07:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032286; x=1772637086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ih6FpLQGj+0QoTrk9bZxrKkeQWeNNrlBbXBKCOgjpFI=;
        b=vO3UMRGGzIFmsWe26XEk2vddMzhRhxoX9rwzfaiTAzNsArzIKEIZlhk4MpkokMhX0E
         sTR4ibQBewk4rV70TanoGdDs/aNVrI7Q+9qFQx0hjD8LMcDv4U4kVXfRdbo6gnVaLxB/
         +9B3z/qI7VoFAXCZuWqJFXshrAYjPd8mysXzrSe8aWgDSgRpF7cNFIsH7FbcX+UfrUFT
         RtCrbF2p+HiGOdx1M/N7Jig0tD7klVZ1LFURCbdL3t195Mc3iCOf5ERHGH4pzmeGByAJ
         n6CJQCmqIysRz3yF3EG29Kfwk5gzIXyn0P1UOYndEdkiiRBS0JFZJ0wMeUtTIExnQu7m
         qtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032286; x=1772637086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ih6FpLQGj+0QoTrk9bZxrKkeQWeNNrlBbXBKCOgjpFI=;
        b=TaHp3WB3q+6rl46jF57Ll4D+VidSJBKyH3rASm16SQ3bUDJVCXSHux/ga5On/THSbn
         Vog70RCnTqxidTWEz2T3nLlFMHdZrpmQZUhUQWH+IQSwsW/GLmg6HJvodQ6RrrTYRfc1
         P3vPgR1eT3BDpRI/q2o79c2eGYsa2qOgO//VntnMtFm6iqWr+LBEGeMrAbHq4QwbtYEv
         rnrn407zDjwNIURes/mKure30uyiVh82ufaRjtodUb7XzAQEZ7lqnMRrmxjyLRYd7NRk
         AIO40Av9AEfrtPVlzdRB0q7tGsIkkTA47eVUJvukKlUITgI7gGBHTDQpdbSW3qHRee9t
         Ni2g==
X-Forwarded-Encrypted: i=1; AJvYcCX1tBzlk+4v8ttKnvRZg0eE/PG1iZ0fQsCm8XZt3rJDdUf2Kq/waw1s89rwDMEU+qfR7Nx86ahk+/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAh/rNVoGunmj0+EwldBcK/3rR3xJPDcG9Ol9sTiTLQ4tUSbea
	hjM6Akq+LENQ0zAUFQfI4NiuBFnklpZIKpNHOdIwZebbOE0MXtWL6NYes99teECW+VU=
X-Gm-Gg: ATEYQzwYoWwk4+0xHVtCTVBQte/V1vDb2QUCzA5Q06XIIfSVxplodIIpuuL1BBwS3C0
	k2KAUQbr3xWm6AZZ5/ScvNIxdgjqiHm3krdd2Tv73gB/qI+jEATsBndE+DrwwJVMlP9Eh29ZAaS
	rKwQ9vWVcizXPvjMuK0enxXI8+xTqc5cj+RTfrlicGI+Yta3Q/QkJuC1jQ/dnlR6QYiEtPoIpyX
	25rU2h7cLclpOgyw+gzfhcUuLM3RUFPtkYCAaT2K0ZtouJeLgYyACIIomWYSKsOHXCywNBtI2Wi
	+b0FUpQTKHm8UkvBs/FqtRC6XWddQpv/iI++4w3FKocDAgUGfM7LaaAb3ovgpNA7I0fRmkU1Z/X
	OeEBA+Rtl0hfTrXsc3tYd5iT+gWQ7PNo3qQwyKu/WhLk6MGLj4XBRoFQlVrdNEBqN49TqgLtvjM
	9AYUMFwzqM6cco+otHndHH1jmAiA7yz/RhR1acuXzvoA7hpad5g23F9CLAemWFtBXT
X-Received: by 2002:a05:600c:4589:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-483a95dea3emr338807445e9.16.1772032286387;
        Wed, 25 Feb 2026 07:11:26 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:25 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:18 +0000
Subject: [PATCH v8 01/18] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=foZjVoQRCiO5EiFO0xsiUtYEo9hBVgElUvLSY4ypLnc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEZca1HsjDAJ6+HfVuj/Vtr/IKLciK7avurR
 iFioEc0uCCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGQAKCRAicTuzoY3I
 Ot/ND/9XruPd1dbup1n5pBerZGkY+lReBH62eETyjKGRtBDgrB5yIgdgIe4ZSmG7hhUf6vDc/gN
 cr4GwOj4dyo5qhG6w+RgPrey/q7Nb+YsFMJhOm1OizQ5Bej9DNSVXDKFmev/FW6cX/PtFIUYz5I
 6UXvbauSfQR3t1ZXB0BOw169uq6LsQ1PYbD7X+3sFkRhJxNzv4clQIjwkfx66XAia3Ol/4tzvAF
 fkCNK2fOUhTCyEOGG/Zb8WVxni11Qg3GYzEoiu0VnbwFcODmo9YqEDaxLg1v+bSWGokixTVSVHc
 NOW1EALg8uAp25zE3D9ZYl8uwb6OkO6MeDOEkuvRWJXoaolh3Seb8IH0d+W9U79uLhHm5U/Y+Uq
 vXobiouYmIOywMZdzUi55Wb4/aV4Hc110PtaicfkA1MGuN+UbkURdfvf5N3ZFVDfLjkrugQ8iQe
 bmcnF47x8UkyWH514UmVqwpGSUNkjgBy7nwu1JtcM60l89SvFgD3kYgkITV6aGSIlUxGFtQ1W2I
 Dnane7PN/Y7PDeyPXS4DKRwBHKRGdEQhklhB51URamzyTVtP53pkoEtRNKdqrmJ3p89iYwruwJQ
 spXdQa0xjbwTJyYaU2eF/+GQRyFt/Qpktjn7Yt2I0BAGQQGFaGdTnxjHQzVGtVxv/e9RV5U8gMx
 Q9vbFaj57dAtpFg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The first register bank should be the 'main' register bank, in this case
the CSID wrapper register is responsible for muxing PHY/TPG inputs directly
to CSID or to other blocks such as the Sensor Front End.

commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address")
assigned the address to the first register bank "csid0" whereas what we
should have done is retained the unit address and moved csid_wrapper to be
the first listed bank.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..9aaed897f7e0e 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -21,12 +21,12 @@ properties:
 
   reg-names:
     items:
+      - const: csid_wrapper
       - const: csid0
       - const: csid1
       - const: csid2
       - const: csid_lite0
       - const: csid_lite1
-      - const: csid_wrapper
       - const: csiphy0
       - const: csiphy1
       - const: csiphy2
@@ -190,15 +190,15 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        camss: isp@acb7000 {
+        camss: isp@acb6000 {
             compatible = "qcom,x1e80100-camss";
 
-            reg = <0 0x0acb7000 0 0x2000>,
+            reg = <0 0x0acb6000 0 0x1000>,
+                  <0 0x0acb7000 0 0x2000>,
                   <0 0x0acb9000 0 0x2000>,
                   <0 0x0acbb000 0 0x2000>,
                   <0 0x0acc6000 0 0x1000>,
                   <0 0x0acca000 0 0x1000>,
-                  <0 0x0acb6000 0 0x1000>,
                   <0 0x0ace4000 0 0x1000>,
                   <0 0x0ace6000 0 0x1000>,
                   <0 0x0ace8000 0 0x1000>,
@@ -211,12 +211,12 @@ examples:
                   <0 0x0acc7000 0 0x2000>,
                   <0 0x0accb000 0 0x2000>;
 
-            reg-names = "csid0",
+            reg-names = "csid_wrapper",
+                        "csid0",
                         "csid1",
                         "csid2",
                         "csid_lite0",
                         "csid_lite1",
-                        "csid_wrapper",
                         "csiphy0",
                         "csiphy1",
                         "csiphy2",

-- 
2.52.0

