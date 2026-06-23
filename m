Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF1B35DA7B
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246005; cv=none; b=YBLn/SitK6v7hpNMAev9engpO9H1ygZUT7a185ppRQCQ6BPvfvSeqWY0fg5Ri3eNOoBLPMn/phjmgX7ZeArUxGfXzbDQZsPfbN9LBSGlnI+8Lf7t0OA2Cd0ekj8wS/1Y+YQeB4tqv9nH92HB8UVE0Z/38HJJdUINrf4CYPeGXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246005; c=relaxed/simple;
	bh=3QFeDqXTv1wfF5kEEMxvr4oZDoaaVKJx4utG6LAa/a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0clCqMlTyX7slINjxjTQU3PfIeAQCy8lUTT5oCaD9NYyA0hQBYcCGfh0GY7VlXagG4KB3SZnrQnlrtRd7RnwJcDMzaT9xVpMbE5n8i64pQPTDNeQQt5y1IfOeT1dY3VwduN/0uqE/ZynuYNXRrsYXdVuEk1ecIPd0tuRpoLkuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Xw+P9q+2; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Xw+P9q+2"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46a0741a09bso115162f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 13:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782246003; x=1782850803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuzHGLvmYUwhc8I6yyvP2EEo7aup8Z3LHV+PsMNUuA8=;
        b=Xw+P9q+28qZ8dAlwy6dqljDlfMgddIwdGzKN+ihhVo6rISKtrzlQJRgWc0IVKIN6cd
         GuqBtLYAYnUmHaqRaNEze98Mu5yxBGtMolvqNwoLoaEKggxrRPSkce/7K7civqz8nEfb
         WRzRmFkeA8iWoTJfTQrT3/upjzNaDD9JPjX8/y8oMC7VZBMMf7azTt076zC0pGed3Qkk
         CrQ0SpoFR8+7mg60U4pBz4vWxSovIbBMl2q4zzSJePfE+AaaHBhtQszZhLo1M0FwRKzZ
         ihyktt19GR0ehRwx4T/CUyrKJ3DTbVKbyCVSiXZiXYT+REgxRjPUfjN97onkKyiXo1a2
         AdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246003; x=1782850803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuzHGLvmYUwhc8I6yyvP2EEo7aup8Z3LHV+PsMNUuA8=;
        b=sm5mqzpIwuE5i9nBDeyvrdfAlCkojSADettZSYWfDAVFHIKH84gzAX181W88bwOLyW
         tq18b0rZFtdATaFBAwDswKJ1ab2RaxZ/kMgWqxWvAUM9qhk4GxUGIbRSQ6r2zfaPlAq3
         /V3lzEr56rgaJcn7FdEI0vMo6iXxkzCDFiWQv0K63OhV0R67hSJkApjCoE1zJGDbgXD0
         gj3UMfoayLKn+f6bmo7pxN8SBN7+rQKh4KIXdHU0r1yH1jbz9yFclC04K8lycfXrh3mb
         rMJrM9LB9RZwfioLdwtOTQivv3sYIFPbf6sZHX5Q1dKNAAy2fGicGsPP72tDEo4qqJMy
         8C8w==
X-Forwarded-Encrypted: i=1; AHgh+RoSYy9+wrlJFQvYYvNmqNmvwerJ7PGE0oE80FwRWRy6ENpsmcqK8xb0XK4KHvBY4i9CmmQCkB7f3t8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYMz37YSC2YUm03pfaOm5L9YlW7soQzryAf1zAubwMde9nSa+
	2YGk3FbJNVMtfvjxZlT6CLXLuAEsAOa+kAIinyaOiE17W/RR5lIJr2Bt
X-Gm-Gg: AfdE7cnvUmSbxhpXIc+ruv2lJ6kD95+KpmokpufzKX1t81d80ey8YmPcfwaGzkvXMgY
	ChiFSJGxyp7vhefAQL0T2h92gC2JjicIZV+1XaGvfNhTjaB4+NSIhfuBA2gpCBq9AigXljWzF1r
	y54YvrVEf+mWaIyXqbLV7bsKFsEpPjtRd6ZHzVIertzTCe0F096XZZGSTBkto5lPS+XxIfCRObP
	0exSG9z7V4bG16XSMHUFgBbXno2j6PzrbBdGdgpF+rhzFFU0MU3JUb/Sq2BXecH8n2XvEFgcLv1
	2QEcB5ygUnZTFi3RDMOVCiGcUb7o74+tv7QgUtqDof8r6kPXy5e9kFv8pINM20TvXtQRKGjoqk5
	LloTHHG5B+SExA8QuKvKxfCJhST7BQRZppQrEVUFLAXK8wju3TDG1xP1f4vK8wJ2emj7+823CF1
	xojkhL5yZmO4IKXBZM8JyWxKyMgyKKXG+b096kEIxcYJoCRaFR2h7HbHlOg+/8iGI4l+JmYGNX8
	O96wbNm3Am+BXA9KovVAJJP50UrBg/0kYXvuu85+2g=
X-Received: by 2002:a05:6000:2507:b0:43f:dbbf:6d93 with SMTP id ffacd0b85a97d-46adadd2122mr7876270f8f.27.1782246002550;
        Tue, 23 Jun 2026 13:20:02 -0700 (PDT)
Received: from blackbox (dynamic-2a02-3100-a9b8-8b00-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:a9b8:8b00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c3bsm189460f8f.10.2026.06.23.13.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:20:02 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Tue, 23 Jun 2026 22:19:56 +0200
Message-ID: <20260623201956.1324992-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1 at [0]:
- fix typo in my own email address (apologies for the noise)


[0] https://lore.kernel.org/linux-amlogic/20260623201522.1322463-1-martin.blumenstingl@googlemail.com/T/#u


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

