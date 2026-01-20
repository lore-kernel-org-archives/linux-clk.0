Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AC632E13B;
	Tue, 20 Jan 2026 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931324; cv=none; b=t50skWCQYLD2wPXFCzTs/ixlvf1sMFTXcDDuPHL1R+3ns+EeAZ4CBa9OkaVF7kuaZ3D76SPxFVNS2FOc//QrcYT2DWM+xcdDZLQKqr1SdZBkoKC+/WEK2OG7h4dexxX6e+ALum5e4LlHGAj3dz/gGMesl85n3uMWKVPfBit2u5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931324; c=relaxed/simple;
	bh=1xwAICfXCH1TEL3LBSz/2pauvpaeQkFCkY5QAoW2FB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YP0iWiF0GSckRnFIwnwmm6BfM65HvMvxJylTQheKsnxb7927LIs7C3aMIWHNus6lPYNB+mm0bBXYfwIZi7NSf0g2CZrpVDV2uSfzlucesLNqEja0JYVMjTzf/yQMQC7UwknW+3Ps8RjIXsuzHa18eWoeOs5jak5/pY6ObRFyvzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=D6fet0kb; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="D6fet0kb"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7572F148AD9A;
	Tue, 20 Jan 2026 18:48:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768931319; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6cczDl0ufO9mJ/Siyzg20rZ/XUvl4siWVGvmBLx6NBY=;
	b=D6fet0kbbNfXjut+g/Doqhm3/My1YMBeSaGdN8nbnojEwwvokLALeChgt1M46OXRrM3rfI
	buDIaEVh0EhbZqo142JbxbxAtCOYO8STPEOfFJXHJ1Ki3p8dMTtorwteWwKUP5k/AK9Y2V
	hdSnNApr3bQG/UlrZQBPUX96N8jB03RfB8SB8qbSeKN3H0jkJRpMdjxQc0X9vR5J/pVLUy
	CFDWFS9VR2RVfGhT0cZB6zMqY/8QeVvfgd3hRnS3L/jo9/fcEoUOslYDoEWfb2RmsXiqZv
	ELrVm3eXkBhSPlkDEnebLy/Pt5B7w5ICk7kUqpVgw3/BYGQgA6dottO2SlNE+w==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 19/19] dt-bindings: clock: at91: Remove old PMC definitions
Date: Tue, 20 Jan 2026 16:44:53 +0100
Message-ID: <20260120154502.1280938-13-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Those were split up per SoC and are not used anymore.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
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

