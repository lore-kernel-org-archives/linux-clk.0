Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515154;
	b=F9btb3PsiXNn2u09CvfQ+dXJg8TJuSEX1uNjhT61wso98kbKETvibYltBy91nh31o5KD
	 QV60owkMizLUEbb6KsVOvUl16nAYtSFnDhRCpIcuzpVEZzaA6uNM327htx5RbArLNm2yF
	 zLSk6+WXJhcbzwRLZ/VVz7u+5en5+6tSYUAyqUgEYs38wUUlRxnHZGjJlC5UManrLCuR1
	 Z1UxJQkZNlkU+IVWiFJMaP63XhmfQX5qq3Nwr004DAJwxrb0nUtGckMbaQr6/AjijyrW8
	 aIJE+aJqH3Q44Il6jcOShSuY9AY7gMJMdukDnDKrfvNbSi3GLcZxHhWwo/HjmVJahEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515154;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hFdDPVzdN1I0u9PiMxhw3j7BSym1Eu7uE1P1UHlmHUo=;
	b=Cl8Bxxhv7RPeZDF2lFQNEba+RlMTn5pLLrrBlIP3UgjCE6IsoYYBf8w3yLG1l7nIHoL+
	 pRpMsJGe33cahNCp7aR/by+so2q9wcVf8N8o/iw2ZCdGNR+2ah2yVI1u5+sSzUJgl1PgU
	 1/C82VX/aY7tRkvXm5chIBzhrfY2grT///3M2nM3GbHciSvxKpz2rTCRlzzA9q3Zt6MIL
	 okIXYcV0OnjS/AYK4S2P1XErRfMjRC3nOLlNyisew0mByM2Rfw5Ql1PvhwHmTsYTgrfgm
	 D2LTenZS8IF/HxB0z5vdTfiAEBlH1yjDx1Dc0ZunnbIv/9iHBZo8kf9WaD9pJqnoSkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFAE606A321;
	Tue, 24 Nov 2026 10:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EFAE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVnVi-007edJ-1L;
	Tue, 24 Nov 2026 11:12:26 +0100
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
Subject: [PATCH 1/6] dt-bindings: arm: airoha: add AN7589 chip SCU
Date: Tue, 24 Nov 2026 11:12:15 +0100
Message-Id: <20261124101220.3888170-2-john@phrozen.org>
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

The AN7589 has a chip SCU like the EN7581 and AN7583. Its SCU clock
controller reaches the PCIe clock registers through it, by the
airoha,chip-scu phandle. Document its compatible.

Signed-off-by: John Crispin <john@phrozen.org>
---
 .../devicetree/bindings/arm/airoha,en7581-chip-scu.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
index 4a10d024f5fa..a0b9c426a595 100644
--- a/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha,en7581-chip-scu.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - airoha,en7581-chip-scu
           - airoha,an7583-chip-scu
+          - airoha,an7589-chip-scu
       - const: syscon
 
   reg:
-- 
2.34.1

