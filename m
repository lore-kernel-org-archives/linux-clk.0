Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956272;
	b=LpClgKb1PwU7W/VvEVt4cwa+wPa5qXVugZeBMdWAFrpAEGj0hhATDSGe2A+qkM0OHmKG
	 NXKqjZ7Lg4cSpGzZXEYXvDpFuba1SxR6fDghkkqdBE1pLxVFFVuNX0xo9aXGAcRn1vsbu
	 H5D0xv7d1AVUcyBvOxb4DSYpLCt9RBonHP4N89+ZdcS+yBa86n7Pp/2SXynbvtnkoLhJE
	 PntGEP15z7UODrv7SPgfWZ7YjKmEfpEeACTMrIy/0bNUgp7ENhqnms6vbFnRPzrldrQJ/
	 +PCPp5f7df0GJGDbHi96kgt1Kcdy/JBdQA32Cocnvv0KvUZTAi2D0FJ/meJzzKnEc1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956272;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=pBGg+7YBv7mCvyQ0Rvya67DnT4i0HOQlxmouxQbSJR8=;
	b=VJBDMF+anUuntvg6+lRxaJXgevXubqyqZXe/CUJmB7xlcBu+gErrdFL1vv6gw0OLnJgW
	 esU9rWkyxa5rxlGHE55GlIHkWTHnjZDWc8jYONhhar0E6Zjdl1mS4nRNrLq/yQfzuBNK6
	 9p2ymT2LGVZGiZbPIs/f2qk53vrBLMkNWB0X+RELdpGG+J/rl05AUPr1o7UjUBDRgg/Ir
	 N0au+x/Q1KpPrpLx++/WsfPCZPWCj4zCseS1b4uKcMnyaQ3c9eC1QqeF6EjKWiJJ0wJuz
	 s+dNszADg6h/HlB8c/ZI1r76c08OaZ4K90ZNsnbTjNqN7isC/l9S0qcPMldvjnOWU6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=LY4iS6qT;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDB160A2614;
	Sun, 25 Oct 2026 19:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDB160A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=LY4iS6qT
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5Ia518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:10 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5Ia518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956251;
	bh=pBGg+7YBv7mCvyQ0Rvya67DnT4i0HOQlxmouxQbSJR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LY4iS6qTFogv92Q0h2JBUTh6d74cfOefsnuvQXK2FB1vZEaKSvFm8yU/kCbrAuDNB
	 kgyFnb2KQUZ8FopwEbHFCYBboO4UXYh5TjjSwMdTuRMhDmpO/JRP5o6Yfpg8yEr0AP
	 sTQYxiROXDamFikedGCjJuo8H7YzD766jVVsDXLk=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jiebing Chen <jiebing.chen@amlogic.com>,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 1/7] dt-bindings: clock: meson: Add audio power domain for S4 soc
Date: Sun, 25 Oct 2026 20:23:58 +0100
Message-ID: <20261025192404.209695-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Jiebing Chen <jiebing.chen@amlogic.com>

The audio power domain has been found on S4 device.
It must be enabled prior to audio operations.

Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 .../bindings/clock/amlogic,axg-audio-clkc.yaml | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
index fd7982dd4cea..1cd9a99e5ff3 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,axg-audio-clkc
       - amlogic,g12a-audio-clkc
+      - amlogic,s4-audio-clkc
       - amlogic,sm1-audio-clkc
 
   '#clock-cells':
@@ -99,7 +100,8 @@ properties:
 
   resets:
     description: internal reset line
-
+  power-domains:
+    maxItems: 1
 required:
   - compatible
   - '#clock-cells'
@@ -115,6 +117,7 @@ allOf:
           contains:
             enum:
               - amlogic,g12a-audio-clkc
+              - amlogic,s4-audio-clkc
               - amlogic,sm1-audio-clkc
     then:
       required:
@@ -122,7 +125,18 @@ allOf:
     else:
       properties:
         '#reset-cells': false
-
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s4-audio-clkc
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
 additionalProperties: false
 
 examples:
-- 
2.56.0

