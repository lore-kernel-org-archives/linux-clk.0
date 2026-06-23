Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EDF35DA7B
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245746; cv=none; b=fcNcfVZudzhEo5TejLqs/17Mt1ZocSzf/pPqxc4YhlG4cE91lYuZsIU3LmjVtzVw5P8hOhFfCctBYIhr77teP7lOMiB3dh++8+HXXhI5APZrJ5sOGuryWrwITqhvod2swkjMWB/poAzK/iHkgBMQWTqQHmjcgUjotMaUWvPyFNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245746; c=relaxed/simple;
	bh=CbP4KJ9k+O901OlY1cJCxzmihYe7rbDvWYkGj/7Eoz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmviZu2IeslLEgRNlTuW9t3QpnznQ7+TTkpNq/J0Lw2c+rOfdnWInEgFT7XR/MdiPKhYAnKh2L7R5Ooz5Y2IlJrm2PVF1D+hcEl69szR5oGV5MXlp4zIhH3/eMk5NdTDKa+U6ItM45WfN4blpX1TvA3PDsXRBYndyFDXz55sfPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=gtSXQjFP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gtSXQjFP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3637b90so1766395e9.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 13:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782245743; x=1782850543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PApkcFbTCnyRYxUfeFOnQfHUO+BQWYgzQ1hqLVaTxfY=;
        b=gtSXQjFPRVJjZLTdsuMzuB+a9GT46BEQawwHeGpAMdxYGy7TPqOuD5ofyQzpNlffSb
         ElTifcn0HRixGB9yb6pZ+kjRWFgFlQi9Mj+t1pKFFTgnmgqeFg87qrEefjiF/jXx/Hd2
         jWjtARilhDpsYPXhO9+PIX/pH397rE7+iAVOljDS91kiqoD9ByOmX3QDkvLJPwo/o2lu
         vzjzAu6Irj7tzEKyx5xKBgt4tO2mhwJGZjvidsCOhjrT46/U3a4M3TGHaMsHJv84I2Eo
         omhs6L9XU6TgP8AX1nMQcMM/JeqMYZBLrf0K9VNEbjPyKs1fACXtDPdQvFQvvjRPwtE1
         hb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245743; x=1782850543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PApkcFbTCnyRYxUfeFOnQfHUO+BQWYgzQ1hqLVaTxfY=;
        b=nGOTRRFLFvYUW4GprjLFPNGk2jeyvwbg+ehM65j+VmoQpxiCzxAex3gRbaOqjEIOLM
         +Q49B8Na5DQnnEmrGkHm2NozgyMYModW20MPXtd5SGlG+br7xYtegCD6ZxVfLITrxY4Q
         qiOFbyjctnO2xRE+ZLaDmyrhBeVyxJ3LSL07+7T7ZGiPYbxGUhPexn3eBF7LS4PTzZD3
         KAXR/SPEljax6RrbxSNYL53XuBWCc4PZpFGWVW7zJR7Ckdq93biEg7czdhbp5bmREtst
         lCgB5ocIpwmyzRuncS2oYhIJny2PUjvRAuyAYFghnHgipYX3o3g1l/7i43/D5ciIB/lB
         DNDA==
X-Forwarded-Encrypted: i=1; AFNElJ+F9Tt5YRtxUY/edwMEo24AtS5Ckm2dl5yJHzvSSerZ9ySB805ge1K/5OnHZAps6d98sNOegZeJ4e4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyz3hWgMp2EKxs2xykSLF48fMjHJ9ODinuS+8qSN/PdXPRNhR/
	AAeLdqMmKmuu+ZqlJR+DJYxKJiaAFCu2QxKEl428OWCgfUUuRBxnk2kO
X-Gm-Gg: AfdE7cl0nIUZJ9OxcGtGPRrjtwX8ECxKe9667wwJgB9V6fhoUtr3bWYwyHiW8LaWWWY
	+wENTppKtMa3uM9O4GHh6Jd1AEtLfwvhYUpYeKQhG+PqmP6Vh4sAAJmFTv+NE514lrKBz7Yk6ZP
	NvYKjqKaodoA0qspNsZQsl2n4907rFtcqUuYsREvrZ7fZ/QBFo3Z6CyFDcAeqUzyjpGG6THhXN9
	UI2CX/4vJ/lmu1fKxfzVBAUluMbBXUE1s4S1VAGp4H8G1yVjDydkuKTi7PsyciUbVR0tfGlj4O2
	qMesKrDa83G9qxE39m3z/PVrQmcim9wMgBok3D79Os5lRL1+EujfvzgmHOh63xF5jv4k8tyBgop
	uoF9JqqSzxIuAnGXi4nI+2PYh9RUihmZwsldbluTq39fzqI7FYeCaIjyHrDXqZKv+Uoog/MAlFj
	uBbdYVEi7Kdp6LuBFkPQy4U6og97Ta0XJi1jci20DDYaPl1IcVnhzMatv54uFCMAIkk3lQjprsb
	BT9Yp+ODq0HJgY8JFXzkA0TiDA8NmrqoYJ66lSDIGY=
X-Received: by 2002:a05:600c:820e:b0:491:7325:39c4 with SMTP id 5b1f17b1804b1-4926087f7f8mr1421665e9.34.1782245743299;
        Tue, 23 Jun 2026 13:15:43 -0700 (PDT)
Received: from blackbox (dynamic-2a02-3100-a9b8-8b00-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:a9b8:8b00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4923fd1f886sm374378335e9.4.2026.06.23.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:15:42 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumentstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Tue, 23 Jun 2026 22:15:22 +0200
Message-ID: <20260623201522.1322463-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Blumenstingl <martin.blumentstingl@googlemail.com>

The following out-of-bounds read has been observed by Christian on a
GXBB WeTek Hub:
==================================================================
BUG: KASAN: global-out-of-bounds in __clk_register+0x1b70/0x2418
Read of size 8 at addr ffffd66320cf88e0 by task swapper/0/1

CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc5 #1 PREEMPT
Hardware name: WeTek Hub (DT)
Call trace:
 show_stack+0x14/0x20 (C)
 dump_stack_lvl+0x74/0x94
 print_report+0x164/0x4b0
 kasan_report+0x98/0xd8
 __asan_report_load8_noabort+0x1c/0x24
 __clk_register+0x1b70/0x2418
 devm_clk_hw_register+0x74/0x15c
 meson_clkc_init+0xd4/0x20c
 meson_clkc_syscon_probe+0x5c/0x94
 platform_probe+0xbc/0x17c
 really_probe+0x184/0x844
 __driver_probe_device+0x154/0x35c
 driver_probe_device+0x60/0x188
 __driver_attach+0x168/0x4a0
 bus_for_each_dev+0xec/0x180
 driver_attach+0x38/0x58
 bus_add_driver+0x238/0x4c0
 driver_register+0x150/0x388
 __platform_driver_register+0x54/0x7c
 gxbb_clkc_driver_init+0x18/0x20
 do_one_initcall+0xb8/0x340
 kernel_init_freeable+0x49c/0x52c
 kernel_init+0x24/0x148
 ret_from_fork+0x10/0x20

The buggy address belongs to the variable:
 gxbb_32k_clk_parents+0x60/0x400

The buggy address belongs to a vmalloc virtual mapping
The buggy address belongs to the physical page:

Memory state around the buggy address:
 ffffd66320cf8780: 00 00 00 00 f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
 ffffd66320cf8800: 00 04 f9 f9 f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9
>ffffd66320cf8880: 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9 f9 f9
                                                       ^
 ffffd66320cf8900: 00 01 f9 f9 f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9
 ffffd66320cf8980: 00 00 02 f9 f9 f9 f9 f9 00 00 02 f9 f9 f9 f9 f9
==================================================================

Commit 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock
parent") dropped a non-existing clock parent from the gxbb_32k_clk_sel
mux but didn't adjust the hard-coded num_parents field. Fix the actual
number of parents of that mux by using ARRAY_SIZE instead (avoiding
similar problems in future).

Fixes: 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock parent")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Cc: stable@vger.kernel.org
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumentstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index f9131d014ef4..d432e08d1777 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1394,7 +1394,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
 		.name = "32k_clk_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = gxbb_32k_clk_parents,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gxbb_32k_clk_parents),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
-- 
2.54.0

