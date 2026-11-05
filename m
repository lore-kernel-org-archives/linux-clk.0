Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880566;
	b=4dpszUej4zHcvMguJfpya9CMpcKZ0LelXH8+j7Q5rD8bhptiNoZhLRQf0j0kyOjTyzHi
	 VqQKm39BLSLxaMNel/irM0hn0PXWnxsUUCHc1Dkrtlm93PFfI07efdEBFt6c5snvAqbdx
	 ETlgJCFGeXYxl6s2F0MYnOKrhqN3EDENx6hsvABHzFuvHtX3f/eTR/KbYxPZegbQSq2Vl
	 PMHkA4ePPgvfaFcCBb2u+aVJfXTJ+kyw9ZXnYkOe6p74LBaKMIXCl5ZtrUd3o/t/kGs1M
	 KxXypgfWQAIkE+5fsBhF6TYqb8iWUjdJgCCG6HpXNy+w7wplUAcu24ZLbcUl7/PaxYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880566;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=YpZccUebiwLvkcSt+36evL7VK3urd4ZWtr16WFWktIc=;
	b=VVXR+KQEs8//JgXT9a2P2fmAxRvkgrA7hJLTwcHw/DbNZUnU0YKCSERjRHdYsl+BRyP2
	 dFfWBO0RUuQ9/jKvlnVjQC6LJuZimaVRDcb6Q0c4eGuwYOvS+CSlvi+do8FZTT5hksgxZ
	 7+cFzBQw3QvCNLZeMqDsAuCd7U7UhVB97TcenAYXsT6W2vztsYGx+rUpk75RJKi+EVXOy
	 qRVjAeJFv4KwRP0m8p80OuGJWoh6VT3JeMfB6F5n3hzlgG4xbQHDACPkC7an4WW4bYI/+
	 RXK74lfrCRYBHEDqkyOiEz8vGjoCCheJ7mMDl+sxLwVeJn/HEukpoDz4TPG2ty9OW7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=F62jzXyu;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE5F606A331;
	Thu,  5 Nov 2026 12:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE5F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=F62jzXyu
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6902149656B;
	Thu, 05 Nov 2026 13:09:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793880599; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YpZccUebiwLvkcSt+36evL7VK3urd4ZWtr16WFWktIc=;
	b=F62jzXyuXB1IS5lwHAwrMrIE0XRsNhJi3/xuJnYTq1IRIieM/PkFMxbt2YQOGsnIt5tbb9
	cd+zbKrduazgcxKRNX0xvZIVIFSpr0Pfoy16wQC0k1RRvJECrouaKFN10BXoEFpLoka1Zt
	Wahzdo4/8MWDil/SR6pJPNY4/hEfvjVQSO/vx5EJExtKYuVxyMTvTRrE8vjIyN00P6VjY5
	dICpj7qo9ArhN8Z9YqJMwvLTpvuQgWaWNB+mWCKgkRlrm8TRfeGmeup0th7gS1zXRsueX0
	EZnybYX4YZzTvOuyyb+y5D71Jf8fa2LBdbazL7kCFTItBJux+fIoElsk1L8iBw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 07/16] dt-bindings: nvmem: microchip-otpc: Add required clocks
Date: Thu,  5 Nov 2026 12:06:43 +0100
Message-ID: <20261105110715.2486432-8-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The OTPC requires both the peripheral clock through PMC and the main RC
oscillator.  Seemed to work without explicitly enabling those clocks on
sama7g5 before, but did not on sam9x60.

Older datasheets were not clear and explicit about this, but recent are,
e.g. SAMA7G5 series datasheet (DS60001765B),
section 30.4.1 Power Management:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Confirmed by Microchip based on vendor internal documentation (see link).

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Add clocks to the required section of the binding (Claudiu)
    
    v3:
    - Removed clock-names (led to confusion, and not used by the driver anyways)
    - Removed redundant example
    
    v2:
    - new patch, not present in v1

 .../bindings/nvmem/microchip,sama7g5-otpc.yaml           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index cc25f2927682e..bef0246a79f16 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -27,14 +27,22 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: main rc oscillator
+      - description: otpc peripheral clock
+
 required:
   - compatible
   - reg
+  - clocks
 
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
     #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
 
     otpc: efuse@e8c00000 {
@@ -42,6 +50,7 @@ examples:
         reg = <0xe8c00000 0xec>;
         #address-cells = <1>;
         #size-cells = <1>;
+        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
 
         temperature_calib: calib@1 {
             reg = <OTP_PKT(1) 76>;
-- 
2.47.3

