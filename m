Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209467;
	b=ByApow7IJEcA84NA0Zd3ORuYADEBlal2a2D4wQsH8oty2DIpSKD0FRvsSl7gjoQWE56J
	 A+1tH4PXH+IoHazrVsFz9w9gi2q9zeDqk+VDSmVYv8XlgS17DJY0h1QxAMaJeI8OKGgsW
	 BJUupWL7vwkEyjuRIP1MSHnBNyLs3Nr5Mgbze7cKZTuFe8p3mwEkwpCx8kNKhC2w+JX4R
	 QU22c07rSmVWpZdiCAHCoJf9Rv8/aOEzaH2Tp8M5FJ5VbMWjiN1SeaW5gXv/F/peupfkT
	 la0r2ISzKKnfTxgg9FeWO+vwjb3v1OlEtJ27b+sg0hmlWeHF/AqWvgS6FSEm6uZOmYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209467;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RCiCQ+Hp1ZZQnxhUVfE+RgD9eMnE/2PonSrU83pyP44=;
	b=roukgmdvjUJtz8A/MVr2bXQm89uYxwVmp8lP64eejp9+6f8xGNqWLR7bxqoWUKlsVMbw
	 Jz0GWYgQZI3mjkhrgrVNSpLyT/OvJj3ZtwgaIWB94Rz9bMG1Nq5CHXt6cFN2zIE32D7Xe
	 24lO1ycVIdpb8PdbADzNk6t2ZqoMT0YoSIJJVkpkfYdkpt6YmMdh11D5ER62jtxkfLwDm
	 lMGzhhRpp8isMbzef63YXozdYtp2YbP0Lk0U0ZrJI8jBMhS4WiZs9tMXeIURc3OvPZ2n2
	 D1k+luqx77s+PjXo4br1HMU70mt9mfIIV3ZQmLVJDBB0xMiWbzCxduni7PUKELg9fJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=on65Uztg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E60760A262F;
	Fri, 20 Nov 2026 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=on65Uztg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795209467;
	b=tX5TXHclTUranHaB4WAc80XWpi/dJRfw9pUWx6HVlrQo7EF8bJ5AHOtblUra3Z8K2ZZy
	 0ZiKJr4/bJqpygs6OLGEGUtMIeWAKrYrjn18srFVQaZoGzBIB/dHaVY28+zIpmip2rrdb
	 yVhEERrPwZhYt5OIml0u0A+LIJR5pXmO4fo9bc+m/UoXiU29a0x1iyfH6SmQ087MGD7iB
	 5jXKXGIXmyhSEDp822YibSvli3ljYu8HLckLdMihRr1I+pxBB50g6Maq9E5V92sgf1oMN
	 ntqCgmFtCz28+5VyQ1QZtlec20t6UXCzhiGrkHWDMlR++S/JXVUTxh3//EjwKQ9ZNkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795209467;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RCiCQ+Hp1ZZQnxhUVfE+RgD9eMnE/2PonSrU83pyP44=;
	b=XO2qdrAmTa125X3Y3aSXmEevo0e9iK24X7q8NiSuD6oqc6wRwWNIPBL/2eBCZGTpmGaF
	 soLYyi4hDM2UJLp07SDxv90AvmCCVTKCJbUTExtXgx8CUXQcm6APfhqo9Td08k0dDtTMB
	 Ij3xEo0gQUjbs3RjPoHrXmvtq4A6mrEJ/vXFzWHmLsWbVdNk3Il5QHZKOxp98mehQeSTm
	 hb/0gJvP3Q86a9LzTkaN3AsqcmzjrcoPSq77/nom9+YyCAlcp5AErE3TNmmvQC7LfykOV
	 QWyZgUOuEv34kA0k58eXKv4aB9WHXJZ56+JkilZvC9GweD+Swrsy8s8flVb8HEU3z2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 686201F000CF;
	Fri, 20 Nov 2026 21:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209466;
	bh=RCiCQ+Hp1ZZQnxhUVfE+RgD9eMnE/2PonSrU83pyP44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=on65UztgRVfRIZT8jEGRZlPkAjDAzO8Dd5iwsNLxOF2Km0nifFnnRQ8GNxHokdu//
	 JtKrsmMUMcceaAqYtfdr7w9Ql5FHHq7VBeykbplmBZ2pFcMmqp4/QnwscyRRvObJxP
	 Xqsm3QNjtYWrPCkCz/StOup3EHxQEcxAtOEhfmMWdTp2hYnp5ByMS+5E5aI+9iBO7X
	 8MmNabv408YkomUL6F/CGGF4+Ii53+8v3vZkB9wXNFc6941LwCTVCvtCcgmm7iiXhn
	 MpFq5rN3AE755dEcBHyAEF/ohOFk8ODp9hlkdjQ8PJ1SGXWdHljsOUt3gg/58Kj9nH
	 YR6IYyCFtqZvg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EAC014BA2D;
	Fri, 20 Nov 2026 21:17:34 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Fri, 20 Nov 2026 13:16:52 -0800
Subject: [PATCH v2 1/3] dt-bindings: clock: r9a06g032-sysctrl: Document
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
Message-Id: <20261120-rzn1-miic-resets-v2-1-f1cfa678615b@reliablecontrols.com>
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
In-Reply-To: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795209454; l=1778;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=WXf/BZr4yjg1xY6IIiwzikkQWZRk9snLw1UWfup0bNw=;
 b=bK05m5/mZ6wVusVvvi76q7xIAyyBGK1yE0z93i2M11e1QQinpO7IxqGPMM9MR/VGTMxKsvu1t
 xJwOPrhkijiDj4OgLclZAf0W4/MhgkopeuHF7HedOFSeQZy0UM03fNi
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
index d9d7b8b4f426..e3059c50f7c3 100644
--- a/include/dt-bindings/clock/r9a06g032-sysctrl.h
+++ b/include/dt-bindings/clock/r9a06g032-sysctrl.h
@@ -146,4 +146,7 @@
 #define R9A06G032_CLK_UART6		152
 #define R9A06G032_CLK_UART7		153
 
+#define R9A06G032_RST_TS		1
+#define R9A06G032_RST_MIIC		2
+
 #endif /* __DT_BINDINGS_R9A06G032_SYSCTRL_H__ */

-- 
2.53.0


