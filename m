Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C7B3115B5
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804554; cv=none; b=IPhxovjL0ZYY9nukQVE5tFE0gaiVPLXRCxvqdrjnenZV+MBVKd1JLtfSDqn2JQ59eToGLzfNyVfp9tVRUcKh8XgFlLwh6yxo4f5CHODK5IZgJmedwBlc44yfzSXEHeJu9BNev6tg9SweMaeL1aDePM/fWhsEeJHxAa96fUQyp8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804554; c=relaxed/simple;
	bh=lGHLYZSmETibXwSj2VD58en7KnXrQTVmuEiwDEOnrKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rP5nn+nON+mePw9ieUi3bBQlLPIFkxkpBHD3cCnUOQtTHPCFVs5yXKtt/4/+xuhDMwOjM8AKW16B43DuIahefZHPj6WkbzYsJM/OHfg4skLsPP1RhiNJZgAjZqhgN3x3b7jcwGvfoDbcGAFVOxcN+0vSDtGivK1f4VomBst1SKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iryi9dW/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iryi9dW/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48371119eacso109721985e9.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804551; x=1773409351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ny3tn36LFHeisfwSmSM3Ed1qDCiJ36YcJ+5UOs6qsD0=;
        b=iryi9dW/l+pZ5XgMNSzp7qBWiFhXUbE1xKupHtwMhj41hoDBCB+qVFUV37bFm/zeeh
         qQ+GAf7Gkxixr2Fay1yAy9WjJ+kow4fIuYXT2ZznD3HkAyPj/3DnF7yQKAe2G4FMDXxy
         ToZHAfv2EsHLRvBlYh7fQ9KzhBuYwpDx9X6qUctuCZGKqPhOW6GgJKrgsrssbmXVpVDf
         xWJbI7OqoPTklOaMrP4nS7pgaj76Fp0CK7Bxzy9fCIJtG5u3Xo66bxOCR6QDs6qQHCwZ
         palZIrShFHHuQRXpjSULMemeNRdYngZJ9dCm8/gCb4SHiUG36MaDlT2oZPqdSnJNAN8O
         QMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804551; x=1773409351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ny3tn36LFHeisfwSmSM3Ed1qDCiJ36YcJ+5UOs6qsD0=;
        b=jUhlnk6mP+yuSIJcCbjBOcKEZEXx6UvTuUECwbOfH+Bgt3QEjX54bY0KsbqKkU3V0l
         xjqA3GugRc2FGiyBbWvYY38y1dxAWOKC/D1+9CSBTzKiDDV+gMHqGGwdwpwW1IREGLmA
         hU4BGztVMzTLLMOalqNxlZmy3NeGrK6tQ0vbhDLXV7KiHSn/xQNVJ/J2KhOheN2DIai8
         pSQB6kyOndRyVk+XD+m9FG/ZFA3GJ3e74VYoU2gqsaUEGDEJI5nQNnw094d06Skjet2u
         QWRXrkzviUfsOdv8fcYleL4z9TxkwZzA46+hrWR1/hUcg6fyLHAEyCGSWiRD66ntBAPn
         0BXg==
X-Forwarded-Encrypted: i=1; AJvYcCW1kj87/+U/28dvVHhDoOqFHS8Q8nrf0W522heTvN+lUR6uKQN60PggrNiYUXAi48msXLjmhpDCStc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMjHT8OwTkDNRwEprnZ0YLXt+ZmwMnHp2wFrIRbZwBSLCXP7Ch
	/zOLwkO/TPjqCyV4Mwis1QRt5+o9OyUsaSKZrijw+n1bd8U41esY6xES
X-Gm-Gg: ATEYQzz15gpM1+CamEQaGP20/LgL2KAeGvPDzQQLiCa/G28/+XUabgSdadAQXQnVE8A
	GZLfSyMjayfkArWTWyIQA8Csq8uDZW+R7m7bmmFgVfy+bQXn8v8SdtlR6ybRxrBCZnNWe/pz1zj
	8dbEMHrYtk48vPU73ejxEvl37w2YmorfkV8TEO1EK4aiy30w3ub6AX6dYEl3Ul2SppSYiEkHbF1
	icfGJzHMw87LuiW07hu6jxfDxwf5kcl2LafOTNV3kLd99czcmd29kQW12kAuHrNGZMyWYehpfyI
	gvPtv1/AFZ5QIQRERFcmhGCw9vCPzJMWjSp6xARuqQ1a+C7rtx1Nw3at/yALH6WLzn9RcK93VbT
	lEx63RTlq0GJIEvTtyM9mj1/Z09UgVEfmcpuJGaxHyt53NwFV0Vnmoy9OcDBpKuxxEby3uQktdZ
	Z3uWSOxbt0L/Rf8r5qt/r++NSh+onPl+EvFkb9MksJCFG2Wo4=
X-Received: by 2002:a05:600c:470d:b0:47d:73a4:45a7 with SMTP id 5b1f17b1804b1-4852696487fmr35700115e9.24.1772804551319;
        Fri, 06 Mar 2026 05:42:31 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d0f3:534:36a3:523a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm4223790f8f.17.2026.03.06.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:42:30 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add critical resets support to RZ/G2L SoC family
Date: Fri,  6 Mar 2026 13:42:22 +0000
Message-ID: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Some reset lines must remain deasserted at all times after boot, as
asserting them would disable critical system functionality with no
owning driver to restore them. This mirrors the existing crit_mod_clks
mechanism which protects critical module clocks from being disabled.

On RZ/G2L family SoCs, DMA reset to be deasseted for routing some
peripheral interrupts to CPU.

After a suspend/resume cycle, critical module clocks may be left
disabled as the hardware state is not automatically restored. Unlike
regular clocks which are re-enabled by their respective drivers, critical
clocks (CLK_IS_CRITICAL) have no owning driver to restore them, so the
CPG driver must take responsibility for re-enabling them on resume.

Biju Das (3):
  clk: renesas: rzg2l-cpg: Add support for critical resets
  clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
  clk: renesas: rzg2l-cpg: Re-enable critical module clocks during
    resume

 drivers/clk/renesas/r9a07g043-cpg.c |  8 +++
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++
 drivers/clk/renesas/r9a08g045-cpg.c |  9 ++++
 drivers/clk/renesas/rzg2l-cpg.c     | 75 ++++++++++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  7 +++
 5 files changed, 111 insertions(+), 1 deletion(-)

-- 
2.43.0

