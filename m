Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709479;
	b=iEWBPedsdJH7x6br7wgGCUiVxILdo0Z8sYdALI2j7TcU2QbTet4wYkAOiXxUaNXkq7xp
	 18F7ptLbfLATB+baawnhnK5rRUJDKr8/mRgirAj8KdWG9LJACMJu1AjVqLUCBE/Mrvsdy
	 TXWCVkmtMzBx+hYbS7Zy2Jplc3iOfvTPeEtqJcoO/10VyOqAlMMweqO+cpSWCoxzZfGTZ
	 Nkw6UEO72G81YraKf8eLAdsxz+8FSATIiVcHB+7lKOixFNuH8xE2k9c/Q4EL6Ymw/lypC
	 S+ROLfx7KI+3W5FtnlUwtyHqkWUZRdQxIcCsYhQcQu8gJzCXgvTfPApRopF9Km5Kp2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709479;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TvxjHITJOzjmt+7iOw1sa4TYT9yXQN/3c21i5WbJxoE=;
	b=UP3lVQq5yRC8qq+qFmXCYjsgyL5caqCqacVF5rR36bBKs0c+LT9Ha6mYxRhbGCQ/K3ei
	 p0iotVOWcfeLTjlIGznvBQEqOLAvXR/3E62YDSmYtT+xlw4q9FMfguRKL7Uu1o5ZDczUA
	 eMG9HPNH7dk9B7OGzyaeEV1GbNaHQ2vXhDbNS5jRUXvlnBKQ9Itf+me3xtDOsTA2mr32/
	 lwN3drPMAgZsp5dTA1pf7qgbrgQicBLVQwMngSaE+ddaM15XpzkWsvZ+shsqDsHcsq1Nc
	 4Ufg5fdZQjvhvKO3hAK89to5V9Mk0sX1jJLoeBhXfUegiHsQwgaS0a4O4KWiVdgY3Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fC25/bpc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDE3606A31C;
	Thu, 26 Nov 2026 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fC25/bpc
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795709479;
	b=ECRd0ikZqTkS+byBgmBPZpxA07NNnJg4BZJbFibOVXGNnYNnDba/dTXkCvYks/pijn2N
	 kzKGiCiaQUv0XtPfdR8hz3TZoeE98ZzKjS/Jzs7osvj4wFhGpUHG53WZewO1EPoHH4LsD
	 0fbE8XN7sMWuOB9KOMQmQvjMKAIe8s9h7VXWK20V0heK69QVj6kbgnGTmjd1rZSnvFpGY
	 96bg9KmUyBmJ0FVmIN2ImYaLCRVD4xbS5FWxzPbl9rsOWva4nrcy847Q9RHMDcAf2Af/V
	 Ggaquo7gvG/Am/bscJBxN0B5FOK9OzwOn0uGBfa3bu4xu1rhuBKxQ4GHo97sv/hTClw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795709479;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TvxjHITJOzjmt+7iOw1sa4TYT9yXQN/3c21i5WbJxoE=;
	b=Kz2L/NRa4QfkzTnxuGCVpWY0LC6PHG7hax/bhv5QJ4fh1HJMo/5MTCbsXAzdbO4SX65C
	 o04L8rVtxWz10+EfydiQ7xDUNSor/dp9F7tRXogweUHRn3LclaR7z8ghpHJM8Mm7r8Y0u
	 OwS0ysnPqNzbeEX2UIRmrSED6LYvvOV+oc0iOP5nWgY1lLiJfCLh/Nh9Wogu/1zS5mX8L
	 bH8pXITRHKQtvPMUG2/2CgoUYv6kHExnn69P9pNCyQOHwQE0Tr+zMSXQ4vq8T35Gatvk+
	 aSIFOuMl69pb0IF7xTlWVkejOZunwbcSnD0c0BTgv/EhKsGpFZHCZy6lV31kFs1gzjg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C12351F000D2;
	Thu, 26 Nov 2026 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709479;
	bh=TvxjHITJOzjmt+7iOw1sa4TYT9yXQN/3c21i5WbJxoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fC25/bpc9sAgJvvw19dH9ct8KP5sFEW7E1yN6Qkgg303vKlWj1MGS637kY9jFrk2x
	 uhAokkp0+wdqzi5Kj7zGsyZCspQsxD3YoUKMhb1dXfYkHnnVBQkCzK6/X8qKW4PU7S
	 cH10yMskoFdAHWVucuoZAqrDjMLusc3QDkqqEJcSZ0AZoXGAhoQOc02cifsR5UCDao
	 Bogga7HwkFGX19aIWTKt86IkuRZpcb9QtV7k7sVBjny6k0ZX+jedV1JUCkUiaDlDvW
	 fFCnBCLIQneZdy1DLs9ZyqQCPyZnn3OdhIMe2QZq0fllgIUywCQghvd6036OP6ALja
	 hV52xgUy0ek4A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 45B164D621;
	Thu, 26 Nov 2026 16:11:14 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Thu, 26 Nov 2026 08:11:05 -0800
Subject: [PATCH v4 1/3] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
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
Message-Id: <20261126-rzn1-miic-resets-v4-1-4f73af81d779@reliablecontrols.com>
References: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
In-Reply-To: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795709473; l=1840;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=3gnuD7B0CFK427B4+Q3tucnWjRFrW/+a9MUpmAlxi/c=;
 b=uBwZ0w9aQfhNCo86A+BL4hHvpW1wO25a02PvcZpTvqwyHpqh6c5qOFfOyyHeV1tARcmPDjkzU
 pxumqbQdZ8PAUK8HXeOvKIQjfTS7PqKMkBXNYl5VS9F+vAU90KNkwZG
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

Update the rzn1 system controller to indicate it can be a reset controller
and add defines for miic resets

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 .../devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml         | 5 +++++
 include/dt-bindings/clock/r9a06g032-sysctrl.h                        | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
index 26d94cedc871..70ccc315a10c 100644
--- a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
@@ -36,6 +36,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 0
 
@@ -56,6 +59,7 @@ required:
   - clocks
   - clock-names
   - '#clock-cells'
+  - '#reset-cells'
   - '#power-domain-cells'
 
 additionalProperties: false
@@ -69,5 +73,6 @@ examples:
                      <&ext_rgmii_ref>;
             clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
             #clock-cells = <1>;
+            #reset-cells = <1>;
             #power-domain-cells = <0>;
     };
diff --git a/include/dt-bindings/clock/r9a06g032-sysctrl.h b/include/dt-bindings/clock/r9a06g032-sysctrl.h
index d9d7b8b4f426..244f5b221642 100644
--- a/include/dt-bindings/clock/r9a06g032-sysctrl.h
+++ b/include/dt-bindings/clock/r9a06g032-sysctrl.h
@@ -146,4 +146,7 @@
 #define R9A06G032_CLK_UART6		152
 #define R9A06G032_CLK_UART7		153
 
+#define R9A06G032_RST_TS		0
+#define R9A06G032_RST_MIIC		1
+
 #endif /* __DT_BINDINGS_R9A06G032_SYSCTRL_H__ */

-- 
2.53.0


