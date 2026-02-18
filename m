Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCB83033D0;
	Wed, 18 Feb 2026 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412237; cv=none; b=pi/qjmEBqWGbzxJlYs4X6dH7qEGGLtbiTARjeRavQ5oRUpOshAF8WS2hfQhxaqx923PW6mTADNRtKBrasCr+mcCmxcUKTHPfugUBYhw1pOUqb380uSZuoluCEQ2ZsbAGRUYwsvoR9pHV0eUvrSnJA4gurnNdmLtt3XcBRb56IZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412237; c=relaxed/simple;
	bh=1mPXmmMne05pYAaucmru6rWTvugDQH1iZH4JWLruXfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5r/FJUsFtXLxDS76qDkzjIISSlPJjDjjRk2jN+PXYTnqTwsgHtQJuhS3kI8xquj1p4ERLhxCj8UTa9rQ1qb5SXgizMWZriNSr0pqPbx+GDMc40PBIK7sq/1tFph1mvfQfxwe4jbrtvnIjEj38Uy4JoAzrYpbE/bWFO9oKJZ5RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=orEMHMmS; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="orEMHMmS"
Received: from localhost.localdomain (2a02-842b-8136-0001-B865-661d-5641-e7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id E772940244;
	Wed, 18 Feb 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771412234;
	bh=1mPXmmMne05pYAaucmru6rWTvugDQH1iZH4JWLruXfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=orEMHMmS6KMj/5Eg3ixUr9EczDlGfQRqjtWGujH3EaHBH3y4SAKGO93wF5CQh7iM+
	 TXNXb557LloO4VOJXB5w37wXz18Et7lN9mz9NwC2iBKPW+2vApGOWyf2ybfSBhDmaR
	 EQZMbhx6bRQsDN8u1z66t/Se+SMTxvzrBMucm60s=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Hu <jian.hu@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll support
Date: Wed, 18 Feb 2026 11:57:07 +0100
Message-ID: <20260218105709.36253-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
index 49c61f65deff..6a1598e6c359 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
@@ -23,6 +23,7 @@ properties:
       - amlogic,t7-mpll
       - amlogic,t7-hdmi-pll
       - amlogic,t7-mclk-pll
+      - amlogic,t7-fpll
 
   reg:
     maxItems: 1
@@ -42,6 +43,7 @@ properties:
       - const: in0
       - const: in1
       - const: in2
+      - const: xtal
     minItems: 1
 
 required:
@@ -72,11 +74,12 @@ allOf:
           contains:
             enum:
               - amlogic,t7-gp0-pll
-              - amlogic,t7-gp1--pll
+              - amlogic,t7-gp1-pll
               - amlogic,t7-hifi-pll
               - amlogic,t7-pcie-pll
               - amlogic,t7-mpll
               - amlogic,t7-hdmi-pll
+              - amlogic,t7-fpll
 
     then:
       properties:
-- 
2.49.0

