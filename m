Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622061;
	b=uLjaYBGNh0K675hmEFpkI/mzAvshyg6DsOgM8/MeX74CsarSi3CMRDYN9bgwEQniNh41
	 ZUKRmLFI7Fyz72NphE+JIZeNPE1l3TfIw7soF1HEpmIyx6Pf1Mn6QgCGbXTOF8q/uqG/3
	 KeAPWtW9Az5OTruHhHYDBdx2x933kiQLdwbuWj0QXcVW5Or26TgSypqVt/X8Q50XWhl+f
	 pBU+v70e3DOZg59gw4JnefEeSP8ccOaKKgsyFApNG7V7hUHacQKUjpSe4RdsDLOsP4l1g
	 EqSE7XD+7nFBABqu+LtICDSBOdU6GIm+/5O6dbueMOo4yxG3hiXQTelUOUSpAtFTztw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622061;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5n4jaRdycpWwBHXJkQ+NJlb03TXlPebkZfwOJPrhn6o=;
	b=2LI4VSFLYDKcHHEnNHA2CIiLdVlWjvOLmK0quUtWnfmQczvf18KdWvGhtbBa3WBR5Ox0
	 TKNklENd5UHRNHfhcLLyNMmb1TKZeuTrgh/VX/JYqjS4Q7hvH4N1vNT68NgGam/PP3C4X
	 gsA+Ol5M3aDh/INzZ/t5IiViV0qG2z1PoAvbj9TS0xaewDMD2+Yj+UmHSqW8X1sJkmENd
	 nW6QJBGkTLDmtGJA8TCQSssDYVJc2F/vidPLRPGy57lF8ZFSvXcALQVGVn4YGT8f2X2fh
	 fpg9b6cU2nBsGihuMrW+cOzp1ixaCqtDDpKZG+pa3X/kfvJiig3Tbi3bbrxAgDffnXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKSoiUEW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A2606A31E;
	Wed, 25 Nov 2026 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKSoiUEW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795622061;
	b=zGxxd1jrCFIKykcw1UodgTXahyOBinyjgyKn+ViY8c0t+iZux4cQIaNXUNhoXYJ6D9D5
	 bUYfkqvH0Ew4ZQt41w5IXjMhWN0kUZ8Ekg9I2hOcuo2xCCkX+bl3cg8TT2I4l2b/jINzd
	 VcZr+6PpPgOsItTD3XZLtnE/1mYec422R6k788T1BvdAnJv01RSKRYDr9H2aVsJIYplEp
	 WqAwFkXY66DaRw3vn/xIb6vGYjzXwJL3ZV5MduuwozIOE7s5hzCy8KTGnF6jQaTIzwHpm
	 /9zeB1q2dgPn5Q4BmGTWK8typ3FfEI3/j/uN6JUNoKrZvzSHASSfCHzLX0ATtLa/iow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795622061;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5n4jaRdycpWwBHXJkQ+NJlb03TXlPebkZfwOJPrhn6o=;
	b=HU2XSCOPN1JUKVYBOJMnKfaZAuc6vYh511pPE75vd1sLPN5iW4tYQ2g1+UyltF2W9Hhc
	 YQGjTYOK6Cad2ttsAoRJZYfe8DUP3lBXmiwSDH1z1I2uVgQgd1FiBA9ybZD+/107xyJJp
	 xskWYuXRjcwgUI8X5aGe9ZVD7MLS2yjYvPoYtwbn4U9wHiWlElEtz0TLIfkb5pCQYrVc8
	 FJkUSDB+p2C2DaEXO6i2pEWwJwVLvklyIfmdFlh2OLIFopaHWvxf6DDNQMyna7J3hL2os
	 I7Kc3jLWFTbHiE9ilqLmRPsejsF1V58EYG4aAsei/xPY2geoCr4n/YE2bfQ+DeUCRqQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C3D81F000D8;
	Wed, 25 Nov 2026 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795622061;
	bh=5n4jaRdycpWwBHXJkQ+NJlb03TXlPebkZfwOJPrhn6o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bKSoiUEWVU5kEZSODELrBY1w+gEUunvhgVcwQRm6Ei31EEbB3oS0BqAGDxNhX31V0
	 j7zYQEtFXg5GK6GAbzVc9aGp2IjSPnkjyAc97opHURw/dE0rHlTRlCojN9TX62Q1Fo
	 FqvNBMIhhU9kM3VnR/7n91fujms60x6XMfuhYJL686Oil2C61vR7lE9N4Ncs2oO99M
	 R5t8qrCAhO5AUimGtLexqnrVnWMLIPuMHYT1/+cBG6jKlfccUDE5D/TTUYzBFYyEYw
	 /9A5rS0c+zmG4nuWId6hHHbzK3dqDaDotP7cqVmoYzesm0y2wMY53b2+bcTt4pqHtp
	 h2w49balnumJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 95C8C4CF40;
	Wed, 25 Nov 2026 15:54:08 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Wed, 25 Nov 2026 07:53:43 -0800
Subject: [PATCH v3 1/3] dt-bindings: clock: r9a06g032-sysctrl: Document
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
Message-Id: <20261125-rzn1-miic-resets-v3-1-f25a4b656d71@reliablecontrols.com>
References: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
In-Reply-To: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795622048; l=1778;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=b/QqGL4gpzDc/pZlATaU8inxdTKev9TR0QMXaAdJ4ms=;
 b=254cvQmnEJOj02SCmniiQdTBKPZ/CJ3q1NtE46KOUfh6xu+00xPR+a/iKJGK9Cpf8Sjo1H54H
 +Ymo/2xFz27Dn/ZylqIbimTuxkA85VTb/jdopJu5GXu/wrrUaq57xnx
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


