Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D003C2781;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615031; cv=none; b=eYcCiHGc34iIe7HoQZLud1cFUWLlTx4SdrM9bGFP+mRQHLFo+ZGasbTmIhs/1HKwCf3+ZqbFiXYw0t86uI8wDHlzcE+MAQNyFu47GHsxIkA79oJTuO0AWLhzEK5IncwpLqUtig3n3CTquGmL5lQw+Ly/J5m1lfAOG7OSota7TZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615031; c=relaxed/simple;
	bh=QoMXlPLzALhwByi+1x8x2yYmLLmFtvcOqO7OqLXmh3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JA7Dyi4yHMm9PZqlMqzZekzc8AWinQqu1/8X9oY3Vdgq+PtcMz/uIczE4rFhRKdVH+Ssmq7uD1bFYtwqfFukATbhoLsvy0J6XPu3F1/z4t7OU+gzAf3BKep2F7XWL2g5eVtbosoYPXOu00SRoi6vm77UbAgtcmko8T2FuSXV240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtLOIRNe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtLOIRNe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F1DCC2BCC7;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786615031;
	bh=QoMXlPLzALhwByi+1x8x2yYmLLmFtvcOqO7OqLXmh3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WtLOIRNeIk9GweSGMkZBCGV0mLKufRKJCcvPQ4umeCEE8mBcpAlS/g+pwGGrzOsGI
	 RTNrgpSGGRa2c6JveuSbwymDjKC74v/MqFBc+O160kDb1+lQqwZNXn+xP3z+YPIUML
	 6L1+R7nHhmFNOz4BB+02mJ1KhA5OagVzOkeqI/bV4zsqYbgkHUtwwYyKtP1eZtlNJD
	 BDjeC/bV+wlOK7XWY1FitJwY0cEvsZ4rBFUhsW0r5HVcxGJioBIPdOgc8m6YwJ8uIQ
	 zLxuoVZZodwj2Ny5CCEqrKj/QsE1g9W63e9JPlSZr1XqqN/6OAABOYt2s2GHSgGE3e
	 zeo32K1f6pwKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0267EC5CFDB;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 13 Aug 2026 17:56:12 +0800
Subject: [PATCH v3 1/6] dt-bindings: arm: add Ambarella CV75 platforms
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-cv75-v3-a-v3-1-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
In-Reply-To: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786615029; l=1828;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=afPd4fMvs6m5AADxb0oc6RJxPyKNG50c78xrv0izT2E=;
 b=FfzHBtNw5HlISmo6udQC4oEZ/SBB5ags05+u2NZV8P60KxB/xQ8mXQqJM1Z7p36HjyPdJEtYF
 wbyzA21+8RnClLWBe+i2Gfho8WsA5mzaCIRHya4PBYk1J5P6/k3Ld1n
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Add the Ambarella vendor prefix and CV75 EVK board compatible for the
initial SoC bring-up.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/ambarella.yaml         | 24 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ambarella.yaml b/Documentation/devicetree/bindings/arm/ambarella.yaml
new file mode 100644
index 000000000000..72946e94fa76
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ambarella.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/ambarella.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella SoC platforms
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+properties:
+  $nodename:
+    const: "/"
+
+  compatible:
+    oneOf:
+      - description: Ambarella CV75 boards
+        items:
+          - enum:
+              - ambarella,cv75-evk
+          - const: ambarella,cv75
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 85a27937832e..f48aa6dabbe9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -112,6 +112,8 @@ patternProperties:
     description: Amarula Solutions
   "^amazon,.*":
     description: Amazon.com, Inc.
+  "^ambarella,.*":
+    description: Ambarella, Inc.
   "^amcc,.*":
     description: Applied Micro Circuits Corporation (APM, formally AMCC)
   "^amd,.*":

-- 
2.34.1


