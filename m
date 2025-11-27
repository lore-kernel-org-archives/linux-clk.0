Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65FC320CD1
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232765; cv=none; b=TBvXaywCWncp1+FdNH7/2yiOerHoj/WCHslwXJ9+WiiVSk4xWqemnrgDq5tN6Mk9/M70grDqjdQAFrmzoIT1Szg0YOKxiAYKsJr0JXLGq4Yc4K4mEpMa/lzkdtFeR64STWQlvilMF5dMoeh+I7YHsVXU3HnUF4miCjxR73+LuOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232765; c=relaxed/simple;
	bh=XvO8WdPb9Dh+HMrGLdgEGRGU/kywwObZJsmvRiDTIsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nma8pFKN6AE2Z1l5Y3ZQAORpsanUrggv70Dz6FbsPPqwZ6ZaRqFMoa8coA65fJcWJPDnkdn2w9oPlBhJvpNO6pHt744lraVV5R26cLZgL2GVMrZ33m99LkKz82nqd8fi0nmGnUwiiDEZhrvAgWRViaeuWrfERLc3yx1PfeYVFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n1lK/gI/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n1lK/gI/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 167764E41916;
	Thu, 27 Nov 2025 08:39:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D9FF36068C;
	Thu, 27 Nov 2025 08:39:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B470F102F1A6A;
	Thu, 27 Nov 2025 09:39:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764232759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uGUB311hgWAyFRUuNDLWLmnmEe9k7c0Q1RMUsTuYHcw=;
	b=n1lK/gI/ZWefv9D3rq/z16Z4OmDsaSOdN7WJxw+1To5hlI0jyfodUScvXR5zIV+LyMbcsA
	hIKf555N5KfxeazGBpzXws0TIc5AQoZONVoQcXdv1pLG0wGVy8O3/OYeoH0ZNLQpJNo3va
	OSzx6W1og/5lfvKN+7rRNGYYLg/t4zHjPcxCKxRk8oq+AWksVIpPsBg4K07VFvAe0A/vG6
	4OXtn+A5WD8nrA+XIbMWlahn3Lkia0nVTwr8603QIuflhYCnDLKFpEyex0Nm4S2E7vDBjq
	Zvx7hWpzV/93lQNClNb3LYY+LB9IjLfRtGarsgS7bN8bulnan7CWO3u/Bid4pA==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Thu, 27 Nov 2025 09:38:58 +0100
Subject: [PATCH RFC v2 4/4] firmware: ti_sci: restore clock context during
 resume in BOARDCFG_MANAGED mode
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-4-a487fa3ff221@bootlin.com>
References: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
In-Reply-To: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

In BOARDCFG_MANAGED mode, the firmware cannot restore the clock parents.
This responsibility is therefore delegated to the ti_sci driver, which uses
clk_restore_context() to trigger the context_restore() operation for all
registered clocks, including those managed by the sci-clk driver. The
sci-clk driver implements the context_restore() operation to ensure clock
parents are correctly restored.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index a4d28f37b58ae..1e3fe00ff9109 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bitmap.h>
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
@@ -3901,6 +3902,8 @@ static int ti_sci_resume_noirq(struct device *dev)
 				if (ret)
 					return ret;
 			}
+
+			clk_restore_context();
 		}
 		break;
 	default:

-- 
2.51.0

