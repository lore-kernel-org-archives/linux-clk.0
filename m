Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876850;
	b=esfNPKrNevwqi3/2rIz2gbnzvHi2gnByqg+6YqoStc0dH12EJ4a5hw7wgy+S4ymJoVdG
	 H5UifScOfP3frdxyButPWxaMTYvWH3yCc4Xb0Ute6XKM7JqcruXIHiaZobJ1dOZuKGRDd
	 XkSbQOrD/6BNJoTVuhUB4EcjR8RHdFlS+er/4kLk1LEFDCpkncIQiHnlhDL5V6PSYZ8Kn
	 okuAJCNkapdAVSVD1hNIC1vtfLRkZK4KKBiJpUviKndhuS5aj+rn5L73i1XrEvexpTmPp
	 gISko6aB6kKHkFr8oftnsXVaLyyzWQMmWKbFbgoq/oZnwBuBtnACkORJRP/QRFOYu2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876850;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=hxyLMEGDqraxIGgBI+7+yT3sa9IS8sXUw4nKu2AXh8w=;
	b=WT/9oSjiZMcXmwToFO14GGxF9M42hwtQaH/1mXgqHiPfS5KEoiq9eSJE6oHOBnpmPvo3
	 xsndrmxTBp2AgrTDF1QmkcGh0lHhBNt7JfFhonB/9Cy/YaocGMEoAfM5kha/C8MmEUv1q
	 DU36Cep4bpjwoXn7Ab8R+Uwh5ZeNegbNZOMwqzgjA9cXtsH6X0ebMlpD7ArD7lben831c
	 v+ohpfk8gdrSWg9QW7gjwqXq15m647pQaj/ayN2Nz9mNlz0wz2HNpSYKXnyICMZoQRJtJ
	 oRB57FiF/ocfEXVsNBoE93wncvySdrejqscph8ImPsYi8w1P4ddYExFFxiCYGS3m9ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=bfxV1TLh;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8C8606A337;
	Thu,  5 Nov 2026 11:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C8C8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=bfxV1TLh
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E17E2149663C;
	Thu, 05 Nov 2026 12:07:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793876877; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hxyLMEGDqraxIGgBI+7+yT3sa9IS8sXUw4nKu2AXh8w=;
	b=bfxV1TLhvKfIzKHa1laHnNz1KeXCwNKQFT8TMx2lAiFftkScB4PUpNptDwfwgD82v7uADz
	d1AlfV+vnhvJ47o79+k1Ssq3fmJU8Inaw+ofTYbO6aBfNg2hp/gUuvWvP+dIENSDsblZZQ
	UX2HC3HPYHWbVaXj8CqPyuQ9nN1nexpBROKbhFgaO6xMPD1HIl1uD9Tc0fbJG6e6OjBj65
	XCLG6SEp5Z1MbnXxZFViVtxzWmMDAnHE9/2NdvRqQXjsk0a8SSZmA2JzvyrsVljWV9xq6Y
	p285R83jGlU5eXBieALwy7/fbNPh4HQi1MAZhRDx4elh8KYfBLnR0MgZoGNm5A==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 03/16] dt-bindings: clock: at91: Allow referencing main rc oscillator in DT
Date: Thu,  5 Nov 2026 12:06:39 +0100
Message-ID: <20261105110715.2486432-4-ada@thorsis.com>
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

The main rc oscillator will be needed for the OTPC to work properly.

The new index introduced here was not used on the four affected SoC
clock drivers before.

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - change index for sama7g5 and sama7d65 after re-adding unused PLLs in patch 2
    
    v3:
    - adapt to different base changes, added lines are the same
    
    v2:
    - new patch, not present in v1

 include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
 include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
 include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
 include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
index 050e5e774b274..830e247ba2532 100644
--- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -10,6 +10,7 @@
 #define SAM9X60_PMC_MCK		1
 #define SAM9X60_PMC_UPLLCK	2
 #define SAM9X60_PMC_MAIN	3
+#define SAM9X60_PMC_MAIN_RC	6
 #define SAM9X60_PMC_PLLACK	7
 
 #endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
index 292c5873e101e..58d2a08116795 100644
--- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -10,6 +10,7 @@
 #define SAM9X7_PMC_MCK		1
 #define SAM9X7_PMC_UPLLCK	2
 #define SAM9X7_PMC_MAIN		3
+#define SAM9X7_PMC_MAIN_RC	6
 #define SAM9X7_PMC_PLLACK	7
 #define SAM9X7_PMC_AUDIOPMCPLL	9
 #define SAM9X7_PMC_AUDIOIOPLL	10
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
index 08581418b9115..17105a6bedb54 100644
--- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -19,6 +19,7 @@
 #define SAMA7D65_PMC_AUDIOIOPLL		10
 #define SAMA7D65_PMC_ETHPLL		11
 #define SAMA7D65_PMC_MCK1		13
+#define SAMA7D65_PMC_MAIN_RC		14
 #define SAMA7D65_PMC_LVDSPLL		15
 #define SAMA7D65_PMC_MCK3		16
 #define SAMA7D65_PMC_MCK5		17
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
index 27668634b0a2b..4a1c4af8ecc9a 100644
--- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -19,5 +19,6 @@
 #define SAMA7G5_PMC_AUDIOIOPLL	10
 #define SAMA7G5_PMC_ETHPLL	11
 #define SAMA7G5_PMC_MCK1	13
+#define SAMA7G5_PMC_MAIN_RC	14
 
 #endif
-- 
2.47.3

