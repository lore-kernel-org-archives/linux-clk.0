Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B63A3E91
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 05:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141786; cv=none; b=RGnTHLGjThVXNAm3G33MHiKws3ysSnV5KErfAkIUSMt767sVK43DOAzFeM6rpXF5AIEhATCa5I2oFea+XYWmvvyoSCDRgKuUr0NLNNT5atGKpWQLlIUVx1S/flhA8DNua8VmyByxf3imiZ1XqDTRkuASyFQbSthwsrg7kGzPW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141786; c=relaxed/simple;
	bh=5k9VLU6OvtrGZi0gO1yZy16OfwqfrZmQwujeqIifWv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLpt5d7wYxF2U4P6fQdFtY+fMyldZd3yyuJmL213WjW+q0clX4Xp34798MumbmZaiIKxfrmEhDhshf847vt8iTdxpYEKq4qOJTZfenZOcC4hMN+I5VlmrKBzhMq1tIqVUAFyjIErAoox1VI1GZfdpgcNNpyBwsjDrb6WCXnw6cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8XH63Z4; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8XH63Z4"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a3688a2so516006b6e.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 22:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141784; x=1790746584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=F8XH63Z4doIji6bAgrFxU4KEekuBBKmXL51+Wdkbkecnt3xzvQGiJ1lj6kBiiQE78l
         6vt0ZXymtZwSyYJYb3xeB4CmuzVVdbvwsvON9Pmdscl6FcrzMXmyawBtN9dynJ+8gwNN
         YRUrlwN1ZBsGdgrlCvm4KY6vI00oR6JgtnCqXh3Al3/tQWCPvopqWqeScOzz3ApR3aMF
         qSRL/1UsfSmgkSPUXWGNkGBcZRViDMufWKGPqpKEkvu0eyJHIDhDYBCEAH3MEwB3n2dY
         eFQMaLv4if3U391jU5QfTeY3iz8JDef7iyMh5NtrfQdMcNMF4tqbUgVjIHsb3OXZfhhQ
         /FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141784; x=1790746584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4cUR/bgVx/Ef4Tc/Iqux+0dgmZ5BenjLrR4X+eBZEU=;
        b=jz0cL5K9mTYWYj+8X79XTBKFiekd8Q10P6jeZ6MTUjqYUYHFfWVJyvIqFh6EQJMbWi
         hhO07LXUgfFVtNNlkRvAJtJaeoQhVaj0DvcOBK5G/uE0hA1eudjDn9sZJaFJeOjy23WP
         vIa1UvlYN6qVNpzy49BfNxPLFarxrDiRhcXEiyikCotrMVFehzRw1ekPo46OEX/Q+BUk
         1zlZ+jEAYD5jfsn5ZUbCIRZRJYtNix9otbaBrEEEuzTXxjscJwKdJZi2tmgXaQr+5xd0
         5s99x3h5Q352sa/vn1Xtba/XG/1OCm7ljCRkReZURLg/oR7ENXNsMNiUqyRr9YPuqdwG
         nYLg==
X-Forwarded-Encrypted: i=1; AKwUvBzhn7TioePK3zmr5FJXsyxc9Oxvkgxhfl8nr4YaPlhCKbVWZZ1uOX+JU0ckMH8mgje8qcpRIbXaCRY=@vger.kernel.org
X-Gm-Message-State: AFuF++nqvZwLDWzc+ivTeJKo+R3lt2x9nPJuMM+btCj4e4bQhbvbi9L0
	jk9Szi00867FKU6rhZTZKJsGpQuz8D7TcceNVxHGG6yAp9ey3HG+szLF
X-Gm-Gg: AYBFou0khF2Vajs/2FiJcCDlH5wphH3XL9k/aX29TdIql7bTZfKrFXR4+1sq5sgEMly
	GOY6StDEXSR6O7ySTCxh8zCd7Jz61gOhZOPGuqMZQ78c1Tgg5jt3RdS6f/I+Ri2jo8DoGKOyUV4
	XCpCiNEjWijVRuwxiRTwxr/tWlWCALl8dXC2S7QShD0A5LwAlr+MziGEBtt3TFAOFkFlyZbwVyD
	RJ/Q9dN8vSjDw4a151nHctw7tCy2cIbfufSr6JSe4s8pO94gW4y9L0QiNyvFjEoEkjeukMc+zAN
	6nmfELa8dYToo74WX9kbqcr61fjpPbeg0xx2Uu9+FPCZHOY6mQZTZqEcRr0zqEe3puFRqkRVPgd
	2GD1rgYiduRh0GjiwVxPV6DfvK/gMYitlGnHgAKJSlebEwhir+vHH7Qyc4jBndXJgqUCZOa9S32
	DUcIltjILgxivBI620oCjqHhENStVLtd2x2HeawGgbzn8xFV7dfe5k379eSQxQ6yEpVJC+7/35B
	F2ypPdXeMNL1fkHrr0U15i66ww9MzNtpi+9YdILcozKMkH1qKn81x31bzyKAPDl0TfQf5kJkudO
	T8fswAbaYXUi9FasbstKkIinsq3V+dCP/eSPh/93XTC8XvM/SPz15y+mENODEkVoESGlIgeeda4
	SFROklxUtwTdokNNBj3Xe
X-Received: by 2002:a05:6808:6b8a:b0:4c1:9127:c0fb with SMTP id 5614622812f47-4d5ba3c38b4mr1883196b6e.36.1790141784089;
        Tue, 22 Sep 2026 22:36:24 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 23:36:14 -0600
Subject: [PATCH v10 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-h616-pwm-v8-v10-1-dccebbe1aabf@gmail.com>
References: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
In-Reply-To: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
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

