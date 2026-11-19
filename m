Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083212;
	b=VE3mYZYPL+3AYhpqnB/Hg9IZHWaFHB/c2TpbLlpJ2V2wQo28KqwWZsGtEqLbtJF413fg
	 lruq5lDKXPH7sp52xjKBG4CNEp81yjByhx4OBlsY/Lq/FV98jiKvsVj5wyu2q5WPwlOeE
	 0lMbmH7d49cgh/Ye7MIKQLeWSYHppf6KWOsc9rAU17L1Mo4dRQUCcDZnL16qxqC7RUvz2
	 lOjQKprH5Fscv0+YW/r9FVlgTHqL9eLfiMY1KWZDKXQ1rBkqIfgWOiRRC51g8FmGdFen0
	 Fp6bNjm8oQDcrit9zVhiED1rHoeRZnCSjg2Gl3TZ08gNUf3bdfZYBURlPnAm02xN79A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083212;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tBXbAkaPauO/t+CrWaIYHzrmfu0tKOxa9L0c762SX8c=;
	b=jrxJzZ0A33snlEKZ7WI5dLmPmzli6k92WSPfmRQJzvadjNGV0A7yxwTJ+vkVaSTWdxxk
	 QTTCMr0N5IEUmOtAleo1zYX5HxW9x5XnFhXBUD8M1/Y4y/CEGnOKZj2V0EpfF2B2E//zs
	 jlpHRatoMHA6gnzHzjUidFoCAIkC/nIMrx1XFVpC60T7iO1SNgkrEw/O+d7vZdySzJfx8
	 t7I5vk6VGTlsb4MFK6Ir1sx7b+SOR/aWmPUFfIcGwhywOjdal2CYPxBuFAmRQI3mZDq0I
	 yt6SQ80cdx++uQX/IkojQuFvlrKlbzBCmIyO1Ho8VGTHSTGzKcJ6QPpyR3LDiMZBYmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrCF8Uqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4079606A330;
	Thu, 19 Nov 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrCF8Uqs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083212;
	b=aDsPvEfWe1QlQk8MKp3MMWtySPCL5aJ8p1njo59j4Zs7sTcYRuiJSJDc+AbQ4UhBzHyz
	 VnZNOmQJqsnv6jBo8EDlIwMf+I8wmGKAc6AazYCm/zK7DlKVWoaBrZhUqcBU8DIE5Obns
	 bkFokA6N5jUW9ojN0oipUDqASeHGHnp3IRes6JN/384l6buu965Biv+6KczV3dEXY4r4I
	 lBu4PXKBl4VD0J/NdfKooo6taak5stf6f3UmSX9NmG9RS8vz0PPduH87iFj9xkLN9rzMp
	 ZtI3VB8tGVpTCmq/N1GV+9xOGpGNVMy1Ljheozpn22BBL8wjp6Y1UNeiKZbPqSjBe4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083212;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tBXbAkaPauO/t+CrWaIYHzrmfu0tKOxa9L0c762SX8c=;
	b=hcG1XD07QBzFMMZT2wrcg6ixFF3h3E7uGvs7n45rpsQl0An8WgOc7lifoy2HL9PRrW8E
	 LgLD39HEmGyy+/7ou7mpXfDnU5GRtn+5p/3wA27ul8cSINFr4yDmVQqBerGDRv1gF6Xou
	 rdBkdNUY2xBXTVYxPGK2vnxs2VvmEMHAskj/8PeeO9h7lNx3ZRuNCRxfromT4L0PoCtxu
	 LnS9cgKaPG5N6NvH/bWCLtA7m/GQqKvDVf7OYn6Gq1IWr/PfHG8BJpIxx0sSexgxuk1FH
	 xd1BZzz9/eBqU4ec7hGJ8aUyZ5eDGVJSPON4X6Wv5Qrgc+XGQF3scOaH3bs8/9leZTA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C9501F000C6;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083212;
	bh=tBXbAkaPauO/t+CrWaIYHzrmfu0tKOxa9L0c762SX8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MrCF8Uqs1P47hmPDDwnBc9U7nggDYcyvSN6L2sKah6hi3jWPSWQf3wX1Y+THraI6c
	 GcU37kqIAzf1VveWS6Rm6XICZYnZ5e7Wy/Ma04y59dMnlkpvl1oEq0mcFc0SmtFont
	 P3B00aJtFwXlQWjFqMZ+Z2avdpXqGuGmETkk9OygE6qssTDQ4oOr4D9L+iO8pWj8N3
	 K6dMEykbOf+NBtinsNoMNB/GuUiQMs2DHN5ZNaLQCvdA+phvt48SM5av3kKiGsVTGa
	 qk4JcKO0DRzltQGVZdh4SsHf4j8dLe25Mc7oJ0owbLSA5FAFgpisBjvz5njgL2k+cv
	 VMWD8QAbZ8Yrw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DCD0F4B22C;
	Thu, 19 Nov 2026 10:13:30 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 19 Nov 2026 18:13:19 +0800
Subject: [PATCH v12 1/6] dt-bindings: arm: add Ambarella CV75 platforms
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
Message-Id: <20261119-cv75-soc-v12-1-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083209; l=1278;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=3/nmC3518iJUv3pa+4TrYyrJ8fmY9AVoXsn+4KhycZM=;
 b=9vq+1hFkI//llPwg7J+M2UtIl6hu74qsTlef6tAG60+No3Pp77iwO8tcE9EkyNNLxTzqIwF2/
 kZHGHhsc9YIBMPRRMBoQIrjBmTFc+i01huZifYDYXOY8c81aw2BLdir
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Document the CV75 EVK board compatible for the initial SoC bring-up.
The ambarella vendor prefix is already applied in the devicetree tree.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../devicetree/bindings/arm/ambarella.yaml         | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

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

-- 
2.34.1


