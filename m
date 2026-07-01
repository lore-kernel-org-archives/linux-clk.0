Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.76.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CFF47ECD6;
	Wed,  1 Jul 2026 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911823; cv=none; b=h2U//ckkrRs9EYhTkGCNYvEZSDl0KY1TLJLqS4ppf5b3oW2blO/ZewR1qIbsiiL2+6VEtqLYmuCHJmY9GKMl8AlIRSE6PlrfpZ5axJR9I4lfPhSxqcoe7k3RhysPsM350Wy7S2WG+o2if6IqPXqjxkNwNm03ZUeIDlwIaEoIGwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911823; c=relaxed/simple;
	bh=XBEYzDLV4x74wd1zBuwskczGvGY83lTzvV5/9DU/UsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X486sK0lwLg5CYyeqtBLlH0Y6STpJwThOJ1Zk65+P6QoHrZmz1ZUQQ3ifZBHETkvglSvb2eKYkefWfj5S6xjG2oeuES6J5H3pPLj5PnfxhPwx8bHd2JqNXxr0ld56vYPvw/RGxrRzerzucss/j3fUYMrS2ZshP6QaM0FJ1KTbiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=BhNcXJ+P; arc=none smtp.client-ip=77.75.76.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="BhNcXJ+P"
Received: from email.seznam.cz
	by smtpc-mxb-55bd7c95dc-hrn5m
	(smtpc-mxb-55bd7c95dc-hrn5m [2a02:598:96:8a00::1200:50c])
	id 5c74c0df47e64d0b5891795d;
	Wed, 01 Jul 2026 15:16:59 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1782911819;
	bh=6hK0FUG45KN6V0IfxPa0Gm6h2sME80lE+dgc+E9uivg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=BhNcXJ+P+GTHeTrPg4ozUpE5a+VnhSp400lKF7h9TZIPqmXhQqmO/Qn5Y7j8C1ni7
	 WdD+oAwBkR3eB+1AhQjmhcCk0gGQKvNSPNk7slvO0+SM4PIumnp8HK6rZ/QC+Ffsmw
	 xJLIGSf0AXmy0sxucOthVKl6qJTqpnod+2ioUdoMpqmhvOJgdTKbppBaxDUSMnbIZU
	 mXM56bKa5EycX3FIi3JdumuBLjPXybZov8e5W7cCmCBUzgIDQzJYKdxHN/zgMfeDCD
	 AJ1Y4srTgSqB7+l+o4DJAJ/TO7UQmRUDeFDzblTsPxHkAv+KOP/LG++n376JPM1NNK
	 oQ/7VWg0aIaZg==
Received: from localhost (109-81-118-98.rct.o2.cz [109.81.118.98])
	by smtpd-relay-f8b496c7c-jtrnh (szn-email-smtpd/2.0.76) with ESMTPA
	id 66f57920-5731-47fd-9f27-84ff21c20c73;
	Wed, 01 Jul 2026 15:13:49 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH 1/2] dt-bindings: clock: si544: add si549 compatible
Date: Wed,  1 Jul 2026 15:09:25 +0200
Message-ID: <20260701130927.3858536-2-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701130927.3858536-1-pavel@loebl.cz>
References: <20260701130927.3858536-1-pavel@loebl.cz>
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
 Documentation/devicetree/bindings/clock/silabs,si544.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si544.yaml b/Documentation/devicetree/bindings/clock/silabs,si544.yaml
index f87e71867108..680bc71afd1e 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si544.yaml
+++ b/Documentation/devicetree/bindings/clock/silabs,si544.yaml
@@ -13,8 +13,9 @@ description: >
   Silicon Labs 514/544 programmable I2C clock generator. Details about the device
   can be found in the datasheet:
 
-    https://www.silabs.com/Support%20Documents/TechnicalDocs/si514.pdf
-    https://www.silabs.com/documents/public/data-sheets/si544-datasheet.pdf
+    https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/data-sheets/Si514.pdf
+    https://www.skyworksinc.com/-/media/SkyWorks/SL/documents/public/data-sheets/si544-datasheet.pdf
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

