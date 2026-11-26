Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685812;
	b=L37QhVME6Qti/daRsDQbhMbBicwxGtpSSKrMbGPilr6kVRri45g2HyPkQYtSOCELFOT/
	 YSS4+qH+F+Th4LqzhtxoFkkiWu2Q/X3YewbUmfLQxM3lzoiBsAcll7gXXknKDH6yOtwAJ
	 /eGPJ2E144XHqpFAVY3//yJ/U9kGkQgqrTruClMYC8HLCP54Frde/TZFu+t1JFiw46Q8s
	 oCjQ43qmcRCuBnGMRsCvhlRa3odtFaM45eMenVNGyEs+VHUseY5XcHrmP8E1ygw88XzI9
	 uZTwXOZUStyFhIEBIICVs4Dwf8gorYjJTkmLPuZF0wg4bm7HNDxUoOIOuQwef0oX2Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685812;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=vhIjg/ZekNm65fFE7IweYQi3AfyZa6hWVIa8jE2c7Tc=;
	b=kMF6hDRycSW3JLGm7X1295QIoxEEakFxLdaGxkm4PML+pHe3abrqmm83F+EEN3eWdbwe
	 O6s/Gji3eDDnhGlgKVO2qIKadNZtELOK3z0dRaQ7AfQkRD9K4YMagWUv70vBnFDJyqgdi
	 vEjd2e6+NtpyeBJt3dqOgyDVY+XzdztINz6K9RG8dbTij1v5Xdi8y1mPyStuHOFgQe+ec
	 gKBQIrkov/B4tqPIoxl0sONA3LuLUFA87LKaZziSuoRQIR5CjUaMiM/0lUCRW6Wiw115g
	 vXwTAZixfkCrT3uaFlDvW4YTrGkYcXwYc2A6zwpNrQlbjkKy8NcjCBc6ufouADNsgGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=e08gF05Q;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B47606A33F;
	Thu, 26 Nov 2026 09:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B47606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=e08gF05Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795685819; x=1827221819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Uae0pBxFFdBQw+W9nIOt6/uannR5PUUSAL1v1lLhsU=;
  b=e08gF05QgSWWLAwxga3iUr21LVsBla0diJudL8k1BUpDyrUV/05MwJGY
   zK4vpSwpqkoEakVhE3JmAIzTfc64kovHktdgsUKiXVl2RvAOHftC4D1xy
   k9DK/28Kg200fs6M6K3u+g5UjHdJvJ3j1MBlogmHP9t5jdVKZyREdy/OG
   qBbmAN0ZEJy3PsG94anCNujl8N81y+/gWRreO7rM9K5YJwPd8UmuQWIzJ
   bEe8ZGWym1UM3m5EL6zsgzjSAa553khTxrfXSsCIFYfpElLlZU4psgPqy
   jyo2fLRFrvmsfcAw4QZfL72MAkLil5Ini3/lW5g6AZNkZznxwpA3hjhId
   w==;
X-CSE-ConnectionGUID: HmqS3CPxQdKh4eWINM651A==
X-CSE-MsgGUID: 4slE2CdITEOLDw8jNJJSPg==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="234123015"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 02:36:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Thu, 26 Nov 2026 02:36:51 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:36:48 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mihai Sain
	<mihai.sain@microchip.com>
Subject: [PATCH v2 3/3] ARM: dts: microchip: sam9x7: Fix GMAC TSU clock frequency
Date: Thu, 26 Nov 2026 11:36:06 +0200
Message-ID: <20261126093606.13271-4-mihai.sain@microchip.com>
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

According to the datasheet (see link section), chapter 64.6.2,
the supported TSU clock frequencies are:
8,10,20,25,40,50,100,125,200,250 MHz.

Set the clock frequency to 200 MHz, allowing the PMC to derive
the required frequency from the parrent PLLs.

Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf
Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")
Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index f400d709901f..e77683162239 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -993,7 +993,7 @@ gmac: ethernet@f802c000 {
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 67>;
 			clock-names = "hclk", "pclk", "tsu_clk";
 			assigned-clocks = <&pmc PMC_TYPE_GCK 67>;
-			assigned-clock-rates = <266666666>;
+			assigned-clock-rates = <200000000>;
 			status = "disabled";
 		};
 
-- 
2.56.1

