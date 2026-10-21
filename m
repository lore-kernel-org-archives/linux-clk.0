Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566513;
	b=VlKanz1HdtQQiEfNJvrLw452H6woZQyTyFo9wKQyQ2R/58P1I3/b+WGgjI+y70bu3JFA
	 ARZf/H0WAv4TCL6u3oy3NOTLfRgZSQGCv5qkgbQ3rIx6gFJg15KwFxkSqeJfJdljwmxeR
	 iG97DbicWT2CfDtzdRktkMJDWOM57HPTjgsRspomMLXr8sPABfCOBqHa5yA1Pzrw+4HPM
	 eDuXaOz8J+TJ9B5w1W3ioL6yrWmXEho1jPqoemxUz59qbPJ71AZm4X/J9T0zahJ7cTEiK
	 dbme63EwQJELK9AeNMjsGFiBp6r0F1oDdoMIj+IxZZ86u86UYh4NPQGLTrLofiPMtJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566513;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+4XcTB8uaM0hhjpS8gstVWyDL4QHXRc1Kk4cu0DdNtY=;
	b=NvKTP0aJ+9Kt4h7F16aca8xca5YD8z8fLEyBQXq/oHVBmcUmuVYScnlxHZGB1ToEwZZW
	 C2mWniHpQFwmA7SjKcIZXzPa3XY7vDbyEGrAsndRvCMqCNLw3a/lPlXGpcQUb2haPnjV6
	 hg1z+7cb3xnBdYDuoEOwHtKacg14YQCMyw7USKXqw9+8FOnFaaq03cJqDvyozUBYf6YXl
	 ittmu3RVLHSPUpaYgqZ5oG7i3sz36YcR0VOgEim+v/7OMR+EDhjOSYpH7zvWLWFUcaaqc
	 UTMfGlDmon5JpLW84EX+Av6NrOJIIpEH3ubGP1Ac2TpoCdq8il6itlCsnV47Dvj29hQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6wPTEcw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED468606A319;
	Wed, 21 Oct 2026 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6wPTEcw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792566512;
	b=pTxMr2vbUKzkVVcweGd6HxPScQzEjvIeNH3VufyRDYhGM+xtr4CBVbH1yPEC44kVrOT5
	 zOl+lf/gF4qT3mY3+s64ffPb6b8PjthhN2t3r73vFmAqkf5qAX8BAJU5O0nhdHcyCNB//
	 3aX7jSYDokC9lTOVZv2vOtMOGcM/tXN6vzupUrAJQ4Emwvxvd1s8XWFS3mvH5WrHCPWX8
	 n4o7kC6fQJvkTIHaUCAAyr7Ob22C66To/nwLFgcOdo6nEBm4UWkVF9KzTywyC01rFB2qE
	 6rjaeoofueP+2jUqSiDjyxozawTqg1r+AOyyEQ9nC+ZR+RFqNZa3Y7E6E9PDtdrljyw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792566512;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+4XcTB8uaM0hhjpS8gstVWyDL4QHXRc1Kk4cu0DdNtY=;
	b=k9fVs/IfNc7fx8YMSR4u9WWu2lKvUUOIc+lJMvdQDa+3gxWZMdVVgrXMn+ih0Onk8u5g
	 u0g9Awbs2YFyhhnbpH8OzXidDqGLVmN3AwoFINTXDayejQ9lSfxy0jIF5s5E6bDuQoZPZ
	 VcQEjZqSlx3YQufcSbDHf5yBkzIqAuAirPW6+P1V2LVyR6RHKla02K3aUKquVyfaGefTw
	 81Ngyj5BgwCM7mrqPLpC/ZheMI1g7PquGwqk3ObgkqDqtlY+8lT5fwUGNOECqPq8lhuCT
	 M/6vsjXK+1Fkth2cOy+Y17cynzM1E81MS3OoXl8OzDMWVS4NLPZWDb8lq0fR3/Ti9NQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A58591F000CA;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792566512;
	bh=+4XcTB8uaM0hhjpS8gstVWyDL4QHXRc1Kk4cu0DdNtY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=N6wPTEcwvcIH8P3RGguNYWNg4LNiO5EXV9bs7FHsjQt1qdH9KoqSjpM2MtC2QgorU
	 Wf/FBKK5hBqrELJcL9ba+WA2OEzJwUajNLPuhc3LL7lYv79LdIaplCQyHlIXq0xG/n
	 HUDTtH5E7wMpotyWnTPJ2sryahjQ3+1QMViATwRQ2/c72rWV88CdXyNO8AkHrYMTIr
	 jn11OuqWfPz0xBPEjNCW49GA67PocxsQuezNNfRxahT2t5s4Mpqh02QzTnLwrXcN3t
	 IEiGNtGs+cVgByS9Yu5oVjMq5IPZrEl68licyeLPTe15EaDVQB3q6P1Y+BjThE1mVI
	 52dkt9bAZPRzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0F167432EF;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Date: Wed, 21 Oct 2026 15:08:28 +0800
Subject: [PATCH v7 1/5] dt-bindings: clock: meson: Add audio power domain
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
Message-Id: <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
In-Reply-To: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792566509; l=1643;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=Rx5wFB2nCKDMgS2AxdE5dKUFuTGBEHrm0nwe1wxO0Fc=;
 b=eBhduL44M/Hu7Y49Qv9Ch18NOTLGupOewGkhCiJANoMMipUyXfSkugV1wPhCTVmX6IqGc6e1O
 aYHYA0HYRvqBCf8ZzedfhFWWrzfRiOhCLQP46zS7kH0jK0336EZK5PD
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
 .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4cea..69f5fef5f14a 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
+      - amlogic,s4-audio-clkc
       - amlogic,sm1-audio-clkc
 
   '#clock-cells':
@@ -100,6 +101,8 @@ properties:
   resets:
     description: internal reset line
 
+  power-domains:
+    maxItems: 1
 required:
   - compatible
   - '#clock-cells'
@@ -115,6 +118,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-audio-clkc
+              - amlogic,s4-audio-clkc
               - amlogic,sm1-audio-clkc
     then:
       required:
@@ -122,7 +126,18 @@ allOf:
     else:
       properties:
         '#reset-cells': false
-
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
 
 examples:

-- 
2.52.0


