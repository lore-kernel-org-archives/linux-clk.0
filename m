Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0845D1C2302
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906284; cv=none; b=BiFiBRA8olBg1j3wrN/EVe5Ma5+1eVwAer12bZ34vLRCKgoxNNE3AkJMMPxB8EsFLZfxD+nV2A0JvjqcPrqQdmrhAfWjxfmjmYpwmEHtnoN1pvWjAB30tzbKt3lMxhDwRPXqGmtdHMjvSo6cK/iVVH/trgNxUn0Rd+UijSzsVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906284; c=relaxed/simple;
	bh=57mSqvK5F8icDZvtosz8MW5pSg98mK2P/IkbkOYFjBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bb9iFGhzjJ/QtTwCJ2XyU86nqALJQVubD5z4yJE5j7Gh/ryhDvOYHoyFOlj9JSSbckPsTjxshcuCPW7UOFWDHO7DpwMoOUkBoeLZW+SXmFpN1IfJt1LD2fAfcFdmA5F+V0pHh3hB0TdEXe6FCEg1NpOQhCkhbbZlKTX2qwUTB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=Z1WAPFAm; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="Z1WAPFAm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57d05e0017aso1482339a12.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906280; x=1719511080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLJSsUsQJimHeyehvy4obxzFbfnPiiocs4Of944Xm3I=;
        b=Z1WAPFAmggyZXgLQQ8xHRVLJyIdVqTm6EFiZQkqU98DYk6IGKMtR0IbCNv8eef7YzJ
         4U5udbizQMs46zEqIFLLcbKD6EtEnSEv7giK2XYYh7iwjvYnoT/O3BVQt6wbbJy8D2jR
         WvPVWf5OPR+9R73AdLBwFo6uXDNiyz4Q0GVRQbP4JgqR6vr1DSMg7WEOq3R+k69zaT5i
         VDWjNunvXVyqv5ZGr2lZ8ZG4qGUrUJEnTdNpG1agdy5Rp1xak0eQNgAdsOXgyqale1hO
         FHt1JdLhWZ4fm+JxXSREDbBVDzEf+viVWyUTEj8FpRgGHT6Fa0Ul950C885uZOllMtUi
         WA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906280; x=1719511080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLJSsUsQJimHeyehvy4obxzFbfnPiiocs4Of944Xm3I=;
        b=troO5ODzIGkeHpBuHzxXD5TAJBIRz0irUS9TYCOcKH1nsDB1rnAIQjrCqsgBugmg9W
         uUgjfIDnQH+3JYR2J+z+MnBGcFmA7QGMFB5zBdpAEBlkn8cX3Vpwbny+HgMw+02hBoKN
         1uCNqUgSeev6hCQIbxQrx/A3vUFzExodbokSLQvA/Rf1ZcCUq2rLGMFCYp5heDbhJMyr
         zbVWLfSfLxehIyMWGccnJieJrWTQRQdvMUQjVEhPguVsds0PxaUhfMwa75ZjQjgm6dov
         9cpm/rEXIE7XC0EkQ3JPHIXLaMa92vMuxcSl1luyiZs1Td1IWKfDYn0gbMQXOWs8r5xL
         nTSw==
X-Forwarded-Encrypted: i=1; AJvYcCXXyZ6vlpIo1Vhgf+4P4U1+I1lQ8HhhWdIKcNGxcNE3St3809GG+Suqzp/BsUFU0I833doPSwOkb+BpINow4DhX6+CHJFYpG+Ly
X-Gm-Message-State: AOJu0YwYJw3fpGVH1GmWSbYDIaHXiWHZsc78Q0dCQzIvYybeprldNlAF
	fXzV449+ayjk/1ktCIh0Dg6ZAskkrMHM/SQevzewguZSZ2aUFaXfmysX4TQIBkA=
X-Google-Smtp-Source: AGHT+IGXtwYdokrlfBxhK8FxTp2sWYE+r/rA8OXrz8ajsAvjdcVPMUue0BkFzpXPCbEPXWGLdile5Q==
X-Received: by 2002:a17:907:8025:b0:a6f:147f:7d06 with SMTP id a640c23a62f3a-a6fab7de093mr273780966b.77.1718906280266;
        Thu, 20 Jun 2024 10:58:00 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:59 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 01/10] dt-bindings: dma: pl08x: Add dma-cells description
Date: Thu, 20 Jun 2024 19:56:32 +0200
Message-Id: <20240620175657.358273-2-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recover dma-cells description from the legacy DT binding.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 Documentation/devicetree/bindings/dma/arm-pl08x.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm-pl08x.yaml b/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
index ab25ae63d2c3..191215d36c85 100644
--- a/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
+++ b/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
@@ -52,6 +52,13 @@ properties:
   clock-names:
     maxItems: 1
 
+  "#dma-cells":
+    const: 2
+    description: |
+      First cell should contain the DMA request,
+      second cell should contain either 1 or 2 depending on
+      which AHB master that is used.
+
   lli-bus-interface-ahb1:
     type: boolean
     description: if AHB master 1 is eligible for fetching LLIs
-- 
2.25.1

