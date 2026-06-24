Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F170731D381;
	Wed, 24 Jun 2026 05:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782279912; cv=none; b=G4pjjhtp5Wv1dF++J9W9JE/5kAsF1QBwcda3J/ob0j9ku6AEQP3LWeIpGQNpXW0M5W0eYbqb0qZQ4PdSl4EYamWoehT3fgmhbqBpXqfyFXcBjDPaDsGZIKNaQ/GwLKh2L33qx3zVX5oUBaaLUP1reg0QdqbXZnFdIqqsepw3hk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782279912; c=relaxed/simple;
	bh=JUf9fissI0o+YbcRxTHYw+J0Bt4Cob8MbJmxrjdeD0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Sk+CT4SurkSsDfkTASRjA5IkL36shKctj9n7YDOt4eUXx7XPYmLbXWLNbgFLY0iCnT0jg/3BuLzRXPpcx1QtYZ25jnFxF8giPTBlY7RxYulN9y+7c5Op1mzuU4+a+Ufhav63RkWXKs1nvTLkkc0dce54XswCJIygtdPBUBJsBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Jun
 2026 13:45:01 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Jun 2026 13:45:01 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 24 Jun 2026 13:44:59 +0800
Subject: [PATCH 1/2] dt-bindings: clock: ast2700: add PECI clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260624-peci_clk-v1-1-ee28b92e22e9@aspeedtech.com>
References: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
In-Reply-To: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782279900; l=765;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=JUf9fissI0o+YbcRxTHYw+J0Bt4Cob8MbJmxrjdeD0o=;
 b=Dbz+dhYxa8ghMWi+O0fu/mH0ly7AEJ5h7PW3fIkqJGrv1rQJOCUwAC0F+h+dYR/bOITZNM/Fx
 zSU6FRa+1Y2C/8wLxdM/ECnDLAveD5mxSyNzqTI6WjtBtRRXyCSfeDO
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Add SCU1_CLK_PECI for the SoC1 PECI controller clock source, and
SCU1_CLK_HPLL_DIV4 which serves as one of the PECI clock mux parents.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 include/dt-bindings/clock/aspeed,ast2700-scu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/aspeed,ast2700-scu.h b/include/dt-bindings/clock/aspeed,ast2700-scu.h
index bacf712e8e04..138f78ce5f07 100644
--- a/include/dt-bindings/clock/aspeed,ast2700-scu.h
+++ b/include/dt-bindings/clock/aspeed,ast2700-scu.h
@@ -163,5 +163,7 @@
 #define SCU1_CLK_GATE_PORTDUSB2CLK	85
 #define SCU1_CLK_GATE_LTPI1TXCLK	86
 #define SCU1_CLK_I3C				87
+#define SCU1_CLK_HPLL_DIV4		88
+#define SCU1_CLK_PECI			89
 
 #endif

-- 
2.34.1

