Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884271;
	b=nPt57sUf72LxPYJQ4yirDFngEDvWX2kzEMhhd6l1OY/gOCJFjLAqsUKm1k+dPNItQTNu
	 zIFe2xxMyL/zeaI4QQ5JQVC8LNWWADwUwPuc+nabBDXO66tr8qCW0QMC3EKcQ0cWhHoHp
	 N0/ThcNOKWEqZqzG4A+7xaVMaJp2R3N/LHayLEE9v+Q0MHQkZecgtNvuFWxx48wyxR9Tz
	 /3toaNFnhC0mQxeWNd6jfFt+c4xkxWixbBgrPJkaTuHFeR3uXdoi9nq9wVyd5S/APMrPK
	 1xSGt+/WgB8WZ+bqVMEPfR3DLQnNLCxxPAhLficnBlHiDXYCSUmcNW1fIKPUMe6Qrbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884271;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=zFarGEUyw1j9qFI3A4zGklNXn5up3QuYvyOkYkpFrao=;
	b=TljYtSigwl683FUME8RyQpbvfYuPdXTwg5agqrrCEZQJDPKT4QgdY5limuxC96q0k9wn
	 moMZzxYjUHwextNUhZ7Vp0+6PATbtOt+EQ/trYny6zNpnOATZrMkQMQIhfdMgYJw7JEf2
	 FXlGUuoPIqrWM2Ea29n4kDOew1iRyJ1trnXjAwnpPha9Vlevpg3Alm4WUnXHP+as0L2Pn
	 ZAWc/qjWf39cgbskppVgcHfP+xsR1uSQWubldE6H/Nx1sDKrQSEOKZ2WXKcPEkZiCHsZ1
	 Yc23/IzN1kSTBxLK15hdOdEfJn9R6QiQLSIcBxapRrdu7KWingsfG2poDS96Dad69CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=UuWPi6xk;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5E606D82A;
	Thu,  5 Nov 2026 13:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE5E606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=UuWPi6xk
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9D5F14966F6;
	Thu, 05 Nov 2026 14:11:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793884304; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zFarGEUyw1j9qFI3A4zGklNXn5up3QuYvyOkYkpFrao=;
	b=UuWPi6xklvAj+GDfZCkgc7wZ6CkbNbnR4k/D+KclqmiU3337WzAGx+3e285SIqb+lnZbQw
	bzKGdlutJAvHBdIK0C6lSR4+0rqUiu/h28kAwVl4XgSQLzEE6xFousbbgtKKpMkLmoH2PV
	FLb5YaYJp7aazptcXNzI8VGIHAHIfsGRtVJTmfZr3DQ0IVr8m/DSpyZ1TEUKRgfw/RscDw
	xGelgEXoSVKFTQlOxrGxSDb7ojdqfmw1AJJlStKy1SWFwnIC59cxEpf1dLvZT3VJnya8VT
	60rHwPZq1HanMc+np/U8tLNZ5yC6C2lLvyKl/oQ1sVRvt4s7fn9BMRYRqwXGrQ==
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
Subject: [PATCH v4 13/16] ARM: dts: microchip: sama7g5: Add OTPC clocks
Date: Thu,  5 Nov 2026 12:06:49 +0100
Message-ID: <20261105110715.2486432-14-ada@thorsis.com>
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

These clocks should be enabled, datasheet says:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Earlier discussions suggest, MCK0 must be enabled, too.  MCK0 is parent
of peripheral otpc_clk, so this is done implicitly.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - no changes
    
    v3:
    - Removed clock-names, not part of bindings anymore, and not used by driver
    
    v2:
    - new patch, not present in v1

 arch/arm/boot/dts/microchip/sama7g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index b8296391fc696..30193f3bf9775 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -1036,6 +1036,7 @@ otpc: efuse@e8c00000 {
 			reg = <0xe8c00000 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
 
 			temperature_calib: calib@1 {
 				reg = <OTP_PKT(1) 76>;
-- 
2.47.3

