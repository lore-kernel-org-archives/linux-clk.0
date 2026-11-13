Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595125;
	b=K0TMvPiNhPrcikGrFTNDumDhFYZgM+CT7/RLEICWcLHbYE8l1eDeJLQnP6xyqPOzrIH3
	 Ja1tcyVW6ABeUqI0bDGywVd955nob4+QRmP+La94DIudd4ZFgc+0snp4VT6Fg8UdEf9ZV
	 FDzavPuPs1tInHpqeQ9jWZseIN9Q2+hBZa2AENgzhjxHk9HY6ofDcmqvFuUGErF8dyRJV
	 cDv5Hizv5nJuyIDArdnBT8xi4+0EZudHKvHYVshhfDI/+bPSv2Ou+lEsxKGDasPsdI25S
	 imEb5tvCiqZg6R8+97wrUEM5Q1TlvaXjhJrirzLlD8SSiqyOjSx+9do6KQKcb1qWfWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=V7ZSOMsXYdAcwhycQflcDLMzQhl4tW5MNdpWt5mDy8M=;
	b=Ki2sh9iWPadCHChBKC8y9FWN2Rqw09Bb8dY+A9Y3HO8INnaV6XgvvMhZaY5eZbrKIkSl
	 RpbCpHpZhyoGqO21NWysLc202aCPYPCNkYnoXMAjJnR3h+1Zd7JXyd4Bj7byLLFPgKza1
	 CL8BUcVY1MfjWvxFwij6U5zMp+DiPcyP0Bht9ThiAQIzkyVfT1uIFU/LOzSBbnHGW7UOH
	 4NeZvAIcBtupUqivYxkQ9TrYyZFjNpDxpNWo4zFn23O+wZlo3nFeExChuLs2Xd8m3yDzt
	 VRSW5eZA/j1orrdhsJ2LIHLBhtlOo43MWk2N2n70EiLUbcuF1EuaSOPg8G/89wn+CwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jXZFlbDo;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE713606CCBE
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE713606CCBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jXZFlbDo
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so13567195e9.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595123; x=1795199923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V7ZSOMsXYdAcwhycQflcDLMzQhl4tW5MNdpWt5mDy8M=;
        b=jXZFlbDoJMYJWMbHq6wbVzUdIjWX5o3+JckCmdZOdESXI6MzN4EF1WhYlU8xQo5rsz
         xxXPpht8MWtkX47J0tPsWoyhS0MfNRfcFq4bq3Z8lalav24yivnrWKPD8W5p51rpPf5d
         Y2vSCWVe2D3xwWT1e4z7CF1o9Ucw2gXmxwB+f2/R5GAIRy0GQj2Luk2LtwEPJq/ctGaP
         bYAbxw8yTTB6qKAMnCDSgnnE8ZnMHIF1n/Q7V41RPwUcNsI05wibAEoDWQ+pfOow4R9L
         WnpxmbzWKlKUczC9GSzG6k74e+QaBiO9CH7Y0pzww/z5rCwzrEzMPzKx1zeiotEW0nOK
         2Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595123; x=1795199923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7ZSOMsXYdAcwhycQflcDLMzQhl4tW5MNdpWt5mDy8M=;
        b=EwM0x1YSWGedpqKQQ4M+B9DsH7ycDVf9UNth138rmG1+ZYmysaCK99ntLRQjjnpfnB
         wVtVK1W4GJT+e+GSMdYeyIsAf6448kkb47PAVAn4JtWRJDtjwSynh3oU18l62hEKcKWg
         TASBIkUvwJW4L024T74cGvFVXk7AXlnvj10xYhqnZBrIuXaKukjudu4RcB+8zQmShBNa
         1NtSHuagXRl94yMzLVE4/lclA0a4dWUxnVJv8L5jveVr6n+PP5nrbHtWwkvK3rNYqawJ
         Oc2SFFqBBqlUHUKsmMt/eeuz9GWKYUAcoHK6DWv/bGhKEr6oCZGkIhEpOCvFGhJuVMNZ
         SsKA==
X-Forwarded-Encrypted: i=1; AL+hErGWihscOpfuHUQpGbxi0F0jt2jGpWCKjv0eRaJc/Mr7sB/wLMR3+X5AMPXetGHWlGAUji4Zdwzrm4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QCzDjzwH54moaCGl+gW4d/KlHiztrFwWK3BmsuOHckeWmBz8L
	6V7IoYioW7D66wgzdAr/Iva6ESipgqv4E9m0F4iSrP+Ee7Gw0OtL+6EuwJKL+2/mGjo=
X-Gm-Gg: AYBFou1IKAwOPsV7s8iVZMsIQQO1ENuElHe5fm8Z9HT3Kx9nNSifQVEMIMe2VY+VtGK
	UFVWXvuXpGchB/K0Wkx6brD+vMh49tR3ZLQDL0VVkaknU3HpldEKVvdDbkHbbj6BNN8eyJp+ex6
	DsodnN3yrT3ACQvCdbPjb0ZhlyBG9wbQIMlmEgzMBBFWd3rxM9yZX9pl07/1FDw3/jU8Gydf+Oy
	PQ43AqruxKbL6KL0CEkP5inWH2d1q4UErInHGowg3J/6t1ew0kEqkyMtwVE3fpfxWjBVeZujSFr
	vElzWCIqwoKQR/DC1tW2bJ4bQ/AfumUOEbnYT5WztE7P+lsMZZAcqyTNO+2WAM9MEnYW8kOn85n
	QL4p1BG9XP3cSFwJDYfiJH+tMMACyPCNgmpDAWdUQ5vF4BQXRiCdRfcIyELsEg7oJUOGsfgw17v
	xX0jSIvvD0z+WvNTxZbuBzzR5VhdscST9WDfbYU1UvVwRzQOcu0tBmmV2jvGknAtq2qefj6Lmnd
	LboYbXaF2xQz+iZMVXdCf0DFt5HG79N+msk6iOU/n79eQR4HgYSCuOaPDtdhnt69LGR+1NOdaCU
	lUWckuSwdWgy4OMEWffZmvoDFKFf42BnJf0wQ0oj73hjbWjd5TVzHaYzATjFP0Y0
X-Received: by 2002:a05:600c:a012:b0:4b8:d17e:da27 with SMTP id 5b1f17b1804b1-4bb55a85101mr69951145e9.27.1794595123103;
        Fri, 13 Nov 2026 10:38:43 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:21 +0100
Subject: [PATCH RFC 07/23] ASoC: dt-bindings: qcom,lpass-cpu: document the
 SM8650 LPASS
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-7-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3635;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=U1eEhA1am3Rmu5NcORdiBRTvDJRsaqBll4kDIGaC0o8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kgCaGbgm2cwsm12W4mm+WNrzJv2jSdyPgRPF7c
 cZ0liSeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIAAKCRB33NvayMhJ0eFoEA
 CJCUF7fAnHHUA71B5Wy+q5+60Tsk+JwWjhVh3Ytbs6nCPnLEzrRiqTji8sh+lcGz/Pav2HtjPBrBtr
 4ssHsaOhzglSthAd1eupG3surlwy6OLorHSWFrDIdK7ylfAqJnqJfB93FY3SeXvzVtmh0wf/qdGIiu
 PaDTXTuxwuBwMev1/q51D5Wn5G3SN7/Q8NSShBW4DCCy0q4WZ8FNv/e0y4zw1/VR6CoCTov4LQezkO
 M9XW4jWOIfBGFJlWc/QEY2qWJaG7i4Fqcq1AiPgIldxuMzLoDVHu0vjdiS3wy3TVw7+m4PpWvYcN+p
 GR0tux/WP1ngUgeGRmm+28x4blk6LN8MAtPu0gYUR6k0rKAF5oEF6Tr152Paeza6NsDs6Sq0+gD1MI
 53ZZHGrNTtpFr/wCszO7UqlXlyE6wVWDOWlJdrc+YwKl3mUviOoPvt8yZMhGIopUSMgBw1aG1iNvF3
 1LZwiH4dEATf2eSwfQfujTq83XnKGESdMdvg1Gfe2FfXnlpl0Zz6N5RNX1x0DK/sn5uyuS6seBqSZp
 Bf3uUqxpc3u2OUH6xBrVrQRXyoSjOtcmmEBNSk6cn5UuupZoIsoqNCGRkXKDMgrEop5tU/myvEU/AW
 SHrcrA5rZK/v+IRS3dGQ0HPpuOPH6A9P1vijYsISqrsn4hamBkyKcZSIC3eg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The SM8650 LPASS can be driven by Linux through lpass-cpu, with extra LPAIF
instances, LPMs and clocks compared to the other SoCs.

Document the SM8650 LPASS CPU registers, clocks and interrupts.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 74 ++++++++++++++++++++--
 1 file changed, 68 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 3a559bd07a79..f431173a0e88 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -23,32 +23,33 @@ properties:
       - qcom,apq8016-lpass-cpu
       - qcom,sc7180-lpass-cpu
       - qcom,sc7280-lpass-cpu
+      - qcom,sm8650-lpass-cpu
 
   reg:
     minItems: 1
-    maxItems: 6
+    maxItems: 8
     description: LPAIF core registers
 
   reg-names:
     minItems: 1
-    maxItems: 6
+    maxItems: 8
 
   clocks:
     minItems: 3
-    maxItems: 10
+    maxItems: 16
 
   clock-names:
     minItems: 1
-    maxItems: 10
+    maxItems: 16
 
   interrupts:
     minItems: 1
-    maxItems: 4
+    maxItems: 6
     description: LPAIF DMA buffer interrupt
 
   interrupt-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 6
 
   qcom,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -59,6 +60,8 @@ properties:
     maxItems: 3
     description: Phandle to apps_smmu node with sid mask
 
+  dma-coherent: true
+
   power-domains:
     maxItems: 1
 
@@ -241,6 +244,65 @@ allOf:
         - iommus
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8650-lpass-cpu
+
+    then:
+      properties:
+        clocks:
+          minItems: 16
+          maxItems: 16
+        clock-names:
+          items:
+            - const: aon_cc_audio_hm_h
+            - const: core_cc_sysnoc_mport_core
+            - const: core_cc_ext_mclk0
+            - const: core_cc_ext_if0_ibit
+            - const: core_cc_ext_if1_ibit
+            - const: aon_cc_ext_if1_ibit
+            - const: audio_cc_ext_if1_ibit
+            - const: audio_cc_ext_if2_ibit
+            - const: audio_cc_ext_if4_ibit
+            - const: audio_cc_ext_if5_ibit
+            - const: audio_cc_codec_mem
+            - const: audio_cc_codec_mem0
+            - const: audio_cc_codec_mem1
+            - const: audio_cc_codec_mem2
+            - const: audio_cc_codec_mem3
+            - const: aon_cc_va_mem0
+        reg:
+          minItems: 8
+          maxItems: 8
+        reg-names:
+          items:
+            - const: lpass-hdmiif
+            - const: lpass-lpaif
+            - const: lpass-rxtx-cdc-dma-lpm
+            - const: lpass-rxtx-lpaif
+            - const: lpass-va-lpaif
+            - const: lpass-va-cdc-dma-lpm
+            - const: lpass-wsa-lpaif
+            - const: lpass-aud-lpaif
+        interrupts:
+          minItems: 6
+          maxItems: 6
+        interrupt-names:
+          items:
+            - const: lpass-irq-lpaif
+            - const: lpass-irq-hdmi
+            - const: lpass-irq-vaif
+            - const: lpass-irq-rxtxif
+            - const: lpass-irq-wsaif
+            - const: lpass-irq-audif
+        power-domain-names: false
+
+      required:
+        - iommus
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/sound/sc7180-lpass.h>

-- 
2.34.1

