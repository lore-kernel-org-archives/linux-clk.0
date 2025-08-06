Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC11288CAF
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472112; cv=none; b=icPZwka80XxSrGSSX8Kso4NGc5HcASf/I6XFOE37J/gY7fwu6rg0E9AiC7h3IuNlkL76TB2LuKF8SYf40vfoIIldmz94HjMQuyfQIw/L6mAjFK2eyOsPEVjrlNwuyFZAQUSxoV8ExFI2vZPE51hGxyyzyhlySo6q/wziHlLsTDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472112; c=relaxed/simple;
	bh=/u/w7c5xtAEktNgOuWB+mNI2r/3eWtLo6I0rTb2nscI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNs4k7FBGOWkb6FbHQImLnk5VyxjR659QA9h8O78Zpy4cKGj2+sZSpZ848ck225QqeJOjNWlN9hDefCal2xmd/wqtWdylzA5JzvH/oIWLReEmJzBw2PuDSohjtp6g302mQKhpx07uu+m6l3H0tex0pPxi3wZBNPdOwM4QxMtXrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ibtItotk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ibtItotk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b7910123a0so6368926f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754472109; x=1755076909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRM6/LJlPcruvreq9KP4Mh7SIbmUYhjQOIHIt9y1GgE=;
        b=ibtItotkuH13VL38Nb9IcI6xL0um9eQ3p/qiDSpXaAGRyt9fzysyUDd/w0rj89t/gu
         tmxPFhbpKKYsfY2QD3efRQpPwSmr7JBngjyd5jtgo+Ywq6LYiqlmDMcmVlTzBCrdrL4S
         NOv9YbBnYZp3KGdRVXWMIjh2btPyfNnaKKG6HOpV1CutNkp2OtSk4PGs0M0hmeivT4eX
         JySIfBvSjyRtD70nFVsevNtCh/LXd0HBYpzvJwxEW3M0Aar2AKo8lfLCxJ3ZiPZSXInz
         L1yYwBvIjmQ9N4xXPsKW0gH+6qsM29kfHqNvrQY+H6UZ5ZlvXAj066W7+JT7xckHaYfD
         AhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472109; x=1755076909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRM6/LJlPcruvreq9KP4Mh7SIbmUYhjQOIHIt9y1GgE=;
        b=X/9tNj7mZscZpwVjm+FCxRz6Fpk7PcSTWiryOxwwcvOygPtJk45Tw8wa8sj5VFkz71
         o6JaCZzIDIAqVeGordsui91IR0dZnZoBEz+XdMQ3nkilki626XdD4JVENEUK0m6GJSyq
         DiVH0KMzBvYYAS7TKAl+kbB9jnS+ZbFtmS4iS4gEr3qFGzrZrTZ3sFneHoD0FEtIl8Iz
         YVubx6ADHSfqQvF3B1I0abS81FKzLxI3WkvLW5kJSTlQJ35nPBUA0qnIsSIsO5vETfAW
         tIyiJK5qDhr+hDzg3Qw20NXgIPO/UIkoB/REyKJ9FcwLlov4bON/ngYx4IMNSjBI1iNB
         C1/w==
X-Forwarded-Encrypted: i=1; AJvYcCUHWa6lG+R/8LaB6OsPX3A4sHK0asBGegnTNaAuYaYIhvyMtutDbk10f20IwE8EeE1dvI76kAGNBXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsAGKXdP9RPniAq16yeJTDUAkV0iOP1mxvCPd0y2TyMpNpaOho
	zt+ZkdrijDAP6+t2NlgAX7FLkDaVg4j6je15SvgnML5UMnKnGJFFe1+bGaVEmbd2sHhlmhACzCN
	Lp0cV
X-Gm-Gg: ASbGncvfyoEzBcad+bCS5EafPaBwdfzkm6fu11I7x5hclcQDogSbnK+Tlr5FBzQoapW
	1nU0OD9X9kCoS7Qh7G3TlFjxuZmWi0gpwFj6MzrsiCDvlErpo/WMIaaSEdL3dlwyuyxxxDxd/5e
	iQo1gJdMc0hMVLf05DOrPE1a2wq2hsxmhhyKe1eqgC/n57zjiy9+ya/Zl2KJh4p3HHHXd0WW776
	3OCFelpRsE/INb7lcNkfTZvs6CLUKX+2YKzP8NREhoN3Ghc6jIVB9BxpJMlxU6sTJI9c7ccQA8N
	clSH50m12zgmOUI/pyeO0tPHJGxK8RI7BA9G8axdneaMAwgBZyg1wcPGVCuZAA1mb2OEXvos88T
	Q2T1ekaBKojVNIVBCVB0KX4Tx4P4ANadSyTdBAzc25qYZzV861JVW
X-Google-Smtp-Source: AGHT+IHf+/q8mL5kXeXBfuPFH9tkdLBPPDRn8q+gOCdORMDuGNSYwdVs4ImpbncTvKYiAR9QqRiK8Q==
X-Received: by 2002:a05:6000:18a6:b0:3b7:b3f2:f8b3 with SMTP id ffacd0b85a97d-3b8f41ac8bcmr1769613f8f.38.1754472108861;
        Wed, 06 Aug 2025 02:21:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm30188445e9.6.2025.08.06.02.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:21:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/4] clk: renesas: r9a08g045: Add MSTOP for GPIO
Date: Wed,  6 Aug 2025 12:21:26 +0300
Message-ID: <20250806092129.621194-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The GPIO module also supports MSTOP. Add it in the description of the gpio
clock.

Fixes: c49695952746 ("clk: renesas: r9a08g045: Drop power domain instantiation")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/clk/renesas/r9a08g045-cpg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index ed0661997928..3b28edfabc34 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -284,7 +284,8 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 					MSTOP(BUS_MCPU2, BIT(5))),
 	DEF_MOD("scif5_clk_pck",	R9A08G045_SCIF5_CLK_PCK, R9A08G045_CLK_P0, 0x584, 5,
 					MSTOP(BUS_MCPU3, BIT(4))),
-	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0, 0),
+	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0,
+					MSTOP(BUS_PERI_CPU, BIT(6))),
 	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0,
 					MSTOP(BUS_MCPU2, BIT(14))),
 	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1,
-- 
2.43.0

