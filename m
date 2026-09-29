Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28B151C341
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679060; cv=none; b=kHPT3HJi+w9LawF/NBFN6wmLaNURlw2PCm4Kgp0D3hlvwpaoGosFbjdL4pjZPK4o1mFMLZ5XayrOyoL/6uzgHHkXeh3j4E1XCAjaF90/KRBOuWRjguH1eJ26gOXh3VCeAVQxWr+oPW0lQmBEtFq6lQsVyBhPwfWPmqv8UhzWJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679060; c=relaxed/simple;
	bh=yEBiC89OR3qXvDQDCPsvt3vnd76aREcYsfSAe/oYJqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2aedHkhuCGdipYV8UwjFkwNtnBRzAk2a/D1/BoCDXRl4rnPPiUP+xDVB8Ngqlpamy5svpBdbQ4DM/SFPzzeW2E9e/12y6NwEmNlvw5f5i9XgiJemnEFZPVX6ZFRh1vdZFWEe5HtFNnmTnEGbWHCTSXbT23jLwZrZCKuo4eQTNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmBgauqP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmBgauqP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so25404235e9.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679039; x=1791283839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9o2g8NAo8BLROcpDMeEoV80HGh5uA5p5XCke07A0uI=;
        b=MmBgauqPf5DoL3EuA5ugwMqKxCx9+fnMEX/8c11Dv8Q4OTrqhN7gn2Q5S0jVVn1KX1
         vYIJk8yTXv3WnHSprzu44vY4OgxL2d/aknXRa7wMXDGk3xCF022CYNGFW+C5OiIT3pmL
         VqHMLsUiwrcmkU6RvzYiyN3o36m6JLmDdbRKsfG3ewbZpve6+lTt22yhMbmVk1DIA0fw
         HJFs4UahZUbrzWkdZEyKW3jilheo13RfuD5dfC0eqIDTnLbLTU6eWRqFNf7LdeMMV9Cf
         qLxHzaL3aISxb8zhb8xDfESA90U0hQ/gYrXY9IaUXMN2xSWy9vpc9kj7Rill/IwTWxNZ
         hYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679039; x=1791283839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9o2g8NAo8BLROcpDMeEoV80HGh5uA5p5XCke07A0uI=;
        b=bT65GsRJ+mh7qnTOQLYAnZM3EjMYceMXG9uu4Q0oG4kxm9yhCuqwiHxl7RYjjf+FnI
         Qj7KtFL7136sHmNepIDaoontBaDobX29Erv4YuHYzILnDRtRq//0UMUP1UdzXYkSaf+m
         JXp5GE6FFd02vGUdQKra+KtCm15IOH40sg1b9xpcx+X4eyza+tDpV/a7c6ju5W/rE0tV
         Y+5uf32SxcBGfCaRlxPltSF69o/R3I06M7ixiFsWazW1lAjoSDDcEjTr2J/vXLrJ4/pJ
         fkkKe2OfvFADkZhsHaHhVhcWXADP4pC89+r2ceOSJ9Vl+45MFTb0QM76tX63bLcnwvl3
         0hCA==
X-Forwarded-Encrypted: i=1; AKwUvBxozqlNJyW0DUw9iNXnu6if90V109ssKV8VqU70slost7Q7a67uQYlgKh5u8TiIoUW1PWFm8GQuu40=@vger.kernel.org
X-Gm-Message-State: AFuF++m0oZ836SQOUWi7J9KFbBXIZ4ygH5KgZFg7O+2eWh6injU5sctQ
	o4KlEwPOYVomc9dXOeVANNP7NuMyrmovYYx4Lw2WkxwJnfKQ2b63eGEAqfjbNxoc
X-Gm-Gg: AYBFou2gDpXKJOK44jKHcn3JqIT+byboc7BSWnP3zM7sE4oFSu3ccpGA2oDbbYFfM9P
	qbHtYGDJKFis92wPVS0ymOM406UHLd3L87tjNl2u/51fPDmZqkr/zRAjfzKE0rXDW0RBSrWes5b
	clAq3BuSTpR04gELYfip6hWWCjlpirIgZLdtmOH4yf7GfxclWwdTRIGRbhOhTu7SsnYMFqKB4Vq
	SfME9LJ8+4qO9YfL6zaNn1npx/mM0k2aaFe/4F1wMW+NpVuiocEFipmSHMu1xjT2SeKtchQbNtZ
	wRG41G4SLIioTFPGiEHSueQi4FIejPaB+S4OMM0P8of4CH9NdjfmFscirG1uAhbYpzEyHabR1AW
	wVjLiQqImnEIQMThLRrVFtm4/iAiorWY8YojGse8nWiGdRGaVcYTiqu0uBnIAZHnBKDM2ZGDJf5
	8neV12C9TW5wcPy310gx8KEdqybVjmHyuVam/8amKFLmJWWGFgleVebzY+ij958AcmuIpFEZWD0
	lXOz7D8JfFluoSAh2pLcZoOnRRsJFQ+ad80wDcr+lN/hnnqtSw9IojFG33Vj2Yv0DHXYxDS9Uih
	XSYAM0ykfV2BzkhcA//9EFMp5Buk
X-Received: by 2002:a05:600c:6291:b0:49f:ffed:2cb with SMTP id 5b1f17b1804b1-49fffed033bmr120811245e9.6.1790679039014;
        Tue, 29 Sep 2026 03:50:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:38 -0700 (PDT)
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
Subject: [PATCH v7 4/8] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Tue, 29 Sep 2026 11:50:17 +0100
Message-ID: <20260929105021.542730-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 55ac11fcfcab..17c9e9a24ce2 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -40,8 +40,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

