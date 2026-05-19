Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9872609FD
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 22:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229620; cv=none; b=A0dJmz05gqFjyRIlaicwSVw6zlf0OiEdzAwF2xNXuaEv3zLmfkQzBrhyBRZvGUzGR4PzqXyU88jZFJ8c5DCeaAtWZbjEXuoaUvwNPNVSJwmtBQNOsJylpM5vSAJ/PknMQdUVZRjWqKFzQZ66wUO3ARJu2jpfLuIhLjEhj8MWDaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229620; c=relaxed/simple;
	bh=raA7B2CLvwvoXFm5CbRzNA34XxvFeMmexuQRrJJmQGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uuTI/xsJWeDVGV5Y3PtWzAPrQCiFrsWp2ibvg1hktm4VmUo1M24lCv8bLPguovbJr4o3vawpmqzylPLgy7LbFWg9NUEIrXR8iY3DAbbV0NjEvbH81JOazKSbzUtu8MaF0BwcG8XrMdeaIk3RWY5995AY+htT7SrlLytwfqe9Lmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=my/5ZIgG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="my/5ZIgG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bd2c147abaso24597985ad.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229618; x=1779834418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jifOPOKz9e7t/M4xHCnDkF0tjSFHG2IW4tQnfDCbC4s=;
        b=my/5ZIgGMiIj9KuyMWr2APzWO0E8Kqc30SC/2fQ2Oee0qR64P90dDBtj/qoQIQnUJP
         u9/ljLd7eCJnUAHFz36Wy+wuBDMgBPMvhpqLOetwicPQ2gUR6ms5Z2jfh9tQT2gqWRBs
         H78G4bMrFEXzW0/7duZebzp8djAF72v9dllgj1B5IVNkZHWu98GljKVr0XCVzNJVA7ZS
         dwndTXYJCRBD0wUIpz6ZkACI2zRVpKp0AINMAfSldsRr970FnfRmpSUYEzDqvJuIxPH5
         msKqp8Q/Hl1sc0lM/iUBCgsF1ghLxuK7X33Yv9pHbiHcmL63NtjmnqjgHz86SQ7KUO2Q
         W+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229618; x=1779834418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jifOPOKz9e7t/M4xHCnDkF0tjSFHG2IW4tQnfDCbC4s=;
        b=fVMqKVv/Zr7Xu8PLHNgdajGl1mgc/3WkuaDVzrvhKEBFXDv8EqiqoCcaqPSq9olDmk
         txaNAZojW3iy988xEFsZu4LvYUofIXUDSIdkt7otYnm+Knam5Q6zXgVsOMC5s5eyGAe2
         o+8T4P9YWdGnBbcoOfy5L0cy58URcf7pnmHBq02cJ292nJ4HnfefEpAOk1SDVxdUZvOb
         8uQicmToUFcL+7E8iItZWpi9VCrakLh6v5YEnpZRw7xeJbWHQDl49qXEj6+9v81Y5xmK
         88PbJWpr+mSCS9fgOa9dI2jb009v3H04Mjtdpl8X5cYQkR2aVTSQPUwkCd+mJqEUcgAG
         Gxcw==
X-Gm-Message-State: AOJu0YzBGiSS52PoUDyIb8BC9duV2VEApxZH+e5bLEfxV/9s2u4MiwLC
	neegMSimxPYChUXX7D76GHw3JFiSVUFCK4SZXrQ/mxUDBXabfWfQzFJCa9SfZJ+Q
X-Gm-Gg: Acq92OGL8qpL37CYYrzlMh6hpLdQf/9fEactCr5dDoZ8XLUgPz/cvd3fdCNiEOlpXAW
	QDcqiflLB6I+6M2dmQGt+7d/tjoNVzgFXKyd/whabbR9yLuuVhhHf3usPdFZUkvZMEECegOVv7q
	dv1cp/B/T3Gk/OrphkcYA0nQHefTiQYBYT13hF/lkLjF7UrYNoH629/bmrLxLBf4yKO119iZCLS
	dsky4/tRPnEDB+SEoyCDht2nGjez7vSrtdKZMo4fDmqv7wI3sNPz8/T3GYrqqY34654hpMheDMY
	sQ/T2MTrhogvygPtz4ug95rraiRIBGxO3oeTRwW1eSoGDEwX140e8cC0wQW/n1I2YBfAW+URyFq
	jijHCd93p7nYFY7+VOgd3O2s2MxqC/yJFcecGKe3DOKiR5Y8HEUeXgLuthnfYE2izKExpw+rO5X
	j4PS2AHaRqWRy9PwkwReH955XTVZvw6rM66027r/zi5zRT5bimziV8z2aH+o1s6FOHO+denSadl
	Z6ywNDAEXLQ3+xJDqGqxMwv6ooHhjpxZyuQ8NGRVvGGNg==
X-Received: by 2002:a17:903:2a87:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2bd7e8214d5mr226202775ad.15.1779229617864;
        Tue, 19 May 2026 15:26:57 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd279sm196517115ad.62.2026.05.19.15.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:26:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: stm32: add missing bitfield.h header
Date: Tue, 19 May 2026 15:26:39 -0700
Message-ID: <20260519222639.34508-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems some ARM header includes this and the build passes there, but
nowhere else. Note that the driver has COMPILE_TEST in depends.

Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..bdb17419908c 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..eb0bc918ecee 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -4,6 +4,7 @@
  * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
-- 
2.54.0

