Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA1433C1BE
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002775; cv=none; b=sBzaxHqJDnX8vlySqLIoFoM+6dHcD5CFLGKpSjUxDqtkH0WzQhphVT5jgvY8XDzlrVzk1n4TYLw9//HfVgmkpKTCV/LBfPC2QKEgxZHk/7LpL/39g3z9TIlryjqpmjKiUOWQRYf4T+0rUJvsFOE+CJu47F2APu1k4it3OLGyDEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002775; c=relaxed/simple;
	bh=U7gFYCZBHlMfedCTieRMzQlrxSP71kZGI/WHZLC1yjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmeVFCXahgbwzKSSEy1bukk2RbAji1+OjRYmJ817Ak8dEwiozxfTA+E2D2xZiS5M86I5Ck4BmtldzodxPhZbnDp6ic1eaMIfqw0l8XGeIP8b6QGoOEjhfNLBD3wPmTumv+LDltMTlSAK65br/j/rws31yWFOT4ybBeSw7fP/y1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ll2rxxqF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ll2rxxqF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so58114555e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 03:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002772; x=1781607572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwC0/BmrWqLN7wfExQfGq6TF8V6hWtX93QQJcQuLNxk=;
        b=ll2rxxqFGxt/rxdU6+n3LAvlW0lpWoawx9qSNeepSbw8I78aZ8QtGBbZDd/ykQe4Ky
         Qm1DM/kGhUE3RYzhaBJ/zz+lXf1TxFLEdGFy5QbIOD3rn7krz+gqiz5P+af+ZePbY+yb
         zlKTOj8xWyflfqkH4YdNQvxlTROhk99rF/5lv4IpPuA1MZNCUyLPATfX+h7DA+NcbXmU
         UeNSGx80LP11EApntHjNiVu0XBUgKrzGiVpGE0VyecbO5oo8PrQQYYLE2zIyvXxwfny1
         K8UdGE0d9MKjegaLTIVpdpAEPF2+r6UxccOmocPSihlLzhvsKIMEDV6CA9LIF50r4GO+
         W0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002772; x=1781607572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XwC0/BmrWqLN7wfExQfGq6TF8V6hWtX93QQJcQuLNxk=;
        b=cXhbrmAY8pqW2/fuuApXBVqvlhyvJdF4fa++QGjB6SyH6Iq6XLvNUMByRL0oxN5UN+
         r5m9LFI8UpMax9vxwOPrP6WoE0Bal7eoGqdANmqHOrCZflqhvSmShQEsO732ShdtF9cZ
         cs86IWVfkEfU51SVEwrmhhDGMbT349/SQsIgmHIAachyVKJ50WeDWNX/8rjKyTgNHJDx
         KoyVUJEzRdCVR+Kdtq6BSiL+2LglYqILfq0bT4URC6yIlSbIkyYVu9hGq1/OhFwdO4Nr
         bwzR+9Tvoc7DLjeGMMoRBIAIaXxciT0VRbElNrmx9/+FL4Fp/qFGeimy1hA28V74E4dQ
         3UZA==
X-Forwarded-Encrypted: i=1; AFNElJ/u0CTQKtpy61TZkMzIJ9RCVitRaf2yim4wA41E1e0GIIZejJ9xhK3i2+HA090uiRyLOxtbOQUB+gw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7JQOz5G+VXlfXFiSLRNebQn5ILcDbmmDQ49m9mdgVkqFIVrPW
	Y8KPlhTpdoFkli3rSr3dGtiPYkp757Qxh2ax9EDJAAmmlFUvJ2u5jDLs
X-Gm-Gg: Acq92OFWvvMlhL64ASi4Z4nS7DID9d+Y/2bPQ3qtyNU+jQondSJkI3pf9R13bi8Vtsf
	voDlvM8MyeSg3cvO02gGVu5wHHm6T9VSmJ4yRHJQAc8KecpkZY03aAZdveQa0RmI7CDEADIfD5X
	NeQGZJ+8PUUmcVsZY70WWze+CYVONcUalo3VHGVVsUpgKgaBTusTIQBHd4wp40+n2GmDCVBICDg
	YPOo8wodNHwyhlYDZ5/NIj7fmxERHBGpSbEmuTN8wnV9cRDAcnSX60lSzS6u049e1a8u7U5CpE8
	fSW1j09NUiNoiO6bvBuD563kRYxMRp4zsv4acvQWX8Klm46OyEl0ngll51GEyIgSo5rMOkRh7Wv
	GVcs/cnJwcjUjIr1mYIuvMSKR5gRsAK7hwEcr1Sa1bCn8FCx30Ec3EDnRkDVGjoiLc7ZkHCtcHq
	IzMvO+2Cu8cRVj0a9P4WtW181oZgqyL72CS7EiG8LSmRF7h2iNEZpX27q8HB9Ky85/o8FjHD/2h
	6x3TRhPRTTMmrjt6c2K7DgiLVX15+Pykf05jPL4nNa4NE4iuDYck+rbgw==
X-Received: by 2002:a05:600c:34cb:b0:490:4b89:5361 with SMTP id 5b1f17b1804b1-490c25afa03mr312956635e9.7.1781002772434;
        Tue, 09 Jun 2026 03:59:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for RZ/T2H LCDC and RTC
Date: Tue,  9 Jun 2026 11:59:21 +0100
Message-ID: <20260609105924.962573-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce a dedicated clock delay mechanism, cpg_rzt2h_mstp_delay(), to
satisfy the module-stop (MSTP) state release requirements specified in
the RZ/T2H hardware manual.

Per the hardware manual, while a standard 10 us delay (satisfying 7 dummy
reads) is sufficient for most IP blocks, the LCDC requires 100 dummy reads
(142 us) and the RTC requires 300 dummy reads (428 us) to stabilize after
being released from a module-stop state.

Implement a conditional bitmask filter helper that switches wait
intervals based on the packaged module clock index. In
cpg_mstp_clock_endisable(), the clock index and individual target bits are
known, allowing an exact match. In the resume path cpg_mssr_resume_noirq(),
where individual bits are not tracked, pass a fallback register index base
(`reg * 32`) with bit verification masked out to match on the peripheral's
register group block instead.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped using table based approach in favor of direct conditional checks on the clock index.
- Updated commit message to reflect the new approach.
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5b84cbee030b..4ed056b18d31 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -253,6 +253,22 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_priv *priv, u16 offset, u32 val
 	writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
 }
 
+static void cpg_rzt2h_mstp_delay(u32 idx, bool bit_valid)
+{
+	unsigned int mask = bit_valid ? GENMASK(31, 0) : GENMASK(31, 5);
+
+	if (idx == (MOD_CLK_PACK(1204) & mask)) {
+		/* LCDC needs 100 dummy reads, or 142us */
+		udelay(142);
+	} else if (idx == (MOD_CLK_PACK(605) & mask)) {
+		/* RTC needs 300 dummy reads, or 428us */
+		udelay(428);
+	} else {
+		/* default 7 dummy reads, or 10us */
+		udelay(10);
+	}
+}
+
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
@@ -312,7 +328,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		 * register, we simply add a delay after the read operation.
 		 */
 		cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-		udelay(10);
+		cpg_rzt2h_mstp_delay(clock->index, true);
 		return 0;
 	}
 
@@ -1142,7 +1158,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 			cpg_rzt2h_mstp_write(priv, priv->control_regs[reg], newval);
 			/* See cpg_mstp_clock_endisable() on why this is necessary. */
 			cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
-			udelay(10);
+			cpg_rzt2h_mstp_delay(reg * 32, false);
 			continue;
 		} else
 			writel(newval, priv->pub.base0 + priv->control_regs[reg]);
-- 
2.54.0

