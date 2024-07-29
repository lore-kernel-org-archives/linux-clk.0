Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855F385628;
	Mon, 29 Jul 2024 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722236908; cv=none; b=p+FoNtVF9KSjudRmYy7c1j0JAEDZEwUpw/m0YbudFeBcYMuvVEDwm91IWH4U1S6rxf+crxqs5nQUv4NUgKZ09YGpLxaaKcvFJIHIIuIMKhE7OVaFXbuz0rk/qWf9cjj55Rv5RFrjm3CvZFISKtmoCElpWETEJkfTU2gqGZBl7eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722236908; c=relaxed/simple;
	bh=fkG6RF9SVnoEx+IzruR0HjZJb1UJHtjYsNIynC9sonI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bq7hP2NeOOX84qmreRWJoJZM/VCrmpsP+PhZs5j0ucZwXLck+gc1eYWwSSPppJuwK4oTnyWCgHZAEn4ytgqdGz32pL9MLvw7N/dZiW/IFWIVFC1ohGmxCtqoh4olvXVw8BcyLofjE9o2FmrcoRlL0hrx8ykOvpZrmU5gxACWEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=QpxTvoYm; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="QpxTvoYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1722236906; x=1753772906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fkG6RF9SVnoEx+IzruR0HjZJb1UJHtjYsNIynC9sonI=;
  b=QpxTvoYmQlSZA80zTe9Lbp1MaJpkTkA5Hq8aCCpr7kK0q5oKwqyQizGL
   IRA2JCxVzM15OFWpLUJrPghJNL5SiyYezKB15Yr+6SonimSge+ECodazh
   Dt/sH+CylY49quJxFyTMW48s7DbMyj9I9TCsPmlM8MMJghukFs9m4X44C
   LvUCSrQz0CDx5ye85xKB9NCcCoV0iLiLPcTa5ca9WP4xPOHvAlkJgixzh
   xypoKCAwv6ZCIt13Et5tB16K+0T8jnYkNktwBdlaQO+jhIG6qrd0UHYFD
   XQRIzivJoJroU7c20OtcIp9zxj5+xJEeTGw8yF9WwJOo9lPcIDoxW3urm
   w==;
X-CSE-ConnectionGUID: F/hyoSnPT1CJ+O22vYM+Pg==
X-CSE-MsgGUID: OkOVbUIjQaeK/3X0zFOtlw==
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="197213938"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jul 2024 00:08:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jul 2024 00:08:10 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jul 2024 00:08:06 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v6 14/27] dt-bindings: clock: at91: Allow PLLs to be exported and referenced in DT
Date: Mon, 29 Jul 2024 12:38:03 +0530
Message-ID: <20240729070803.1990916-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240729065603.1986074-1-varshini.rajendran@microchip.com>
References: <20240729065603.1986074-1-varshini.rajendran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Allow PLLADIV2 and LVDSPLL to be referenced as a PMC_TYPE_CORE
clock from phandle in DT for sam9x7 SoC family.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v6:

 - Updated Reviewed-by tag
---
 include/dt-bindings/clock/at91.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index 3e3972a814c1..6ede88c3992d 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -38,6 +38,10 @@
 #define PMC_CPU			(PMC_MAIN + 9)
 #define PMC_MCK1		(PMC_MAIN + 10)
 
+/* SAM9X7 */
+#define PMC_PLLADIV2		(PMC_MAIN + 11)
+#define PMC_LVDSPLL		(PMC_MAIN + 12)
+
 #ifndef AT91_PMC_MOSCS
 #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
 #define AT91_PMC_LOCKA		1		/* PLLA Lock */
-- 
2.25.1

