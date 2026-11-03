Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695236;
	b=CS67F/lLIalK0WBteU47wQG9GRsEdlloY+QBSDnfxXIHwuo5Vtm1rMQNdWGhbVACRPyu
	 RaoqO0pB4a8AT9urHCL9Z3y04VO9oBNzoSxwXdIVnEqKNzPhUN75LlZmbdtmCf8Fhi9NI
	 QVQQukR0CnCQ949yo4nONExa0d1qina/OyUGJyUQ5SjSw4AK2Sn0groMqTu0xMhKRAENq
	 NtVkWC22t43IkqWLZfkxlhJT7NT8u+CY6h+Jj4alfhVgSjfoocquBXzzuqsbrXUdTg/TM
	 4vuUXjpZsSHFw0sR5nm/xCrD2oFngDVHQat5x7Gd16SnSAJJx+cz+juoX0Gkc4xJmbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
	b=qgN5FRu2VFlARo8X8p0wxVMNwhAzQxJPnB0+XzKmSEKV7zEeW2FOboTBa1pTWLNMkLM+
	 AUJ2YpB9P7Ref8LUEnDOakXHpuzi7nNAEl3BEMbIvXRUE7fhJly5wsS5uopv/IBQE0QXe
	 tH35oGCIYsyBVK6/Dy43TxYZdTdBDJCjH6JZ6Vqjp4okzhuGt61H9g1PGdw/zWh37jSF9
	 2oBINIcIbVeNA+s8pfE1Ig/bpRLYGKfZdC7iSxOPNIs7DUtg0Htz4iRiPxrk5aYc8nWoN
	 35pTwJplSKf6fbLJ+W+QysezbS5R8KMPJCVuIO6ctiBNKSISVbNc6qvblOfd4kaRwEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmRIarE9;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C85606A97A
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 08:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C85606A97A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmRIarE9
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6f74f6b46abso2269336eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695235; x=1794300035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=gmRIarE9Q49e3N+eyYDYeIXbSWIUOWqXSi/WRTjOsafRsqRgrmitK+Katzb2O5y9uh
         pve7zQeiIP65hLlCihVpiyH7V80U8w4C73mL7cFjlA2pUEYKqCOGLlXlT00mDh/zaxfX
         tP+Usw2C3yV511it/eB6j08OlEGr3GNziSPj9TH9Zd4MhBUkmbkD3AeZVUYK/rotwd71
         vqXDz52/NBq+Jc0sHuMfLZs70hzrhSDd86ZtW8OXOMNpdsSx/kg+Plgq4L2jFrUDnQqA
         ZuqBxx0NO9hY8aEHuiweq3a4Gj693iYyPaNki0+Ft46GntbZmF7A+Il4V8znqbc+27Yb
         S2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695235; x=1794300035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=xAErxori4MtkXZsZPEfrLoAtGy1POkK6rY2kAgoERC9zl7qE6mFZwWno/TdDjZWxDJ
         TaZbm225zfwwvR7kQwGgwOzy8cEd66mkjoIe4S64ZcTkzfbFax7OS4Y/08evrH/y8kY6
         imfVYioQg2fQpnURwQK+KI46Y3cqqP6FtYGfNqaOCX5umRiR/itTry5GdDednbq9B/Lr
         e/kIyozBE5/zNvIR0DvK9bQ47+GpVHXxelqbZDLbFbH9nZeZlWEsHxk1rzSoDsVlN8UX
         jFt+dVPnpzoSmcSwx4qL0Gef7dOi6NxdWieqw6BNVkKPvUDp84b6htbpRHCLWDdIr2UW
         FBrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6uvopyW/mwn8McTtgeaWzmBWSs2UFuy48eTXYCy10B5VS4XjY5gloqyREc+phhaqYC8UxpKsX3Qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s4jdoQ6uVp2VARAp9wOtCwrvLuUfGOIdryiFDwHPJssSo+wwd
	NvvrYbLnISgGvmXmp3z+OS1DBStow2iEwp82F6Yv4idibNoOwmSDeTNm
X-Gm-Gg: AYBFou1byTrPz/fz3PMEsi5t7r+USM6BL1lX62P+FoPQCaN9prhIJ81Vq9fgQnHdH5m
	HXmVGBrFi9cpaqr6YBgGiDtf+ptgYHc1IpGBHngNZlnnAeCtnnd6IyU5JJStCDLHl7ysU4LNgk8
	SaUHyIuXNQVjgJWmi6GM9d9brgzRlDVfWZo/bBPvb/amyqRPnyKlYVzO+yZWOIXJd/4DmJzc5hO
	1taoNHDdzL7kmnxZciT5v62yFaeDgL2nLPMSkKYvj4cCdv5gtBOa6l6SZSvfoaqHUpPicvgPlZt
	wBTuYs+OETYf91nfi9LZ67jwbWCsLZ6gouxDQpuoBltsrJO+144GxTtP4iK4CW7ZZR30Q5ENYRs
	VzSCFh4d/ik+i5sX3XmdJFPOoNGpSJbY19jmFL5N3x8Oq4nHTsinELMstog2Q8k0XuHiqkLwYs5
	I+1TC+0+EJP+mUYooCXwerYtZGbv14Rbe5Yrg+mlnyJ00GuAtNw1NW81F2oh9e+hBJEG7wEV3tH
	EnUnxiFK0MGoa2QQC+JEEcbeCnAo4AptyMpwTV5LAeM4WrM3He3+A5amxYFu5U23p/H3RUsk9EJ
	Lr0uZPXyomk5vBKHAhBdlTG0OJnxb8T1+p60oG7BQX8c2Ey4VhywLtfwwUwHuMUIy/RHoNqY84X
	+8eBv82nnIaziJqfdKfcX6DCiuzFftuUlv6yEFps6DttxHrXbwVRsXKkDBDLjRyEQq3xYumfkt3
	3tZITW4R7IUqQGJlGnMkLH31ov9zpfewXoKg3MNEILAD39mfDdnFg=
X-Received: by 2002:a05:6820:a50f:10b0:6ff:3c41:8153 with SMTP id 006d021491bc7-714f299c8cfmr4772331eaf.54.1793695235466;
        Tue, 03 Nov 2026 00:40:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 01:40:26 -0700
Subject: [PATCH v11 1/5] dt-bindings: pwm: allwinner: add h616 pwm
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
Message-Id: <20261103-h616-pwm-v8-v11-1-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
In-Reply-To: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
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

