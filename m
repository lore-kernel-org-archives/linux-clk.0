Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394553A0EAE
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377419; cv=none; b=Eh+tF0xPqAVO6gv6Agp8BqOh6AvQxP1IfljFi/u+eh5si9sM78ZHSHVHZiaSfxFv4q7zZYtbIn8IWOIt8JbLOG0DRnj1cH3PbRx71/KWNoGCUWItIDjvVlue8GaZXfs3L+UnvtJL6AVahjep3T5egsil/zKR8EkJ+soHRsvCyGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377419; c=relaxed/simple;
	bh=BTx4WOXMeHUHVYxoavX4wm/her8LbKRpDgkVrU+FqEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOkaDkIf9o6bEaC5PtJX+oRE1KUrxI5nH71MsRHqNMPIyrQz6VPw9V6iUSWgHKiBOxxwDd0+rdPaoXWbmV7cq1HI+EcvSOuiuOh9m5SgXV31RQOgISE5wP6UOFAKSr9Fyo2U1W8nUDYlf+9DWonZxASu7pHPG1ExKoDEVqi8UFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTGu7rBp; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTGu7rBp"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43621bf67ceso425308f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 03:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770377418; x=1770982218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKwmbBUyV+FUkyuhoc4dTbfXs9M5ae9G0YS2ltMaFQ4=;
        b=GTGu7rBp21eAe3rqO6i9EdkXhQ5EszVZXvr62yyPLrgyZR7XRY1aAZ7wH8aiS5JNOJ
         HKGFUWsZhCuLko4dih6v0LUGm6gW2WGiQ1aIwHJmPsmGpczAfHgEUY1+WevKE18n/rwA
         Y4WufG1vro1W153TipsUr4tzLy9g4ji9aT/t3zUbS6NKcFWmRvLJqlq++OMKrwAAZPqN
         07+FQAJakCIoAkAhxxhjikQ7jNCEWRKzdz4tCGmAkgd6IvR/lMRpgsF0pcQPiy7nOfLV
         iuqi6dWVdYCNtwsu7pJ63DbpD3lEB7iK9YAF/C6ok3lkjteamD0EKp/qmyOlUbQdORVS
         GkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377418; x=1770982218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EKwmbBUyV+FUkyuhoc4dTbfXs9M5ae9G0YS2ltMaFQ4=;
        b=sTlv8DLNXzdO2Eq6QPmT9C+FafeJqd3abYbwaViWkifnfUPXu1v6qftrz3rPgeGu7L
         q5nlq/SRh1j6CV1zx4WS0xRPGeRdgMBjDNq1VEpQtOClDu/s89cA4NmTiA99buzgNGrr
         +6yAf/wgdlF7OyL94qb1oSk6g99TrhRGG/udQnSlkyZvY+h9kVxSVk2/YelUkeLJJSdp
         A8bOFtWvGSv/y4M2ygdJkQHqRKOFNngk0Frwfzb8zQiHGLn8RWcoQhjOmscA5bF/l9A5
         Ij45mtCBjYtEy9CBu1FS6oMQ83OvCpBi4/CaiiOQZqcaB4s0aJaiO+PKMywlhd3+m/+R
         HVFA==
X-Forwarded-Encrypted: i=1; AJvYcCXEB3Iz39MhZJcPF3MtDecifQmBrHC8BA4n/DHhjrTEzulKDRxKfletnNz5nUcLQ3b0J8MyuE+OHwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5nv/7yCisd0MRtvWvZ5ZmN9s4k4WIhEr41aCp4lMVLb/bWAR
	L5fJ3vYAlGwYEBp36EqiosGk+hnE2LWrnGkNLEUNu9G5dtH/qEa0wsid
X-Gm-Gg: AZuq6aJS0lASy+BR3lja1hwohq2IFTvQX17j0IT+duB0PamCbTuBLool3/+Nrqgwqp3
	5Ki6GFC+zdDk9uVR6tMP8gM6smTrBBvVYufSm+f97L3JVpszHmyOi9yJiSiEtU2OR6rMMHW/i1z
	fi9usfgNi5ysw2OIU9LqKPIaF1mE4TQQKTlS3x51JTZzwkONmYPaE68ui5qwPbqTPcRvZc5DmB0
	19PUplll9KWihbiQ022UrHaOHWE9AKOqngy+ro9Et1k0KyCB24nm3UoFR4gNvmaW94gQbnMK8bH
	a2EP0MmUQwyaa+g0VbqyJ5FujFKkfQy7imgYa0HmmIdHG4Yu4sfBFxq1Zv58jBWpgbRXXPocb0t
	besZdFYL2ZO5F6vEDlzrB3GNOt9y69yaq5KvAV7yzdldRtRYAGBGG04mjFB0D5LcgTDcRDt2Tda
	eho1X99cP68KE5oY14/A==
X-Received: by 2002:a05:6000:2909:b0:435:6c8d:d017 with SMTP id ffacd0b85a97d-436293b38f3mr3781165f8f.32.1770377417469;
        Fri, 06 Feb 2026 03:30:17 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm5309670f8f.28.2026.02.06.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:30:17 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] clk: renesas: r9a08g046: Add WDT clocks/reset
Date: Fri,  6 Feb 2026 11:30:08 +0000
Message-ID: <20260206113013.233432-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
References: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add WDT clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 6cb3991cfeb6..4deaa60dbc23 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -219,6 +219,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_REG1, BIT(2))),
 	DEF_MOD("dmac_pclk",		R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
 					MSTOP(BUS_REG1, BIT(3))),
+	DEF_MOD("wdt0_pclk",		R9A08G046_WDT0_PCLK, R9A08G046_CLK_P0, 0x548, 0,
+					MSTOP(BUS_REG0, BIT(0))),
+	DEF_MOD("wdt0_clk",		R9A08G046_WDT0_CLK, R9A08G046_OSCCLK, 0x548, 1,
+					MSTOP(BUS_REG0, BIT(0))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -275,6 +279,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
-- 
2.43.0

