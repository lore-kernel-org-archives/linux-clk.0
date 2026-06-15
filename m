Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE234340DB8
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520533; cv=none; b=Vbe8+Og7JpND6MKeig1MUAHAHhEMt0dN/VdoaaB4+j5tET+e8PrEPKRGO9dEszbtELtawdoNysvIBC0QYkgfWkXEr7gVa4+fRol6yfdXGvDspRzivG7TOawD6RKF+9ojvt9CqoTmQ11HgE7WC8E4Cu4nRFUy2TObf9hv9LUAPdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520533; c=relaxed/simple;
	bh=YGpbOnzNFHtccs1nsI/f3ODNgK61VFnWrTpbiSn+Gyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKQ4Tnxlm1eE1ht4COtSqXMDdCyrDYaBRI/09udeNUBF3aLzNclB6SR0uAG5KpCjG8AISoiM/HgCRt8MpA2G2DwbmeQhCsAo7hBMBTDN0BXGgD8rly8WxQUkGxkPDWP8q3zQ2qBzIBLEsYYsV3f8s7TyqLhg2lP9eU7jLsRMtyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8bsWJig; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8bsWJig"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef1198766so1654109f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520530; x=1782125330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLeDqFqDa9KpNOsyOXrLj3mdC+7gkZq+DBsY04Jn0Wo=;
        b=B8bsWJigtpLPwqRo2K2q9YHVka2iRo4qpphaaV/J8FJodYlKvU65Yawi0xRW+G3mlZ
         jbhDDUI+y23rnn5jILa5d4EniLtryAIjXbgZKmUQhZ5lPjOg/X6INvdOWYXAUjLF3iKO
         7pidSZ3I8YhLlBASXzarrPRub1jro4l3R04VbHu6kEKMZC28VbC0d8nlLVZB5F5M/7M7
         RVv3FnMFKWcYdzgI17zcIH4dyqeu1LBEds1gRtArcX7OA8QNNkBCW759PcQKyx7zRm4I
         rlhrBIdnnC5qeKSM+ZOgXYVeK8j/J6TOtm5RGu5GuMsMuLTnrpMWPxn2+f/+QoGrCu6Z
         z1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520530; x=1782125330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XLeDqFqDa9KpNOsyOXrLj3mdC+7gkZq+DBsY04Jn0Wo=;
        b=qnbfRqHwsR9YdRCil9HbQrVCDcDisgJAvO9gxRrIVSib3OVyl6CnexJniKSFsn6zI6
         Gw/DPthHwt8JzvUz5ItUTPlzpQ7fTQwFHHcMJz+ysm78FIwePKAcT/Dwgx6ozJjrZOsy
         gvIEdikXoWpPJ37clXXsfixIEjen5CphiUPOE/xlLsAMEF6NV4B4k/vxktvQw1GFQjWO
         7i8GKFRSD91xV0G9hndlxdYbGBFq+FvV50JBcr2e6/PHzsf/iqi5V4DL7MwqOowV0XvS
         oCE+Jy4O4O21G172WwvL+55SNEKiEsXfZ5nTQnoPjQ3roZznN7DKVLTDLdOkFOyfg9Xt
         ZV8w==
X-Forwarded-Encrypted: i=1; AFNElJ+9m2n+fhqKjjUXdj6K/8QPX4WhZcR8EMGeCw7ivw8YAoVfKWaaMIn4ihyWYXrUD9zbETg0Q3kNSeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/wx7/pKaqJcEJzx1Jju53fugXMzNjkgBeE7FrWguDz2YjJ3C
	D2zZY0jYxauF4VbJp/5LmYsf/2lk6Im2AX+jL4MUUtmXBlLZf0IANKPp
X-Gm-Gg: Acq92OGUmQO/GlKaiCH6AYbxelUmFGaXkvCqHCahUrSNUydXeHWwD9jgNgsdC6N2uTx
	e5/CKZ4tduC2MHnJ5LuUamyXDzPVp+5UpGcPdTDkyvEMZoMZoSvYErZoneai6XNAPOlBrzU+i5S
	rU1J9lNMkfL6/Wou+V1phDxwO/tendQv+TV0Ec/SazODNQ6+ggWahpsSPdCaXgYpmBj8moHlP86
	9K6+uhgblBjoMLpSxVNFePgnAOuzZ2if/cus8Mrwvm6l3QzXum9zqjDMaizk4Am5huN38XtZUzE
	UXmA4wexdw8rX4rawvEvS1BVTNOcqXHvY+m+FkxTn2uR6p1f/Fj0wZW29v1am/hXrvfslLQh7rN
	ciqqQWRtPEb1qqHoI1BkgsfK6fwdk5ZDhDfZa9Z+3IuhBldWt54oynIiXFtWzg6MuaJ2gCpZ9Us
	Dbc0HrjRJAmmpDlfrja0/3BFAyUca6H5BQTL+XdwrZg83MgGiVjy7VTvhlxwc15Zd2XuoCoGjBP
	jlQMVppj5RGckQaSDKR2ehbgELwBWcwePZn
X-Received: by 2002:a05:6000:2586:b0:460:684d:d565 with SMTP id ffacd0b85a97d-4606f255ab8mr16011008f8f.15.1781520530262;
        Mon, 15 Jun 2026 03:48:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:49 -0700 (PDT)
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
Subject: [PATCH v3 2/5] clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for RZ/T2H LCDC and RTC
Date: Mon, 15 Jun 2026 11:48:42 +0100
Message-ID: <20260615104845.4122868-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No change

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

