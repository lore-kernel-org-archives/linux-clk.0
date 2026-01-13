Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A44352F98;
	Tue, 13 Jan 2026 22:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342331; cv=none; b=lX4Klbd4IcpIN0g67F8vuYPusfuox7We4eDSrbsvnQf0f92KqW7coTF1QlrDc265k3a12sHiIgDNoczL0sDarwWSfM3YBb1+Iyct2JBPxVJl5Icrx3vW2kgK7yo7l76IvBGp7tk2MAnDv4XiXg6Ol9Jpj3aFP7pSZoLqfFBK5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342331; c=relaxed/simple;
	bh=28SFQN8Tnumdev8ylgHSFbtz98QUFPG1RsovO8KRHrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OhoqC9q7zdwiOeH3dXb0bWbJUh/kimVRcSnoMOZoBTVy9VJLlcazBoAcwe2sxDKst2WKWsc16peeGQL3QTr6KIYSI3myNzgKgwEWaX9Rsqlq/YKDMpKQtMkFslf/anAPDFlGhB+INw7sexktFuBb1j6AOXlq3PW0y+aErFDjXJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckhfq/su; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckhfq/su"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81689C116C6;
	Tue, 13 Jan 2026 22:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342331;
	bh=28SFQN8Tnumdev8ylgHSFbtz98QUFPG1RsovO8KRHrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ckhfq/suIKuhvaMuOr780x/hkTKkcGahNklE+Tr1T6YGG9oi7RpP+4esk/EI7tx93
	 QECxZEXR+th+48q2IV7UMsYRuIDeAhh5x3d020i/9AeA8fICKHicO212HYVVv0YIqI
	 5SFy829TBOT2hKZIM37JngyOyyHSFK3YyJd5DQ34OcIKHMVfTYhEYYTONeTxJcReDK
	 b1LjmVughVgH7w7POgNaJMnfi9k+lW/zqpWojftXYxWMYKeHsZBcymGX/+7OUTc/wQ
	 63NKLrBxKWmX/7vidKEriZgQHLrceTIMW0yAk22fGDnjzmWMZ82YrT914C76jHHLK0
	 /Xjdlf/izYsgQ==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility
Date: Tue, 13 Jan 2026 22:11:47 +0000
Message-ID: <20260113-glue-justifier-566ffab2ffd3@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113-snagged-blemish-52af3d00d88e@spud>
References: <20260113-snagged-blemish-52af3d00d88e@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=2bDhTZLUYJ0LPw3YfkkGQ1+HBQ8bn68ICCZRyZt/Obw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlph9V76l4sco0wN/9lWFc8b7v8FgPLz81zs5WiUx59X 9DZu6++o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABMxDWP4K5x28LrNFyPdFS/b 2OLDAu9o75zuuX6TS0ho/LMdVoZMsgz/M/VZznJtKj1+faqk3vfy2ZH12iq95jW8VwV3L2LzUHr FBgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
the deprecated configuration that was never supported for this SoC.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-clkcfg.yaml    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index ee4f31596d97..a23703c281d1 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -19,7 +19,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-clkcfg
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-clkcfg
+          - const: microchip,mpfs-clkcfg
+      - const: microchip,mpfs-clkcfg
 
   reg:
     oneOf:
@@ -69,6 +73,16 @@ required:
   - clocks
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: microchip,pic64gx-clkcfg
+then:
+  properties:
+    reg:
+      maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.51.0

