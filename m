Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EE52836F
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 03:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755143603; cv=none; b=hvnTNXYzvRnFJjVk0X4DAXYw53elHrSBL/e3lTBS4pYjvYBZOv/Vu7cboXfWZqNlrGszHuckoIPQa6q9KmA6xrq6k7W0Bxw63llfe+gPvzsR/UxuxBKQ1P91vCX+xJi9XpsgppDHvZ9SilWTrfkn5A6SJMGOKhSGkGl65l0zUH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755143603; c=relaxed/simple;
	bh=WrA7wXphGq7C2+quYEdoZSP7IvuC6J33CkBNdOUJY1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A65Bi5FoWxnOkMPn1vxdj7RLPr0Vt8SNCNCABR56uikC0JpvRG7P1+CtwbyIaejnThHJEylD8O9xnXRG6CZ4N+ZS21k74pXJrTfFkRjCShtKyp9fzz1fbIvsWuJ6E+YYOaGFn1GuNMdsQQ8qDWPeHi3SGdVq4Fvdz3o0Zih9S9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gUiZ9PnM; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gUiZ9PnM"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4716fb2295so286095a12.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Aug 2025 20:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143602; x=1755748402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pl0UCqTEugdT0otZ1JL4PHmJhUzKYCzZ7agBq4X19mE=;
        b=gUiZ9PnMTuLovewnncb/LfQCqjXsZJQdVWl7OIEa3lT3VUvRPQb0G6CrlcEbNx+YPr
         LoFqARwfhOVoPRqtIWEZnfneetH+U+DNO6cX8XPF9wqyyBxRomxS3MwKjD8jyOc/X1hm
         SGuEDcy93t15wkZaEbxaUd1M/uandPR/3F/OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143602; x=1755748402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl0UCqTEugdT0otZ1JL4PHmJhUzKYCzZ7agBq4X19mE=;
        b=kfxV6cwJyW5g3Wywo08lASxvAucw6iQDFGkzwiLRhtjTjwVQS5iKg0TkaERihLqjYR
         cfrAij9O6EsskF1g14jTcLvoHCP/uh9JpmlSi+N8031LHsO+9NfgfT6Em6EBNcdZdQDf
         Gvwga5hC06VqrCpIrPqKaI7DHT3GkXiY4pQn8LeGEoSMi7BNPnkGCwmm+X/8Xwud2Jpy
         wpR9t4GRFWvf6D2ZpqZqmsFL4ni4fqxH9kbUkgX8rnz9CQgONnh0/l1sAQg/kZyqbLCt
         Z0sEoZO4GnDxVmVxZ69lHU1Ic0h2PtKglmZD4JnHsdIRMz9jHNV2D5HvFwB/wfbBFdwQ
         ipng==
X-Forwarded-Encrypted: i=1; AJvYcCVq4nJu91yBFTJX6Yun3x/ktbgPwwm4yZ27gnXTDCs/swkH7uiGdPoicjCzq0kFm6xtRgQR+xqX4TI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfXcHc+ZYiXVAY2/Ch+/pkFQwroGPieeNrf0wVBBkGR0rUXe98
	XgLTFZyl/o4UjU8HtuDDjW70plShliyiL+mEdbzbdMd/I7jppYbw0CC/D9RsSiPxdA==
X-Gm-Gg: ASbGnctKR3EkF1rdRgQyhvqTpYMQo3FSYJ3aLyhmC/oa3RBw6wRSIeBppvynshspSOs
	2X0uNI3NhnidO6iV53PtP0LCC44NUDSi7iAUWykz+NwycfkqapDTU2iybwp7bBxQ8/+u0T7LO+E
	I91dVKZhI61vrxyjClbDP7ZEd3LbLvdYrxpC+RdXkIz823qEHOR8F8/e/S3AQA1UqDz7/f07L/c
	tsbC2o3SpnY9VIw6bT1L/GcYx4UrHK+XVeLBn8HewtUt9gnLzs7nFzU0HdSl70yFgyYi9Gu/pP5
	jFIXrfTsJvC3NunGgr+Y0bygb3zJRFVumO57epojCSH8Ttm793Zqn4RG/jp9FiVkPoPtxnM593x
	9zfl2ObiZsu6k/DiE/qenHd8iLT2h7xMb8/2F0Bi1
X-Google-Smtp-Source: AGHT+IEewGnhW08uwz92qzGaMb1N+K9gny1YesoScUE9j7LXkcIxhYyAzeLPYF+E+O3U8ZcDGRXTxA==
X-Received: by 2002:a17:903:985:b0:234:f580:a11 with SMTP id d9443c01a7336-244584e4479mr23394845ad.19.1755143601765;
        Wed, 13 Aug 2025 20:53:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c44f:5805:6bc2:66d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21c65sm342150205ad.73.2025.08.13.20.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 20:53:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] clk: Sort include statements
Date: Thu, 14 Aug 2025 11:53:15 +0800
Message-ID: <20250814035317.4112336-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk core has its include statements in some random order.

Clean it up before we add more.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/clk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b821b2cdb155..2eb63d610cbb 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -6,21 +6,21 @@
  * Standard functionality for the common clock API.  See Documentation/driver-api/clk.rst
  */
 
+#include <linux/clk/clk-conf.h>
+#include <linux/clkdev.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clk/clk-conf.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
+#include <linux/device.h>
 #include <linux/err.h>
+#include <linux/init.h>
 #include <linux/list.h>
-#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/device.h>
-#include <linux/init.h>
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #include "clk.h"
 
-- 
2.51.0.rc1.163.g2494970778-goog

