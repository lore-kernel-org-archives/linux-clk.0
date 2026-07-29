Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06C5443AA7;
	Wed, 29 Jul 2026 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326403; cv=none; b=K3yG2rzDBdfMPE/y4qF7lKQH+q3I4oLBC42ktW/e+mj2ooVc11IjEV+blUTeBA4q2fuFyHxWv8n7Vc05xeuNQ5tQZ1XPcdNE7XQVk6CkdtdnsC8tLisijbqQLKnQ4uIosP7YEUJ4h/1VheVRiwmM7zPDoewFglhjX65+ADzSkfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326403; c=relaxed/simple;
	bh=kOdEVimoPBGtAMpf8yRJ+sOoCFXh/vCxiVV147TWl7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NP1Ev/oDWcP4UyFL2bWhAfJMaVHwBwxvny1kfsDDRUicALXJ2GLRZ3iMjsLJfLqv3fOZ2Xf63lur5xZYCnRltE6PxxmoeiJnCOrdx555+XM+6dn1zlWuA+87WeCsyB55C6NL5OkT94UsusizGvk/SBmo9+IQHp/xxZlWJh3JR/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=OGSwdu6S; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="OGSwdu6S"
Received: from email.seznam.cz
	by smtpc-mxb-7f8c58b87b-r86x2
	(smtpc-mxb-7f8c58b87b-r86x2 [2a02:598:64:8a00::1000:906])
	id 542d34384fbfb9ec50c88dba;
	Wed, 29 Jul 2026 13:58:47 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1785326327;
	bh=e7s3QzmzogSw1oVZAIzoXxznxQIkj+MrFBtWtnhExik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=OGSwdu6S0ksq0qdRoEqA8+6JUWi1IzD5pC/fqq8bq8x0F+zGbtFAWW2/pbpazbqT4
	 tK6d+1GjmbYaGQ2r22fpp4UsnugU7caaZDZrK67K7auSJjJlkLiidJ8gH0j2fv4iLD
	 36NpN4S905IJpblQMKbYGThXlDQMmCd3GktQWdtH1ZD3xUX7H02FA64ofSw/c0sgps
	 8i1KqYnd3xDJ+FpGfmZY27Lfu2zFPbaWr1iCTa6XKimfhU5+3Rpkf9TVxrsfloOBfn
	 Hn21+u8wub2qO7EKNMlqkjwPLDKhtuxSvMhOh45L5RXA2GUNBgJZVoCAcEorGzxH8Z
	 CErjUhfuyOpxg==
Received: from localhost (109-81-114-141.rct.o2.cz [109.81.114.141])
	by smtpd-relay-7b8c6c77dd-qk97r (szn-email-smtpd/2.0.79) with ESMTPA
	id b10099ce-0067-45a2-b3c2-539484e39067;
	Wed, 29 Jul 2026 13:58:35 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH v3 1/2] dt-bindings: clock: si544: add si549 compatible
Date: Wed, 29 Jul 2026 13:53:09 +0200
Message-ID: <20260729115310.3490589-2-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729115310.3490589-1-pavel@loebl.cz>
References: <20260729115310.3490589-1-pavel@loebl.cz>
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

