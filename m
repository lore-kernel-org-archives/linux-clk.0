Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.76.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C7DEEB3;
	Wed,  1 Jul 2026 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917550; cv=none; b=QEQfQuKn5gDFz9SE6Flb7nrXoVp+RnWVDcVpEGvvBN6eD3IWef1Wdewo2dFl8ZP2yzbv6yeTTPASWWJ+F9OrCew2Kd9tOyEfFtXOP7zW0v5bjc9MmoidYHvEV/V/Mt7SFpAmiJ82JQac5KIsu8Dbt7aNzwYTJzLNC7Q04C+tsL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917550; c=relaxed/simple;
	bh=ika0BrSNQoltLJqUAR1RwAjrRKCr5c1SgU5LtyaOsdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K1roQHT9C5hFvmNrZMQyXQRxockfuwpjycNsBSSaIbYlKrtq8UXNGxRNTHTkG3q2xZvSyVKesaxCe1yLsD69Xr/VB8CgNhBfYGzMX7zSIDfNA1Sxb0ltj2sZ/FmdU208YorrS1/DSw3yAuZFCwji5TDD8OY0oOhGE2wAJeg2PR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=VnM2bm+E; arc=none smtp.client-ip=77.75.76.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="VnM2bm+E"
Received: from email.seznam.cz
	by smtpc-mxb-55bd7c95dc-hrn5m
	(smtpc-mxb-55bd7c95dc-hrn5m [2a02:598:96:8a00::1200:50c])
	id 44b5930f5f271edb40502a8d;
	Wed, 01 Jul 2026 16:52:19 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1782917539;
	bh=us0nAeHD3vBIcCOehjkvttvj8zYNKPFSkGMChTkflDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=VnM2bm+E0qbTzLlfXP2BQEo/x3vR6XUvns/j9J6AszsWRQxGF2ymGbOsA+2NyGORE
	 Vum3oZbG9APyNuZaqmPmuOsojftnVD+emLkPM952rDAisVNX1o+KfxQodaGD1M6Nb9
	 v2IvS3yumvBFQV/UxN66by8OghQ9d3JzxIcbCfR02CvV5jSIk8haLp/c2TKRyimRXl
	 2EZKftbbi62hYj9juDRytIA3MjavSttxgz6wA3bbHL6M+ghY7Xs18GJjDOBxvKiZfk
	 l9o6ttVJP6AJfiyHEbZzPI31IUcxq/+0HUXZhr2+DZrd+Doo4o5LTsEhzBH3BHkDft
	 JMQsewixa9v3A==
Received: from localhost (109-81-118-98.rct.o2.cz [109.81.118.98])
	by smtpd-relay-f8b496c7c-25jvs (szn-email-smtpd/2.0.76) with ESMTPA
	id 5109345c-e1c2-4b17-ab47-f09211e5ee9b;
	Wed, 01 Jul 2026 16:51:46 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH v2 1/2] dt-bindings: clock: si544: add si549 compatible
Date: Wed,  1 Jul 2026 16:51:00 +0200
Message-ID: <20260701145101.3932655-2-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701145101.3932655-1-pavel@loebl.cz>
References: <20260701145101.3932655-1-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding Si549 compatible, which uses different internal oscillator
frequency. Like in Si544 case, there are three types ending with
latters a,b and c. Each with different maximum output frequency.

Also fix datasheet links after Silicon Labs acquisition by
Skyworks Solutions.

Signed-off-by: Pavel Löbl <pavel@loebl.cz>
---
 .../devicetree/bindings/clock/silabs,si544.yaml        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si544.yaml b/Documentation/devicetree/bindings/clock/silabs,si544.yaml
index f87e71867108..c58171f1bc5b 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si544.yaml
+++ b/Documentation/devicetree/bindings/clock/silabs,si544.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/silabs,si544.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Silicon Labs SI514/SI544 clock generator
+title: Silicon Labs SI514/SI544/SI549 clock generator
 
 maintainers:
   - Mike Looijmans <mike.looijmans@topic.nl>
@@ -13,8 +13,9 @@ description: >
   Silicon Labs 514/544 programmable I2C clock generator. Details about the device
   can be found in the datasheet:
 
-    https://www.silabs.com/Support%20Documents/TechnicalDocs/si514.pdf
-    https://www.silabs.com/documents/public/data-sheets/si544-datasheet.pdf
+    https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/data-sheets/Si514.pdf
+    https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/data-sheets/si544-datasheet.pdf
+    https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/data-sheets/si549-datasheet.pdf
 
 properties:
   compatible:
@@ -23,6 +24,9 @@ properties:
       - silabs,si544a
       - silabs,si544b
       - silabs,si544c
+      - silabs,si549a
+      - silabs,si549b
+      - silabs,si549c
 
   reg:
     maxItems: 1
-- 
2.53.0

