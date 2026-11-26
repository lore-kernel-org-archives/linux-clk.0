Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685810;
	b=EoLGslAqS8CpxFStTy1juCbxoWdo6akVT6cFbacSMS8q9BrFvT6AqTi9FF1Qix1XIOMZ
	 qCqYI8JOiKPkT/p4wS01Qz1mdMVY5HfZpTUtpJT3XsMP4JN7PKm5aCgncd4bjDdG8WxMY
	 G91UMfXTgz/PDXLorZcgZyX8QJUaoMu5uQJIUK1Ohx7v5qzdSNluWx/9xKs7ogttdNdsE
	 uBYhtEKFrp4dmkmlJBdTDdXprZXOgs5O5pyGcuhwSQ22+7JGBM++noETuRW07p50ZDCta
	 fbt8QN6E3FqrFSH6zt/90NRSinD6ASk+gDjmCjsqbyYhiylRnCPVYvKbwRTumWVRJrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685810;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=1cA81nKKC8QQHaL1H3/5BheT9EScx4zAhGfz2VgV0dQ=;
	b=d5PhON7peLNIgp7HaEOZQXz/MnPqHCVBFLIxgJUGHJi/BbM+dE0uI6RLt3UOznhM0uHB
	 4XnnMablr9voQHvX3+/AvbPujdnmdVfXii6F1ri4QeJUAhgAkxsB0WRymGwAuUxF8jTwN
	 HH9C0UaxNWB1iP5/QQ6qNgAUJ6xYK3dqujWu4AiUYduRWwZnaTn6L4brZmYGClUeJsmGM
	 j3tYO+HzxkrxZa8vbn/xnJIDt6k5stIPkQTIp0bGg1+WqHCkEUv5fyvJBP/3ZD3O5UrPn
	 27cygnHYAOWN6Z5nPN2b1a8XVp0X9gCSC1VdkaH+UYWxJwwcw+IJzg9JzPwnjM5yb6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=FryJXlEx;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8D7606A69F;
	Thu, 26 Nov 2026 09:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E8D7606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=FryJXlEx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795685809; x=1827221809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0zMVg8I98DgHF+mfSWFAhjUqH8SYfisyE49hSmgNMek=;
  b=FryJXlExBvBLj2D2DNHp2+Kn0+pza119ItCj8gwSEaiCZ7zb/C3Sk3Nq
   CTYeckaBPzjtCI3knd7ZNX0XTegBTCZ2BPyqNjCO8RUFAyRP67d7IisKo
   3yXcDT2RQeMHHWgB4QwGYWIGc8xQOoqjgK7qtbc1kaScBx3SmEisLNUVS
   ejOpHyNNlxZ3DiTCo05dJJpQbu29DL2W+bhPztoztIsoLEpV5QSzsHknE
   GbFXuT6TXwCmYRhi4Cx0nBraxl7WjHhDicux6eEJCQAwwupEME+2r6wYY
   dpo1bAmTX2Yvy1Zv3pqb1wEfCErChHWH9Oc06QrZF0Jzm7bXgIhXZ6KeM
   w==;
X-CSE-ConnectionGUID: 8V2eb2kgTiaxw1+1ksT54g==
X-CSE-MsgGUID: MVhSRHzkR8m2FmGVoQf/oQ==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="77907080"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2026 02:36:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Nov 2026 02:36:47 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:36:45 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mihai Sain
	<mihai.sain@microchip.com>
Subject: [PATCH v2 2/3] ARM: dts: microchip: sam9x7: Fix GMAC TSU clock ID
Date: Thu, 26 Nov 2026 11:36:05 +0200
Message-ID: <20261126093606.13271-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126093606.13271-1-mihai.sain@microchip.com>
References: <20261126093606.13271-1-mihai.sain@microchip.com>
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
Content-Type: text/plain

Correct the GMAC TSU clock reference in the SAM9X7 device tree.

Use PMC GCK ID 67 instead of ID 24 for the tsu_clk input and
its assigned clock configuration, ensuring the GMAC TSU clock
is configured using the correct generic clock identifier.

[root@SAM9X75 ~]$ ptp4l -i eth0 -m -2 -H --clientOnly=1
ptp4l[3920.698]: selected /dev/ptp0 as PTP clock
ptp4l[3920.702]: port 1 (eth0): INITIALIZING to LISTENING on INIT_COMPLETE
ptp4l[3920.703]: port 0 (/var/run/ptp4l): INITIALIZING to LISTENING on INIT_COMPLETE
ptp4l[3920.703]: port 0 (/var/run/ptp4lro): INITIALIZING to LISTENING on INIT_COMPLETE
ptp4l[3922.226]: port 1 (eth0): new foreign master 803428.fffe.37d483-1
ptp4l[3926.226]: selected best master clock 803428.fffe.37d483
ptp4l[3926.230]: port 1 (eth0): LISTENING to UNCALIBRATED on RS_SLAVE
ptp4l[3928.226]: master offset          7 s0 freq   +7815 path delay       650
ptp4l[3929.226]: master offset          8 s2 freq   +7816 path delay       650
ptp4l[3929.227]: port 1 (eth0): UNCALIBRATED to SLAVE on MASTER_CLOCK_SELECTED
ptp4l[3931.226]: master offset          3 s2 freq   +7829 path delay       652
ptp4l[3932.226]: master offset          2 s2 freq   +7828 path delay       652
ptp4l[3933.226]: master offset          7 s2 freq   +7834 path delay       652
ptp4l[3934.226]: master offset         -2 s2 freq   +7827 path delay       653
ptp4l[3935.226]: master offset          4 s2 freq   +7833 path delay       652
ptp4l[3936.226]: master offset         -2 s2 freq   +7828 path delay       655
ptp4l[3937.226]: master offset          3 s2 freq   +7832 path delay       654
ptp4l[3938.227]: master offset          6 s2 freq   +7836 path delay       654
ptp4l[3939.227]: master offset          2 s2 freq   +7834 path delay       655
ptp4l[3940.227]: master offset         -1 s2 freq   +7831 path delay       656
ptp4l[3941.227]: master offset          3 s2 freq   +7835 path delay       656

Fixes: 765aaba18413 ("ARM: dts: microchip: sam9x7: fix GMAC clock configuration")
Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index c680a5033b6b..f400d709901f 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -990,9 +990,9 @@ gmac: ethernet@f802c000 {
 				     <62 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 3 */
 				     <63 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 4 */
 				     <64 IRQ_TYPE_LEVEL_HIGH 3>;	/* Queue 5 */
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 67>;
 			clock-names = "hclk", "pclk", "tsu_clk";
-			assigned-clocks = <&pmc PMC_TYPE_GCK 24>;
+			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
 			assigned-clock-rates = <266666666>;
 			status = "disabled";
 		};
-- 
2.56.1

