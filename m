Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684725;
	b=w7ngTKQKcUi5PByLs0VpEV495FksyQUmoS9CY0+oOPb9cCk852WagPTBS0K5nVu1y/G8
	 M20nqXLEdNW7wk/Awwby6xcKLAWvJ7hAS+3/2+QqN/QW3QPYy4oIn81hFJaLJTXFgcPVn
	 la11DmW1rBRPqfbApJF2yrtotScVXJ3Gofnp1c2gR7xF8Hq7zQ2PRps5d55ZEYUZQfl5j
	 9STci27PKf3NM3FwdNu4mhEIn3N1ywtWnQZSnpFjBrLGEREW25GDxEKPy7K7QEkGeE2/r
	 K8jIArKef7PwBMXImJd5j6H5xQ1L7RxvBk6YEEask9rN+sBdB3cgtpYUzOruLPEiZYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684725;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=Dml2oES2r99mzv0WDYILS7xwOmKhPiDAhWdrvCj8oJQ=;
	b=pm7W0QCvOgo6A1bv3TAGWlVVQM+F/6Z4yx4d0Y4DmdK8koxCnd6ubzxpISbMiaxXevCo
	 nyZ1uTNCrZuDxemYrTgYgJQ9mFys13v1RdkwM/AbDHJNhdSex/gWgQaWOfyhDdq9OCugn
	 tk67KVF+cldaskegU/MpSyWAxBZ+uGKN4R9ZxL/8U+XPCsRl6vd5hJ1Gz0nGY2nelrPFo
	 SkErjw8myDCSC2zMvq3rBiJgw9TDudazf8zJLZ6GFH2GO0itfFzSCppxBc35cbzoejrcV
	 SiYFhLFSmixHkt3lLjEVa6U80TApA9jeWYi547u1puPBkEmBXTYR/9tKG3w0bmO5oSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=PCAxjKBi;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198D606A31E;
	Thu, 26 Nov 2026 09:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5198D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=PCAxjKBi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795684725; x=1827220725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=65Ljyrys+GP8qJ5zbm/Fc5Hox9VUPZjJrPiVH570RXQ=;
  b=PCAxjKBi6uT+Q/A1jNfRpOfPsjDDah9/GhkvY6Qu42S5HD1RHEmfwNA0
   Td5rTBZGsuwCIHJxATCOVyNOcwKbEXFBXn8Vjj6T3nj7wtmZjcsAB+0w1
   RPCN/7aNJrC/3GKhr4immq0zH8R7vJB11Aits0DPOnQq9lpWy0hgYIvJM
   V9lVWnm6vppFwGKU2z14tec6EjVUzFjom77lUGh0qt2hC+huFW3EkbgUM
   LN0l/tHZ55j4mk5SEPm4TgC3Egq998QlaQErpxCPjYju0KEyAi1lawG0n
   VWbFQjZcNYJ0WmTxZZWqUgZkcK4hfjfXrU6hYIoF2TAjdTCd3rIDA4YaF
   Q==;
X-CSE-ConnectionGUID: fKU50kOATSme+N/jMfNPvg==
X-CSE-MsgGUID: kY7Q2SWJSsSVi/KXXgyt+Q==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="77906060"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2026 02:18:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Nov 2026 02:18:43 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:18:40 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 3/3] ARM: dts: microchip: sam9x7: Fix GMAC TSU clock frequency
Date: Thu, 26 Nov 2026 11:18:09 +0200
Message-ID: <20261126091809.13012-4-mihai.sain@microchip.com>
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

According to the datasheet (see link section), chapter 64.6.2,
the supported TSU clock frequencies are:
8,10,20,25,40,50,100,125,200,250 MHz.

Set the clock frequency to 200 MHz, allowing the PMC to derive
the required frequency from the parrent PLLs.

Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf
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

