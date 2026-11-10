Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277723;
	b=VARRKRWY3DawIYQlJl2k1SMNOMcTdqqUrkhcyWyqEROclhRBp8rdgKxTmkf1uzRE/cG2
	 5jEkbS8c6BwtDMjzEaPke9FacsO/H8BQTYQ+yOlCp0c1Nqf/eLmK+ChRoYHwpos+gRHZ2
	 q48J1l/X7OLQQDpPKzwSfdV3eGd3kTxm0Jxs8Pj8eaeRydsG6MFQLJAYXrS5r5et0c3nG
	 wfwIkUpKG+iysSxBGETlYESFQviCEHQQeD9X5U4iri8QxaLwIVxZfLRUrW52ilHMZDhYL
	 cB9z3terlxrVWJKcP0HICpp9fvyZe0EQJRkIOHtyim6HmEpiKVZRy3oG0uDSynzj9Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277723;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	b=QQYMdsj4jaS6gss4+DpaVhBrhDSx1uVDfuHtQ0gMf4SoliRit0llL+XCnKORBubiV9mA
	 +hngJH2LM/GHCVMQuxwMta4ZqzvhihYHJFysWQEusj63655Y/2M5BA/a5jaSeOa10KFh/
	 Lcehq7D8pa36qWHAtkl7iNQ1QLEMeRVoiHtWYz0tNclIGQ2TGCVsZUz86pdOPniA2Ed1W
	 toc3KpfLWVTHrkADXpwg8lS3EMM0ry1ojyk6hNSqtuhFTIpcF8ykdB3BnnF82DvbrtvhC
	 OFTLX29SUoot6s7J8BOjoFJxzGSbSOzFDIZ1W8Z/DWkPLbEFfQTUYnGwznww02Usxaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beX7e5pa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EAA606A31C;
	Tue, 10 Nov 2026 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beX7e5pa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794277722;
	b=A9hwlogobFauFuBDdT4bYhkW8jdPA0+WwMurpqANcTtCprd4Jt5t1bP1mB/i6iNjAsfh
	 MSS0aM98tb/3EUYqLuy4oZfZ+wtPX8359YZ9VIcPeM+Hjx7gyZ465DwGou37REtI1Nkuq
	 Dua/3ASVVNs9ExwB8I6pLszG7iQ6SDXKpj4Bj6p8yf3ncWxsIe2zKJ3sA4BxfzPSepdGN
	 71d9CrETSl2/q0V7pEm1QBHWrWjrSXGbWQZiZJBo+AAatsrMYwqRF6izTMq4eYOAoLqH5
	 VZE31pLv/yuCY9JHi0MsoZP60qHKANYhkp5PPeJaLTlhL6G4yg46N5TG1t40UkfT9TA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794277722;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	b=B1w0hIPDb1ErLF5uX35DbwZ+FNB6AaMkDe3at3P0PqLG23qjYOdZa5IuFxUAD39C1BJJ
	 VC9v5JkGgaHnHZVl5XrTbn8TEoGvYd4V8U72/Syk4kfnhFnNIe0VPl8+XGjdBKLQCwsS0
	 iDPcG9HRkq+nyhPE4CloTsF5X6z/LG32WDvvI1laKVZpDSdEcTiQE1BLgj+ZUgCc9BwW+
	 GEv6oQsQAYepaj1F7ZC8InFuE0MzDJT3FjG/7UsALGmDJ+eyv2KHwTsNuPGbe9+KEYRD/
	 h5UY+9rPCPS+lOoJwI9PtccbKsObAjEd/wb+WyR6/JBqAjlrzbxrC3PbvzGetWyvJjA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37CDD1F008A1;
	Tue, 10 Nov 2026 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794277722;
	bh=stxnBaxP9XqQf+8BdY4DQ42cPatMzck7bz8+9mlyJCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=beX7e5paOc9KFVijwsLTE3ezzZ3kbN9z5ZOKo1VbUIN+8E8WuRLJ5KGrKhEGJaHF5
	 S6QnqIYwOygb/0+uMf8prcZ8lM1rETmoDA/ZIDceKn15JmK1Bs2jbzFoFhY/6U2A9v
	 Dvi1RZoZt5xuBParXMt+kBt0vZL1S8w7yvnanzIuz/OUPK3AD3V2ICL4UgcyF0ySmW
	 GVaP7DE72OL0Syn9GiftySeskZG5eEZDLvzOROy2IUcRuOpNoUci/q1xGwCnz0LQ44
	 qcy7XOKQMOrTS77FUqUIIaRekHc4tHka9yOi4eGt2In5M3FRrPF8cSBTkUJO3uIm3H
	 dTGfvv+z7Tx1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A85E048764;
	Tue, 10 Nov 2026 02:28:41 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Tue, 10 Nov 2026 10:28:24 +0800
Subject: [PATCH v8 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
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
Message-Id: <20261110-audio_drvier-v8-1-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
In-Reply-To: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794277720; l=1619;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=8FHHLcJZtu8lo09r1PD8utgqmy2N7M4R5lGLzc1tkrA=;
 b=tU/7TKYYoslaBsaQeijapfVxmsVy8JtS0rrkc3CACnkHRYQIyBFT6kbd87jVYfci8R7Fzh/mK
 iGSeam7mSKGB88BQb+YABi60uAmQ164s7cm9IZfsUgqZrgENxe5Nh23
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com
Content-Transfer-Encoding: 7bit

From: Jiebing Chen <jiebing.chen@amlogic.com>

The audio power domain has been found on S4 device.
It must be enabled prior to audio operations.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4cea..75ddaf8d8091 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
+      - amlogic,s4-audio-clkc
       - amlogic,sm1-audio-clkc
 
   '#clock-cells':
@@ -100,6 +101,9 @@ properties:
   resets:
     description: internal reset line
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - '#clock-cells'
@@ -115,6 +119,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-audio-clkc
+              - amlogic,s4-audio-clkc
               - amlogic,sm1-audio-clkc
     then:
       required:
@@ -122,6 +127,18 @@ allOf:
     else:
       properties:
         '#reset-cells': false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
 
 additionalProperties: false
 

-- 
2.52.0


