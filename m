Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554390;
	b=zL/9JMnTxZyS6aQct0uQniSvcL8hhsg3uDnTnGuxHX/IFhe0QvYNW4e8xezcuB2Q7x4C
	 2A2Xq5O4G2iEAp/HCPcYYLTJQs/d8IkJTN9Jf7etN5r0CG4wXkSJDG608y4SzTyMZns4O
	 Abulqg6uxaV0IYA2Okqd2nqm1sDhNUJYzZFUTDAUcJ960FrmaFoFSHQENZ3KuYPU9Vbe1
	 MqLOhGX3OT37tsrnIQVkXO5Q98dXuHrHwPg4xeMtZ82j2gBsVIwjTLeW+VRFyOHWcDIhS
	 yk2ibKTN+MHUtqW+0OMY3s7Bo2Gc9eSXAWG/MYwmXLSvT5CBsIPwGvgvUVE4k4bl0kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=39S0aJdHWIRyJr9J3YXH1gyMCf139eDsPFo3E4VheKE=;
	b=4z47aH9/R4ju0JKcDv+zeRihDovJUgJMZFeYYF/69rXTAhtjrIdm6hwdQ4k1f/f7WHBV
	 DP4dqwa3tt3Sd9DhvT7l+huJkrkn7f4oYaWv1FdvCMXFmhA/V9ZzPF6BYXXkC7U9SKstB
	 /TDrCZ4c7VJomEpZThvdPsLO1GZZChgdBXu0wHDGRMu3wdHWC/p/TDKUXlyWsDnCP/woz
	 7sfmUrdQ9lcCRRqQvfU+3O/J95LjOhN57LunqrPk02VEyXzLKZi1BwvTHE+FyU5Kx+Hsq
	 kGl6AkBDPINUkQlhL4zKRURC4CXqK9ODT6oWAhhgaQ1w12qrkvEC1fNnWjNH294MC4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ka3i1QcM;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FF6606A32E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 21:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9FF6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ka3i1QcM
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so45589941fa.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554388; x=1796159188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39S0aJdHWIRyJr9J3YXH1gyMCf139eDsPFo3E4VheKE=;
        b=Ka3i1QcMwgj9n7g4v8b4yXKIMd6UgursfRCNBPDOgQhogBvy47twgV+SNmIxwsJaRp
         uBm7dXlHNNGzFgKCgDw8TOjiKicY2tEhLQVQUOnxrU3pVO2U7d7mAuqp5Or+yEqG3a13
         0GlLIOd4ENdJCByGc9txCcf7HL3IRRsARqYGQeKa+1KbwfwHZ0rexHF1srG0qyCmCTk7
         pBPmPXXC1ji8zcGreTCQ+2uw7ag2QBpiTEOZMLrvWfHM0x4PrwQeru+jH4b5ViYHuVyU
         rntzTzRkcNmvmExS2X6MkGHYYrJ1+DymkZAIjqzqOGm6//WJgOKtfqzF2L482PTu0TXQ
         BDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554388; x=1796159188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39S0aJdHWIRyJr9J3YXH1gyMCf139eDsPFo3E4VheKE=;
        b=mT1eaEDSfofQJtR4bcKIO+fGvvaP3b+EpWAhwijEcKdVTCNxFU8VipC90y4glEAqsi
         BLL6gUnorSYn2H+VJ43xrDb8ddDiTcyS6qlTShZywLjsopik2T6t7DOfNMDbKpgKjafX
         xHfkNRlYmUVAiFMSFCKA1I1WCUPi6n7NJ2pqcPXAVzugYg7sSvozXjtO1xdHoRqURRzC
         p7S5kiFh/LmCSwMW9pcISZMIf4te2Nv1SE9aOkWrNcE0Tdni15DcQAwpE7/N4mOvkbnh
         xIBmMAnvHunpq0PEG2t0Hq+7KniO0XXsVjjjuXiFJMDrG+OovuMjbxTqAVvOmDZArwxo
         9XFw==
X-Forwarded-Encrypted: i=1; AL+hErFM4FHhufCelNUFzaEFpfU7t/WPFLFghoswzcWWpMZGHe36ZpG8YdA6UURT/GaZR3OEj2f/V5HNr4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AGvXLxqKzzyy9sEPhL8Miix1r/xDkIxCvMRpheJo7rwndz4/x
	+DryBOZd18s6BrTLvJ5uWLUhMWqikXtdwOWaDlNND4Pyfl4w57AJnnse
X-Gm-Gg: AZFdTZeiTHTcH55WB4yXnaF8jadOlEAv/DNFSSjQcfKE9KVTk4cmfToMkVy2EfeitRJ
	wibcBoylJg5Njrsm4GkM5dysYz6hPqM4VMkDffRH+u2GkD5pE29sd8m0Kgnd8k8ukKxegWcM0L/
	uI1RslBJAu3tmuIK41imgpp2v7E5WydFnJncLJkZjWayvyRJYTr3yGanrrmGrC/XlQBa2ITzQ3s
	Pr96dXT90NvNhRTI6RbYTXAoEKjzQKH9d/iQyZg9pNrq58ReB9zUMOjz/QRmz/fYtaeGo8t3vcO
	fqyICrGTYWii6JKZJm/qHWLneOd7jPCfzNrpGPt4ZVL9mB1Z3DwZtfy2lMO2hHWgZ6dwpQoDsTu
	0SVxoMPBL69P9kMp0d1i4gk+zyYbLtzfWC8I9HdukZGqpvV/hNQD8WMHmA30GDmQA3PSpkzSoyT
	rmahiBnJJuqKG6STtgv+ZOrHt5LolIDM3x2fwF4IEpP0tdlcUHVrDo+qHHDPD49bwmgTnlWbo8+
	GrI3wzNGN7KgRpyQX8tJpn3LU4CLNKtbBS7KJzReOvOQcAUbbUsLS0XPLytR72d7CGJV9PkzNlt
	LL7WWtXV37kcY9wqnnkIDuseFPtIk5XoeWYkxl08
X-Received: by 2002:a05:6512:6d2:b0:5c1:57c4:a756 with SMTP id 2adb3069b0e04-5c1bc67ecfcmr4578403e87.9.1795554387810;
        Tue, 24 Nov 2026 13:06:27 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm4099045e87.53.2026.11.24.13.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:06:27 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 24 Nov 2026 22:06:04 +0100
Subject: [PATCH v2 6/6] watchdog: tegra20_wdt: Stop on VDE power off
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-t20-for-upstream-v2-6-440116846f97@gmail.com>
References: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
In-Reply-To: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11358;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=tn4wJe9hYRRwGHyBOLf6IjcClTEqhQuMn6rAi8XzVQw=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbrH2fxB0V8LMxJWz9uezTrp8ynlBkH1Xaf39ad/KZit
 723jzZ/RykLgxgXg6yYIovZQ6EvPPO83m94ubUTZg4rE8gQBi5OAZjIcT2Gv3Jmsi8ZDu3s0ss/
 Ffdrs453LNPc5y6FO++v/nEgTGjPyX8M/2P/nw15IHpcOzVsfoNOudqxA1eOdOkVhwduzGWf/yY
 8jR8A
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

A watchdog reset doesn't reset the PMC, and Tegra20's boot ROM hangs
after it if the VDE power partition is off. Unless booted with
tegra_pmc.vde_always_on=1, the PMC driver powers the partition off when
it registers it, and genpd powers it off whenever the VDE is idle. A
watchdog started by the bootloader can still catch hangs early during
boot, before that happens.

Register a PMC partition power off notifier to stop the watchdog before
the VDE partition is powered off for the first time. If the partition is
already off, a watchdog left running by the bootloader is stopped
instead of taken over. Afterwards the watchdog refuses to start with
-EBUSY, as a reset would hang, even if the partition is powered on
again. If the notifier can't be registered, the driver warns and keeps
the watchdog running.

The notifier runs outside of the watchdog core's locking, so it only
stops the hardware, under a mutex shared with the watchdog operations,
and leaves the core's state alone. Clearing WDOG_HW_RUNNING there would
race with the core, and leak the module and device references the core
holds for a running watchdog. The core therefore keeps considering a
watchdog stopped this way as running, which shows as follows:

- While the device is closed, the core keeps pinging, which fails
  without effect, and holds its references, as for any watchdog that
  can't be stopped. They are released when the driver is unbound.
- Opening the device fails with -EBUSY, as the core pings a watchdog it
  considers running instead of starting it, and starting fails as well.
- If user space has the device open, keepalives and timeout changes
  fail with -EBUSY, so it finds out that the watchdog is gone.

Stopping is the default. With tegra_pmc.vde_always_on=1, the partition
is never powered off, so the watchdog stays usable. Booting with
tegra20_wdt.stop_on_vde_off=0 also keeps it usable, but at the risk of
the system hanging instead of rebooting.

The watchdog is stopped even with nowayout, as a watchdog that can't
reset the system is of no use. Booting with
tegra20_wdt.stop_on_vde_off=0 keeps a nowayout watchdog running after
the partition is powered off.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 Documentation/watchdog/watchdog-parameters.rst |   5 +
 drivers/watchdog/tegra20_wdt.c                 | 184 ++++++++++++++++++++++---
 2 files changed, 170 insertions(+), 19 deletions(-)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 8f454c82521a8..1c62d2ad22f7a 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -609,6 +609,11 @@ tegra20_wdt:
     nowayout:
 	Watchdog cannot be stopped once started
 	(default=kernel config parameter)
+    stop_on_vde_off:
+	Stop the watchdog for good when the VDE partition is powered
+	off, as a reset would hang the boot ROM. This takes precedence
+	over nowayout. Booting with tegra_pmc.vde_always_on=1 keeps the
+	partition, and with it the watchdog, usable (default=1)
 
 -------------------------------------------------
 
diff --git a/drivers/watchdog/tegra20_wdt.c b/drivers/watchdog/tegra20_wdt.c
index aa90d538f92f3..0f15805927d20 100644
--- a/drivers/watchdog/tegra20_wdt.c
+++ b/drivers/watchdog/tegra20_wdt.c
@@ -9,11 +9,15 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/stringify.h>
 #include <linux/watchdog.h>
 
+#include <soc/tegra/pmc.h>
+
 /* Timer registers */
 #define TIMER_PTV			0x0
 #define TIMER_EN			BIT(31)
@@ -40,6 +44,9 @@
 struct tegra20_wdt {
 	struct watchdog_device	wdd;
 	void __iomem		*tmr_regs;
+	struct notifier_block	powergate_nb;
+	struct mutex		lock;		/* hardware and vde_off */
+	bool			vde_off;
 };
 
 #define WDT_HEARTBEAT 120
@@ -55,10 +62,26 @@ MODULE_PARM_DESC(nowayout,
 	"Watchdog cannot be stopped once started (default="
 	__stringify(WATCHDOG_NOWAYOUT) ")");
 
-static int tegra20_wdt_start(struct watchdog_device *wdd)
+/*
+ * After a watchdog reset, Tegra20's boot ROM hangs if the VDE partition is
+ * powered off, which the PMC driver does when it registers the partition,
+ * unless booted with tegra_pmc.vde_always_on=1. By default, the watchdog is
+ * therefore only used until the partition is powered off for the first time,
+ * which still allows a watchdog started by the bootloader to catch hangs early
+ * during boot. tegra_pmc.vde_always_on=1 keeps the watchdog usable for good.
+ * Clearing this keeps it usable as well, but at the risk of the system
+ * hanging instead of rebooting. This takes precedence over nowayout, as a
+ * watchdog that can't reset the system is of no use. Clear this to keep a
+ * nowayout watchdog running.
+ */
+static bool stop_on_vde_off = true;
+module_param(stop_on_vde_off, bool, 0);
+MODULE_PARM_DESC(stop_on_vde_off,
+	"Stop the watchdog for good when the VDE partition is powered off, even with nowayout (default=1)");
+
+static int __tegra20_wdt_start(struct tegra20_wdt *wdt)
 {
-	struct tegra20_wdt *wdt = watchdog_get_drvdata(wdd);
-	u32 period = wdd->timeout * USEC_PER_SEC / 2;
+	u32 period = wdt->wdd.timeout * USEC_PER_SEC / 2;
 
 	writel(TIMER_EN | TIMER_PERIODIC | (period - 1),
 	       wdt->tmr_regs + TIMER_PTV);
@@ -72,9 +95,8 @@ static int tegra20_wdt_start(struct watchdog_device *wdd)
 	return tegra20_clk_watchdog_enable(true);
 }
 
-static int tegra20_wdt_stop(struct watchdog_device *wdd)
+static int __tegra20_wdt_stop(struct tegra20_wdt *wdt)
 {
-	struct tegra20_wdt *wdt = watchdog_get_drvdata(wdd);
 	int ret;
 
 	ret = tegra20_clk_watchdog_enable(false);
@@ -86,32 +108,90 @@ static int tegra20_wdt_stop(struct watchdog_device *wdd)
 	return ret;
 }
 
+static int tegra20_wdt_start(struct watchdog_device *wdd)
+{
+	struct tegra20_wdt *wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	mutex_lock(&wdt->lock);
+
+	/* a reset would hang with the VDE partition powered off */
+	if (wdt->vde_off)
+		ret = -EBUSY;
+	else
+		ret = __tegra20_wdt_start(wdt);
+
+	mutex_unlock(&wdt->lock);
+
+	return ret;
+}
+
+static int tegra20_wdt_stop(struct watchdog_device *wdd)
+{
+	struct tegra20_wdt *wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	mutex_lock(&wdt->lock);
+	ret = __tegra20_wdt_stop(wdt);
+	mutex_unlock(&wdt->lock);
+
+	return ret;
+}
+
 static int tegra20_wdt_ping(struct watchdog_device *wdd)
 {
 	struct tegra20_wdt *wdt = watchdog_get_drvdata(wdd);
+	int ret = 0;
+
+	mutex_lock(&wdt->lock);
+
+	/*
+	 * The notifier stopped the watchdog behind the core's back, which keeps
+	 * considering it running. Fail the pings, so that opening the device
+	 * fails, and user space that has it open finds out.
+	 */
+	if (wdt->vde_off) {
+		ret = -EBUSY;
+		goto unlock;
+	}
 
 	/*
 	 * Clearing the interrupt alone doesn't restart the timer's period, so
 	 * the reset could follow as soon as half the timeout after the ping.
 	 * Rewriting the timer setting restarts the period. The interrupt is
-	 * cleared afterwards, so one fired in between doesn't count.
+	 * cleared afterwards, so one fired in between doesn't count. While
+	 * stopped, the timer setting reads back as 0, so this doesn't start it.
 	 */
 	writel(readl(wdt->tmr_regs + TIMER_PTV), wdt->tmr_regs + TIMER_PTV);
 	writel(TIMER_PCR_INTR_CLR, wdt->tmr_regs + TIMER_PCR);
 
-	return 0;
+unlock:
+	mutex_unlock(&wdt->lock);
+
+	return ret;
 }
 
 static int tegra20_wdt_set_timeout(struct watchdog_device *wdd,
 				   unsigned int timeout)
 {
-	wdd->timeout = timeout;
+	struct tegra20_wdt *wdt = watchdog_get_drvdata(wdd);
+	int ret = 0;
 
-	/* starting again reprograms the running watchdog */
-	if (watchdog_active(wdd))
-		return tegra20_wdt_start(wdd);
+	mutex_lock(&wdt->lock);
 
-	return 0;
+	if (wdt->vde_off) {
+		ret = -EBUSY;
+	} else {
+		wdd->timeout = timeout;
+
+		/* starting again reprograms the running watchdog */
+		if (watchdog_active(wdd))
+			ret = __tegra20_wdt_start(wdt);
+	}
+
+	mutex_unlock(&wdt->lock);
+
+	return ret;
 }
 
 static const struct watchdog_info tegra20_wdt_info = {
@@ -130,30 +210,96 @@ static const struct watchdog_ops tegra20_wdt_ops = {
 	.set_timeout =	tegra20_wdt_set_timeout,
 };
 
+/*
+ * This runs outside of the watchdog core's locking, and possibly before the
+ * watchdog is registered, so it must not touch the core's state, such as
+ * WDOG_ACTIVE and WDOG_HW_RUNNING. The core keeps considering a stopped
+ * watchdog as running, along with the references it holds for it, and the
+ * operations refuse to start or ping it instead.
+ */
+static int tegra20_wdt_powergate_notify(struct notifier_block *nb,
+					unsigned long event, void *data)
+{
+	struct tegra20_wdt *wdt = container_of(nb, struct tegra20_wdt,
+					       powergate_nb);
+	unsigned int id = *(unsigned int *)data;
+
+	if (event != TEGRA_PMC_POWERGATE_POWER_OFF ||
+	    id != TEGRA_POWERGATE_VDEC)
+		return NOTIFY_DONE;
+
+	mutex_lock(&wdt->lock);
+
+	if (!wdt->vde_off) {
+		wdt->vde_off = true;
+		__tegra20_wdt_stop(wdt);
+
+		dev_info(wdt->wdd.parent,
+			 "VDE powered off, watchdog stopped for good\n");
+	}
+
+	mutex_unlock(&wdt->lock);
+
+	return NOTIFY_OK;
+}
+
+static void tegra20_wdt_unregister_notifier(void *data)
+{
+	struct tegra20_wdt *wdt = data;
+
+	tegra_pmc_powergate_unregister_notifier(&wdt->powergate_nb);
+}
+
 static int tegra20_wdt_init(struct platform_device *pdev,
 			    struct tegra20_wdt *wdt,
 			    void __iomem *regs)
 {
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, err;
 
 	wdt->tmr_regs = regs;
 
+	ret = devm_mutex_init(dev, &wdt->lock);
+	if (ret)
+		return ret;
+
+	/*
+	 * If the VDE partition is already powered off, the notifier is called
+	 * right away and stops a watchdog left running by the bootloader.
+	 */
+	if (stop_on_vde_off) {
+		wdt->powergate_nb.notifier_call = tegra20_wdt_powergate_notify;
+
+		err = tegra_pmc_powergate_register_notifier(&wdt->powergate_nb);
+		if (err) {
+			dev_warn(dev, "failed to register VDE notifier: %d\n",
+				 err);
+		} else {
+			ret = devm_add_action_or_reset(dev,
+					tegra20_wdt_unregister_notifier, wdt);
+			if (ret)
+				return ret;
+		}
+	}
+
 	/*
 	 * The bootloader may leave the watchdog running. Take it over with
 	 * our own timeout and timer 1, and let the core ping it until user
 	 * space opens the device.
 	 */
-	if (tegra20_clk_watchdog_is_enabled()) {
+	mutex_lock(&wdt->lock);
+
+	if (!wdt->vde_off && tegra20_clk_watchdog_is_enabled()) {
 		dev_info(dev, "watchdog left running by the bootloader, taking it over (timeout %u sec)\n",
 			 wdt->wdd.timeout);
-		ret = tegra20_wdt_start(&wdt->wdd);
-		if (ret)
-			return ret;
-		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
+		ret = __tegra20_wdt_start(wdt);
+		if (!ret)
+			set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
-	return 0;
+	mutex_unlock(&wdt->lock);
+
+	return ret;
 }
 
 static int tegra20_wdt_probe(struct platform_device *pdev)

-- 
2.56.1

