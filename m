Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED08C2E5B13
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754988815; cv=none; b=ljwe7iBYZE+x7tv+W0VY+H0cLdEYujfoxs4PKkldeQ8Mf5+5XlqrgxM7cHKXfb3WNssSlCQaMPFBXtqKMXhaNIGERcNZykqw1FJksOMjgl0OhgUSp6hWsLcanBQRqmLBquCcw/m6lJZvWUbfehHdU4uuEojNASUn0MlFTUyVm+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754988815; c=relaxed/simple;
	bh=CT90p7o4NQd828E9Ubu/4Yaaoo+eLHYjT01GBxlSo2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ArkNLamUB13GKlxsHB+iLyzpJJUKPU7bLQoSjmbNwFR0lC6EBsF2UK8+DJAJNVKWYFsF59uWu5xLVJTLJbXSFNDI9Lj3KF+pqX+ZqVEPD6mIdGzTUFBg1PpFioEaltgo8fmzwbHIHBgcX3mbOXtZXmt1kHJAjH74aEWzh0HjZew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NNXwZqla; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NNXwZqla"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4281fabee0so3544700a12.2
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 01:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754988813; x=1755593613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz4Qdv62lAKsjkAZ22ZFX9wEAksTHe+JhTiso/RYQVc=;
        b=NNXwZqla7ISk+dqtlRJi/DSOC3omS4cuFK7KCxLiTkVEHHlmacq8ImiHtVVEQ8HYOj
         2ZxYfj965QK2K8enJrnnmY6vU2Z32RSICzTR2rJUdIk4UHx0bAZ2JHN0jMg5ED8XYY8w
         Be3yqZW2tP/5TZAHtOAzFobDSHyEcVhXTohhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988813; x=1755593613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xz4Qdv62lAKsjkAZ22ZFX9wEAksTHe+JhTiso/RYQVc=;
        b=Doz41440AZskcDw77cYrEFVBGJicpHQJJJGZwEYiloyKbYusMmHexRjMeVmddZb4ik
         ppw8zmdH6S4z5ZqHYeoEuc1AkSOS0tJC04ZxHMrUHhaMVvT6kSJHpbGyocf+Xkrr7m1S
         F8wSLfgwXkYpNnrqOjgs7KdkfC4K3rf27ne/w/Gzvyi7jcsG3noBOpGj+VMjj5ql3m2+
         kenumnnBiH9Ky4kiHIWbM41N2fO1TCpTMeg7SF3U8gn5Hy5nJtIcTKY+Mpj5qIDgWT3q
         BJlmp8ijT3mtEB6ZanDdRohGdH7mWjSbnkx8l+l5rS1MIJqkomHNCA+ylRBUenqUrCJH
         +TAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzrfDrVVKM1xDMTxwbwKeZ5GRuU7euheL8Wqr0wYlKo17LyoA6p6zV/awBPksVd5VTC/pWuZkt8v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzlRwSA7bPexR6PNbgOZI4RLMsOLHfVniY/178SwMe0hq17Q9h
	5QBul7sONI1cEwAkMIOXIh/jEes9L6rI8BSAghVUylAT4nERHH2qd5oNLPh8MrjR+g==
X-Gm-Gg: ASbGncsz7Noij6JV8hbNFsNtFK4T62sCjcWhyHsoU7tMRb65rCF2y/BSARomXSG7fsy
	ifAeUUBSgA5b9tJo/rZjyI0NzSxFLO9Gm2Sszwo5Q/VE+g4Z28tfrJbH65ioUL6sawFgS8lydfO
	hs/Nv4hJDCAQeFHlAW80ItuMq1rtProNafQI/ziCxPoBlhSe4A0oLNst4kPxTPv4dq/yqEGCFQ6
	XWV3T730uTQTMdT07Y0+Xyt9PYCw14VLfB3iRDtQQAGQtodSGgAc39Di9DfRP5UyHsMa6OQkC1k
	xhk5S61n2MZrPlWKb+wAHIiUd2Cp7N8nkYRTabihAuy/o33fnOJ0ViAWoyQygvymySPNpd/phwS
	SViO4yBq0Vqb6tOPLXsZqK0GOWBC955eAIDgBNWx5
X-Google-Smtp-Source: AGHT+IFOWCZVXUc44tmrtbFyVyCPua9bqZtg9A4wAaJCkeOc5TnmXp6aSqWf4TQcG7yMH+z4ilx1Fw==
X-Received: by 2002:a17:902:d2c4:b0:240:3e40:43b8 with SMTP id d9443c01a7336-242c228f274mr203344785ad.53.1754988813155;
        Tue, 12 Aug 2025 01:53:33 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f81e:7c91:8fbf:672a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243017dd480sm10014365ad.33.2025.08.12.01.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:53:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: Sort include statements
Date: Tue, 12 Aug 2025 16:53:26 +0800
Message-ID: <20250812085328.3306705-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
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
2.51.0.rc0.215.g125493bb4a-goog

