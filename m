Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684722;
	b=e/9dOs9P064xibTK9/Mfmkha+xCm9MUhHmNFTFAZP/+kHAnMNLg+ijpabN5/MIBbyy3Z
	 USBdwC3MiNSCJMQx1s+BQSzUBRJeAKsYV2LWTnL5Whnj0N5d463fXfhKfA2swxRQikFTD
	 tcwxfIG+5SUxZIpALoilUIgsuDqU7W/XU66uC3DLc7lvYiYvjV8DnClGEsCoCHpciz09p
	 kTmikRMKbJLxTt3tDLuGj3VxfKALNjIaV/MIqCyMivdLomhPHOENOi9GdyC2kabFOOkQO
	 dOZbtoaFCqASuj2ueuUL6ikFhDuLhe6wHqyYXKB2ku05moizcwVlEd9xlT9e6z8GXhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684722;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=pzzX1jYH29DvtebnDrL9IRhQCVnlt3LOXji+PKH3TBE=;
	b=3V9yUWpUD+HlB6UnhABEnApq7JVuILrdoLhBpntdFnxhX9mZDZ50UCUIWtWGpqt4DAbD
	 AGuGXoD+9mQ865Xt59BhtmwMBndKsep3jPNaQ8FJUEMYyNg/8jPBoNAYdypTGCBCoIJ6P
	 PNNJhv+8HkWlX8QWFnLsdlHW4RqW1H2h1G+bNuWtHHyCtTpeHXgadsDDM/rzUqRCjsiUa
	 j/lw6BmRpFUXQNkeW/rhz/PA7GojLTeQRwa0z/uHlh/fSYEKEerYFBv/TF71jdlUjclEv
	 uLBIhTslI6XwBAiwJNv7KUTmqFPHFksWW1xnOlyjFHHoIvSa+GPiDrZwdvvUGSe+fhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=k+rTo2DV;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBCC606A31E;
	Thu, 26 Nov 2026 09:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FBCC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=k+rTo2DV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795684721; x=1827220721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pwKFEtJt2Of3c9d68sQnYuIZYNu6BQLtd/DWMWEykBQ=;
  b=k+rTo2DVYHJ+WsalhQg1se1tG8H27/kR3p1DsovWQhIzBklAYY/O6kYZ
   wZ/cLXT05h7d1+YRPNW2qKrjpi1G6c+gv0TMzd17BPxzdHeWOp89dX+8S
   5SYlCjHTdWLaBjeCvm1U7gLBG0utSBrxELDBfIK+FPpkAgP23Vpp+84iq
   2vGALirTnKHV49PJguZIVRstnX6vQfpaRNM/fgeVBnzKXiq9V46UaYe67
   WgbiFgBPHqy11Fwdir8hr70Qcp9eQCEOQZQihueWsHJR75/rkNLjPxB/e
   DQqyEWX4jnNq8pv/eQcTNydlwh6OkFdbghIAk8laqCbrCEZ1Qg4P5CigJ
   A==;
X-CSE-ConnectionGUID: RAevDqs0QzafMgzOWRYBwQ==
X-CSE-MsgGUID: F3ewkp8NQl2su1w9YgubTg==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="66103548"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 02:18:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Thu, 26 Nov 2026 02:18:40 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:18:37 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/3] ARM: dts: microchip: sam9x7: Fix GMAC TSU clock ID
Date: Thu, 26 Nov 2026 11:18:08 +0200
Message-ID: <20261126091809.13012-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126091809.13012-1-mihai.sain@microchip.com>
References: <20261126091809.13012-1-mihai.sain@microchip.com>
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

Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")
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

