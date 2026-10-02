Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761692E8DE3;
	Fri,  2 Oct 2026 06:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921348; cv=pass; b=juLK0ZV95Ybvz04uyFEHrjF7l+yjpzITmfzuIdZ5rgIV50FG6b6lQbVhC7uZYSrxcJheQycjKkeYfOJ9BaywC1CZZG/tANxaZZ2W2jqLoyGGZANqxbQyw7pR1hMDbD6ct4xe4Cbv08axy5aRSZ8JvScN/yZ3/YGb35VLv5wXScE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921348; c=relaxed/simple;
	bh=BIY6eHBDFTpphuNlDMZqPsrExFIMpb0TUz/VDfFcopk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hA9++OUJyW6ILEYlgDrXJIopQoovcOzfWuUAPO4bfYjc3DGu1ozVkkjo1/YXMVwtGOH9lqmTkTVWeB1KmMur4kn3Rcd9uoJFC6ScBJasK1fcvEX++Rz3g0ve7ZRJ78bxI/v0mwZ2tNkTfnQ1CPcxd4QISyGBb8F3or07Xm5jo54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=M6686PhO; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="M6686PhO"
ARC-Seal: i=1; a=rsa-sha256; t=1790921328; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CKvBuQIYHMUziJwUOFvaLd9kofoA3UaThkci1EHakmsNOtzbmWI995GT4DjtpmtV6qjUkC+jTorGFGzimWVJWVB42GxjWWnYpN53cpaysgYjV2AnPUshr3M6ukWscoPPmQOUkvROWicfbLPZCTi3CJrYU9y74+Qiio7egKBjrj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790921328; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4cHq1Co9HcRiqm/xFpM+Dsl9ec4MWYGgWYwgZsTisL4=; 
	b=CwIf19zDmZWbZQ+nTnf2cxYJIk/xaiItbEcQ0JtJnwFF0ghXR/6F73T7ea3DmwOSHX/4lYhZo41hIbm42Ag4mKyKAE2b+npJGGFtGDz3Qdq6xznOW8WwPA9KLyRikA5taPX31yddm8SSDSph2WeM3f3S/JXvrh5l08wNCoL8haM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790921328;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4cHq1Co9HcRiqm/xFpM+Dsl9ec4MWYGgWYwgZsTisL4=;
	b=M6686PhO3sQmFlhpVh/f4JMFBlDWYo605N+eImvbr0zlfeGsKpwPtkAyQXLm/Rb+
	rmiOMXZK+mijRKx6tGpu+ll3eJmyhN3mPq2yB543j6vIEiRoqBeKL2npoC+pM+bQCth
	twsnnYLoLjcZ0CLRBzDFz1rjuHRMmmwDbWfteulE=
Received: by smtp.zohomail.com with SMTPS id 1790921326980205.33797877040922;
	Thu, 1 Oct 2026 23:08:46 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 02 Oct 2026 14:07:00 +0800
Subject: [PATCH 1/2] dt-bindings: clock: anlogic,dr1v90-cru: make external
 clocks optional
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-dr1v90-cru-dt-fix-v1-1-c3e0b5d4c30d@pigmoral.tech>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
In-Reply-To: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=BIY6eHBDFTpphuNlDMZqPsrExFIMpb0TUz/VDfFcopk=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL2e0X6BMzmudSmqdNmY6Sz4+bRx9mvLUrNyw8YG37J3
 fjublh1RykLgxgXg6yYIguXv/g/ax2eb0cEWu/DzGFlAhnCwMUpABPhO8jIcDPg78bHNaseWv0v
 +nZSgVuhXaW87eR2UZ5SqzN8jOFsgowME9puRFtMVJKKfRMW+n/tucd9b/eaJJfxlVp6X3vHuLS
 dEQA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The external CAN and WDT clocks are optional inputs routed from the
board; the main oscillator is the only required clock. The binding
currently requires all three clocks, which forces device trees to add
stub fixed-clock nodes without a clock-frequency to satisfy it.

Allow the clocks and clock-names properties to contain just "osc",
optionally followed by either or both of "can_ext" and "wdt_ext".

Fixes: 155d900e4c7d ("dt-bindings: clock: add Anlogic DR1V90 CRU")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/clock/anlogic,dr1v90-cru.yaml         | 24 +++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
index 11a92588e494..8bd7b78a58d8 100644
--- a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
+++ b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
@@ -17,16 +17,26 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Main oscillator
-      - description: External CAN clock
-      - description: External WDT clock
+    minItems: 1
+    maxItems: 3
+    description:
+      The main oscillator is always required. An external CAN clock and an
+      external WDT clock may additionally be provided if the board routes these
+      clocks to the SoC.
 
   clock-names:
-    items:
+    oneOf:
       - const: osc
-      - const: can_ext
-      - const: wdt_ext
+      - items:
+          - const: osc
+          - const: can_ext
+      - items:
+          - const: osc
+          - const: wdt_ext
+      - items:
+          - const: osc
+          - const: can_ext
+          - const: wdt_ext
 
   "#clock-cells":
     const: 1

-- 
2.55.0

