Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605C3C197F;
	Tue,  5 May 2026 07:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965242; cv=none; b=jZbErhAalO4hRcLdHQOmSzQbIqlkYeH1snPm+8thw+RiXBctd1WfkLj6BQBJNx99HJ6gcQmaBp5Yg+6HClxRl7NxJRq6G9FXRFOCFJRF3sWzjS0MqQVtdSh5adsSOAf1lB3mtnfMjSixtPdzVoJM1Z393iyGMJ/YGyp8sPbtClo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965242; c=relaxed/simple;
	bh=1pdGbtvS5ukFxIuzO7UY6eiKSwsEm0UA9a+Owr7FRpw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tk7HVDJsf3fsRB6aZpBjqDg1haZd0V6+T693Vd7RxUZmoONy8YeJr/sY160sg7K8qomKWKsKwZis1VxptCH8UhCB0NiGZh+zZIAzpbZY0R0wntYqecUYm//2cwwGlS4HkTMVcgFX7z8YA6m+2RAc3bxp5L3rpFrE4apGHMuqInI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=by8dY5rn; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="by8dY5rn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777965241; x=1809501241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1pdGbtvS5ukFxIuzO7UY6eiKSwsEm0UA9a+Owr7FRpw=;
  b=by8dY5rnUH+GfU/MLe4tYypzGmnt9NyMZaM3rv3th+qagfNdU7IMJqAU
   rNxc/NMJiyfhPuofyQJkIpYkjWyHtI7WSkql4nTRAQHdC0znR+aux8zN4
   lEKYnd1u/JSLD9GUV1qQ2p3e3v1076G9ih/OeICxpD5TZiOXAg8lRUoCI
   ETKWvNYT6HduTMYK1CWVLdnRmxtBkjbg9bRRDZMdHwdsJoGmyFo7qglsh
   3ybqU7VP5thdmuZ2UF0gFXSG8doOv3DeBE9BjsfEIznxeK27c306FccS6
   WY/qDOMswYyV9P416LW+cS07mze8Gtf1/uairhJvUDrx+IK2jS8MoIXTh
   A==;
X-CSE-ConnectionGUID: C9sN+4ovSMmSQ0K5JQ+nAQ==
X-CSE-MsgGUID: PF9d5EP4Q2O15BgTuTjUXw==
X-IronPort-AV: E=Sophos;i="6.23,217,1770620400"; 
   d="scan'208";a="56268030"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:14:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 5 May 2026 00:14:00 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 5 May 2026 00:13:50 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <Ryan.Wanner@microchip.com>,
	<tytso@mit.edu>, <romain.sioen@microchip.com>,
	<aubin.constans@microchip.com>, <cristian.birsan@microchip.com>,
	<adrian.hunter@intel.com>, <jarkko.nikula@linux.intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Durai Manickam KR
	<durai.manickamkr@microchip.com>
Subject: [PATCH v5 2/5] clk: at91: sama7d65: add peripheral clock for I3C
Date: Tue, 5 May 2026 12:43:24 +0530
Message-ID: <20260505071327.125787-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505071327.125787-1-manikandan.m@microchip.com>
References: <20260505071327.125787-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add peripheral clock description for I3C.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v3:
- Fixed indentation issues
---
 drivers/clk/at91/sama7d65.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 7dee2b160ffb..ba8ff413fa2c 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -677,6 +677,7 @@ static struct {
 	{ .n = "uhphs_clk",	.p = PCK_PARENT_HW_MCK5, .id = 101, },
 	{ .n = "dsi_clk",	.p = PCK_PARENT_HW_MCK3, .id = 103, },
 	{ .n = "lvdsc_clk",	.p = PCK_PARENT_HW_MCK3, .id = 104, },
+	{ .n = "i3cc_clk",	.p = PCK_PARENT_HW_MCK8, .id = 105, },
 };
 
 /*
-- 
2.25.1

