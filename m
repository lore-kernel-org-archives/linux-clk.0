Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515155;
	b=os6jINDAAbTt5lHaSw9TgZ/q2upWfr4pvFXqpk2qWAbwmkcHBLg5fjMlgbpbGNJMVO2x
	 tiIT8ZTlPZr7GF4U/kMi+pDNYmk4/xnrk/bHf/kGfd+NSISh6oGi6vgbSeZz/d3TOaC+m
	 qrHVbyjoP9ZRAIFTaLaG3cp3Z46KFXTDIe4ytg9Grqi+2bEV/3wH3+QrKW8itGZKuYL8r
	 lZmWrIVvsA/KOTHAVKekJRVyqcDGCnXPzlCU1O+Y6zjyNt93a7BgreuVLMO9oW5awJtsn
	 Pjz43ok6A3Ry+WfhngJ8Q6MXzU+6GGslXJ4pCbCRwXI2qT38cZE/R7S4lQmd1Ro3mXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515155;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VC3zdcCmQJ5xuRGuScfghO6qOOTPwatzp5rgJ5szjZA=;
	b=STTlFaXsWgiDkpaCn8on0qXF/fgRMdAQ0ZxhbacAmitE1VJ5d167N7tqv0wgowUoG0lo
	 VRfdb5aAZ296qTagx2Zca+jN41KLc1lwdNG1W3ERPTZkE9KC6FX968cSAE7AO2QsxiCY6
	 +z+td0rbAmdiw4J5t0IANIjaloevmI0N14B1n8F7yQNJNPnyONpJTQHYyCisYxtL09MrJ
	 fc3L9NNAtpl6iwVgMACfYRA1ITLiu6wN2EPJwR0MQuK5H4fgGZpNqFgIxP7PTE5i2lxMt
	 sO48vF9EPNaTzqpoy4o1eYL941tQtvrw0Qkw/JgfLvPTcDvK8s3ZMB9vDcbuccydHwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D386606A695;
	Tue, 24 Nov 2026 10:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D386606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVnVk-007edJ-17;
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
Subject: [PATCH 6/6] clk: en7523: populate SCU child devices
Date: Tue, 24 Nov 2026 11:12:20 +0100
Message-Id: <20261124101220.3888170-7-john@phrozen.org>
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
and are described as children of the clock controller node, taking the
SCU regmap from their parent. Nothing creates their platform devices.

Populate the children once the clock and reset providers are
registered, since the children consume both. SoCs without children are
unaffected.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/clk/clk-en7523.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 800de9a48594..bdc5b378d1a4 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -5,6 +5,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
@@ -1822,7 +1823,11 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r)
+		return r;
+
+	return devm_of_platform_populate(&pdev->dev);
 }
 
 static const struct en_clk_soc_data en7523_data = {
-- 
2.34.1

