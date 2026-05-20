Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D933BED66
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269128; cv=none; b=AHRXS3PbIvMVtI/+ttuAZMN6uIjUqIlp8eIuTVP8IB5oFnzC25uu4li//CS8l8SepuPMFLEigCSQ5+OcUD5w5Amw4K88nWoBhDcKbLaarlpAabIjVlAMNScmt8rjt4MpJxvwZ07AsRm3cIZ2q8MycBv+1rKCR0iPk/O+6RmKynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269128; c=relaxed/simple;
	bh=4Zkx2H0PiH3MVAOPZhP25pMjtvzzQXvPzDboI7IuW88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4HOpE5B50aUSOMfpG/1azs63ByzZWRyGB/mB9Y29lZegarN25S74xWHUkfcaUe6Axbn0D1kLBeEaSx4S9lZHWMvmtbgMOessG1SJLZUFabsTc4azqW7Xs15euLqf2fEhCApY1FJoM46XHEMxK1J3USjQpuWiB/wbhDWlZ/u778=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsuZJ0Sh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsuZJ0Sh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so1876965f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 02:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779269124; x=1779873924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9ii7napKSD9nM0QyMv+uOMieKZGVTfPnkU+URPN/2g=;
        b=BsuZJ0ShulgJ0A3++B4W5Rq8G3OiF75wM/8s44b7wsaxMBezm66rm8cShjPcB+r50B
         ya4+RZ16A0XbMEDS0G4UhwXApIK5K5H9PsOqsHl42lsMu/WldeVHfHwxcTQEixxTaiHM
         ngBX5VpauL4vNw0+HP0QFjniPZ16lA2rxvqv8RMgAD1EEe/pg3mR4j4Hyj0jowq7Cte2
         kYO6r0yR5K5RteuXx60r6/rTvhr6+Z+/VqiCZPJqZ3NuT/HlLEQ2vYDxENUv36iPSLEw
         dVMYcdIJZA2QB48Ik/jK3MtXQwh9vByYgdlvb49/R0iIxWAkrhVh1TW6iXTNOeFVBMBw
         DAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269124; x=1779873924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9ii7napKSD9nM0QyMv+uOMieKZGVTfPnkU+URPN/2g=;
        b=I+kESbgr+YFw34/AIrAdWh0vLfO0eik3LeEAegNBJUs3BpIuQ9U4Y3dqUTCdJ9q1f0
         2HorMqF9STNHp1sdVqDRMxuSIX5Gs9gsa38mZI8t7PAFoMn1cG6fBPJc+vW1hZV1Jv/O
         dv+b+YgohfLTJKAWMueLq0rpJpHuj336m688fi6w3y0Qs7iJxAEZwAsAzCxy3jWYHWbV
         DHbsXFGPn5StMZKDkOPpPK9c9uNPr3WGPHPpKzkPnbTG25NDxAjBpciCh/2s4pQ/4C/L
         1Wn3pSkIxYjvfOSjM0aIBz8pJPTWVyCXTPQgGY8toifbwK6DAPj/h+Rvj3a4RNYNfyKa
         TZJg==
X-Forwarded-Encrypted: i=1; AFNElJ8CA+NZnowB+7LrUSMgIE1a/9JJVTZJk3rVy9g3WJ0MGdORA8S7RSFjlTLe8i6bPkQLDReAeuiEamc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhiYQHtGyhK/WJVPaM0jqXknL1aMXF1TieguO0Sfw/PA4KZc+5
	S5+f+0wMc9CuPIcCTZfQrhldm3dXt1ifDtVPJfyd0RhW6LGSxB/7KdGh
X-Gm-Gg: Acq92OEy95O9gTQK1hL9Jysn1KXwkk2uSDjva2cw/FF1ty4tW7yBOPlKZv3cNuEAVOx
	nnf4CoSyPtK4K2YV8+AFMJUfg3V6B6FAS/3uvfP0zLQB0pd6I+gFAOKLAtY2FfERfQegAmuTvBL
	FV1+JZq22BneFL+PETxQy9Q0wbyXrRyH5NfjpsbDj97JhmloxX2hG7xoXIQo6/mbtKwUWaTbzE6
	2K9rRSqtZn3JWG05LAP+iuknsd1t+pzG+slBIiYwiK1i7dCe4SVS1mamOOeZcAfSizAxstPtf+U
	keZs3Ix9u5uuX2z0u+yrCBllro0p3epgN4yRfFGrN9C3q5Vcf29OS568r3wqFxv/jzwD2LIgbCG
	QYpQf6jozvx0Kt6lTuOftoMMFxoUls7V5JSEw5Xb43eBretKpprZ8/wEx9nQXInBvTuoyVYnKmR
	yurkLATCxLOOQTdtigrwYEuYWPteu+fyOuHwfn9u7K1Pzcaf7VO0GoQXilSqRoUQWmf0JEd3jL0
	YKMfdQ3cLC3+FcCf/L9iTrM0vZ3+9k/NbRyU43g1ZaJolNK
X-Received: by 2002:a05:6000:240b:b0:455:d927:1b30 with SMTP id ffacd0b85a97d-45e5c5f5c36mr39275410f8f.28.1779269123691;
        Wed, 20 May 2026 02:25:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm56276935f8f.7.2026.05.20.02.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:25:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a08g045: Drop unused DEF_G3S_MUX macro
Date: Wed, 20 May 2026 10:25:16 +0100
Message-ID: <20260520092516.69819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Drop the unused DEF_G3S_MUX helper macro from the r9a08g045 CPG
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
DEF_MUX() helper from rzg2l-cpg.h can be used for any future mux
clock definitions instead of maintaining a duplicate local wrapper.
---
 drivers/clk/renesas/r9a08g045-cpg.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 1232fec913eb..733c1ced6224 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -53,13 +53,6 @@
 /* PLL 1/4/6 configuration registers macro. */
 #define G3S_PLL146_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
 
-#define DEF_G3S_MUX(_name, _id, _conf, _parent_names, _mux_flags, _clk_flags) \
-	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = (_conf), \
-		 .parent_names = (_parent_names), \
-		 .num_parents = ARRAY_SIZE((_parent_names)), \
-		 .mux_flags = CLK_MUX_HIWORD_MASK | (_mux_flags), \
-		 .flag = (_clk_flags))
-
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G045_SWD,
-- 
2.54.0

