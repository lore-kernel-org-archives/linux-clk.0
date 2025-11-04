Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA392ECD3F
	for <linux-clk@vger.kernel.org>; Tue,  4 Nov 2025 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257847; cv=none; b=cx412+taG2aZMwTrdNBl3LHLZldqfIn1ah08yeK53DqERVkCbyoibZzWQL4iwVs7h03wwjzTVqffAOiXgrNLxEHk0DvaSDQ/ozynHPLKhxRx50TxrZ6hX8S6HQdepkudvq34PX4TEXXO8i7wnnGgO7Hn4qRUJqBEZHXtuTgBYII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257847; c=relaxed/simple;
	bh=TgTd1HpIl/XZJoNIxl/sF6YycwPbOWbZcWt7SX51N6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGj66COdKOsz/kaE8gCXWb+Hgf4T2/xH+pidDfODhTf83fyBv/BI1iFItCM0Evu/VWbtkzmYvq9kD/1BecMOMNt8rF85hgVbuOb0oVVrj3Si5+YmVAARboxBKJu3hecILbFvJ1LohWkQVQlNmeH9i7jCFdN69VzxL82gyMPC0aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEREGphu; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEREGphu"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7260435287so1567366b.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Nov 2025 04:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257844; x=1762862644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MONqpZUeZWIIjN6d114EqSMuX3Td/c118reK/5knf7I=;
        b=SEREGphuW7G4f/PD7getzsGEd/9jYb3YmPdN/Ewequmz744g/e/votmfzVoG6ae3pX
         d0IVVhzQxwREjburiCjVaDIacufOhfE6ZuKRRkPNUAe9lpRqVUGS1uKgxzGJAFMp9Pl1
         FlKdhxVTuBAkeGXfgfyJHm2uyynPSjTVOIO4IHPS5Zorgi00BnMukY/h36VpbHzrvurI
         /aYhGoyARczJGZbXnTOv643J6oU23SKDA97SFQ60w1kgMZFBG1wa+IYMxP5T2MCVsFbE
         36FR45TcQk3orfzAEiOiRJW6ZmsmLExHaJlnV0ADSIuZiIZtz7F15/39NpRG5cbOn0JL
         63bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257844; x=1762862644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MONqpZUeZWIIjN6d114EqSMuX3Td/c118reK/5knf7I=;
        b=NBI5sKWvYfQHJbYQEQRQrJWRdq+Ia9yr1ozLqsTY3Rl9p5OJt6cQFueL1cAmHE0pt5
         bZIK7R/qLC9y672WeGwV/LQ3iLV6ELsRztR8N/nMMlk09MU31XrTd9XETaZHO+yxIMhK
         Oi271oH8B/WKcTSscgYqfQftX9J2UzYdN4cMG1JuqHpmIMk4RGSEl1Sos696ycI/L+kd
         h3Yqo41qkgaz97EXO8mHnAo3MPAe31sGSEA6PHp+gZcbwP/Au1hQX0DO/uMFSYqG/+r9
         YJ0mEMjFLLxGBNACOWd6LsGmeCrD8QQfNEABBcxTLpmSfpJqxDeZJk8YZikhzMHo/Y1b
         tAbg==
X-Gm-Message-State: AOJu0YyhtglWRxliQazxpT63K2SUtEfNdk/wXoqcVBuO+ViLdj6ypgty
	HPEGe+I2L1ndxkb2xM3+8gqkdi9dImwtlAB1AaOpyZY7eFRgx9/KCgi5
X-Gm-Gg: ASbGnctUaRfHmVUMfRV+E/fOMDuCqmrx074peUnqE+SIrjolYF0koV4SQhVzb0Kkkms
	QauE2lZwiIbdwECCVjvhlZc4NfNLCSvWxDokgxCmciG9qgWS+mZCmDZtpoURuBHozP1b8IUwmab
	TYVFHKKJF9t62PNRx4YBA4CkDPgNXUT8222hJna5B1M8WSUkelPFtCli/7mnzQIf6f92TI1g+vL
	bFWQXB+CD4cgEtTUaiOs8x58Lz00mQfDM+uNDGbTBqUtzrCXSbTq4JR6Du2FMVy+ycf/787BCqP
	95peq26lsPvyxCCNatpZTuZGi7V5ZZLqMHYpQ25Q8KuPjOX1G+yZBOYVcTk8uc8mAUldDlnNFV0
	JN7nEfLDTY+dKwQYC0NJSwHCzpLvKrjV8MW3Ol1sRPAPIQpx6p5ylKlujlFEEi8IdJbSuM3El4J
	RqvbMhcttGEniSUb7hNRCYjqbNdw==
X-Google-Smtp-Source: AGHT+IHRrE0o2sdiIAqRFi5TYM4KHbBFm9RA/54j9UR13Jtqc+5S0hJxSBlIU42MxJbJO58DHC9lVA==
X-Received: by 2002:a17:907:3da7:b0:b4b:e419:9af9 with SMTP id a640c23a62f3a-b707018cfa3mr1722945866b.23.1762257843561;
        Tue, 04 Nov 2025 04:04:03 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:03 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 4/8] reset: imx8mp-audiomix: Drop unneeded macros
Date: Tue,  4 Nov 2025 04:02:57 -0800
Message-ID: <20251104120301.913-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

