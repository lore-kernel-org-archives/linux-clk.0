Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379FA1E882D
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063025; cv=none; b=n7DQGSu8DZ2UzvoWDGahwq/0jjtl/wnMxeRDBZEFsNFCyPHn3XHv35oazSLxKforNAVlKldfyKB1qAx3PSGT5j6rzeuEJer7jmxyZj7FoEu/pCs2WNHdLkXf/yU8wLPp3i3h5ldtPIizCnqtYarcmltc7uPUAIdlk8adqBue8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063025; c=relaxed/simple;
	bh=hrCK2Zxoh8/JjqVyDPNA3H1fDJQ1g4J50LV6ttVxEeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BK0Af3msmBxH4hBHpojkcB/YYtY5vJQif0Mh3zEWT9GlwJ57nx/eP+nZZQ5JCePsfClWUYybSrRAik4ZpOLVw6WdLtOGdxgY9IyWrHStouTcZcYWaaPGyxmgA9MY/ADCWZrCw0oWI/j37mEPUJtz8WFEIuL2uiCyPFw1MYlnLmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Of2V5iOP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Of2V5iOP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso255244866b.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063022; x=1731667822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJnwa8rEXc+YSCArORf3HuNYYv4Q3mj8WrGo4fAJplQ=;
        b=Of2V5iOPubC2ctWQI9tu1n17YiJ5OYg2t9IzB3hN+9WZKP2m5jhVxPU6ZWpwiblH1l
         ILB5NpUi5Q7a7UbnMeCv5fZeFLUfsFN+YTNUWqeOG5Azw88maJx++teA3dde35q4pmPn
         yVo2CXDwkCyJD83Wn3d2qEjMBtgVN63F2Tu/J6Ahs0VPUw3rrfL4mrb/O+jt3pXTSt6u
         YKFkoxu9lUu/2HbDc2vrysyvthvCPPVf3uAilAwndCf7IUW9r6MoBvNxih1o3+fsGkdY
         scmEwHFYaUsHT4nsLfmKezc73VIhRTZF4FeKe4v72V0xifcrnnoIkhvkpG2mSdG9phBf
         oXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063022; x=1731667822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJnwa8rEXc+YSCArORf3HuNYYv4Q3mj8WrGo4fAJplQ=;
        b=hCE/JPFPIhBvYqbiGFcjQ8F173ZbvrG5MDuDaWbDKxoyiEZ+WdlpcD68gFU7GKNOKz
         jYdrEgO6Iuylwi53LQm8ppJdqyTDA/ih7ydEs4LLB91Qa9uwZOEP1rxsBwKbQfFjpoaY
         JJLgxzexjhrt4UVaCinYjPPP6V5fBIRDz/vpIh/AJoskEWDsK+/iBw9ivoX/E7WfrlXb
         YItKcGYUrA1gMgCLz2spttLm/nyYDiYhXrjuIidXZp0NEmHnBdIPMw/DeSoKOGN9iCF1
         dN4qHUVDJqoFkJ23b0B/boc52cEsYq52d6FhpJRvwI1LxTgDYrXenCHsa5PLV30mVrLN
         DkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY9rego0QQG18wnNZSgrHrAbBtfv4cqzeA6XFeBXkvgdJGy/WKQfwY7ssL97kNIIThkUAERmwxMQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi0hwUS0a7HTOCibMdA39AJZSG/ygyr8ZMSsofA2N/IRJaKqVp
	rFITpOTWM0qlauqQNnU7onMizZj7NO3pCqIdEzh8aQlIpb9GtJw8YLWQx/6K2a0=
X-Google-Smtp-Source: AGHT+IGNV2dA76ASbDo550kV8XOA74/mKA8GWhaRSvJ7vuuCc3zBxqC9yt/lpj67Er6bgye0miE0Yw==
X-Received: by 2002:a17:907:7b88:b0:a9e:441c:f74d with SMTP id a640c23a62f3a-a9eefee456bmr157988066b.16.1731063021547;
        Fri, 08 Nov 2024 02:50:21 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:21 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 05/25] pinctrl: renesas: rzg2l: Add audio clock pins
Date: Fri,  8 Nov 2024 12:49:38 +0200
Message-Id: <20241108104958.2931943-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add audio clock pins. These are used by audio IPs as input pins to feed
them with audio clocks.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8ffb9430a134..1190ca4b1808 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2086,6 +2086,8 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 						      PIN_CFG_SOFT_PS)) },
 	{ "TDO", RZG2L_SINGLE_PIN_PACK(0x1, 1, (PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS)) },
 	{ "WDTOVF_PERROUT#", RZG2L_SINGLE_PIN_PACK(0x6, 0, PIN_CFG_IOLH_A | PIN_CFG_SOFT_PS) },
+	{ "AUDIO_CLK1", RZG2L_SINGLE_PIN_PACK(0x2, 0, PIN_CFG_IEN) },
+	{ "AUDIO_CLK2", RZG2L_SINGLE_PIN_PACK(0x2, 1, PIN_CFG_IEN) },
 	{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x10, 0, (PIN_CFG_IOLH_B | PIN_CFG_IO_VMC_SD0)) },
 	{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x10, 1, (PIN_CFG_IOLH_B | PIN_CFG_IEN |
 						     PIN_CFG_IO_VMC_SD0)) },
-- 
2.39.2

