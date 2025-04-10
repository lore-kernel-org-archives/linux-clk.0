Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F67276021
	for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294003; cv=none; b=ksbBY/+kb+doezWxWDHkDetdiA+DHCVIMOPjqzYiwB4AHMpcLSGfxKDoxq9m+6vR/cH5JjHn7eqb53GoiF9mEIVGaQqRPIoqLa3xFw4fUn0HokgBQosExRbtDIrTPFnTJzyWfq5NZcNd5USA0e+pAX0kkVMNyKBhI4dX9svwDa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294003; c=relaxed/simple;
	bh=hbP9+zw0Fcw1ISRojomtfQ9Ytr8BAnXkESaQRO8oXIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJ1N9F1++pbzAlPVz7FVD0KLRnadekWxnzvTdtcgqSCCAtHW1FapjlESuzu09OxTbMtgBg551ANAUAxA9+gbEmUxRgBdNwadjunRjb2LY1SzAogfall4t3xOyyhOrxPlsx9Gbs3oMxwY4r9jt5+A0ih01yAo0rm1GFFvC3Mci04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AI1DkBSq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AI1DkBSq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso510249f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744294000; x=1744898800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7A/GRyhOtG3bO+YzatmKCaSfgKvP9KmL+6FQr6d4sI=;
        b=AI1DkBSq9+1MUrWQGZv6I8wJuUzBEfPaJcNfo+O7hJLspydBw2lfo6JytSpPMKqI3T
         6gGmVZOpq62YUYZMKsfKSBz/B8SIvvBGjqdJE8YpmWjVQIET49+dPg8s122XV04U8Vm2
         o0aUk0uVBcktqxundlvGZynLuTn9GFgby807pvWghLypJ/l2JOOGhOLSXD77T3hzyV6C
         2FQ2wCjryTiWYqP2SSaeQmmWPQ+f4XLYXVgtN3hic0ElWfMA2fIfRjOolJydCZn/zABT
         Mjh/mNqTBrKtyv3G9490V0ERArZz7CEHBweL3dvPYFnigf4NOwAyjZ65vBKBN7cEeVT+
         NVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294000; x=1744898800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7A/GRyhOtG3bO+YzatmKCaSfgKvP9KmL+6FQr6d4sI=;
        b=rWPCyzQfL+/QNA86zmcPlWnx1Zf56yeL0EQXZIs6Muh5jcmvk0m0ArN0xekD2ehCUn
         RJHgOSVMxe0RsReQUrpBRbffH5kcKICLoVW6DQGK+DmISt3F3v1qV6+KsYBuQJycW7gm
         uCBhUeLEbvyMaABKFaNrsDKccUrReclzBdp0Cj2iV8zYti9D1sEc/Q1S9NFmQPOICY3T
         kxIw7Ea6IPG6S9zrfhalEb51cJBgmMOwPF+tWOK0AHIHRZx1+P7BC5RJcay7i8Lt6DC6
         3Fib8MtUfHju7YsFHsyoiixjHxTLELLWjLdgG7QpNUeVuBzQcNFIDeFUq1OgH/b+pdwr
         60pw==
X-Forwarded-Encrypted: i=1; AJvYcCWT+El6EEGHaUqDYhtruPJNPuRYcB4p+3mfNt7rtPxAANtpBSrreXR+oKngrujWH5HQ7sOwMRZZWe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJLeniOi9CG+3kenC3F2vGPOQdvHcABi7qQGCDqixsvtA2BupU
	v1iN36QqVd+NeS/rdDEM5YcThtDX/K0C/Sr7rZWjuef70HaPMd0itI6vxa6XnMU=
X-Gm-Gg: ASbGncvmCYCAfHwRKbUkk1bI72Rqe6vgp+EnmOcrXaFW7lRrWWNCGEUgHJZaT8pLHpl
	aYm01mjA7Dj3TIfCisoHY+bgZ3gOydp3VFTCeBCFYc613uiyNQ9RmC6tmVfJauiXJc5Qnb3B+k9
	J4lP5m0uduTQz3ZFtoMkVCdX1UKcUVJ/BFrg/Rk3w+QmzyE8j5PMbJ7gp/1GzBt7/B/co86PUgp
	UmPE3XVsNrof1dV9sGBy8k6BA5wTt7kB7OCPYLPZJIru3b8DPR4DyF3dybnrI+5HPIvhJD+BAMN
	ktsj0rF51cZmZL13NSADlcLnhetcDnVGqpOZLeQCeAs+xUeVHLxfhTeFi9ttoaHadbqR7w==
X-Google-Smtp-Source: AGHT+IHHzYrWkYVJB2jd3EaUVrf89hE8xWwgx3sxtfVkK50L5LRAbxgU0L/HY6E/Eihy7Wd6XXe4jg==
X-Received: by 2002:a5d:588b:0:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39d8f496e01mr2596448f8f.28.1744293999580;
        Thu, 10 Apr 2025 07:06:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4806913f8f.40.2025.04.10.07.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:06:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/7] clk: renesas: rzg2l-cpg: Skip lookup of clock when searching for a sibling
Date: Thu, 10 Apr 2025 17:06:22 +0300
Message-ID: <20250410140628.4124896-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Since the sibling data is filled after the priv->clks[] array entry is
populated, the first clock that is probed and has a sibling will
temporarily behave as its own sibling until its actual sibling is
populated. To avoid any issues, skip this clock when searching for a
sibling.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b91dfbfb01e3..2ae36d94fbfa 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1324,6 +1324,9 @@ static struct mstp_clock
 
 		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
 		clk = to_mod_clock(hw);
+		if (clk == clock)
+			continue;
+
 		if (clock->off == clk->off && clock->bit == clk->bit)
 			return clk;
 	}
-- 
2.43.0

