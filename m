Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111099;
	b=QEXrJki0f1/4GgqN0+3U/QyUWxUe0Ch2XeyKjN7UlyyyQI+Bdy5GX1MFEpD7E2y48n1n
	 ozUBe9RulVAlTh+p0VQwdxyBMLhFLeefxiuE99VY3JhhAE6zYJ4hMp7qsIq8pPhe9ZqyR
	 1erIeeBoOdDlZg1wtoKcocsiZBcC/gPrknw7CYk08H3O4e9mb4I+Crb5BcSXDCeuh8gwE
	 pMiy1nzplXkR/lvjNu18PpFj8wfM+3QWp8rwFMO827biUPXRsaAVrMe5lE3tqSQN2gnVC
	 tLOtleZucLPQyV5utpORcrxVtH0Xfaldpkdg3VND4l+V4q0EFevKRKG8123og5Hhg4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111099;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=75urtztgOSNwe5i74exMvlBgLARAXuohjj0wbS6WgYw=;
	b=ZBWrD/BsZmQCJ/gjoxT6zqkFS5BECLcc2ft35jPAmFY1gIVM0DyqAStVDFQNGgqp1/v3
	 6Y/agaezq8LuEfoZkWpmZ+Ee2+OzxLW7Xm3D2hXLq348hCrlB7h4ty3plxR+DUC2oXvh5
	 P6DUgnliJKtyZK+L+dHDm0JGF45I0iA7HBhWvGGC+Tm2rVpa5oGDFDCVTZ9m9AHkpd05r
	 QjMeUUyaweUknNENwrIVSExUUcG4PuRFSok9IynwpDcsbNMh2ilXLcPzfjoqSBBMp5Bwx
	 dPSQdjSMZiMEmW91wL8DYpJvY4dnNIu3Q1Y8LA+yF0mes9iq1abu4L965HCXxVRCmoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PAtvYLsS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED59606A320;
	Thu, 19 Nov 2026 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PAtvYLsS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795111099;
	b=lO7QnlJ3RN4p4TnqHSlnkzPXDh5k7TJ10ZXDLh7DU4zF5V9E7JoE+MpEOTXb+fHobQHG
	 hMRpMPlEFPlc3B4L9b1HyKgFcynmJljO8dI959c65dGdG4kW2Ce342kgRm153g7U0L3SP
	 +y74JNGnDfIGImSEUiFZqbianaVwVvsdeS9BpoCrkxnk2kpOqoloPrv2VaA2Cy4vU8QxI
	 fNvSLDsAPPXFyLXNOAwr5aS0WKrbj5BWrvwkqvhwMrKdsS8be/ysVsvc3vXav36FE/lp/
	 yM1uDVBZWGx5Gpdxn8Xlnri1hfHrFBuujGe2HRBRLHd6N31foCDMLzNQHRuQqSfX2Iw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795111099;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=75urtztgOSNwe5i74exMvlBgLARAXuohjj0wbS6WgYw=;
	b=G0tBQu1x38o2iWRi5NDBuCYkTeTcPVbkmm/6wobG21oUwftYof/5SQto0O6h+sYiRNhn
	 qlVbumeTNGFafdcgHgEr0r+4qU+VVzgQqZhmNlk4AyaQ+5ew2mte1iovpIbj6AJB7CaUW
	 Dcm3ht5J6rUI6SBPcEXmQpU0IvsPB7vahEQK3W4v+3xituPZhGDaxJ4Eqc8pEThPlblxH
	 b10gU9Rtc2fnT0/X2rs9uUZjKAy9hu4D5BV0zBYTIgqvq0roh97/PSx61qsI9keKJSBb/
	 ObU+Q30ZAZlo4+EfR6nWOjvPS8heQymHtFkJ4UiS4hl1v6+iNuyqgw8EjC0tFZ9uOTA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CF751F000C5;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111099;
	bh=75urtztgOSNwe5i74exMvlBgLARAXuohjj0wbS6WgYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PAtvYLsSgvzzvAxPovDnbQ0DVZARNEjOLJqTx8FxnS6XTlX2LJdkw9LUJ8elUM+U1
	 HTx1i977A/oGFh8kbcX5iKHYudphLL10PjiRpQ7Ks3Z2tq7LvvFEc/GgiS7hz0AQeR
	 yw0zL0Zy8+NPwvTF3i/43pVFoRvveqFchWxGNOaGwB3ov5YiEK5FcORjMAlAnjERli
	 FtpRG5buDNtFyaTLMYOMxf/tlBCrJTonB13/u8PZTIMjJqiv0YqvQlxkjgx31hQpX2
	 XnUu1Eddd9rDEGSBiaZkr2hs/rOBqjf85zfvmznSzMQi31euJilgA/WJ2pCAuTf8ZK
	 awuO3S0LDmjKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 286464B36F;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Thu, 19 Nov 2026 09:57:43 -0800
Subject: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document reset
 cells
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
Message-Id: <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
In-Reply-To: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111097; l=1361;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=c3F7H8OAib3ngdx0LQJ4NlDMiifU/M4ux9Hr9IVMP6s=;
 b=h12Jr0aE9p1uVSAzQxOv9lZ6u+ki+NOL6D5pgVgF0DFIXLv3apIu4Mb1lPEqPr2K71J1ZGTA0
 8snL5HNga03BMjkSnv7nz7qr36UbCcPleX2uGYcGs3SkVb4flYQ+ayj
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
 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml | 3 +++
 include/dt-bindings/clock/r9a06g032-sysctrl.h                          | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
index 26d94cedc871..c552b78c9d43 100644
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


