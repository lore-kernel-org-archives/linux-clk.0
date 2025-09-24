Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF30F242938
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758745704; cv=none; b=YZTm7N6mPfE5YB1XXzogd2Z8Hja2dazIiHx0kUvXbGEMCWVD/sOmV1xfRDgcQdrTEciUcRlqOv1FEIL3uwxv8NwkWhNAzSJcQtMXmh24ccyavLrHOwydhiwQvYDKTYaCZqAcYwjGW/6hcFarkWx2WtSTUjehhX6In2BhmwIYka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758745704; c=relaxed/simple;
	bh=UmucYTRu+BE/Lztu3PCNMMuVHUkjtu+v3sIYViVwO6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1cIIM/GongobDpzHKeyIJjvgr74yOz1twHMAhq+WQcZwiZEcB0B/8JY5Uzrw1U+3UI04OIK+K42aM6DFPagtqbKXokpUKsnkCJG2MJY5hvC+mTs6LsTPFBipkau/97j2k7qY/GAuiaTQnr/Mwf1xdg3XVagj8gTF1ylZCFa7sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=aMp3CbI8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="aMp3CbI8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so3633935ad.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 13:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1758745702; x=1759350502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NddK7zUtx29kLKxWc4QfF7l6cZPcdstc1x330fld4jc=;
        b=aMp3CbI8anc46oQcLNdHmnlJulQZ7TO1IlJFEvlA4awVuOttLpym1kboUKycPJc25/
         Vzuj9bN/Q/9wicXmFEdLxxb3IdniOHQvGYIObeSqcaiXA3BzL5JVVXqGxeZF7W7cSJZS
         8FFeBkt5TDPM0AbJJbropMx7kRvY8x8AVgYkD8+ObjDKobEUbeEzWAJ36AcbE6HGciHT
         L3ArTuyK2lZ1GhEVKMLWCCU8CFuAIvrI0Fopw6h8fzX91/UJYRi3FGowRvXcCZtepSde
         wLlHeJWkWboiI92z/SZxp6ViPOUH8syDNaI0Z01DtVk8CEVLhu+/vvPXNE4p3fogNMer
         qH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758745702; x=1759350502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NddK7zUtx29kLKxWc4QfF7l6cZPcdstc1x330fld4jc=;
        b=FOnBrrwTf6bdioLp6467/W4nt88xDy2NkKGOa7jlQJ9j7z+BvalL4fQXXHExwKdqM7
         wMCX5QIilI5Zr4lg/R4qUr7hcysjPa1ITIqLNoL2XHR7yZNo5Eg08AORLg0efX1cvR+e
         saVEImfhIrWBidmXoq77Mf7P/K/HltzUo4M5PH/tmtDRF+BEMdLre078aX2KdUlvXpAc
         HQj0tsiKeTozTyBjrEnvSi7u1FgqFv474sDbMkZd1ZQTkb0QheI00Kbup2BV3q3gEtR3
         A2FsXuxCcORNWjotXlkD9+8zO73zKKywM92Coj0NWcfiIwqFoFmaIqBJjukTxANTiBEe
         rq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAoZQGWNeIicNo+y2ZcJhLk5sfsZPmGzzsjDn4OLERqleiwJ2h1JuVW+qswK+ORFdjyl7pi0lJ9xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/7TLGIee/b23P7UxULcCcsueAbxG4DO+Rjl36xrh/YXuP+RN0
	w2Dx4r37YH6CEyz9ae+HRY2rddpsajnZQ2/aLIlFajFNq64DWG2J8SYTRQMYa6SyA64=
X-Gm-Gg: ASbGncssffivx+3xVMqShRBI+B1UpvZpftzuG0sc44C54a4M5potsUZtKJBlfRRVbuv
	CxucmZhK/XfpHel7dv1ukxF8bZOKdIIVbHk7iokQ35Wj/74b0pxz+Xww75vlgoQcpPjldXQB68y
	OXrXjs5hbtvc3lpU/KWtbuPhrwORONwimFlTv5/VDBjUcqCA2DpJwG7ZzUu7wKOCX0vS0HzKM3e
	AdLdUI2RPJhEFhCPFOcQECZrtmccMGzPuuaLkewHJun/tdYJ0ovOFV0L7+LhlY/wJshul8AOgxi
	tOcAuITMadT3X82DfZtgm08rRPv5/ffq3DnRV5Hc1umstvkyQTgxw7WzinjMp3qhd0gyy8/a6tL
	wixDxcHL9lOK6r+Ih7zbEQrJudyG2dr8vhGUpt8YBbIk=
X-Google-Smtp-Source: AGHT+IHJVzX2g1UA3upwAb/j5hdf3l0TKF508erqEeVTVoaUhMLw8VEbhNWZxcVuu6I5gB/pfVVtnw==
X-Received: by 2002:a17:903:185:b0:267:a55a:8684 with SMTP id d9443c01a7336-27ed49c770fmr12390275ad.2.1758745702113;
        Wed, 24 Sep 2025 13:28:22 -0700 (PDT)
Received: from fedora (d-zg1-232.globalnet.hr. [213.149.36.246])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3341bdbdc9csm3229737a91.18.2025.09.24.13.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 13:28:21 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	claudiu.beznea@tuxon.dev
Cc: luka.perkov@sartura.hr,
	benjamin.ryzman@canonical.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] clk: lan966x: remove unused dt-bindings include
Date: Wed, 24 Sep 2025 22:27:15 +0200
Message-ID: <20250924202810.1641883-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for LAN969x support, all instances referring to defines in
the LAN966x specific header were dropped, so its safe to drop its inclusion
in the driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/clk/clk-lan966x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/clk-lan966x.c b/drivers/clk/clk-lan966x.c
index 16e0405fe28b..3c7a48c616bb 100644
--- a/drivers/clk/clk-lan966x.c
+++ b/drivers/clk/clk-lan966x.c
@@ -16,8 +16,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/microchip,lan966x.h>
-
 #define GCK_ENA         BIT(0)
 #define GCK_SRC_SEL     GENMASK(9, 8)
 #define GCK_PRESCALER   GENMASK(23, 16)
-- 
2.51.0

