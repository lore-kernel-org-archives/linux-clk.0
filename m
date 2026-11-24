Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515154;
	b=N5Jre6ZCrKTGOkY0X/wSASLZc5DSgsxCz1R/Pa3rNBA2ECUd4KpNViVPaqYs/YryrtUK
	 XSdCzJ9oxlMgj0F+e16gaIvSqjS0wGULOpIV7llY6X0+o8AhaX94b8c81EAwiDnS+MO6k
	 VigyZGPWjTOa1SMUuddj68yGO1mwTOQl8yFKNO7sIiNxRsTQwPxkvLEhh7bBQgMpC7dBb
	 MNHE+owW1Cp2KY+ho6hWsLuQsFLirQPhkXM/vdB3ubhMywERShPqBNJsW/7EcUeRu7XfN
	 N0BeuQSoEVJiwfpnvdmvHFVtyPGn7d4e8e17oJOpKjRChbh6Ill4C16MGbtXNccV3cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515154;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+X2+9/1D+BoHiOylPLdon3nipe1Roke8VdLinnRcKEE=;
	b=vjjWqhQfsXw8YuIUNkkHHguwuEhcfZKB7NFxrHjMXawdSA8thi/x2DL9VGWzP/DyDjv9
	 b0eFTgpV2dwwgGf35k4oaJIgr35NN5YsUNJMMVcXYe6kv7LQKyjZZvZ/o5gfk/0NzUl2f
	 3GALIuE54AUJPC4eF+xTo8dL80vmOdCFejVF4s7D6NBWkMAO0MCy4/PLK5vKhpBjKOvCJ
	 QIoqu+F0hWINA52uzuYU8Iq4n8/nWtoNVV10y/hATiFfmE51e+n6APeTiUq2ScUejCr+2
	 6hKymBpY56cH+5gJKVJFRkSzFrxBcG8RRzz5DRi1fhzLzQ0RMNqjwHQxMru7jpnisfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F706606A322;
	Tue, 24 Nov 2026 10:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F706606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVnVj-007edJ-34;
	Tue, 24 Nov 2026 11:12:28 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 5/6] dt-bindings: clock: airoha: allow MDIO controllers under the SCU
Date: Tue, 24 Nov 2026 11:12:19 +0100
Message-Id: <20261124101220.3888170-6-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124101220.3888170-1-john@phrozen.org>
References: <20261124101220.3888170-1-john@phrozen.org>
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

The AN7583 and AN7589 MDIO controllers live in the SCU register space
and take their registers as offsets into the SCU node. Allow them as
children of the clock controller.

Signed-off-by: John Crispin <john@phrozen.org>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index 947f8b939449..f3172ab9ce78 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -65,6 +65,18 @@ properties:
       for configuring and read the base clock sources, dividers  and
       clock gates.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^mdio-bus@[0-9a-f]+$':
+    type: object
+    $ref: /schemas/net/airoha,an7583-mdio.yaml#
+    description: MDIO controller living in the SCU register space.
+
 required:
   - compatible
   - reg
-- 
2.34.1

