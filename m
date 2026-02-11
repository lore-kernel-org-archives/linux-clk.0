Received: from mx-relay128-hz1.antispameurope.com (mx-relay128-hz1.antispameurope.com [94.100.132.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413A433B6F0
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813366; cv=pass; b=OM6byLIhewi4B3apHJu6kDl34BMEH85eDqMm1LEVeOKPItFDo3Bnf5w1mgpvevKmIjsmz3Psoc5eydgob4qMYrZzPBOvBQBEJs034IasBCydPSDYIfyMGuS8F4FX0noW1bQmR1r2Tz2sVA6tIqK0ovyU0+6/VfzyMOPkbevblas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813366; c=relaxed/simple;
	bh=VZKGAiWgFqKvUlRhNiG9TSUoowFI3whqpIuUPg/BfZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwPcHqv5MXsbJ3lX9WCqGTYLo23n28o4U5p/liXX2ZTo1ItVj4nWvLzLyRy3HVohOaNSwGud/s0cFaUO34Cc4/Pd3hnCksXQXdpCgINKcHI1cXnRJhLY4bt/xXYddPDuaA5ZZt1pfxk5Vi5eH2yht2TKsr5uDhv+POFPgBC0ZzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=htquCslK; arc=pass smtp.client-ip=94.100.132.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="htquCslK"
ARC-Authentication-Results: i=1; mx-gate128-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ezwBTEGDVrkTw7utJMNRHdCflzlp+turEuzGuTHPmd0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813309;
 b=hV0NyE4KxKvHv/6RQbK02hAuCWZUb2ivRB7PcvwJ51c1G96BvIiHwU/PJW1EZ66yORSCnxku
 u1j6NdWt9xvKikhqp2+dba2yex8PJNwut8HHV6W14y7GKdzLTW8xxYlkYU/6NlbyzG5A22b/rTh
 Ju4Cw5bK9At4uy3J4Na7FpMBa8DPmwLdphZxgJpXpLkyDXeHufHgRogW3ypIBUBWYwKmOqUZIzZ
 MOROyOlgEJS+eTftB80+7m8cNAbe7XOf/h24ovYTeIOP49wbJI5mKIIn6O0W4wZEh0QifTw/ldx
 eGb4YMtJrL9o8kovQZmcqPC77dNM1q49j46kK9FXMSh/A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813309;
 b=DfrGmt2v+tuE9Fw76bTQxtvmd9jFW1wBwHDGZnChQ6/z210dvryqRHlsDuMSani1QJIft1rx
 tM77HMJc0LVFGye1sOTOoCX5YuJgpQVjzxV5gyLWpRf6P4djybKF+MuBgyWLRMGUAFxd1s6pirc
 s45CsC5aba8dl8/deItpGy7Uz43hzc1r1A/6Qa9KjS8dTKCHQmXIYxaob9l318MCjyABQd7Opo2
 C1acHN3lraQe6vSPGiyOz3jNsI3GQ05hvn6br2sWOJ4sjkF402SPTXS6A3lr1JCO2hwDYmASnsr
 hUmARgNkYhOVau8hodlQART0imO3Z9teQBmVC6YQqVPXw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay128-hz1.antispameurope.com;
 Wed, 11 Feb 2026 13:35:08 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6742C5A12DB;
	Wed, 11 Feb 2026 13:34:43 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 1/5] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Wed, 11 Feb 2026 13:34:28 +0100
Message-ID: <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay128-hz1.antispameurope.com with 4f9yYc4gf8zvb1m
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:127a990275954f2aedbe66286a895387
X-cloud-security:scantime:2.345
DKIM-Signature: a=rsa-sha256;
 bh=ezwBTEGDVrkTw7utJMNRHdCflzlp+turEuzGuTHPmd0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813308; v=1;
 b=htquCslKfHdnMfi5h/FjaAAhnUBeL7JuL4qB2g03PuEZqhvFhplrTZX3tYj8U+2K3B948Efp
 hIGQzMqDzk0QJ5KOmQVN6QTwvAVR6M+Y5k/9MPvZ3PewXFJ+AC81cateUn/cFCI4qMzGy9rPrnX
 D/amAYiKwZJSErpAY9CqTdzoyhvymVVxoZmj5bohJUR/yQxlqNDjrn4wnCwHs61DV6UjK8ADHzu
 0oYl3mG1TFsPkvhb/RbVAfND7SLz6pCnXQxmrM9x9SNabJz3GKc/M18aWh8/3jEz9izuCel4dSK
 re+zlYQW2pJnQ0qMFLKnGWkRB7uF71PsxmUrT4zBzhGxw==

Reference usb-hxci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* reference usb-xhci.yaml# directly (suggested by Rob)

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..a199e5ba64161 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,7 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0

