Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB9851DAE0
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679053; cv=none; b=jGCHCC5uqnfhJhfGBEN8WBnGzrky05ah8/53AiQ2yzpfbkC4Wn7nHXlS18xgrhjSZ1ogvFF4+9VLfAZhCqRo3cPGqk3Q4VH6Z/nAIVZBm9e7Y5LQfGxPP7zybfuWE6N69bbRpH1oA+MfE0xhx9ACHxdJm60F5Wlpnnqpe83kbQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679053; c=relaxed/simple;
	bh=Nlv1m2l7ghTkT3cO5yFi20nfIAUpd2j8NLnXbA6e+rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4vYEhiFaKN40zBYFixSFobenZKc/CkjSw13t/szXnCZQFgRIVXAwFUcSTSW4xK+8Az61EpKT8wGsmdhFaPgXhunAin2mCsZ96WCz9pMD4nhomttWm2qVhEuH86E+QjPMIqzsHHHSAd6Odg7U7pC8XznvZKDkO1766hwgt0Gb4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgtErF8d; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgtErF8d"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so3041355f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 03:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679040; x=1791283840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5tHtfYr9TOddaGe2pXDMEwIuJ0LgMwAhApw2cB2IqU=;
        b=NgtErF8dUX2SZCDiJiA/8syDRYJR4n/Kazm2CT+81R3QoJzDZwJylIodtle9Lv5RyL
         XEH9E2btWxkb4PnG9azveAWhfNMgiRhoredtO2GXY0fs0qFvT+ASdAim63AKLPzdz+UX
         zgbX/rAmi5iv4db3yQI11XDfYGFm6joBjpkOJyaTCs435mjuwDJYOfmsHMBNqiisix17
         k7TlvZnxyXjxnveiirGeOwXSREMNk2YrH3RFcugZBv/dNP/mR4BP+ICVuTNtjkVVtL7X
         4buwxQaDyyBsSSFmD8QDeKtgq516jYSwHeGBY1cTq7O8P/tI52VGD2gLwzCXNSdGOsfT
         6TyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679040; x=1791283840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N5tHtfYr9TOddaGe2pXDMEwIuJ0LgMwAhApw2cB2IqU=;
        b=Yt09Rb7WBKzTCI11x5qD93rT4y4hZZhFDZeYc8a2z4fecQ5M/t/9hgtt6FWImqKC3A
         PUUkORH2s4mU3uHBS4ErxplLEgH0Mh5hWUcGNBGnDtM+WJ+hPeb2pkvsgyX8RqGQq7hF
         +5rrLiuEsBiMF1wzq/p4hmpngajhlxpeuIa3QcicbqJH4CEXwqlt/2e1I9bFrueI0/Pq
         9WfRZMRK2rrjRqZK6BJMWkYYSHcxEXyXHf5RpmYn/qpA2jBKx3DNyEJZxJ98CBosIO7p
         K3JMqI7u1znZDKYen7QKljH7tl5EP+pORw3q9QtYgIK8rpkvWwSt/VHD5sEJ8JZnBskT
         YftA==
X-Forwarded-Encrypted: i=1; AKwUvBzGm0+ET4p3EB+Dw4EPWF3hl5VAGmgPos6uR0tzgxOPoVhxEli+PA8/tHassyElVDWF4/2JwpyKtug=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyIUYC+OUQJ+IQBNwOIfjOtaTt/oCqIPHtdWQlvhy7+YmpwY1z
	NqJfIr55inxz76xK0xMdqjsXtTkWUVEaIAMRgMgb2oaPiawK+X1U43SK
X-Gm-Gg: AYBFou0haefMQTOGHUz4wUFEYmd7un5CF3IRLxnjlPISUVYCE2RnwLOeGf1KPf19h5/
	8tOzN6ihrrcHYxaTMv0WtcatqqIrctaQio1hX2u6LCTzypt6v/ktSb+Va/p3f5+OAAc3zv9riB5
	katMSyGSCZfzqMSQ92RfS+YtCUtd7OMgf4/OrY61WBnfXkT7XOgkdFbj28dMxybUwGpXR5NSjg6
	o3GQnSZ9LrszuAyMe3L6YQBpX/ht3Vl/ksh8xdlsqTektKzuYiGukYr12O03vz6vco/1QBOE4ZC
	+23nvu615mnLlBb1ZQXtlvlqTIX5uSzKXg4kVTKJ5VU2YtUbUG4h30V4tg777kQFGv2w8nkW/9Q
	ZK/VMu1fC0VZhJJDznTa7yRB3zw/c6UoJCaGgsvOb7ArkbrBOzhirIeEovZbDguShAV5sbC2lF2
	wnJAtKxfE7NoywkXOlpuOneH8ddZUq0AKTqrzr43lgOkpCbsQ09QdIlMCLb1FS1gW1WPijAXq8C
	sjpl5RhjPnl2/KlUN+j6TcAhHWFYxKascmmEQmqbDk5e89FkoXax7fKKeKd3iIwO18fouHkl4FJ
	XytC2y+I6PuyGNwXGQ==
X-Received: by 2002:a05:6000:230e:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-4887175f986mr28573245f8f.36.1790679039746;
        Tue, 29 Sep 2026 03:50:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 5/8] watchdog: rzv2h: Drop runtime PM handling from WDTDCR init
Date: Tue, 29 Sep 2026 11:50:18 +0100
Message-ID: <20260929105021.542730-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTDCR is located in the CPG region, outside the watchdog module, and is
accessible regardless of the watchdog's clocks and reset state.

Drop the unnecessary runtime PM handling from WDTDCR initialization and
access the register directly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 17c9e9a24ce2..40157e969f58 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -242,20 +242,12 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
-	int ret;
-
 	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(priv->wdtdcr))
 		return PTR_ERR(priv->wdtdcr);
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	return 0;
 }
 
-- 
2.55.0

