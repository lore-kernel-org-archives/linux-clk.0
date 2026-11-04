Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820305;
	b=YwpQNP4ZizfjKJ2HF++5/SoDTL9nNFiAFw68Cf7Ny/2KYE02Fl62Oh5zMSbtfH+KknOf
	 gc6Q1kynSR1Lf2ElM4YZFdwk3CW1/B4lyXV7psYvU5c4XUPXsL903HTw2MUm8YPXG0zzy
	 1EPXlyutZxo3U6S8yLvm1udcTywmjMjfXEUc7QDladcr4Tlgea+hPZnLox1gBBA1O8DcM
	 HOGetKcB8bKhgPh4gPGT93olt8UfgpmgwDOsZIazud+qgivDlYX+n4FKNsTto4hxBt4Y2
	 JaRLFdwLBWHnDNJ6uKkw68tO33P6Afw0K51AEP2Q3YxG/EjrjIpTF88rES10z5g7JgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
	b=N2oAm0bdcJuouUvps8PaKDb70pF5EwWukawlC8wqaAAZmHqaksTA8EuVS0I/B6WdCle0
	 sQhpbYNRV3z13xqnjLdh8yHL7fc/LzL0FrJJMR3Oyy5ewcO1MZ+2dYv9Ua1dczX+fqNGj
	 60ysJZwK2N4S3rURHodxnP191jTQoL392Yw+gZYkLs1Lq+PXRbcsCcsl17HNgFMU/ZYWo
	 a6IimhXjM/75DUo/30K05SZ7n+PZiTDds0yeTtAJUPnFNkh2CmCiz+A/LYd8+6O/ue3Px
	 zhG5T7XhnvzvI+XvonO3Um9qtpBHlzfSzKitl857yOnNMyxpdgQJEydtsD3gZpIRU7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3d0Ev0P;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05D607F28A
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 19:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D05D607F28A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3d0Ev0P
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-5058b105df7so428040b6e.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 11:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820304; x=1794425104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=G3d0Ev0PzTKoH9/qkmm1xdyYMItYLtR9472uuxqYDGGE3DTSJDpNdW5KhoxyxluyOn
         bDJ4RdQtvjttKH/Jbe621LTmeAdFhbfq5FcDRI2p0aBcOl62R2c3QdLw0jIgQFq8BkYa
         Rw3733tFokoCWR1RpQc6qIPQix/VVjjpj2qYOOfwn24mnZ/6oHTcvUVoWxyp9r3HFDfM
         khvKJVKxfAdrC2gtj+aFX0JLL+N5mtIOaKAl6tOPQkT3XTwNru6mxU5tsDFZV4NGMFl3
         TIBDEUtPsj1WwMA8a8H21JNq9F1B/R8FDGAFaPj76P08+TiGta82bulTdIFbVzc2KRgs
         Rdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820304; x=1794425104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=fm+5MfLPfj4hUm3rvDdm1kIIzmqQ/aAgp0iUGkltL+KUlarF1VeJ8i0PlAs+6Ob3Ju
         FAA4j0q7HS4UEqayu2LzBBt+q1e85TLbWU75yowUJsKKu0o1ryI204XsY8dgsNpBCkkr
         L3xXHxyItINkecbG+MNxCX3n2Q3RBtTDQdQQ2PZUv64iwCKyp+EoOVJiZd6/FJUDSDIy
         JC81IHTFihkkTa42sns1trXOPxGOYAO2LSnyHyOlHATVi/wRolNeQleG7PudRl4mhVr0
         xA0n1iFnCU0Ps31b6+zbH0O/r3tEBIsbtybYiMInkqTNmwN5rdUVmgrKykk4pUmYHCyM
         N1AA==
X-Forwarded-Encrypted: i=1; AKwUvBy+sqcBeOG6BYPv7KwnITY5NMhLiD6KmEmCICf3748lAIA/Zq7w1Fr57cM6J3+Jfq24ZcHRgRYO66A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1MlY9ejj8F0dH+Rp5KEPylov86kPM0Ml0AfW22DxwufqHKC7/
	og/C2ILmt2la8fddGDH4iz82nC09gR0Ebc0v43/g+SAq9snicb4Wrc0+
X-Gm-Gg: AYBFou24SX79f5XOKuPKVoDYPaKIndEUZ+oXbuuM/B3PdgKaT0Q3BSgLhbGz6Hd4VBQ
	1lXFbwXz4GMmnejuW4Rjqe3gYQcK5AMuqcA8BUNYAN5OsbJkd+RSApRhpOZnqb5Dg7m7H6OEv6k
	lEGdzIKUZ2z7UCDJ7WXPYWfW7YhRTkghqObeV1tpwc+iIF6LK7eGU9pz/lAYAh7yeq+by7IZO7k
	HGjHPxGWmHN36jAnti/tNPzGDEwkBZqxzRw8se9kpqFe5Tm8YMeGvPL2Sxp3WSANJn+gVUM/dVY
	WnEdxDTtS/IBh9BvlK9EW3H6ASzq1zRvZzO7qCAzIiD23o5h9qcTn2ElfggV67aUXxW/4CsGOIe
	fkggnpN1CWLEb6jJe1PsB6CTcz6rNXrCX6VydpCAVB4gFs6aBwBpWbDmaxpnIAeFPd/oh9QAmkH
	siR71JjK/F6tMbXN7/vZnUmjLZO5/TPgKvmVIoPHqrtbXVVX3cJCePNjZ4byq7+PnlEPrhyuRl1
	vsU18kRBO7yQiXTJw2hzgdrJR96kSof9oMwVEm8CdBrRtSk/rhmlLBPefZN3+jXk+lSod5CUWNF
	U7m0oYBshg2h8vye6tFFdu3SWh2LaX6niCvdviGc5yOj9wjnyyJXN8FHQykJ/UQdxdov5P/evVd
	ao7+z64zpTbVjsq2scLY/fQzJv5Gpz1zNE1lD1rTaZ8zfKvFZxFF0kSQEvyMb6s3PcnzbM5Soi6
	R4gJmyzSk4BSj8ljOWYDoW/MsSvqKFPYPwfWTdKW2ARYgp8V2bCfrLgGcA2809tx1TmNhZlzEP5
	4k=
X-Received: by 2002:a05:6808:50a1:b0:539:596f:6623 with SMTP id 5614622812f47-5640de36536mr13164089b6e.64.1793820304255;
        Wed, 04 Nov 2026 11:25:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:51 -0700
Subject: [PATCH v12 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
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
Message-Id: <20261104-h616-pwm-v8-v12-1-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The Allwinner H616 PWM block differs from the A10 and H6 blocks, but it
uses the same input clocks as H6, so extend the existing Allwinner PWM
binding.

The block has six channels that can generate PWM waveforms. Each channel
also has a bypass that turns its output into a clock suitable for consumers
such as the integrated X-Powers AC200 or AC300 Ethernet PHY.

Require #clock-cells for H616 because the bypass clocks are part of its
provider interface, while continuing to disallow the property for the older
variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 33 +++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1197858e431f..3b1819c8630c 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -14,6 +14,13 @@ properties:
   "#pwm-cells":
     const: 3
 
+  "#clock-cells":
+    const: 1
+    description:
+      The cell selects the PWM channel whose hardware bypass path is exported
+      as a clock. Its rate follows the selected shared pair source and divider;
+      the PWM period, duty-cycle and polarity logic is bypassed.
+
   compatible:
     oneOf:
       - const: allwinner,sun4i-a10-pwm
@@ -36,6 +43,7 @@ properties:
           - const: allwinner,sun50i-h5-pwm
           - const: allwinner,sun5i-a13-pwm
       - const: allwinner,sun50i-h6-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
@@ -62,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-pwm
+            enum:
+              - allwinner,sun50i-h6-pwm
+              - allwinner,sun50i-h616-pwm
 
     then:
       properties:
@@ -83,6 +93,27 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-pwm
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
+      required:
+        - "#clock-cells"
+
+    else:
+      properties:
+        "#clock-cells": false
+
 required:
   - compatible
   - reg

-- 
2.53.0

