Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887975;
	b=RuWYDFVzNeEFJje5GQ5TesaBUJvab+riLqd/8A46zVztN578TPSBQhxuaKynx/HJU+Bo
	 9zWunFk/aS92W9yJsXB1nbeTkDBrBUpZ/smjKUcEtAvs1U+LMmvlW0ws6ybZ0X9fgGIfe
	 NKwvHfm3QpmaeO6fgr4PhCO0/bgEVTHKFcfqhk2e/rx3cI+psAnMzeTQcF5dRv1HWMGX2
	 baJHwdnoWUjZcT7ONLbjMaKzYknTrGKlcu5CFVj7/bNqFBYPD83w0yA1b2nYgk7oc7uPy
	 DvE1HPX7dafxnowljI89v+Hh08MThHOSKHnltj3pHy8k62ERTydNsTL1+8PgtIx278A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887975;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=1G50rBV01liY/Ser18phaysjoabEV3aBmHhAJ8LmX5w=;
	b=3U72nJWDEVcgRxFGHQvTuQgXlymzD9LIEXGkyDc/gyphG3+58BLpJouHZ1+2o6N8d/xs
	 9E4yKVXgvdkagjS5PwE7R0R5IauG1M05AgytN1UlKMVs9IilPP1YXUAC4tA8AnposEIun
	 D11qHbMGvm+z533dXEj2/4NUb+cZcr3VM1jTEf0eu9e/IHiGCCmvGk1Hvn2TvztrX8B3J
	 4MfvNLONcN2tSM9xtslvD4OyGhviloGowHN4EE91xEAPkG1BudOThdEPeYGFSwGdXvz6V
	 jRvJrps3WveW8btqbwNo/0Q0yMjc1ptIAumssJds3ZMXjfIpAwkpTMyylbo/ZQqBUKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=roikVhSe;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB184606A32C;
	Thu,  5 Nov 2026 14:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB184606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=roikVhSe
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C42A1496743;
	Thu, 05 Nov 2026 15:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793888008; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1G50rBV01liY/Ser18phaysjoabEV3aBmHhAJ8LmX5w=;
	b=roikVhSeQbfcm1C6KuVfw8SvcxGxhWz1lmDJcJDSFAnjhrJbpMRpIDna/DyON5TvaT+18u
	D2GONEaZXc4ejdjAoHPGLBE8tiRnPwSilfbMTp8Ue6rtl03cNgTFQKOvqv2/6HwD9h4Yvw
	JsRcF6HnAdHkZbv4MUaSL8sPoqtyWX5Vqs0x7fx3Yd3gdflxanbxGpXvxYZgT+LU30s9j7
	rj4Fx4pneUeVONE06WFshlPUOMTA7XC7Q9wS/KDtP7nQBdkiaS4F+68t7NxdmzumxP8l3U
	9VR7xUYhM9i6+bFoFyvZbK9yJiq8sKdGeQ65DfKLw6pIwc4MypHGpi6s1abKaw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 16/16] dt-bindings: clock: at91: Remove old PMC definitions
Date: Thu,  5 Nov 2026 12:06:52 +0100
Message-ID: <20261105110715.2486432-17-ada@thorsis.com>
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

Those were split up per SoC and are not used anymore.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Added Acked-by tag (thanks Rob)
    
    v3:
    - new patch, not present in v2

 include/dt-bindings/clock/at91.h | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index f2a7b7d39c0d0..ebc41cb4edb92 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -14,38 +14,6 @@
 #define PMC_TYPE_GCK		3
 #define PMC_TYPE_PROGRAMMABLE	4
 
-#define PMC_SLOW		0
-#define PMC_MCK			1
-#define PMC_UTMI		2
-#define PMC_MAIN		3
-#define PMC_MCK2		4
-#define PMC_I2S0_MUX		5
-#define PMC_I2S1_MUX		6
-#define PMC_PLLACK		7
-#define PMC_PLLBCK		8
-#define PMC_AUDIOPLLCK		9
-#define PMC_AUDIOPINCK		10
-
-/* SAMA7G5 */
-#define PMC_CPUPLL		(PMC_MAIN + 1)
-#define PMC_SYSPLL		(PMC_MAIN + 2)
-#define PMC_DDRPLL		(PMC_MAIN + 3)
-#define PMC_IMGPLL		(PMC_MAIN + 4)
-#define PMC_BAUDPLL		(PMC_MAIN + 5)
-#define PMC_AUDIOPMCPLL		(PMC_MAIN + 6)
-#define PMC_AUDIOIOPLL		(PMC_MAIN + 7)
-#define PMC_ETHPLL		(PMC_MAIN + 8)
-#define PMC_CPU			(PMC_MAIN + 9)
-#define PMC_MCK1		(PMC_MAIN + 10)
-
-/* SAM9X7 */
-#define PMC_PLLADIV2		(PMC_MAIN + 11)
-#define PMC_LVDSPLL		(PMC_MAIN + 12)
-
-/* SAMA7D65 */
-#define PMC_MCK3		(PMC_MAIN + 13)
-#define PMC_MCK5		(PMC_MAIN + 14)
-
 #ifndef AT91_PMC_MOSCS
 #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
 #define AT91_PMC_LOCKA		1		/* PLLA Lock */
-- 
2.47.3

