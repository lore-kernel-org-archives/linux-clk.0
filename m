Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FBD198A0E
	for <linux-clk@vger.kernel.org>; Fri,  1 Nov 2024 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455070; cv=none; b=TI9OGgIgCczuftuNJkh8Z8r+wpX65S4FTb+wyvn1IV4+8KKrcBrhv2J1YnErkT9yl4GqxtYe9NL1w2cOIfM3rHUFoxNk4yVLH8iS4G/N2NA0LUoF/iYQJIB6jF2Uehf1+P5QrIyJyg+EqjqrqdOm1zjSHPXBmmfqPQ4ucgEkMsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455070; c=relaxed/simple;
	bh=TpRf+IPzzflEYM2PIdEujWQYh9I90S6kiE0QI6bogDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NKLaiPbym/FR+Tv1LXLuXhCEbJOzxq9uQnNL61zG0LAX3VH7g6XgDCwTGljV4VlM1/XBW22wJ5NNAD0JM68/3EdlHDTPyD+AYjPrONJNMn+OQY8zRjEBwpCb9QTG/WQp8fDylizN34AQ8vvyOj7HpAmTSdy76Mo0BRJ1VjKYIv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aBdNrrCJ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aBdNrrCJ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ceb75f9631so1318083a12.0
        for <linux-clk@vger.kernel.org>; Fri, 01 Nov 2024 02:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455067; x=1731059867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RfCSiRKPCnvU8GbAS6ruNWu/VWU6I+MnOUaUXq52C0=;
        b=aBdNrrCJfTFIK+HV8864JZzIMfP4dUOPfNn6eRj6ZmMDsQ1Jo7BVt4uXgXHUNX4W35
         QC+utTY/FaojQdD4/1tbcRv+XZa2wV6P0nwLHOu5TYgO4PqDxvY2yq62wFubq+04jKlN
         +8J0Adpaoj6fZ3xPV85aIzqkie+9UtwbehF/I0XXoRnLib3/EcI9OAHQk5VKhUFFwQ5Z
         oNXjvVjNLxUj7plvIpRivudAq9nL81XJOWGUng4zUIvTSJjKuIfAaQucHqrXvKI6Zo2G
         aK3xrMwrt4mGe6LKbIyx4fRTGRtUJWcryVqgc3cAx+hW8fCdwL7yxjfGnOmY5A1gWUEV
         8Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455067; x=1731059867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RfCSiRKPCnvU8GbAS6ruNWu/VWU6I+MnOUaUXq52C0=;
        b=Z4ynABswnTXxAoOajXd0JZTHjMG2GDyc01rbTDNlwZzDO1nbHACRirGYIzH0BTCcMM
         ZTbPa2pU8enT4Nz1PMaSE1rLMto3kobOOULAGNe+4cTJwT23rDsZUHSFh4rJqBdaWAXg
         FvB4XAuFMBZE+AnIcTpbOK6cCJqMoSWd2DBOJElEYKN01vxvAvVQqE/r9TKOkH5BkSCi
         kkpCT35qUw84dc0eQ0SRzz9nuXhoND+BhGSsTRF4BURqt/hfahpwS+548mG9pY8NO+7X
         +sBcw6zii2kS6Y3PpL/hDyVDn1E1lbR46onoVDT/Jm4zvd6qVvfSIGD3i00MqjkQ6qVb
         ncvA==
X-Forwarded-Encrypted: i=1; AJvYcCUwU8cLoMYzAvKWybfErphpQFP2aULnO07OVNSo92S1kGmqNg1ni3vH3KOr26+U8PKY7plTGwkp+0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3IS593Vyd/+2LPv0SFljEOaSvUq5LXU6fO3lsqM8LOfnyToI
	gdqrwAK9whgZnaC0cYAtH55ymQteh4ObW8fEkeBgrBQdDi/e7ZgFuGMdEzdaIXI=
X-Google-Smtp-Source: AGHT+IESf07+Ty6d+mR8h6jLvICrJWZMLVl4M5/vp52FC/zlmrG1YxQrK8z4XTkLNQ78LoV1FRPc3A==
X-Received: by 2002:a05:6402:518d:b0:5c9:5701:f79e with SMTP id 4fb4d7f45d1cf-5cbbf947bf6mr17732684a12.27.1730455066464;
        Fri, 01 Nov 2024 02:57:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:45 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 4/9] rtc: renesas-rtca3: Fix compilation error on RISC-V
Date: Fri,  1 Nov 2024 11:57:15 +0200
Message-Id: <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Fix the following compilation errors when building the RTCA3 for RISCV:

../drivers/rtc/rtc-renesas-rtca3.c:270:23: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  270 |         tm->tm_sec = bcd2bin(FIELD_GET(RTCA3_RSECCNT_SEC, sec));
      |                              ^
../drivers/rtc/rtc-renesas-rtca3.c:369:23: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  369 |         tm->tm_sec = bcd2bin(FIELD_GET(RTCA3_RSECAR_SEC, sec));
      |                              ^
../drivers/rtc/rtc-renesas-rtca3.c:476:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  476 |         cycles = FIELD_GET(RTCA3_RADJ_ADJ, radj);
      |                  ^
../drivers/rtc/rtc-renesas-rtca3.c:523:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  523 |         radj = FIELD_PREP(RTCA3_RADJ_ADJ, abs(cycles));
      |                ^
../drivers/rtc/rtc-renesas-rtca3.c:658:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  658 |         val = FIELD_PREP(RTCA3_RCR1_PES, RTCA3_RCR1_PES_1_64_SEC);
      |               ^

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none; this patch is new


 drivers/rtc/rtc-renesas-rtca3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index abb0f6f73906..d127933bfc8a 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 #include <linux/bcd.h>
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
-- 
2.39.2

