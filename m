Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023B83559D9
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746173; cv=none; b=Vqdqiv700VHfmHnO3uGrda7NlAIlunXI17f879agY0UiCrBhdt/RRwWHmOWVfc2c3oWiwXVrbcNYQtTsn4fkKG7YQC99+GJyd/KDC23Hjf6FK5Edj0sFFBtZstvCJtXAUIiK+0ZoVjMywXPQKrqEJPn1Sr4+NXpnnEzyGRre0tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746173; c=relaxed/simple;
	bh=v5ahFBmmoGFzUch7/2SvprVd1+ErqpD5A4vWmS2SEcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmQwql3BkTt8JMBI6Xl/VnMoApIGJ5lFmB5BqeCwaaYQWPqJlM0fNCZMwXH7K1Vg6z6gH0rX4zhvjZS3wWav/y5toKXZVY+INaYsKaihqkpJXL2ze2y90NL6Lh4qUoXNSSC195cxX7oG8wA1q2ArL1AGugmpuZpD4p/R2hsiE7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXGyrsgQ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXGyrsgQ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b64cdbb949cso1650169666b.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746170; x=1762350970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWLsbyIMgrO4Anjvx4doEaIEZAGpDh1hvTWQGxqxKac=;
        b=QXGyrsgQIw495cgh7znPWycJd8DmXUIGvFt1GnIvoLG+PYx0aYMza4WBTHbckJrRr1
         PPpDX+TSnrahMBwbIhadjDx8NcoittoHtXBwEVUsQka3x3pY2AbwJCM2EPeovCsQqOoX
         k4+tiUmIOTbr4uMNt0CwWR9zhlSogITKvIJOLhm+FDY/vFbJ/Wdz6v/5brTjQN1JbYFi
         rPgouNUptK8lpWdKdR01xRHquSomeLJvNZcnOw1JQnv8amRYkDiuzDu2Xqa+LU7lUXxW
         /uOYDWOKCqPtDq+ubZX4e5eehfylRJQSb7IDIlKOYNX1BZTiHDZjv/3i14SXgEMyYD1N
         B6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746170; x=1762350970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWLsbyIMgrO4Anjvx4doEaIEZAGpDh1hvTWQGxqxKac=;
        b=d2DqHXW8bZMvnwdwAVJYcEeMe/fIrWPOwtQF6MWcrh3MLy537/puNJR2MWlCLf8nbB
         unmpOpzigfbQFl1gtr4EPqU/SiL2kn7Q/JTf2CLSKLDBVFW1BC7nRhDfUGWOAK3Zkj7u
         wmg76SN9z9FSKSRB9JsoFtRi93QwEVJi2981lGtUgrxZcj7G4O4ZqfE1+GXu3OXtp894
         5GjrwyEvqkb6Th0FoeE+5LEKFybmZWBU2+Vu2vWvPOufFEdSiGFh4kVC+hKOrCiz7w72
         IFOlA+ca8o/8Xk5wiUz/n8ImjU88spfjqE37aa1x3puqkO2yMq0IG7+i7PlMIoF0aVnm
         sWlA==
X-Gm-Message-State: AOJu0YyVqXjZrqUYw+6iLVclu6IvOwkYrnXOuWcxcp4tVNi/W99bQvEN
	OOp4BYoWXJdRjr3JeiqnDy95Taw3smoebKdbvaBkqE2LzrdvMDmdPO0a
X-Gm-Gg: ASbGncv2xakTOANACyXMN3YTBNQaQsaCsobwEbDBWY20Hn0WG85Z42h5X/ZtXKRqrpc
	q7bw1YGu3gyshFq4Yj0dXTlMyxJKGTWWYSWFX+VtEQfzCqfZbINU/q/oifXUjd5xHO1Cgbphh22
	39qJfADuOAoY8oTluHbdGXf6VHtemdlepFm1tw7OOvI+xyWxKX+U/nXEFRe5BJnbqqOES//MeN8
	nkt6xn7fuvzfpaWKxtHgolCWLHcEkBGkn/IsRkytQKVuV5R/0gzUzub1MZfBT7ETYHLWeMQV8WH
	F/zGt0Fe82eFA2QVBpC8ZZdD/HM3TsbCh7Mj2gSHiq2Bo4uJ9MYR/SCnHwAgQG/heZUoTvjGp+Y
	WN4cxhpE/9gPETyaxBR9iBNLduuHSk/IYoWQtePINVq7MP5OmiBtClka7vzyd4RR3/m8MzkncUf
	5QRuHQNtQ4VHfbzhmSryom2vJH4Q==
X-Google-Smtp-Source: AGHT+IHsIhczBnvh9jDdmQP7dI7sF9RIy0mdsWyOBSP3lJT3RdO+FroC0QNH4bBEw0VRWYxAQ/wuNg==
X-Received: by 2002:a17:907:1c93:b0:b55:e023:5e79 with SMTP id a640c23a62f3a-b703d55cd84mr342463066b.51.1761746170153;
        Wed, 29 Oct 2025 06:56:10 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:09 -0700 (PDT)
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
Subject: [PATCH v3 4/8] reset: imx8mp-audiomix: Drop unneeded macros
Date: Wed, 29 Oct 2025 06:52:25 -0700
Message-ID: <20251029135229.890-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
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

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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

