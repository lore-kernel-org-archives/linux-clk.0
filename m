Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D277833F8B4
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692983; cv=none; b=Xxl8M3ivvotJr38torbMnXEih0uJMG14k9210BADtfqpYxWk7KI0ZVaCRtFM54eYMnLVnxPF0MdLXcVsbuyvMNV2ObK04cMwstCWhlp5O/3r23sYbGzX0MvX3aZcXM+j8J2rRhAPJEK3vO6Efd9CK+6smPS9VID1z4i328YsWBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692983; c=relaxed/simple;
	bh=kaZWdUsxqAV2QF2frcp8+EsbD+tpAWpuVVcoSrWGqWU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rHMxbXDkIuD9dZjD/zhOL805nvORtYVoPT6bXtEuL7BEqShaZ6JuXH9cnyUiOOGfnkj+LHGKSADLZRdkgXjLU0zKHzHTdb5Qf7lXQM0fMa/0dvpLqDgMWkZycrqk5W9NqicahRZwAQFBpb4lCklSWZn+JPROJjz3IK8PEyluAwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjV/NspG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjV/NspG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so8894905e9.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 07:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783692980; x=1784297780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HeYkzTq5Qi11epBMFr4FwcZKXg49Mi6I0xbzoJQT6PE=;
        b=pjV/NspGCNa0QL7G4FSxkvkgIn8olwWGNFSkuR7OHbxNC5/ycX1r5xwS2BX6Ftc2mG
         A8OuABb+buESAMj5PrRSOLB9DYAlCPqYADAs0v7qWVLDcGAiDMdFNsvzEu20tSn0rl8Z
         VLLyhjrgsgGK7WPAS5grb3rQ/+DwYYvm9hccrAG69nN1Cv0L1+Yxom84S4H907lFUGFT
         bcT06+qWwYxSsWD+5WtW9IqsBaUNe9oh0jcalv5ym5PuzXTP/G7/aOaKzxfWzYALBfPD
         9ZI2hXxpyzjEhSBOaQH1xPpkQU21RZeaWJo89I2n2OuQt3gW2AbSJdmew3B+P10M4ypa
         F6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692980; x=1784297780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HeYkzTq5Qi11epBMFr4FwcZKXg49Mi6I0xbzoJQT6PE=;
        b=i3aoAuzK2AKKqRFruk+84b+Z4sbC+pYy0QJJeuvY+wl/anj6R7vmRZ5vQDnxK0H9bh
         ImESMAAGObsG58A4pF1rs+U6IpX7KMXlgMpL2F0V+r2b30H8t2ZLCVC56Mu95kW1eW8/
         MbMx2ho6pGGmHNwH78+W0Bpv8/ANC31eM3HyAn+aMmIJpIoQTRBXGNYksLoWvHAlyjs4
         NdS3HOb7SIQnLODkmJk8N0rguPKPuwtpEi+Im/+RPyymfyFTdEQkK2zSlEtMs6AOutVQ
         EgA2q7+JftNzcTGQselCrMRNAzWmydXRGOo/PZZOe7amFUzTl6gGu9TjSAO88S5AyH21
         w6Hg==
X-Forwarded-Encrypted: i=1; AHgh+RplcDGhakx4hg5x14BFg9GoBPDFnuYL3GKsidu1uG44yT8nL+dtlra/jsC2J3bfw4PpF2RoAATEG88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZYokQbqDbqcxn6CZ1MQpzg9J/z9E/z1prdjWRsQVEPPqfxoDG
	OeRFFxoWCRmvY3uLGaGU4GvqjZt9SVN0QQW1ikfoNrYTgjXRmOSrvXMh
X-Gm-Gg: AfdE7ck+7sfInweO8vQv0OSkDLp6EPapbaRyT1WczTHr6IH4cW4nOdXEx8hOlToQ8LN
	m4uiS7ZLO9olmSc6dRa2oSFSxKqBHDxyR1S3oqhPotKjyGECugOj/pjLFNaLMcN7bAThsk9i6Sx
	nDNuW5Wtb6KifTX+ie3n66aV10O1DIMtGpMcwFGPLMYSL/ah1l9tUVG/LEtvkVCRY260fTkn4lI
	vLyEFv3bGWsRI/nZBZ2TVE0pUSin6kGycWGjbiGSgILYcSyQ1j9TeeLsYhmtK7AD+bc2+Sr2vdi
	WR2xb/Yu9cl/JKpvEl5I7PLEoo3f02evkyOtMYYcgDIWyqRNsnmIvRkA6FLmIaXdXYoCzKbIjIq
	oawVzJsNogwrMs0O3Q5pGpscGlTBQElQxDIm1onyfsqJGnlnYkDIiTVN2AIekzgEDfex7cyMFja
	XQpSV+aIebtz50z6Om8TkUbLxJ04R+AywkZA==
X-Received: by 2002:a05:600c:8b4b:b0:493:bfad:9d99 with SMTP id 5b1f17b1804b1-493e68c2777mr120283455e9.13.1783692979931;
        Fri, 10 Jul 2026 07:16:19 -0700 (PDT)
Received: from furies.ics.forth.gr ([139.91.92.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccaf1sm251239255e9.2.2026.07.10.07.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:16:19 -0700 (PDT)
From: kdamaski <kostas.damaskinakis@gmail.com>
To: Yifeng Huang <huangyifeng@eswincomputing.com>,
	Xuyang Dong <dongxuyang@eswincomputing.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kostas Damaskinakis <kostas.damaskinakis@gmail.com>
Subject: [PATCH] clk: eswin: Zero-initialize stack-allocated clk_init_data
Date: Fri, 10 Jul 2026 17:15:20 +0300
Message-Id: <20260710141520.285132-1-kostas.damaskinakis@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kostas Damaskinakis <kostas.damaskinakis@gmail.com>

eswin_clk_register_pll() and eswin_register_clkdiv() declare a struct
clk_init_data on the stack and only initialize some of its fields
(parent_data respectively parent_hws). clk_core_populate_parent_map()
checks parent_names first and parent_data second before falling back
to parent_hws, so leftover stack garbage in the uninitialized fields
hijacks parent resolution and the clk core dereferences a bogus
pointer:

  Unable to handle kernel NULL pointer dereference at virtual address 000000000000000c
  Oops [#1]
  epc : __clk_register+0x31a/0x7f0
  [<ffffffff805dc774>] __clk_register+0x31a/0x7f0
  [<ffffffff805dcd76>] devm_clk_hw_register+0x2a/0x94
  [<ffffffff805e319a>] eswin_register_clkdiv+0x80/0xd0
  [<ffffffff805e34a0>] eswin_clk_register_clks+0x162/0x1a0
  [<ffffffff805e3736>] eic7700_clk_probe+0x146/0x180
  [<ffffffff8065d23c>] platform_probe+0x3c/0x7a

Observed on EIC7700 hardware (with the driver backported to a 6.17
tree); whether the bug triggers depends entirely on what the stack
happens to contain when the registration helpers run.

Zero-initialize both structures.

Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
Signed-off-by: Kostas Damaskinakis <kostas.damaskinakis@gmail.com>
---
 drivers/clk/eswin/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/eswin/clk.c b/drivers/clk/eswin/clk.c
index e09a52cc3..79d1e4c5e 100644
--- a/drivers/clk/eswin/clk.c
+++ b/drivers/clk/eswin/clk.c
@@ -204,7 +204,7 @@ int eswin_clk_register_pll(struct device *dev, struct eswin_pll_clock *clks,
 			   int nums, struct eswin_clock_data *data)
 {
 	struct eswin_clk_pll *p_clk = NULL;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_hw *clk_hw;
 	int i, ret;
 
@@ -419,7 +419,7 @@ struct clk_hw *eswin_register_clkdiv(struct device *dev, unsigned int id,
 				     unsigned long priv_flag, spinlock_t *lock)
 {
 	struct eswin_divider_clock *dclk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk_hw *clk_hw;
 	int ret;
 
-- 
2.34.1

