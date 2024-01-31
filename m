Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1405A69D02
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696433; cv=none; b=ob4sNtQ1Ir8YQO8jZxJ2MraHF7Sp3AGSrpDra2lGZHfR5lRSXaqEhwartGTSKfxeMiaAwjcXgIORy7VibnMH5/knJaEiyuNsj5avV4K3+db0zkpkqUFXIg7h9pRkQQAbjPpD8Ogojwu/N2Skmo05Pd7be0UrMm2PVkvc3hybAag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696433; c=relaxed/simple;
	bh=oE5h6rY9x2tGBQVchOg35/O8P8LJYFf57f/PwB4KFbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=otexAt4tK77CbWmDzlHPGI0E6EQxf+vmjdOTwh66QZceHfCqdktXvo19q/W4jMAx57AVVJTtGDCWoDVYnyiTA6tW8Pa23X+sPE1fcK7/9q8J8KyjTjwCPNOntcIGyP3xUK7nUECUAntvR+avNwbgHVVfj7tRwFkH7LYwAF5GvYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Pg9cCo5w; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Pg9cCo5w"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso5497931a12.3
        for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 02:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696430; x=1707301230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWlqSYVWXt5E/so3s3DVsM24TfFqYzGuXtgHed/wp8s=;
        b=Pg9cCo5whVGCPrI1h6Ugn6aINl+R1r3uzw4Ux9+JVFxGjoSbqT56X+nByGCCxBSLi/
         9OUQqHjJEd/slrg+MnVv8e3IYPQn0n7FNQesxKZTwTJD/PHnpB3yZMeCekhJw8tcK54/
         7Rk+1nuZqllNj+uMHEJ9FErxTve/XVeNzmNgmDzl8TKm+SojnGxIJFhqzk3fePYv9Cun
         UWnCSUoyt6gNMTi+BLQY0dYN8JDorldB62XgGXi9UQeTJ7fzGtdyxI9ZisdkFyKzYG9/
         LRH31dnStthHvgj3HCV7Rtw2orw9pm6ld8xtyjyitjua0KQlxTNtubRBh5mhof3xkrGI
         GZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696430; x=1707301230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWlqSYVWXt5E/so3s3DVsM24TfFqYzGuXtgHed/wp8s=;
        b=kZNRZ9D0nrTUl4262jIb/DsY8/WV+6kdRLl5NPSw0dRDZpnxJWcK1bXtJUHNLkAJiL
         M2QhjBwqSAJymM8KvtJ10wB6x3Oj4npv69E46wVbeIpL7KmhKEJFjXuG+oNKUyK55twP
         R0UHSKPYeP1TJi6yyBmeFnwuDTlqY1eX3YoVA3mRNHj1BYV4puMllUbkkQbxGcSSL7ER
         qsFSDivATXrxL3cXK9u65kuI9a/immLnyi5OEeHStUDsP6DyVTOf0DyxBR3J0J+EDOCp
         C2pBMBm2kv1gG6+EtHh31gZ7bhsjkb6+wiJwkm4Y/93N+ahKb2eBQ2ogn6DkoO8FHJmI
         paEA==
X-Gm-Message-State: AOJu0YzLjagA09kBhGEICOud+a4KFhklLIRaHARwnS6RNlCNdAL6R7mw
	Ga2fKCo1y61vXoq9KPslsbxV5K3aJFLbUaVzZP84ARX/DUsUXXUzD3T2KOBTsTc=
X-Google-Smtp-Source: AGHT+IEkBPX0RB46Y+mzBkMyZp5TJ/mY/ycL6/YMwrbMHqhH1xrh8VAu+2o9p9g6kPEAGsMlAOeU9g==
X-Received: by 2002:a17:906:2511:b0:a36:8d18:4c23 with SMTP id i17-20020a170906251100b00a368d184c23mr345341ejb.11.1706696430161;
        Wed, 31 Jan 2024 02:20:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV1Ri1NVLh0NF5zlUaVk2LHboPFKt3vlX5nUZsfLUp8tfHumWoZsFReo2sckPYwFpztR0dhc/i/AzIS1SgQThJAAT8xhaV2eyz/8uaAX9i+MxzAMDTGiIxJx/ZBgukcQsrpQO7YFc2maiQNWUHrW9Z1gzDs6auk1cSHE4JgFEb3S0XHSQMC797OzoOuBVeMkkvOtaiGPJSDut0wixUE+I4Ge8VlS1+MQJqyka3A9hZCUaxbR3xlhlPXmJz9jy7MK9BsayDmaQ59Cjbx+95l0qmfpkilxhAc+CItk1amXZLDJagZ8LksjARqf05noT9rvFDsejY5UR+9BraUA1P+isPYrib6pE+o/hEi9V4inqT+ocI40qzJ2rqjbhoylihNjjMYpC4dRoVAiQAxrSscQYbeYIC8MvaQFU3sJ2QzCo96E8Tkqk9I+MDSlZ+tycATmiePuE/Imr6r6jjX9KrYpXS1gAJSg1syvFoSHnQjo8BOS1p0xLEdc+Kf5CMDfZF8daMrT90sgI8NxG9qt4FwqHo5rZQFiOvptavSv66oURwSOuOvbsSJhXLohaOas5XyJToTOR2UkHi99fugqwlOIKWtYajk527FODjYHf+RRs8TAmM=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:29 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 02/11] watchdog: rzg2l_wdt: Select PM
Date: Wed, 31 Jan 2024 12:20:08 +0200
Message-Id: <20240131102017.1841495-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt watchdog driver cannot work w/o CONFIG_PM=y (e.g. the
clocks are enabled though pm_runtime_* specific APIs). To avoid building
a driver that don't work select CONFIG_PM.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new

 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7d22051b15a2..495dcd1c5139 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -912,6 +912,7 @@ config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select WATCHDOG_CORE
+	select PM
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/G2L SoCs. These watchdogs can be used to reset a system.
-- 
2.39.2

