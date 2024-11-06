Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7571D7E42
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881170; cv=none; b=sEyzH6bR2wuWfuUnLGeOk4GCuaTWrTRFGNYtYhEfgmGPwzM6YJt3AbRxEyFE0+O3B+Bvyux+c3NTK9enf6l3ozAPToZkeAVSr5tOisAYMYQu0m4Z5iDGGZAhVk2s/4wAU+2Funu8MfOwW1Kwz0vhtsuSLQ+e9zQ4vHSSkw7i2s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881170; c=relaxed/simple;
	bh=8UOlDm3vrSjRTc4vbWGP2PkIhWAkTQRY2So1hnpltTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dEvfAXZU1jE4hWWEEu2kC8J94RvOC9nN1Oqe7kJTIrCFa3UVwTybJca3N6IKeB+9E/hAJKip9feW/HDqCEuaGrbaFC+Cneb8xCIbH3c3x3bkRdic4PFzcBmZWwtVWCW57S2YBUtcBQQiuHFasHS9bz9qqNjcR3uG3/i+eIA+L2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jmVh954j; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jmVh954j"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a99e3b3a411so105005866b.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881166; x=1731485966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+ke7NRgTssg/IEZFWgLNPKBw8NmV+vA1artHipjKW4=;
        b=jmVh954jD7M2GVDspV46DP3n+eTyxONuvgCAET/J8yAWK/PVZnydCyq1UMULQkDPqY
         IHmkCCbeCxpYf/oAHBw+Hu9VwXNJEYeJkR6NmlLAaAPcl7LUS5jmFtVYKoLWU4ZU38Ra
         b7gRO9gK+l0xAehVCBPMxPf5VJUxVsSwbHc4qhke8WeK6iCoJC0CJr+w+WFpn/lLqmaB
         9NexTqSK1uo9W7a3tbC5WALhSTdxGmUldVmc9GrwRkA8q+derdXQhn4KjpI0gw8f+sL5
         fYg95f0Gvgq4NV8UtUX68El4bLi4WVZC4c2bxCTwZr479g334dRBwtQaRCbLQUJbCmpO
         iFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881166; x=1731485966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+ke7NRgTssg/IEZFWgLNPKBw8NmV+vA1artHipjKW4=;
        b=wvJIhQvjK4e0AY/jLs5g/2k8wlhtHCAgOwfEuzBvk0XqS/zqzgENC6An1sEAxgqPKN
         SQBwdp8EtzUutQiinUFMR3yo0rF+huHPnL+quwVwznF9eTr7BP2Guc71BEtuHCQ5mSKq
         PjdOgxkPu/rGy1oC81O8wklmpG2ymcgdWQZpQzSzj4uVpKe4nIX9eTGJaQF9TwWhe+0P
         nb8OLUmSG3z3m5nl9Vv8G8G7aB+BR9d/qRouV79w5noddTkVmR3vzctC4BtI8gN2z7QU
         iB0xL8QmPSBfK8FBkubCpDMLABmJ+s+0OMRyWRLKaggFftLSOuwGGmxRIpqjZkOG8heX
         3Bew==
X-Forwarded-Encrypted: i=1; AJvYcCXk8aYDbrZbEBJpkjIMtILC08YPN4jXMmIinWrzR+bXkss7NtaESMZYhDwq6w0KAld2ogR12SIGazs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY1kVQancOLph5vG+Rw6+PuCCMAPYUnx6x5Eug98KoJV6xXdwh
	8cIKAtYY+OVPUzEoIiwFVJSCX1bv/1lMKusiQbweDoCYcIUBodg6v9l0AdbiVXM=
X-Google-Smtp-Source: AGHT+IGsSrynXgwp9ybYH96pAnSvTf/jo28kUEGLKKl8GOZpqqi1T6VVn/a9MUUUoZoaN649GiICbA==
X-Received: by 2002:a17:907:e29f:b0:a9a:616c:459e with SMTP id a640c23a62f3a-a9ec667289fmr159795066b.27.1730881166124;
        Wed, 06 Nov 2024 00:19:26 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:19:25 -0800 (PST)
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
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 05/31] pinctrl: renesas: rzg2l: Add audio clock pins
Date: Wed,  6 Nov 2024 10:18:00 +0200
Message-Id: <20241106081826.1211088-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
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

