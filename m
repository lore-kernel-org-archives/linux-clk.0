Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485F937C91B
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472860; cv=none; b=lO5kqUpDbdc50uGr4MMyVfdmNindt7RyXYTIeH2CWpo25az7cM7JmhNy552g0DIi5CDNCjbCvWFBf1XqTwOOpgusE5knWGRxsDDjEXAxLV7dYxPbHPY8NVzwLlx1Padd9LRc14gldgNwWzptDQ+zzoHaxmZguKi0V4g/2QcAx1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472860; c=relaxed/simple;
	bh=mqmafDf7D+GjfEPYR6J4RxC/jXPl5lKysFJIcPaqAso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJzY4pe+YY4U9sxvVbrd0r35hUZ+3zLquCxHC0SdKJmRkDKef9if+8h4qpflArJ/j0MKQ8zPQyBGEtJUxgF7BJOYXSoM3dWdAUPCKK5V8FyUbtnz9cLPdU9qaZRkHirXL/YeQbkWxuPNu4VZcRW79839P9zUEfsNLIP4PwCJ3aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mT0Cq5DZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mT0Cq5DZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49954b88fffso1185125e9.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472853; x=1787077653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ij+5nUBr62ISeroE1A14zeBfYBlsVYffc+E2WxB1wTY=;
        b=mT0Cq5DZ588s2GALo197IG0Ymy5e2Z4qSwsKFCbq0ktqUxcJSqGYzQwm1+vkLbSU5J
         0Q3NCLKPPxWDIVaDlmWWVjfK5wsJWQGwlyDmVizXwF0Whb20lLrW88ypIAi/9pqjKyMC
         Yt63tqWu6Qj+7ONen+Pq5e9CZBu1vBnPJZWy6DY5zRjuTN8mAyRCG9m8UUkuIH5TfZ/V
         pdsLJjChJn6Lg+bhvEcByCln7C1EtA/H2cNa3NSb2iAo/on8LAZX1LbWqZyxl9iD0VoX
         zWGMFI33M8UMLY/zIBtxG9N/nc3EpyjPrA1cO2VEIoMG2UTfwSpOFt6zB4uHury/sbvL
         LDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472853; x=1787077653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ij+5nUBr62ISeroE1A14zeBfYBlsVYffc+E2WxB1wTY=;
        b=h9OehUoC7wh5FERFz0DnSUuhA7R48pQroReisVdFIYXQYPn5Zg6LerEgAPSkTOdfLk
         h08w5YTYMbfMQRF7E4UZswnTENBQNIv+3/l6aaqavtMhLamR1o5K+Ydvv1iNUy46N6Dn
         HkM0s6wV2+NfV70rRjb9AbKYL7MxJgyzRAAoZOJFIXs9+C6B/85Pu1UW6+Mk6BqPvgpC
         JgjVcitTFtBm629JfRal9e64neKYVnyGZLqavblzBhVe6jKKPfR1LMX0uxGY0hPzDk9R
         TFqeZ6dTHe7YaMeAG/5dBKvVPlyvt2BamI1psJEHFoQe85G1ed2Y0sOhGlbTAUxhSloX
         fgZA==
X-Forwarded-Encrypted: i=1; AHgh+RpecgDt73jL193WzhfpZrrbGgVUReqKoRUMW2uVM3nIt+lp1GNjhy5e2LHTU2HUqNDRddY6/ruGoqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfIgnPUnbaEDjEliYZYgNjtxsa/EPOLUR//MBtpyHL6JmOxxjk
	Rdf+B6bj1Kkju+GsxuGOQ49KEn4I8tAWZGAWG6h8iLdpLJDYOcKSBaxP
X-Gm-Gg: AR+sD104VGTjAp5vp9kcalNV9h/yMz0UbB+fWbDB5doo5UB3kFzap+Ohuv6P3lkregL
	ymIoqhQAKHOE64lf91OXCirBEsmE8o+zjfgVq1gOzjMlh3FLiz2PVO9hmjConDIKjUEx4XZharN
	LOlLkTrvvIdNDSE0ub25D+ROfemGwZbraeFJse+FemNYIvy/wMpdbHNJsQCUufReCKrh7Ez+fuV
	gJCSPdcaGmHbWLo8VlujAArzVYdLRh4rlZ5qKr5+oRDOxrZ8JWK2LlYL1iOxaK3Gn4242WvbsvN
	WwhnlVE0LZrFMi0tnJU9KBAhndYgZRy0IRWToBfp4cvWV3/Q9OsT68oJD2ECLrukwGXBd+mQt3a
	xEwxCalRlLQMPdHNLoo2l31T4pkRJTTeIMCXFaKLas1pS6PrhLyAIRCcftmoXzPj6DmE/6DwTX6
	92BYkvHj/U3RcxSr13CzeAV7PNlVFu2PBnp2b0YnsPmn0G+zEGwLFLVvMZt/40L2ay7b75Pp7io
	Q7G6/55lP+XOfnPGHiX7Hw=
X-Received: by 2002:a05:600c:6288:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-499784605d7mr70042595e9.10.1786472853308;
        Tue, 11 Aug 2026 11:27:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/9] clk: renesas: rzg2l: Add RZ/G3L MIPI DSI, LCDC and LVDS clock support
Date: Tue, 11 Aug 2026 19:27:13 +0100
Message-ID: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,
 
This series adds clock and reset support for the MIPI DSI, LCDC and LVDS
peripherals on the RZ/G3L (R9A08G046) SoC.
 
The DSI clock path on RZ/G3L is generated by a dedicated fractional PLL
(PLL7), followed by a two-stage divider and a mux that selects between
the LVDS path and the DSI/RGB path, each requiring a different output
duty cycle:
 
 EXTAL->PLL7->[ DIV_DSI_C | DIV_DSI_{A,B}] -> [mux: LVDS | DSI/RGB]-> vclk

v1->v2:
 * Collected tags.
 * Introduced the macro DIV_DSI_{A,B}_SET and used inside 
   rzg3l_cpg_dsi_div_recalc_rate() and rzg3l_cpg_dsi_div_set_rate()
 * Simplified the divider to "(div_b + 1) << div_a" in
   rzg3l_cpg_dsi_div_recalc_rate().
 * Replaced the data type u32->unsigned int for the variable divider in
   rzg3l_cpg_dsi_div_determine_rate()
 * Moved the declarations of the loop counters inside the for()-statements
 * Updated the comment sections in rzg3l_cpg_dsi_div_determine_rate().
 * Updated loop logic in rzg3l_cpg_dsi_div_determine_rate().
  * Dropped the macro CPG_PLL_CLK1_VAL and instead using FIELD_PREP 
   at all callsites.
 * output_nir updated with mul_u32_u32((p->nir + 1) * MILLI, fpfd) as
   p->nir is small.
 * output_nfr_range updated with mul_u32_u32(fpfd, MILLI)
 * nfr updated with div_s64  as div64_s64 is overkill
 * mul_u32_u32(p->nir + 1, 4096) computation reused in fdco and output.
 * Open-coded 64-by-32 division replaced with div_u64().
 * Renamed cpg_core_clk::flag to core_flags.
 * Fixed a check patch warning by using (_div_flags) in DEF_DIV_FLAGS
   macro.
 * Added support for LVDS fixed-factor divider with 4:7 duty cycle.
 * Dropped rzg3l_cpg_dsi_smux_get_duty_cycle().
 * Updated Mux flags with CLK_DUTY_CYCLE_PARENT and
   CLK_SET_RATE_NO_REPARENT
 * Determine rate now forward to clk_mux_ops.determine_rate().
 * Dropped the duty cycle macros.
 * Dropped struct rzg3l_dsi_mux_clk and to_plldsi_clk_mux.
 * Sorted clk macro definitions alphabetically.
 * Replaced M2_DIV7->.m2_div7 as it is internal clock
 * Added DEF_G3L_LVDS_DIV for fixed factor clock with 4:7 duty cycle.
 * Prefix mipi_ added for all DSI clks.
 * Fixed commit header /r9a08g046-cpg/r9a08g046/
 * Sorted DSI clk entries.


Best regards,
Biju

Biju Das (9):
  clk: renesas: rzg2l: Add DSI divider clock support for RZ/G3L
  clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
  clk: renesas: rzg2l: Rename cpg_core_clk::flag to core_flags
  clk: renesas: rzg2l: Add support for divider flags
  clk: renesas: rzg2l: Add support for LVDS fixed-factor divider with
    4:7 duty cycle
  clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
  clk: renesas: r9a08g046: Sort macro definitions alphabetically
  clk: renesas: r9a08g046: Add MIPI DSI and LCDC clock/reset entries
  clk: renesas: r9a08g046: Add clock and reset entries for LVDS

 drivers/clk/renesas/r9a08g046-cpg.c |  83 ++++-
 drivers/clk/renesas/rzg2l-cpg.c     | 557 +++++++++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  52 ++-
 3 files changed, 668 insertions(+), 24 deletions(-)

-- 
2.43.0

