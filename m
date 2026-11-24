Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554381;
	b=llGzx2eCg41jXgLBYVimLEYWBXDex6cByeRC4D1AU3XsVLPzZ1W+d6I7gS3pKH1fuIKJ
	 +XsSRpHa8xg94oN8m+5n0VDWUk00syWRUbBHCruKbn7OPDsql4ZddcY/r053C+MMR/wHF
	 QALJpfLvQQ3p9XdCwvG9p5RnkggxuJiNMnoIuMXRxqX4OeQVvIeXh0g3BeXupuySHdyvP
	 BqyqAYXDB683ZO8QrUFqSCKkHGFnSeKu7rfRccOVMc3NItDJ/1nYTForoegagGQ0aJnvc
	 cf9DHfoU7+aawip9iE7sk1M0js0ROFVeNNxnskqGeicom/RZpxDbnOy+Slgw5bIvA+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Ji5DBvHMt9pEPGCAjXMKV7F4pZO8U3K9gVXBlfCjXhU=;
	b=Z4m4oitkNKdMEoL7SbxWn25QsebkQm1Y/yTXrlNT4+7TtbBBk4sqZUS970E/yW7r4rXG
	 JYJ1og7N2n4W8xiOiCNqusT0kPxYCn0xGyfhEuedowGzImLVcmuyBQeyDrtzS4eEeCSa3
	 NyeB4+lIONijkXzrVSp57KwQYA8+LdXZ/fOIjOD/pf9ogsgl3aZs/pVgFnOJav2DlIQQy
	 sAlTce10dOhe8ngCGejBZFU8ubdT1p7EPTQbU7Y994NZhqSmHSFXjEj9t58dIR15vAKBi
	 bMRBM02I9dfODaZqqQydUyeFFGqME4S9Wo7WOIfSylb1M/WYQfNcQLzmCd7JtlfleJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmRHwFwT;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034BE606A33C
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 21:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 034BE606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmRHwFwT
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae7d1ce1bfso43378561fa.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 13:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554378; x=1796159178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ji5DBvHMt9pEPGCAjXMKV7F4pZO8U3K9gVXBlfCjXhU=;
        b=OmRHwFwTSawmkAFTR+o9w8xLXrxw7BfrpxHcwbaPH2om110faqBJfdN3CDbluszpla
         MCCatk5dE0MmP31YcqDqerFj7VzrSmeoQ6UgRoURqgJbg3tvTLPK3sSHdU/txDIRzCu4
         /GDjSoJKo/n24GC5G2O3xTy2o1Jtjv7zVzLyAuBAJv9beFIE1vfwsOt7NyBDlWl2262K
         3jpc5jYMz3F0/PWkbQMuGx027L6vwwl4AYy7Ust8JJ1H86hY7MfeHndyAAgKBq8YT6Xx
         RYm0U9a09PQznO/2YrgqaRGylyoTDIPFFo5eISmZgxcqnYgRxiuzqEN8CegtQ1Uz5d3X
         DXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554378; x=1796159178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ji5DBvHMt9pEPGCAjXMKV7F4pZO8U3K9gVXBlfCjXhU=;
        b=RPGEm6o2xZaGsJnK3uwwnuxHmg2oEcWvKC4ziY2HgUiUc5w3/OaNlWKTsMtqjeZcZX
         ufV9sE2GrcJtwio12beFT2dsk0g8ZgJplUXgqXqTrV/Kyn5vPzqPF9E7tV7J9q/PEtSn
         Ur6Ed1a049mdiGWgxxKwfqNg4vzFLjQoN1f2lemDYIQOhW2kqI2u9OaysA0EkWvLSSSh
         OnhgB7YkDGYUIopOLDrTD8N0uudeHVArKEjPBpJlluOaEVXFdBxDYAHbaWF/gn5brgBL
         S07czcfZBA3AlS7aKVaqDmSB+/HwCioQbNZnzD2mnoUAtgE6DDIZObcS8qONSrHzFac1
         UJZA==
X-Forwarded-Encrypted: i=1; AL+hErFISf0xadh4h4ecU4IY0jBmJ5fspCc6uBJ/PlhtnjuLOquC1FwFDAasw1lXrvZTbq5yRXFkNhn45hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CCo4gsTygjTkBTkNxmer6EuAbOlD56nBqjj0XJzg80rnMeAQJ
	zLvp6YxGqSCHWHTWupFJcZwDVbJ0Pq1BlyrNDQUlLI5Dh8QbX0qwR0gD
X-Gm-Gg: AZFdTZcG8V0W7XdJJGg44wQo3NkJ0WiMGXNMvkQtmdYOKriSa33ecM7lofSTuT7oZKN
	zeGNeE8aHmhf8UFCZeJrAt5DLJhNEEV5sDLIMAx7KJs7mhWjCNB9m5ezaVPT6mO0XInveet92vq
	GcYVZlBWOyMs3W0l7TkmqD8XRSXDCL5cXppcnGtk7dl4gnNZq56u4Sd+6xKH1gOj6ue0mAELiAk
	aXYjIho/sApVeYgvIunjfqaLXpoCZRSnpqBBgzYSRPysuB7ynn1zDMXGeQijTnvfm9NXFFR1Ib1
	SPJsl28HEe4ODW7sus0P1lxoB9achfnJTtviS1NNu+iUwtjZo8NnmFzPYewdHJ4cbLsxuL7Z1gG
	ubYcDIvWbLWqRClu68boTOIQfjeNixgzimPtwYkNpBt4bxZOMU4rLW42lKkt0iW21uWvFqsR7FS
	bGkr4BjLEjCa1byuMEXpv8bCVXlfw1n3KH41qcX/L+8TnJl8xiSQRx4/rXpBOoFkXqeYMtU8S2W
	e2kBsQfD3ePbcdf4gw9dA4HlvvMX7KmcLGGMtJetg99BdGy9cx9+BBod8SUd9diYnZgcJzFV7kt
	h7A5Z1GJ5+gC2C+aGXGIalVD5+ksMGGwobR0TibNKecNKQ5Wv+xF1PB132QY3A==
X-Received: by 2002:a05:6512:6886:20b0:5c1:57f6:2a55 with SMTP id 2adb3069b0e04-5c1bc7c3c66mr3363374e87.22.1795554377996;
        Tue, 24 Nov 2026 13:06:17 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm4099045e87.53.2026.11.24.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:06:17 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 24 Nov 2026 22:06:00 +0100
Subject: [PATCH v2 2/6] clk: tegra20: Add watchdog reset control helpers
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
Message-Id: <20261124-t20-for-upstream-v2-2-440116846f97@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4485;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=+8ECPpoBhBW0hO7OEab5QMQVuU3PE8Uce0sGxdle7g4=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbrHyeRq/9eFy1l7my/tM1WqGl1Z97lTWrt5WLJtTJck
 53fVWp1lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgIkw/WX47x8tyL+yytPIy11a
 Kfvdl/hrn3zd8jPyLZO0PT8mGgvPZmS4XB5k9yasIFor3eenj+i31uqLax4F7PLmZFsh/rxibj8
 7AA==
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

Tegra20 has no watchdog block. Instead, the clock and reset controller
can reset the system when the interrupt of timer 1 or 2 fires while the
previous one is still pending, which is enabled through its RST_SOURCE
register. The clock driver doesn't use this register otherwise.

Export helpers to enable and disable this reset with timer 1, and to
check whether a bootloader left it enabled, so that a watchdog driver
doesn't have to map the controller's registers behind its back. The
read-modify-write of RST_SOURCE is serialized by a spinlock of its own.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 60 +++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/tegra.h       | 16 +++++++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 9da82dd7965ba..4b2e0e4540a5c 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -17,6 +17,13 @@
 #include "clk.h"
 #include "clk-id.h"
 
+#define RST_SOURCE 0x0
+#define RST_SOURCE_WDT_EN BIT(5)
+#define RST_SOURCE_WDT_SEL_TMR2 BIT(4)
+#define RST_SOURCE_WDT_SYS_RST_EN BIT(2)
+#define RST_SOURCE_WDT_MASK (RST_SOURCE_WDT_EN | RST_SOURCE_WDT_SEL_TMR2 | \
+			     RST_SOURCE_WDT_SYS_RST_EN)
+
 #define MISC_CLK_ENB 0x48
 
 #define OSC_CTRL 0x50
@@ -132,6 +139,8 @@ static struct cpu_clk_suspend_context {
 static void __iomem *clk_base;
 static void __iomem *pmc_base;
 
+static DEFINE_SPINLOCK(rst_source_lock);
+
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
 	TEGRA_INIT_DATA(_name, NULL, NULL, _parents, _offset,	\
@@ -1164,6 +1173,57 @@ static void __init tegra20_clock_init(struct device_node *np)
 }
 CLK_OF_DECLARE_DRIVER(tegra20, "nvidia,tegra20-car", tegra20_clock_init);
 
+/**
+ * tegra20_clk_watchdog_enable() - enable or disable the watchdog reset
+ * @enable: whether to enable the reset
+ *
+ * Tegra20 has no watchdog block. Instead, the clock and reset controller can
+ * reset the system when the interrupt of timer 1 or 2 fires while the previous
+ * one is still pending, which is enabled through the RST_SOURCE register. This
+ * enables it with timer 1.
+ *
+ * Return: 0 on success, or -ENODEV if the clock and reset controller isn't
+ * Tegra20's.
+ */
+int tegra20_clk_watchdog_enable(bool enable)
+{
+	unsigned long flags;
+	u32 val;
+
+	if (!clk_base)
+		return -ENODEV;
+
+	spin_lock_irqsave(&rst_source_lock, flags);
+
+	val = readl(clk_base + RST_SOURCE);
+	val &= ~RST_SOURCE_WDT_MASK;
+	if (enable)
+		val |= RST_SOURCE_WDT_EN | RST_SOURCE_WDT_SYS_RST_EN;
+	writel(val, clk_base + RST_SOURCE);
+
+	spin_unlock_irqrestore(&rst_source_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra20_clk_watchdog_enable);
+
+/**
+ * tegra20_clk_watchdog_is_enabled() - check whether the watchdog reset is enabled
+ *
+ * A bootloader may leave the watchdog reset enabled for the kernel to take it
+ * over.
+ *
+ * Return: true if the watchdog reset is enabled, false otherwise.
+ */
+bool tegra20_clk_watchdog_is_enabled(void)
+{
+	if (!clk_base)
+		return false;
+
+	return readl(clk_base + RST_SOURCE) & RST_SOURCE_WDT_EN;
+}
+EXPORT_SYMBOL_GPL(tegra20_clk_watchdog_is_enabled);
+
 /*
  * Clocks that use runtime PM can't be created at the tegra20_clock_init
  * time because drivers' base isn't initialized yet, and thus platform
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index f1034e14c1a44..2c88b9c78d88d 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -6,6 +6,7 @@
 #ifndef __LINUX_CLK_TEGRA_H_
 #define __LINUX_CLK_TEGRA_H_
 
+#include <linux/errno.h>
 #include <linux/types.h>
 #include <linux/bug.h>
 
@@ -195,6 +196,21 @@ tegra20_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same)
 }
 #endif
 
+#ifdef CONFIG_ARCH_TEGRA_2x_SOC
+int tegra20_clk_watchdog_enable(bool enable);
+bool tegra20_clk_watchdog_is_enabled(void);
+#else
+static inline int tegra20_clk_watchdog_enable(bool enable)
+{
+	return -ENODEV;
+}
+
+static inline bool tegra20_clk_watchdog_is_enabled(void)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_TEGRA124_CLK_EMC
 void tegra124_clk_set_emc_callbacks(tegra124_emc_prepare_timing_change_cb *prep_cb,
 				    tegra124_emc_complete_timing_change_cb *complete_cb);

-- 
2.56.1

