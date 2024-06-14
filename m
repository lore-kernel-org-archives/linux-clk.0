Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BBB18756B
	for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349619; cv=none; b=fLg223unR4NL5uLfOOdRPJy/2pElWG/fBQvqyRDRwqwt2DN9q+mRoa15R3CC0qYUQRTjrq/SniTyLEaIGUATyFX+YuI9IRhZBt8pFO7O04LzV0mqO6aURBXOqQ4ol3B4gSTrmP0L/27thpuxfyyR2ZzHsB9e1PKUM3B0j7+n5b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349619; c=relaxed/simple;
	bh=IpLUG766k09WvJhc+aQ2V6g2kms7np+GuxaR8CPa+T4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fWVI1/kRbui3oGszVSR9BO7r6VFdwpXQ8qdR9KRtcUn6veHn6R/twlUXi1vk9ZD3J91wPn7PCibC6GPSu3Y4jI2rDfEXeihh/VBRiL1cJU5XxCQKKc21hH9KcvptmUgTE75CRnxXB34oG6hpwN1y+oM6ALq6Ljfhv8pPBQmYmv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ha4MDP2v; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ha4MDP2v"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c32d934c2so2021898e87.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 00:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349616; x=1718954416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLVszOBXKdCsK5qaPuAoiXu9R/5md9OnkOvi6MZ6Vqw=;
        b=Ha4MDP2vI4Mq+10X40LO7bC8rY/fmhrlqss89nOVRzxWXVx2quhGE7vAY5nb+gm67U
         PS1h5jSaVbD0/I0d7LCEU4S/Xubj71OmH0utFEdOmnPYBqfDOQthsCyrPFYLxY/nXI5r
         PpBf2uIhAEQWCkGJH2oVNYnjj0kvQWm6j22OQ0TcuQUgMvQdoOQDWv6enQTNDcYC5cKF
         HOpT0qp27rz8cuhUQRRvGqyMgvkiaL4k7No0atObYAeSvTaMSRYspq5tjmY4nag0xavL
         97TTUAeO929Gsl+Y4ZmLm0kRDTGsj71fuD2m/zYjQeQ8ytSAp+ODSz16h0fz5GPrutZZ
         uNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349616; x=1718954416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLVszOBXKdCsK5qaPuAoiXu9R/5md9OnkOvi6MZ6Vqw=;
        b=Swn7fj9xlk5NMKW3fd6H/qrkg7409h/3I2NDLG/r1ruHM6CJVtl49GV2tYY2MIFvD2
         SQigKVC0ScusuhrRQbNKVubZYT/89QzYdbOlgtJflhH1g43DlivWYDvWCs43Ocxf8cIl
         dSpdGoKsQXssuWdfKRF6xeaP1tDOlq5UTCzjJGlhSjGAwdcPZQTIDfbpRqKwwouDbekX
         k7C+CCYXZ17envOxGCDKi/oVZ4qSnrcuVbJDVVix9dHbsfil8oCFPkTlP6nxNDaUFMjC
         3diA6uURA5R281Kld0tvkzV1/OZR/y2nmDEgdG9eWViQfK9G+QoCRd422vcqG+UCc97i
         BUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZmtneDqqSZCss6LGmYTeqWXBgEMoRUdAp4Kd4QYeQKT2gbEQsf6DeGI7flsQ7NwVSv5VajQrsRubxE6DiR/L4oeCUzYz/QJJB
X-Gm-Message-State: AOJu0Yw1OEQUYv5PmXg0NkgTpkO3wyGc29EmcZISudEdHX0yiUYEdRiX
	zhgsGLtibrTgZMnGVYaQI36uJYi4ox/qwhArN+QA6v1OQ3lyfn+jLprrBukU19rkPIz8G3nUDzs
	6
X-Google-Smtp-Source: AGHT+IElxpc841rHD2Xiu2oaf6mrTuypBvT7Rrfq0KAuW6+UruOfjHi/qGNE1rhY2ZoG24NezULOsQ==
X-Received: by 2002:ac2:4181:0:b0:516:d219:3779 with SMTP id 2adb3069b0e04-52ca6e99397mr1027545e87.58.1718349616181;
        Fri, 14 Jun 2024 00:20:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:20:15 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 12/12] arm64: defconfig: Enable Renesas RTCA-3 flag
Date: Fri, 14 Jun 2024 10:19:32 +0300
Message-Id: <20240614071932.1014067-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable Renesas RTCA-3 flag for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fcb0c7ee8769..86e74da7a9c9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1202,6 +1202,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.39.2

