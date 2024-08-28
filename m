Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DDB189513
	for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853982; cv=none; b=KFgGGp1pyJHRCGsOJh0cxz7+a8QFDBsWBwQRjvVajtBj1NOFrDjWoBNHQ9RpVV6hnTtDxZ+qsiHbiMb3MzBVLn/6r8p3010x8C0Q5920sHKfcmYeeDpzh5NUuxZaXtcojASacrK66RoaAmiAooPE6nvIXxP7kVxVEeVGwBaNNSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853982; c=relaxed/simple;
	bh=RZ7f8KSDfavIg2LMNLDwKSDIUWMWuB94Qd8u4dHZeAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cy6lRP4JgFNNVljK6hdnrzE1nnQMYIR0KccJdUD1/rSNsrOPACylbHIb/fDUlc94FmkEodk1cly7eyixDy6DcBx92XCnj8FNqY54PllJtSgBpfDU1E87aYuFOiVEfg+FpZk06rtXzC9vij0nnjWW+TLenEs7045Yz21mIog+k1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kSnq8xHZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kSnq8xHZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a866cea40c4so775628766b.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724853978; x=1725458778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9iF1jJIvtOjyxkFa1dGcE5P1zK7/0vC9veIHL8v450=;
        b=kSnq8xHZmThYKL9vBgbC2urulWGAc5YWtqbKicaWc9kVI0opDrqxru4IsLhWzZiRW9
         KTpfS/A0KoIa2tR+QG2uJxLyR4PCjK+H7zQvyukTmv7XsaPNqzKj85yYByapooyCXpGd
         O8dUJJtEpig4t+qZF+pK4GqaCJXezTSw1so2r9MnItWKTuYJ8gvDPnNOypNKs69my8Zg
         VXsPGIwpk3gNNsw1F2poKM5GLK2kyLU2om44Io95/olJdvmKr7iBAYtmPIrdU19YlAn9
         TyWPzQGAKsT/yR5Tvgo51M91dzLw6KU8iLtUI7DsLvPXBTCjTbip6e20Lu2ys8cpc+X8
         f9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853978; x=1725458778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9iF1jJIvtOjyxkFa1dGcE5P1zK7/0vC9veIHL8v450=;
        b=mS8OezMmlD5Vz/didU6xpClsFe7KGAgxoFqpezwQGK8/Xuqdp5v3RjCArnC0mfAULQ
         N13DCKowrKRe10dJA306Q5K7QzfQla/m1N2tDHomc4sfMEpM03LTf8EGwJE7aDRBpu0y
         sWSVIbHRshIZrwJ6hMb5v/gAYhN1os2RilDToUJwkpRUqCuZxEyQIn7PCpnvfVyACQTp
         q8sQaVamu/W/49/MzMmRZSrw447fNCg0oQpPDksBPoYnmyNsHMYNMJShnPI0/DdBeilh
         iqpn762Sf7uWvd2wbTbsz36vYpcUVHVBcviB4Us4QLXEXN0zFL1D/lMPrL42HHmgcb7e
         DG5A==
X-Forwarded-Encrypted: i=1; AJvYcCWUNIvHxNCEQGbLwaOdNnQF4huxUtIhCkKLoJLRqWfJgjgJaQBKs3exuvd86mv3ABpdeZnmyJjbiDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVEtvUXu+EO/Ze2PulmTQvicuIe4fK8vJLQMXYc13Upozk3MVU
	4KiB/Y0g8gPlrcVz9p839GFcqpv+q1r0RyKq9FYtPvkWFp86kGsRhCIuSDb1DIE=
X-Google-Smtp-Source: AGHT+IEsHCbcGPRfjvRa3ReFX+yeEg97TxBu8qrzEnpYz3gK7FeIv1FbQkePSMHvE/KzGYp7D32IZw==
X-Received: by 2002:a17:907:ea1:b0:a86:789c:2d07 with SMTP id a640c23a62f3a-a86a516305emr1476874566b.4.1724853977604;
        Wed, 28 Aug 2024 07:06:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e54b50dbsm251875666b.93.2024.08.28.07.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 07:06:17 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 3/3] watchdog: rzg2l_wdt: Power on the watchdog domain in the restart handler
Date: Wed, 28 Aug 2024 17:06:02 +0300
Message-Id: <20240828140602.1006438-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On RZ/G3S the watchdog can be part of a software-controlled PM domain. In
this case, the watchdog device need to be powered on in
struct watchdog_ops::restart API. This can be done though
pm_runtime_resume_and_get() API if the watchdog PM domain and watchdog
device are marked as IRQ safe. We mark the watchdog PM domain as IRQ safe
with GENPD_FLAG_IRQ_SAFE when the watchdog PM domain is registered and the
watchdog device though pm_runtime_irq_safe().

Before commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
context'") pm_runtime_get_sync() was used in watchdog restart handler
(which is similar to pm_runtime_resume_and_get() except the later one
handles the runtime resume errors).

Commit e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait
context'") dropped the pm_runtime_get_sync() and replaced it with
clk_prepare_enable() to avoid invalid wait context due to genpd_lock()
in genpd_runtime_resume() being called from atomic context. But
clk_prepare_enable() doesn't fit for this either (as reported by
Ulf Hansson) as clk_prepare() can also sleep (it just not throw invalid
wait context warning as it is not written for this).

Because the watchdog device is marked now as IRQ safe (though this patch)
the irq_safe_dev_in_sleep_domain() call from genpd_runtime_resume() returns
1 for devices not registering an IRQ safe PM domain for watchdog (as the
watchdog device is IRQ safe, PM domain is not and watchdog PM domain is
always-on), this being the case for RZ/G3S with old device trees and
the rest of the SoCs that use this driver, we can now drop also the
clk_prepare_enable() calls in restart handler and rely on
pm_runtime_resume_and_get().

Thus, drop clk_prepare_enable() and use pm_runtime_resume_and_get() in
watchdog restart handler.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- adjusted patch description and comment from code
- collected tags

Changes since RFC:
- use pm_runtime_resume_and_get() and pm_runtime_irq_safe()
- drop clock prepare in probe

 drivers/watchdog/rzg2l_wdt.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 2a35f890a288..11bbe48160ec 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/units.h>
@@ -166,8 +167,22 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
 	int ret;
 
-	clk_prepare_enable(priv->pclk);
-	clk_prepare_enable(priv->osc_clk);
+	/*
+	 * In case of RZ/G3S the watchdog device may be part of an IRQ safe power
+	 * domain that is currently powered off. In this case we need to power
+	 * it on before accessing registers. Along with this the clocks will be
+	 * enabled. We don't undo the pm_runtime_resume_and_get() as the device
+	 * need to be on for the reboot to happen.
+	 *
+	 * For the rest of SoCs not registering a watchdog IRQ safe power
+	 * domain it is safe to call pm_runtime_resume_and_get() as the
+	 * irq_safe_dev_in_sleep_domain() call in genpd_runtime_resume()
+	 * returns non zero value and the genpd_lock() is avoided, thus, there
+	 * will be no invalid wait context reported by lockdep.
+	 */
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
 
 	if (priv->devtype == WDT_RZG2L) {
 		ret = reset_control_deassert(priv->rstc);
@@ -275,6 +290,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	priv->devtype = (uintptr_t)of_device_get_match_data(dev);
 
+	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	priv->wdev.info = &rzg2l_wdt_ident;
-- 
2.39.2

