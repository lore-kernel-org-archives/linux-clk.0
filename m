Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1628F1B5EBE;
	Thu, 29 Aug 2024 17:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724951099; cv=none; b=AZkzbgvisnXa5MXRIXF4j2TZrDjUg+4rf6jm/mLE4e8asqxtMnWiM0otP2CB3PuUFgiB3ZFyH4UUvJQMbTtb85EerTr66e1VvCUsLj5VkyJhf89b4UkfPMfrGSxvC4MMuJ+ey56JBn+IsaefOZokBQrvyRiZQE9Uw3oSIFPaIRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724951099; c=relaxed/simple;
	bh=jC0Ih0RsWMxQyauAHR0Kk/LIzSjf9fHkPJzL1gcEs/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4Bi0ekUheUWaTGbPMUJMxlFjznjGoid8aNuvriOh84UdKx6kimzMCnRWaBeMJrwq/OIyiJ0T8dlvVULNSfJb+803T8MhHFOYr8muTjDwXKzWgCUTy9n0bU6O3daNm4adK29KgyFBG2GCJeM9E0MQx/kgGHl2LmuKcu0ThbloLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qjva+bfR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qjva+bfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1724950781;
	bh=jC0Ih0RsWMxQyauAHR0Kk/LIzSjf9fHkPJzL1gcEs/o=;
	h=From:To:Cc:Subject:Date:From;
	b=qjva+bfRaR2i1mVhXNcWL2ScQvPvnOTkY9MvzONRULs1NpMZmNWRXu2RGEmpLRIt0
	 bpPkZgNFdx47KvXY1T6AHQEWAxCsMhjWGESYyMEV8OF5McFsvusMO7Wl1G37i7CWxY
	 pkC8zQ3mKwt1pvT7eDbAMd7LVYu6nvVOptaEFi9IH6PPBMBFR4vgPJC+8oNbxYI6sG
	 zKWj0qTebohaWOaUy7aIPGlqnDJ/lMKypB8Wy/5xM0aQSmmvuxWSerz6lbW+ac64W3
	 LbwSXZV91XK2r571XiznugbwwxT3qvbaxmsdCLqZ+RsJYdEEtCWNOvhQYzfka1oEqO
	 BgbgRCaM1XfBA==
Received: from jupiter.universe (dyndsl-091-248-213-095.ewe-ip-backbone.de [91.248.213.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2015617E0E81;
	Thu, 29 Aug 2024 18:59:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CAB754800A4; Thu, 29 Aug 2024 18:59:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v1 1/1] dt-bindings: clock: remove assigned-clock* from rk3588 cru binding
Date: Thu, 29 Aug 2024 18:58:05 +0200
Message-ID: <20240829165933.55926-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These properties are automatically taken over from the common clock
schema:

https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../devicetree/bindings/clock/rockchip,rk3588-cru.yaml        | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
index 74cd3f3f229a..4ff175c4992b 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
@@ -42,10 +42,6 @@ properties:
       - const: xin24m
       - const: xin32k
 
-  assigned-clocks: true
-
-  assigned-clock-rates: true
-
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: >
-- 
2.45.2

