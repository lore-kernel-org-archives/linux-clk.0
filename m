Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F0E51D521
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679046; cv=none; b=HXmnAtzu84Hi9M+r8QvhON1d5DTxEnPwj7u2eppkOzXKZyrgvxbQqI/JdALhuQmVR+GG2qjQXE19lmyrZp27wB4bKLbF3LuCwE7s6lMyrb5wID0Ix0H7Y/9ztqlfLjP8XpYMbvlfb80OEY6OiBHC4nP0gLIWWV9B32oWPnjNAhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679046; c=relaxed/simple;
	bh=OVUnuKw1VfCIL/x+Su3R5aFMSSrygI/xzkVcJpV45Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FV9B4eELDbs8uL6O5u9uFAblb5l9bUkdjUR37sc/KSqX4PAu7qOTh+4sR088e1hxJZAymW1iVEGVDQIxFYT+PcSMxrx8sfryPyile/Pq1YjySixjU+0u3DThT/qpqcVsMVJmaSRU2XiNV3D3t0XzLSRhHFEudanhTMIQcCTehy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQDlseh/; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQDlseh/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so2207818f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679038; x=1791283838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs/A5b9nR+JVsXJC9eeh3ISdiCZQozid18OwQ5Bg02U=;
        b=KQDlseh/uVbz8y5rI7OG4y7TbD0mCqR8rBXZ1KfsBM9HOEmdN8ZZHrZG6WAVV9CdBS
         dwYcWr5Ds7zUHpQ9J9+ySkM3r8T+FVB9qYgNW0VVS/s7DqfW8eU3rxX1KPOibOU3B2F8
         EYHgOrF8d+s1ShKoR/jTIQaJ4ysaBSlJ9caFMfHoALHz7Lb5oo8tUxaG2MU/yn0JxCD1
         xjv8xjE+KVHCzPMh5+heE3u2WiiR+ibKMXZNd9LTG0C195JizkoU54545fhwLTFLu24D
         O96DdzonON2mYEkpXdj5UMSlj1CagaE5ZJgslGJ8x29gfhGNx5i93Bv/PQo1CMfuz76r
         IJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679038; x=1791283838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs/A5b9nR+JVsXJC9eeh3ISdiCZQozid18OwQ5Bg02U=;
        b=tjWtAxt7zaEYpdNDhr9Pg6cufYLdtuNrJeAdJAmXZqJqFyg5DiAB1DV1/MXn5vJMH1
         eYCnVQcfICyC7jkdV30hOh4n83W5FuISLJIxTlts9rO//GQLeGzK9x6eslhvlvekqdYC
         UWUKWZzAKb8CwI4MPG3+asIA22whQRoOYVqGffHDJnkvHL5LBOyGjLcX8idoWweHc+3L
         eq7Z5EppUYK9o64OT8ZKp1mMeekFEBa/0VS6POkeSNwhtdxAbMksyaUJuLYBoCSVFFgU
         23+qcd61LvmlhOoW/YnnxQeyKIJjD+2hwVJ9QR3BWCuwpD2HIOhxIEdCIRIWH9vKthbH
         eWoA==
X-Forwarded-Encrypted: i=1; AKwUvBzWO4D2UygfclF4LxumgUm1U2Y5Wql297PCnX2bncxbIGLIbD8v5XKV/2G5YNcDNAHaUQgNyO7qHRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLedKziXaahhGIh7f1yf5tqJvkOb9J7YTkVgG1bjjaj0dT6fWLb
	lIo9NHRcLBa6i+Yu6EZaFhpKdNI9rwc2Zbzx0LjiRQtaUneMffmYmCRN
X-Gm-Gg: AYBFou3Jv1jEU8szAAeg1ImaHa/H6VWgBJbVYs3Tfl2AVaZuf1LRSLRIYi9MhYlAMPt
	OCH6vkzHyHmEWzOIh8onFsFkeZ2dPcV+PTyaePAuLUMtUMMf4RFP2jXnTYlw2l2L/RYUiuZjPjk
	EzrukMMkCYqQatbRBX3FX5BAACNxj0XDgY5/zpDTp3ikZ8gm0zMvcHbEXenPpH8jhgbx5mU22zY
	WigQVMlizl0qgc1hftYDnYI+TPCs72V74drLlLnN580mYOz9syUkcgiAgg1igbu8DgfiHASqhrv
	DtCvjmLLqIkeN3pgSXNdTP/6HPFo7S+7wLsEx2u75bVxBIZqVBXifJYotWjeDZniC57dJCo/XmI
	myEuXEWsKTrwxyoR7h7ws2L5ReQW4YopPBY0pSCNcbve4gCM0Al4eSrPV2BLZB2gJ1kl0+qNsLr
	PxSZRLdSbbU9N1Q1unb05JHnwjhZ0n7Tf0iCqrRydrRZX5VWA98KlMcioNJ6vu0mR9eV1PJ0c9M
	rfWBmbovmOOMWMteUoGJ9nWtzAbLzw7TYj3jESKYyXNK9F01ywoxH1OU2+qIPIz99ygbfcZKlNZ
	V6u31RWkLU8KYuux1A==
X-Received: by 2002:a05:6000:402a:b0:488:89ed:4430 with SMTP id ffacd0b85a97d-48889ed459dmr17158130f8f.33.1790679037535;
        Tue, 29 Sep 2026 03:50:37 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:36 -0700 (PDT)
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
Subject: [PATCH v7 2/8] watchdog: rzv2h: Use pm_runtime_put_sync()
Date: Tue, 29 Sep 2026 11:50:15 +0100
Message-ID: <20260929105021.542730-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- No change

v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.

v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index a8db85e85c73..f247e42d54f5 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -175,7 +175,7 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (priv->of_data->wdtdcr)
 		rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(wdev->parent);
+	pm_runtime_put_sync(wdev->parent);
 
 	return 0;
 }
@@ -269,7 +269,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 }
-- 
2.55.0

