Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA034F55B8;
	Fri,  2 Oct 2026 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958571; cv=pass; b=CXnxyAQkSznmjNlSC9dRW68gPlIfrQNJiWZY0Zo5zNLaJ1ZhyGRWcxMm+Te+KhW/KLWCUAOqJcV5vAKsINuLS76I3B//GGuNhYUWcfIgFL+OsqgUoT5PEDb2CkLN4dJekZjVFJqlfYJlx9+7yFjzcO3NoiGoR20QLG01zfke9RQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958571; c=relaxed/simple;
	bh=3EPl1xrEnKTuVwPppRjtajlmBRE4FwU0CRLU2+g2M5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2c/mlhutvLCDNXu1ZlAjnzPOg6/iKg6x0+VNav1BVIz+u/uWXdiY9uqC3JNNeMP7hmO0rsKWI6afpdSdueGHRBRjGAZ4Ka8PCItx9awqmpp3WiHBtbPBW9N2c6c8fUwfIlAEp9wLMkc8x/KwTlFIaFciceRVHWX5vuVGMqyV0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=Pd01FfIX; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="Pd01FfIX"
ARC-Seal: i=1; a=rsa-sha256; t=1790958553; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h9R36u9Pj7FF/r94eaCvJ2dvqQfWXhxOVJ9LBuMFxqNDcrxS0mIRPLwqpyfMD9Cyt+cHw6Hr5Q5TbXSgBFuxJxyYzL78Lxyp+siZL65kfGdJwMa3utXjPVzbtcQPFKZvqcUyhTsQWEzkV110VAIybElyhayX/CxNV1nIeqDbUao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790958553; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AaHauvbdnLQTxnC3eeCEYPDWEgFEPt9mYjYfgUaLDiI=; 
	b=ajadwwyWYp+3S3k+qMjap1Haz2jS1vGAyGpLddJOKM9LGpABg7M0gKJvlgbdVltxM9gzt9KJS1tWBbHQMaZMkFZjlipx0lWGeJN8gFc0FKDLHOt78WGtd5NfavfRIPGQAgWZ172QK4jNbZJfHubADElpSIPJVWNBZWIUOzJwr5Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790958553;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AaHauvbdnLQTxnC3eeCEYPDWEgFEPt9mYjYfgUaLDiI=;
	b=Pd01FfIXr54yyXe2VTufzf7qmkMd5/eYSgLkCT3Wfg9U7K4stzPY4p0g+qI2IGlG
	Q46PWcrXnxORlBPvGAdfrzK6nb6cziIgWRUYIBzXEq2rEbKmJNjIANiW41fdBXOPrqz
	ztoQojYcXsbdAwY+/pKIjBSa1j8YVoY9rTjZ5vLE=
Received: by smtp.zohomail.com with SMTPS id 1790958551948520.1332953923302;
	Fri, 2 Oct 2026 09:29:11 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sat, 03 Oct 2026 00:28:39 +0800
Subject: [PATCH v2 1/2] dt-bindings: clock: anlogic,dr1v90-cru: make
 external clocks optional
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dr1v90-cru-dt-fix-v2-1-6e7d96612ac0@pigmoral.tech>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=3EPl1xrEnKTuVwPppRjtajlmBRE4FwU0CRLU2+g2M5I=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL23z6gueP06tQ3jmnLzsZpXWF0i0susnN/+Tng/f8uR
 rU6jXWzO0pZGMS4GGTFFFm4/MX/WevwfDsi0HofZg4rE8gQBi5OAZhIkC0jw/MrTNxnTvx0+TRl
 Lds9bVlnK/013xTzxLlCPPqcZj24uZDhf+G6JWccfN1SFCWmbRedY1t5grG6UPjF4TNTyjald85
 SZwYA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The main oscillator is the only required input clock for the CRU, while
the external CAN and WDT clocks are optional board-level inputs. The
binding currently requires all three clocks, forcing device trees for
boards without these external inputs to add stub fixed-clock nodes for
which no meaningful clock-frequency can be specified.

Allow the clocks and clock-names properties to contain just "osc",
optionally followed by either or both of "can_ext" and "wdt_ext".

Fixes: 155d900e4c7d ("dt-bindings: clock: add Anlogic DR1V90 CRU")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/clock/anlogic,dr1v90-cru.yaml        | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
index 11a92588e494..482640bcf644 100644
--- a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
+++ b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
@@ -17,15 +17,17 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Main oscillator
-      - description: External CAN clock
-      - description: External WDT clock
+    minItems: 1
+    maxItems: 3
+    description:
+      The main oscillator is always required. Either or both of the external CAN
+      and WDT clocks may also be provided if the board routes them to the SoC.
 
   clock-names:
+    minItems: 1
     items:
       - const: osc
-      - const: can_ext
+      - enum: [can_ext, wdt_ext]
       - const: wdt_ext
 
   "#clock-cells":

-- 
2.55.0

