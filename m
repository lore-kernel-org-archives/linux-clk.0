Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009074D2EDD
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 19:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527157; cv=none; b=ZZ+pIz2/D/NkrSsdcTRtPX6h5UTORk3AZWubuQXn/FG0BdlY6M2ps4o2D6gdDKtIV7ydVJqBKsA31yNGyfGNyhk0wJvefgbMv8tr0AGgY6Yeal8Qou8A5tbsC1VvVn+xfZNAD7KWglEJ1H59Yc/P+IooJ9KpREFMRqzn21ngj2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527157; c=relaxed/simple;
	bh=bRtHKL8Ghq1igkZvpCdDlmBm9XyVW19EMHHP+BJzPeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CC2mtUQ1Ml5H+p7vgf9NZg3Bsq8LavwMHYs8f381ocDRLYmYqe2cQmMNothrncdzYLcxcntp0TMQZyCyZAVv7SRe5GKGcuCvb5foVUCC49/ALoF2gEnpmfYgeP4socKGhzZeV5f4vX4iiYkDMEndpwzScjowt/95XlWMVbKEVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXG32A/X; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXG32A/X"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ba840146so41893945e9.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 12:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527154; x=1779131954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POtlnulhl/F66NG/qN2X+H18Iihe7TwpdtVefEviDCE=;
        b=YXG32A/XZZ+8zSJWbfvSNysUE+YaEWVKjg4+GAc9udh5cmrHpZxFqesh2VXJ0bDvu1
         28LBjfkkZWhmsadbLmy5o48MglU2iHL6dnIYKkHZE8msCv3xuGSqj2fF4lyLCjCniAuw
         flvGlo/wuNsuzT6o0Z489bgskYG3ii/j49LV6R/cXgB3UT8wSAH30L+Wn4VKOTEmFT3L
         gYC7cgk9Fm8b/PHO+7dHLMghVhdKSP4W8PwOSKUWFiUpUBLzeh8SFuqG2BBQ2XWpF/tF
         lt3XLWPr1jQoYdaCsNRuxDc83nwKbc9vhMJxu06epaDQ9XV0WmV67nZsr1bHLF/WFmt3
         wznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527154; x=1779131954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=POtlnulhl/F66NG/qN2X+H18Iihe7TwpdtVefEviDCE=;
        b=pAduNqKfZWyPWtckXd4KLhkO3jXoGqrUxstWhdDEi1jih/79XPTz+TZoNFjhVryBKV
         /JqOwaF5+mlRJqMunWVc9oQpIK6MhzV2qnBDmWeosGPcY6t6ML27GG2kyUrDqhfZcFON
         kt1MS7SlA5oM1a7EgnLVYbksQ8YQxxVKEkFFYoCbS/BwW7QK9XqR4iO25kGnlFdpD1Sx
         BI1ghAvkXGJzsyK1b+m9zB1WH1HElgkB4Bs9w05Qa5wQYgJDTQ4Oj/Ae4BXAz/XFUdMo
         lgNcXv3tyEGm6Mk9Jk2m4TEK3UqCF/bK9NIQDG2s4bEiiqVWDOBPgVMzkqs7nSdMSH3d
         JT4A==
X-Forwarded-Encrypted: i=1; AFNElJ9y84zIeaUxqdpD55ckMFKVkym5O/PYkotgT6YIgrSY7pzf+ruo+Q621n2CRvmb7snKsBEg2Emixso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu4aiFWBWUKZDXCavSSd28Zp+L2fV9tIMz6xXiimwIUsnrKLUi
	A/9/UfS8bd77TPlj0DJSWUIN3i0DN2tGtBHP2pHWdNkVD3NBiWwLsz/Y
X-Gm-Gg: Acq92OF+YHO6AlazVCfB2kM6krKP8S0OzEfSk61qM4B4R8Zz9sb08wugTthXPvkUOyF
	Yw5HKMB3TFpXnsF2mv/ilgqJTIJoUEF7AzszoBquJ0YKauCQHf0zC/ozX5glh34dFRbEkLahfrP
	sQbsWOH6C+4KU3+Bo3YlI2gIUYXMbN3qDQLMi4/gXolUJJb5kyTmHKPYZxw9fPWzHGZkw1MU677
	CNd+wcpRGPLz/G6c9yfze9X89uuExqDRtral8TsWylagBEQvuaz0g1nzn+qKTV4oKLKKEzYJFeo
	YNB69BW5n+aoLA151e++IEh8MLyRzOzClNK70oc60aRTHlP87B1wipVCD820OWjxVDcvnGZXYQD
	fEeutNj+HK5R4x9HXbOk2F1OvnX4ji+QsZHOY265MN9E/eNxee3jmVuY2VSyZUv76aOhQVE+cgQ
	MDL11Rn3UiW+7Rf3QmzsEg80CTXd+7ffmLmFEyKtbHdGJvzzQ8zkQ13R1LJm+Zp7tujiZc0Qe28
	fvR1w3MyPtF5ZZuiw2npJNp8Eu9OhyHMxrEPA==
X-Received: by 2002:a05:600c:1797:b0:48d:366:b962 with SMTP id 5b1f17b1804b1-48e51e0a8a8mr217354635e9.6.1778527154318;
        Mon, 11 May 2026 12:19:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm150350725e9.8.2026.05.11.12.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:19:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
Date: Mon, 11 May 2026 20:19:09 +0100
Message-ID: <20260511191910.1945705-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
operating clock for LCDC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index c4863e444458..f6cb8d649a46 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
+#define R9A09G077_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 0d53f1e65077..312e563b322e 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
+#define R9A09G087_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0

