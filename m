Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685806;
	b=2pSiQzhieqa1ojnc56wiObK+w40VeKP2vsWNq+RkCfVktkVSXiuAVGzpx3kFCUX4LL+Q
	 iXSVwEV+c5GPTxKttLO9gILos5fZLs1c/c9ocE8KTKozca63jEcawipz+o+V2gsPZBd8l
	 eaxBeTRDtQxdq3sAodGVVzFPNemR2vo8OgpgKgEHT4iMzNcL2KHSW49aMPXjL2TPRirF3
	 KcZHPYMQJzIzRfjiBNv15fAqR5zawlwbwu071W6hIdrF+Zgm0cLPom7DFiHapHkOGWJeh
	 i9Boo4VCGkYwo/Jk2wTpJWQWeYPrhzpc+H06RdeU/iXOA3fZ8KXmShuvf+G/uPxPkTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685806;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=xgqLAx5bD2+RAgA4BuQEwiDEQy9uzNE6YfX/QGBHxCg=;
	b=tUh/sDCGhmWMfH0/DJ9kV+6h4wvf+YeInYTx4uxosXEAqdbnEdcQEa1HVuoIq7P50bVM
	 eO+lw4cgsNhSQm1l9AT6gUfdKTdUVbLluLrexQC6cVaMaKPQag1iFx/DJlchYTTlpNGgZ
	 XEeViqq7CO+UsqBYGT23qYOL6UCcTSK8D6aOg4e5w8CvQvA7ociolpYjdwVjvVi/8O02C
	 DxmwWRJAglO2yCScFDcLUpVKnoEm06Xfc5owP/gNYceBhURF/YYuAU6/Kx5xmSOjEKk3/
	 E6TaWr7eq/jtTUujj83tRSNIJLiAAdaAu8qCXHeJAHwLPYXKbmc1zZVdvG0P0W5wcVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=mgtcV4vu;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D24606A6BD;
	Thu, 26 Nov 2026 09:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D24606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=mgtcV4vu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795685814; x=1827221814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eCS7eB5hOBZ+j439y6Lezu1LtAD7S+jIKLU8MGwR5/o=;
  b=mgtcV4vuytpOiM+GaYKnDsir9dXuykqNX5n1U1w0xfkxtVlg3MqCmmPw
   FNVcXqd2hqEjvE4Xr3129ZJEbzNeh6TMlcUepeBCEavXeqH830nlv0DS0
   mraMWGDy6F5dzDLFq/C1M6L3/EXTMEsvd0jSlYl5El4FgGe+KsClFPNqm
   6zCNLliCjba6vsdFjQTgpStRZ9ZCFRlKxVsxrvPEgsgBN48jiQQ/pwBJs
   DNxTL9gKo60ICYCzNvTqVR7z+vYjTR3OtQd5ddQJ3HqgbesRIZjD1+dKT
   oUSVEVaJY9fbWRSyyGeUnNV9kJAap77n3I9unqsq2zZTxF3Sy9J0yZxyM
   g==;
X-CSE-ConnectionGUID: bW45RRidReilWAqpnsZmDw==
X-CSE-MsgGUID: RuGvHXF3RH2QNiWCJLCDXQ==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="234123007"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2026 02:36:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Nov 2026 02:36:45 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 26 Nov 2026 02:36:42 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Mihai Sain
	<mihai.sain@microchip.com>
Subject: [PATCH v2 1/3] clk: at91: sam9x7: Fix GMAC TSU generic clock definition
Date: Thu, 26 Nov 2026 11:36:04 +0200
Message-ID: <20261126093606.13271-2-mihai.sain@microchip.com>
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

According to the latest datasheet (see link section), table 12.1,
the instance ID 67 is used for the GMAC TSU generic clock.

Add the gmac_tsu_gclk clock to the SAM9X7 PMC clock configuration.
Configure the clock with a maximum frequency of 400 MHz and
support two possible parents: audiopll and plladiv2ck,
using the corresponding PMC mux selections.

This enables proper parent clock selection for the
GMAC Time Stamp Unit (TSU).

Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf
Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 946aa54dd2e8..80e9ee154b97 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -710,6 +710,16 @@ static const struct {
 		.pp_count = 1,
 		.pp_chg_id = INT_MIN,
 	},
+
+	{
+		.n = "gmac_tsu_gclk",
+		.id = 67,
+		.r = { .max = 400000000 },
+		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp_mux_table = { 6, 8, },
+		.pp_count = 2,
+		.pp_chg_id = INT_MIN,
+	},
 };
 
 static void __init sam9x7_pmc_setup(struct device_node *np)
-- 
2.56.1

