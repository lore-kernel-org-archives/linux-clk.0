Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B6A4F3EB7;
	Mon, 19 Oct 2026 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412718; cv=none; b=gQJL6+hMEG5Dxd+znFajYK8BPoY8wq+YNubqdVCkDav79FA1ICMsYqkn+AFIlnfjghwOOwFIfIGJLmAhdHmg4rFHP1A6aDlGjvFAYTT5FdcXNEGfMP0qyiGjoGrWc9YgfbFXIO14Lmywv/mW579IC2NN6R5l1AWmOYeClkXOSD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412718; c=relaxed/simple;
	bh=2tjXlSnRulflD0vtLpOegHZrlW348Jzx2hdit7neF2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t3kbOsnbbRiEURT3vlf0Gvm0ZUSZg3L0VVfxC1FyJETnoIVUiTbLl7/nV6X0TOk+BNLQblMNMWh6AIq9CyUAsxqcBvbTXGgqybgFsv5TDOoTks9cKJNQHEqcaBivS6Vo0TI3jENMsHT1444My65V9efOA3l9WIl3vsyQDwpwOWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ES1aSMUv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ES1aSMUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437831F000C4;
	Mon, 19 Oct 2026 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792412705;
	bh=L+6zxwX2hK06lZIxxH2XRXImGk9IpgyunfgBPaW8aTo=;
	h=From:To:Cc:Subject:Date;
	b=ES1aSMUvi7RF5pWuEjXRWIbb+uQHJLVPID5ecHb3D51bPdehbqE4f/rLGfOwzIkSe
	 YFSCJoDa672xWttvR4+pwmHVUNkmBLkEW0LLzm9A9q+wH5JEks/GK8laUjaV9yMX/F
	 XeDKEbluK2KT2IBz7C3Mya2C0Om9YZ81iLekVJOYaXqTAzUsb0DRFSL6/XOZ8FIzpU
	 FuqXy+dm9m9vNk/hlAcSTPHd/FUa59ZbuxKvVA6djs0xO7xYawfZHLQrN/hDYbVOEp
	 hEnW1xFEKfW64WcQAX68w6B7DC6jmJcU/f70ciQxbRjXzlK2i++icuJu5rX8P24z78
	 it2oqcLr0OZuA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and critical resets for s2idle
Date: Mon, 19 Oct 2026 15:25:01 +0300
Message-ID: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

When the system suspends to s2idle, any of the IP blocks may be in the
wakeup path. For a device in the wakeup path, the generic PM domain (genpd)
does not disable/enable its clocks across suspend/resume. Re-initializing
the MSTOP bits for such a device leads to synchronous aborts when its
registers are accessed for the first time after resume.

In a suspend mode that is not controlled by firmware, power to the SoC is
not lost, so the MSTOP and critical reset state is retained and does not
need re-initialization in the first place. Skip it when
pm_suspend_via_firmware() reports such a mode.

Fixes: 5cd33db56956 ("clk: renesas: rzg2l: Add support for MSTOP in clock enable/disable API")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f6293c968bcf..3d2281456036 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -31,6 +31,7 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/suspend.h>
 #include <linux/units.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
@@ -2697,6 +2698,9 @@ static int rzg2l_cpg_resume(struct device *dev)
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
 	int ret;
 
+	if (!pm_suspend_via_firmware())
+		return 0;
+
 	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
 	if (ret)
 		return ret;
-- 
2.43.0

