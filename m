Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285029;
	b=y1mfoDiVd9i2gI2276bdakbCB5f5wNCV9sdgN7JkiokJm8fcp4RWYorM2wdOQc1TdhqQ
	 CWwaJzdKLyoF5JRmIHkPtIh/3TplbSsIXivObc/eHWmXcRNqkEl0NbpWc+LQIK1GLQVNQ
	 /dmobGpwIbOtmZb5wsFnyGqdPNTNkG6Cil1GWM9fJO2QfqLU+mYfIEy3lLOHN+ldST28v
	 lBoze0w4z3042fUuRhFRH0YwUeaBeKQoIHEkSW52ejgE5Hda0FXBafpgnuAa2GbhzCOdg
	 40WHj/jSFA6xGNBWaM7S4GRa8goo3CPBVAQZmDLhHr1CS/pWc8mOubrD+8YJLdHE+5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UhzIB9kDRA/O8B0wyP5frsqnTbd8pw1jKQ9ECYnxkeE=;
	b=aFtDIS70ejZHmRqZWalye6hiE2O5Q3ljWt1PDw8rNAzzGoeMFlcwzK3vw8QV5WLkCtF5
	 9+3wiGO1OlXPvzv9RG7YNqL3sufK3mkNwzz8/opSDehrDDQUqNK23rMOUe/2AostxujvD
	 a/o2k5pMRjuzamYi7zotRBmwfBLOkOrprKhzHKTHhYUt/fkLySp3SJQjYO6jt6Vc0TJLh
	 4uOBRE5V/5L3VOpl2K7gPVuYpcgdDdNIEmqoVrITphJsT8aoDnXEzGMmDj9GLzZbK9Rvn
	 J/yWOyd4PjlopFvzPaFfD4vJ0PhgTW/ZdLtQNpLEGmxIPmc+0RsRJno9h3byOLSlfkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiLOvKEx;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D6A606A320
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 18:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D6A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiLOvKEx
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb61185057so12917065e9.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 10:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285027; x=1795889827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhzIB9kDRA/O8B0wyP5frsqnTbd8pw1jKQ9ECYnxkeE=;
        b=DiLOvKExvnJJabRvpakLyt8W+tMc4HkiXeq0BcKxPBX5QuRH8LhmvoqfCEApUKuzml
         SlxdL30qETTWMhy8wjpGveKsKvquE4kMAG2Pfh2hPPC6tf3hYuIHwHUdxfH8uYelVo7b
         n9SmpzAKedC6QTJwNTofa4A6LIl8cuDPqxEwrdk+bR9iCHRhn0BZD2Frvd5gCd1kdGgk
         cE3FpraODjDzSzMj2arwRw9Ck+FqAxAN87BEDxxAagdYntckh/YwKvCcvs8JzXzdHBej
         KyuMJmwVbBpWxIEmzOqy6my0Cy2LrEhSctI06IFTG35Z8nqq93vLlCEj6nDQD69h/5KW
         axqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285027; x=1795889827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhzIB9kDRA/O8B0wyP5frsqnTbd8pw1jKQ9ECYnxkeE=;
        b=ySrWeIbhgeAiAsM9vKof/OmnhUiNUHQwYLVb5I+CepcpnT7WjMlSlraJd0CQgiC+g+
         gPpcNnK/cdWiz15SvvGLlpF82nD2pRfLtUbjjPntbKtOZ7gsHDHZyM2WXpQ3TA/hLVEF
         kFQP6sSHi9fq5N/jYwBGMwq7LicbCGGFuyHrXYa/ZxuvNJUwir1HSIFvJh5iCffMTPNo
         snw7W91tHemwSUKLq14Rri1+mWSoCRs/gU8Vz/t1csdoAC/I/OeA2hz7vg1kaHGpi4nE
         eqeViJWQAYcCQKPJmSgQ6BCz+M02fg7gcUHVX24LeeuVGoJyMCcP8JOaI/kPUoOYz7Iy
         LYfQ==
X-Forwarded-Encrypted: i=1; AL+hErGkG+M2jv/rQZx9BYNJdNs/q2UBK5w96+GItyQ8KX4xIb0voO6Mk8NYOhtf96fJnxmlPXhaGsRjZuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gMSfUAUKmGfRdESUY2VBQlyyvx6bX8jl2CgmBn2qL9ufyhYaX
	HtIyStkhyjMBT+1ZPpFZMNKWRnqr32XyqMIR3+2BnI6b3hpYWthMU8Xd
X-Gm-Gg: AZFdTZfYCstZB9abyvSakFKAOMRi7w4A88HycYExuh8JBkB4x6ZmL8xZlGfBzSsGmeC
	hKRqz3h42C7iRv5qkrsPQBvb7xrgeOTjg9sFmHeiv3karBkk15txavbQtT5f6Gx5MZckvfx88su
	skulXJRvUMqJC4K5xonfirxmKWEzMjItdR7cFpk0+/f7fxrM771zVLlCiyGuqQ7zxcLKO7n0QwK
	v0Iv8KT0ko7AnEMD9E8ztIm5FUmIOzaYSUkl3RC3P6mZM3pBU0FJLfCqGl+9znUUp2flvkKqWIK
	2DwOVjLWUU0pqkE62vVhNJSlCTSaaY2M2w9k3AyWncspVAFFExWxbc+Nt+y5sd2z/EMMivu493l
	0tYtFuj1KwHIw0DPUDNi0CzVEEZWACkEJW4Lu7mS7rvBEt49+B89Y4tBkNXjsl8tBa8Up8+aiUE
	kVK4G3hR2JJRuunBO1TkpiEkoqrpzj/heYpEKdv83+xUDKwKJ8QYLtKzrqNarLUIIV8SCplas25
	LwRNvOFVmeMR7zaSIwVKjQO1AOAVH3GMUSpW+bVbA50gTqcXHZs1IC70E7LOVVUP9wTY3dp1F9I
	is6zEMCTXzdp6EcsSQp5EyN2ofofue1GjSAAmSJnYSAtEFGLI4/+a3R79OQhESa8NvpseOc0
X-Received: by 2002:a05:600d:82c5:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb88822642mr168886035e9.31.1795285027487;
        Sat, 21 Nov 2026 10:17:07 -0800 (PST)
Received: from localhost-live.home.vlan10 (053da81f.dynamic.tele-ag.de. [5.61.168.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm152782155e9.0.2026.11.21.10.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:17:07 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH v2] clk: rp1: allow the clock provider to be probed again
Date: Sat, 21 Nov 2026 18:16:50 +0000
Message-ID: <20261121181650.143474-1-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock descriptors are static. The clock core clears hw.init when a
clock is registered. When RP1 is unbound and bound again, the second
probe registers the clocks without init data and oopses:

  pc : __clk_register+0x5c/0x9dc
  Call trace:
   __clk_register+0x5c/0x9dc (P)
   devm_clk_hw_register+0x5c/0xe0
   rp1_register_pll+0x24/0x40
   rp1_clk_probe+0xc0/0x168

The clock core also leaves hw.core pointing to the freed clk_core on
unregister. Some clocks refer to a parent that is registered after
them, e.g. clk_mipi0_dpi to clksrc_mipi0_dsi_byteclk. On the second
probe, their parent lookup can use the stale clk_core.

Restore hw.init and clear the stale state of all descriptors before
registering them.

Fixes: 6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
v2:
- Also clear hw.core, div.hw.core and cached_rate of all descriptors
  before registering them (Sashiko review)

v1: https://lore.kernel.org/all/20261121163915.86681-1-joshuacov@gmail.com/

 drivers/clk/clk-rp1.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index 1dd276dd2b..c261306dcd 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -363,6 +363,7 @@ struct rp1_clk_desc {
 				       struct rp1_clk_desc *desc);
 	const void *data;
 	struct clk_hw hw;
+	const struct clk_init_data *init;
 	struct rp1_clockman *clockman;
 	unsigned long cached_rate;
 	struct clk_divider div;
@@ -2416,6 +2417,18 @@ static int rp1_clk_probe(struct platform_device *pdev)
 	clockman->onecell.num = asize;
 	hws = clockman->onecell.hws;
 
+	for (i = 0; i < asize; i++) {
+		desc = clk_desc_array[i];
+		if (!desc)
+			continue;
+		if (!desc->init)
+			desc->init = desc->hw.init;
+		desc->hw.init = desc->init;
+		desc->hw.core = NULL;
+		desc->div.hw.core = NULL;
+		desc->cached_rate = 0;
+	}
+
 	for (i = 0; i < asize; i++) {
 		desc = clk_desc_array[i];
 		if (desc && desc->clk_register && desc->data)
-- 
2.56.0

