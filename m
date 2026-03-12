Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5962D4A23;
	Thu, 12 Mar 2026 04:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773289342; cv=none; b=biPvasp+GqRCOMj1DoVbxu+TKSbFg6j71OrH4Hg84uLrV3FzaTzfJgprhzhOIoZ/8vR6KK5Q8GsPnmo9iZJTI5KPzuyqVwvrE557sfoxJddxbKUvO4tf+aPjqUiibnTEIdSqhd50gBDhkjvlDU7qAC6zIqfsMcOCVAkBoCq2LmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773289342; c=relaxed/simple;
	bh=PUYnKeKHUBCeKind9Npf1NIbjQzWI2oBFhL1pRGpyEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjxltr8XHqbrcuOYjqc37CHM0io2PC786YR3d2tt9n4oxnQXHAlpNCRn+qb76jVFUYQ5ZrchdQ7DQ00ub+JqZ2+wOpbei8LV4DXNdarIjcA2lq91UDXyjA+EXv5HDc4Hcuf61ZmYi3kVOjZCcoM+TvdOVwK1rUfSQgKQfp8gyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=yNQ+XmAo; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="yNQ+XmAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773289340; x=1804825340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUYnKeKHUBCeKind9Npf1NIbjQzWI2oBFhL1pRGpyEw=;
  b=yNQ+XmAorypvnC+9wQ8Z8z7ZdOwgcYqpejk4N32O61pIQZRrI6TlOExL
   6cnxVqt1xOSXUr1Rcyxq/vMRj+oi0GeBNu3oQfM6EaUZzSzvL65SBSS8d
   GAhxzIQ2hBErxAChaE4VrsRw8i3SL+abiQSEMoshki3RJpXvjdDx2rcet
   UbaQIPBhnLS2TAg4ydLiQhkFNjfHmm6OumzXWwdzGV7OxNbRvdBVhGOK9
   ZlMc8fEfZ+Fhmhpc/uAgDYvF7SFaAxfXzrLhgYmMqNWF4yDkD+PZxLSR9
   9KfTEU1SZG/+gltts6MqczVq5BY9yJkPwTEZyyLJgeIaYQH5bX4f3CYDX
   Q==;
X-CSE-ConnectionGUID: il7LFELGTMWBUr9DGihooA==
X-CSE-MsgGUID: Cw+T+2u+Sv2qNM7MfPGmPw==
X-IronPort-AV: E=Sophos;i="6.23,115,1770620400"; 
   d="scan'208";a="54551562"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Mar 2026 21:22:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 11 Mar 2026 21:21:49 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Mar 2026 21:21:40 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<ebiggers@google.com>, <martin.petersen@oracle.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<jarkko.nikula@linux.intel.com>, <kees@kernel.org>, <npitre@baylibre.com>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Durai Manickam KR
	<durai.manickamkr@microchip.com>
Subject: [PATCH v3 4/5] ARM: dts: microchip: add I3C controller
Date: Thu, 12 Mar 2026 09:50:55 +0530
Message-ID: <20260312042056.309237-5-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260312042056.309237-1-manikandan.m@microchip.com>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add I3C controller for sama7d65 SoC.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Remove clock-names property as driver enables the clk in bulk
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index e21556f46384..f358aae3ec59 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -1015,5 +1015,13 @@ gic: interrupt-controller@e8c11000 {
 			#address-cells = <0>;
 			interrupt-controller;
 		};
+
+		i3c: i3c@e9000000 {
+			compatible = "microchip,sama7d65-i3c-hci";
+			reg = <0xe9000000 0x300>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 105>, <&pmc PMC_TYPE_GCK 105>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1

