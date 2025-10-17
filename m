Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531DC3451DE
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700117; cv=none; b=tP65ILmR3E4PGtXvsAYxds3gwYRWQWcNQqXVktIFUwyj1i1EnTqBKTqR5KpBQNTJHfA8zX89r0ueSE7A9LpQ+GxAz0w38KkERatijV7sEka29KmXPpKmXJq2MqdQFA9hdqgbvbQKUXDHxn3I8cubqRX5eo7NXOQv3LfmC2smnho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700117; c=relaxed/simple;
	bh=GfD23YPZ5xlI6Cvd3J36u5HvRuzKaxr5uePf59R3rfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0G/TgXavI4SB+YADi+vhSIRT0Be8bVZVpnC9LytZZvILOTiv9J8rb0jqkQEilx+BbBfhudpDUfie0voyf51a9r9+wXu/0meo7OdFUvj+jBsF7Hl0UZiY8K7gOrTGbegI6FE0SIUY2IiiTn4PJEff6RV2DkOFEtjZODNRDJwR3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1QS9txA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1QS9txA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so372677066b.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 04:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700113; x=1761304913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szPuxr5/z40MS5Mlf+BY36YkQjXOaNb7HQ9L58rAhvk=;
        b=b1QS9txAOqHWz/L8n+5EFgUejs2xgLvYicWhCHCBcL78/XM0+qIcPXbmP/BvCnpLQZ
         X6kMDkPfX812O11iGjpr9W8i/sAf6tu/3+s0bQH3PtoblFYgutycTN/EEQ8S1SOeoiUl
         0GcvDePr4GZ2MfWBQyHXRLvjUhYTX1MCNPL9nyEFF1HxhTuQgqo3oxxEnHAeB6vaerh1
         FBpu682koFb2xPALKJHCbuiJy0Sao8TFKl6dBp6ZGwfXfS2uz7rV055EJ0hGQim/KFBC
         FCGReDWeOVKknH/ghTuOU4JGMhUoq92CD0NtsUl94DJNDz5abgf5FbLGCiZu/zYlb79R
         NLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700113; x=1761304913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szPuxr5/z40MS5Mlf+BY36YkQjXOaNb7HQ9L58rAhvk=;
        b=jEUi/+PE01A/B577oE5ESuHbqSqQgCVv3PEqIUueCRXuE2CmExhRuCsacqzHGCgCo5
         DbHCaFqbtr5yTseSAhIeyckO/W5SUw8XWE43PgzawaZwFjiPdlvWE70tm+HQq2pgp2KR
         xuqjZK2m6mDOcyDhqTFBNvOu66c3sb8GnYhg6IYlfurpiVvw58WdhQFifPb4gQMNvNrv
         yqCx5aHbz8y03aac940m2gtg6RQYR6UmWDWzZULZ+wFhooiwxuS/fIKElUr7aFzOGpIo
         zi/Q42NmnCSe2IQBuBZ9sdjfOVwy10G5ykgRwGONL2eM9rbHES48+TNxb51Byu61TYqy
         NUUA==
X-Gm-Message-State: AOJu0YzNBznEvCp8ZX80IFT32WTCFtq5SnuFQ6c1SIu4Bl0di6tuCJIU
	X055I50vtNnfmmXb5HXLCMj7e1674I/quzMepYNvUp8MawfEdeXO8Bvc
X-Gm-Gg: ASbGncvXei3l2cafhWig/0mXetBs1XONwq6dwqGiarHEclYMHo8ItcWbSfs0DkeWXe/
	ozRPyR6IWmvfiTh/UrW0kVFDhdBmBO6LfyFEUTkj7e10N6P4Vss5j/+9WoM5oqG7CYBPhC06933
	Ax9xgAXDg4n7tw5c9d7IFhV7orCOeKm0hASa/y834pDW5DMfax01+nkEJyA1Jcr/DV1zEQGylG0
	GirCesnYJCl8Dkxj6jTeVfvlY/Y6dem9OITO7w9OX2rBJVm4iKcgUe5R79jU2pKxGgOUsxRbD5Q
	Czk6Q/NekFg6n165fOg1j8RRU1qd11S1eXzzWqUP4Z3VePVH4k9GYISFxTjAqdJM02NCMiA6EsJ
	QE0QbZShM2dT5nAr79ecJKwyzEL/j0RNo7r96UK3JUgSlFII8otDJe03IubEPVhk06LBZ180NvK
	4qQqTUx7/c4BahJ5OQcHjCDMXcN9Q=
X-Google-Smtp-Source: AGHT+IFNwxALXcNX0FiT0aapuBu2Z9QWfQyDyDhYXyKBSinI4TH4m3Od7Om7Ykt8jQkZG5S9C0wOAQ==
X-Received: by 2002:a17:907:86a2:b0:b40:f7dd:f8ee with SMTP id a640c23a62f3a-b6473732c83mr382329766b.28.1760700113139;
        Fri, 17 Oct 2025 04:21:53 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:52 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 4/8] reset: imx8mp-audiomix: Drop unneeded macros
Date: Fri, 17 Oct 2025 04:20:21 -0700
Message-ID: <20251017112025.11997-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The macros defining the mask values for the EARC, EARC PHY resets,
and the DSP RUN_STALL signal can be dropped as they are not and will
not be used anywhere else except to set the value of the "mask" field
from "struct imx8mp_reset_map". In this particular case, based on the
name of the "mask" field, you can already deduce what these values are
for, which is why defining macros for them doesn't offer any new
information, nor does it help with the code readability.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index eceb37ff5dc5..e9643365a62c 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,11 +14,7 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
-
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
-#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
 
 struct imx8mp_reset_map {
 	unsigned int offset;
@@ -29,17 +25,17 @@ struct imx8mp_reset_map {
 static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.mask = BIT(0),
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+		.mask = BIT(1),
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
 		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
+		.mask = BIT(5),
 		.active_low = false,
 	},
 };
-- 
2.43.0

