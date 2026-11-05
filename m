Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887974;
	b=rjuJcfwc6DEjtqpeEVBRmUSa2P7YlpKHDj5bOllB1umey1+STTcSmF9lZpVMhNE7zC9b
	 q03i88FykVmunIMiahcsQOzAQDrSxC/f5U7+qdcdSBpticLwas3B5zUZnYmmSIouiNbRp
	 u86cKL2a9ty/RPk0wAT9SEO1+bcyE6doK52HNrFPjdVHsxr84iKOxSWw3iufQVBK4Rth8
	 yWm3SJEGJ5cagwYzLT5xX2au863WZgMu+OFv5UFl51QF+neAdJpxTIfc13hJmtBxSm+XB
	 0oK0EDVa0kAKLK13WfDKa8HdzPJubFTmCA8+kyPjVeqzZUx1ObMuM3MQC2EBTWd5ajQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887974;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=3AoMLszL75RGaB8VS8iwoRVvxh/ff74HhsxQd5Z1i8I=;
	b=PQva5vuPVIcbLaNUN90uIDdx1VZEzDxqg2BI8u94lsELk1MJep/WJgmql4GZdh4qLDmI
	 drSv0LbdDW9SLwDB4xN9S4Ock6QL7OcXbtE070cMqpZY+eiHpx1EO0GkyihLxvLl1Sbrz
	 g8UWTh8dmHzmRMDogzahs3LtJ46IxL1LYqqtzV9KTYHSn9bLzu5NEHnfq3fZfdF366SmQ
	 pq4bddIE6vd4Up4vyvR+FjUyHBqxSgGGYXRMSLniKrqXrp3XbPHp/PsTdhTs+ykJPStu0
	 MdtNkZzPs7j8kbsmkJwaOgpj2fdY2Ev7xqSwz/VaV2TCgUQeR3WDZUpHdm9va/2jeVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=HCZoFnt0;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B169A606A326;
	Thu,  5 Nov 2026 14:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B169A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=HCZoFnt0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57EE1149670D;
	Thu, 05 Nov 2026 15:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793888007; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3AoMLszL75RGaB8VS8iwoRVvxh/ff74HhsxQd5Z1i8I=;
	b=HCZoFnt0oKVbE4zYiGQTpDoBTsip409uGFYWZEYxqpCLpeUBPfD33kr3g8Gc4y9f0UOrWU
	HAP6TQXXCKWF60LM7J8GKeSwgihu61xAxnHFCOSJlpeg6DHIFtp2TRZ50R2v9skT0b37Z6
	wA9BOUQL2DULjn2e1BSGl5i8eiVw+4RT42FdTg0JJuobbd46N7TTD+VAfLq6rSIudoktSW
	VZ4ShS9w0lawaIyBpNJ/WMbREsEj5M3kQEkgquWyypB/FzjgQb+/EaEoZBFQBM8sxUL4W2
	cR6p09XZUyFmW3pRTCDLyeNfmO3ndsYldGPFmLWSEpyBJIkZXkPsde9hTobzcQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 15/16] ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
Date: Thu,  5 Nov 2026 12:06:51 +0100
Message-ID: <20261105110715.2486432-16-ada@thorsis.com>
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

Allows to access the OTP memory and Product UID now.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - no changes
    
    v3:
    - Reworded commit message after reordering patches
    
    v2:
    - same as in v1, no changes

 arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
index b9ffd9e5faacc..c110a8e87568a 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x60_curiosity.dts
@@ -252,6 +252,10 @@ ethernet-phy@0 {
 	};
 };
 
+&otpc {
+	status = "okay";
+};
+
 &pinctrl {
 	adc {
 		pinctrl_adc_default: adc-default {
-- 
2.47.3

