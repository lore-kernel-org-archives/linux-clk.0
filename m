Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11DB2701CF
	for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779611224; cv=none; b=HL9czi6IQ3yI2paE8vuU3BqzeOelyHHxPrFz4XvY/NWbV2zBJI/PpGyI1ttAGegNS4ehVn56hq7v5fTh1VQ6z0dGZoPNHGuF8seoSa5rholZ7wMvfps7mGR5+tMchG0IqoFXbV/MdUA5u7G+eKEkRmAZudYk/VprvOkGRo7lXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779611224; c=relaxed/simple;
	bh=34dp9f5T9YrXRKgyAocDQRHMx/8sQhWIOEfGzLLGqGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dRrdKvcR6CtBehrj5KMgJlTftFaDCE81CiREwa4+zAnpft6bLxOVSOkX/K2mwhPmUWlIrtStIUrQ4sGKw/XdIef957vyKF0g3R0arEaPILsqRpHzJp0Aez5azb9CSbyVNnjBjxcbMUfXWKguKZvnGTCOf7HNRAUBk9yOV1VrOiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQAUT7Op; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQAUT7Op"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903974854dso27548005e9.3
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779611221; x=1780216021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qdTAUWZwMStvqigprrXqH9hWjCxZHQLI8rGUkZZZlk=;
        b=LQAUT7Op12qOXhtHVB2LySn92qY2m+9kNMyi1DQKp69pMJDUzzcxW/NxjnyeCk/sSb
         c7gy+u19fOwHOv0kUv+xGKYmqmGpHCjidCKonwT+mCmuvVMdA4Btyl5QV5VRIJ2kRpZY
         2LS81a23qFrumWJqg5F9y09LEYiFuACEI7BQJWRTypnsJcx3hVg3lt6P7vr3JpOY9kF9
         6f3BcQ7h4LHub7n+SiIzJ05YrpYheIkqdmWQcvZSiQJYNxxs07rObd3vkmPjHLoEnNnm
         PpJHoHd7hCBFKMhnG2QV5dmGcSWwnZnstOPm3wOTZAYSuOKO+MV0ultJb+NRxnTsclpX
         lABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779611221; x=1780216021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qdTAUWZwMStvqigprrXqH9hWjCxZHQLI8rGUkZZZlk=;
        b=Ne9fNpCxXZpwsCnUyLnCMHvg0NLciyk5QrfFK7GHxOta38OL/j3ZW9mDedRE1XFHwI
         prCd0mEGLFExAF9LxQwJtRYU77C71LUONUt9xQi8eJ6sjZ1LQI3P9Bxg4fuwxf7HVUd3
         MaZqkIxVbsVYaInvn3byG9Fc0lZBAGy2hAQ7V2y9xDsNy9S356tufz9vWgRH0ya88/74
         relGL14ZVj0W/xSS57Z7S0j+My166+Q7a7FmRHlwiNTjhgk6Yidv86Xin/yBMcaV9A6d
         Dg0czKaJ7AJvONhtryJ0mbWfIH+Zgc+tzdXxuOaG67/G+MUDnIa8KrWwDgk23sLb6j8M
         DOYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FYvl3youuY2l7teTjz/G0yCWFopntYvKe+hJggGGf91Kk91f2RfttedqC7OzBOVSDx8SShgw/zWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRJ8mb7BwlWr3BMyFnandy9AbMfcQuwzsD0IQYnkY5vkW33DYv
	Z+Hlo4tMSV9s0McknNJi+y/aey877sxXNgASjf/cX7rNvw6Zjdbz9jGn
X-Gm-Gg: Acq92OEPgcc2z4LGBZVz4aLyc5XNo+sGspF4w/6fyKzHoFtUnwQOg8Lp+MUO0MZRkOv
	XvJKg5RzkCzWKOzYEHxyhkK3ifNYXRZ+5OoN67v6TA4sD5/Yil0md1CADi3QUQsIdcoI+Y+m8WE
	NaoDRUNekp3Buwbj6NGJDBfmBc2nCW76OYnl36uoLzsiN6x5Cmg/cJPPPazUsdsPmZ/PWmQxjQy
	abYNfx0nhaE7UMSOwmPVhHpI5uxvoT4oHRggt0BFEei9eOs9RFTH+fRjogFE0ah15X4G3bfzg7R
	oO1/cbCvpiNJczUmqWpiA6omtoTMxDJ/LszillpTCOSmZv2L6Ccju6dHAMtBGQlJSP4eAEVfJKY
	mXYMNJ+VV4EQudkI4oGvyi3p9Pm1vJMW4r9Lts0cdf3TLmTSg2h39d7jw/puFqGUc49a7VP8lO9
	+GX5A6R2DJx/C8u039AYrHWcdjMG0hjkoLjBS8jErJ7f3YzJ2X1RHuO93R7Kg=
X-Received: by 2002:a05:600c:1c0b:b0:490:44eb:c1dc with SMTP id 5b1f17b1804b1-49044ebc2e0mr172726285e9.20.1779611220498;
        Sun, 24 May 2026 01:27:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:ae73:a12b:ca55:91be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49059fb42dasm47284715e9.7.2026.05.24.01.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 01:27:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] clk: renesas: r9a08g045-cpg: Drop unused pm_domain header file
Date: Sun, 24 May 2026 09:26:50 +0100
Message-ID: <20260524082657.19335-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The linux/pm_domain.h header is not used in this file. Remove it to keep
the includes clean.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 9610676058de..29b47469d814 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -9,7 +9,6 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/pm_domain.h>
 
 #include <dt-bindings/clock/r9a08g045-cpg.h>
 
-- 
2.43.0

