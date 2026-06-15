Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642203F39E7
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534404; cv=none; b=CnXSTbOs1wCEARqPJCcI7MPrp9UJERIxNuH3//OVHQjEm2J9XQ5dUtpazaHBJ5Lwhjy5SjbRdtOx7Sc/+n4JgUFH3ATlbCsUmrxNK53mIv2qKgrTzd3hKsM4ly6ssoK1SlgDUDTCww+AgysxtsSNffOeIfPpgBdLVt+5qJlslug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534404; c=relaxed/simple;
	bh=RPYCKUoaLHx21mEpdL26fmX9w4xAgCZxloQUVPzEaaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lb9bbzLBKYlQStb5kJi6S+SFVbiwaiTFs5VUMar7egNBdjrmnWTQrbMGmM9WLvlGBF/H9rpf+nuW19HTLJScGVDUBEk/w6svvoHMyMfE/gaHXrdFQx84VH+3yCVk4cywdvQyJYX0JjdQyq5miCG0adanRkycKoXT8o2v+j+mKSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNHajxpP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNHajxpP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso32737075e9.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781534402; x=1782139202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eOE2cW5CuMlltMnNIAtALpjm3kz28XwuEUz1GGDmxQ=;
        b=RNHajxpP9OT7RBWJDkxfPGRnH+aeTYtSjVibR6AwR53qdyiQ8zL4Ln52zpVJhnrbRI
         KiXZAQwS3ilMZdcvEoqYwNjqPwu2+vvcl5jeLM3Gc4D1zBTZpwh0H+BqSvPYmexdNNsj
         bXiGLzzp6pKyZmibSBUp6O3f//it++Y9+nMopopQ3JovHfAxa+RqYU7KVhL4pi4LPdn4
         pkCX+Zd/huVLT23nw5NiwUxItqGT6pVYYe7D8O20vfmzBRvUtvZ3WKKOJsihJSVS1Z6S
         3N/xLpaunucSJdNvlgbBepeTtPcBqiBQ9BcQ5UTta7loOiOOzykCXdtykMawQK21cdEJ
         Z1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534402; x=1782139202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4eOE2cW5CuMlltMnNIAtALpjm3kz28XwuEUz1GGDmxQ=;
        b=HNRCmKaphr6dcSiwseHubk36DZyc+RI8dtABlRNEAjeRIPMH/Z2F7UzJFsfpL8H2Z8
         6NWTymYKn5aeeyKgn2hbzwo5E/Qm/cIhDPF6WBopoiV4DathD+bf8DE4DRifIYtRKO8j
         /cpoPebKwJL+0m97at5EOLgmgUiuCQyRczQrdB32IyqXShgX1kiLxfH83tdtRTI75E4a
         m2b6JJhz5iRDcDCyC4i9IqdVFTzLxj0qnotf+XkDnpsxN+zOXpa5blzK+pgclz2b3iJL
         7cc4Lc3UR/37cj5i4cikhXX302ord2FbsS+1Bwz+a+f2xmOkV7im6/7eD3L9jcNpnbnx
         Au3A==
X-Forwarded-Encrypted: i=1; AFNElJ/THE1pZQOR7mqDuDriILbw5voYabyHC9ECGQWJusbtnM7/nXhPOAMYG/mP8KrBLBu87lYt/UioFi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzX+QFMxumPINWcWWNKFSsM2yp9V7XOTTLmVXeqCvNkXhDDKWM
	oXG4OT7LhwezU823+mvFrs7ZjWTvCsrDza/iqtZgMM3gLNtMVbss1tnp
X-Gm-Gg: Acq92OHiFsvE7LFKa+3RTa8xrTYwN4IIYhnd9fGUvgzHrX+8klGOE7rpIb6DpAWLZdX
	HpetoVWTzD5bO99rwoQej85Ckm5eDhR0qZ/zcubhqLtmRRctEccsuJqY912zdZMC8pKpqTBuDnY
	rhWQGXnNb2nugLvsCyGXT9wqiLyp1Mkso8Y/uu82NyTX5r2b1Fp754ektEUIdD/Emrnh7WPwRxc
	yprHSAjAnI6jXdak7KeyzDZn5BykMCtXKuRejdoKSq+yu4ScY05bo6ytv9TvRZ+qF13f1tL/X6x
	UDyo2yE7cVyVAPTdpFfHRtMbioLWwdCwFxzCmbsx4PVfkXBg/YJXng2blYNBFTV+EX9va1Du272
	KVwCDE81XzAONeP1bbnVzuv+c2xv2ksE6se3+Qod6bBG+mKZBUsYHhzoLAFq1/l+dUfWWzz95p5
	sWRQ2s1I3xMOKqtEOdV+C/qf/640pxchrDylRxymIdiYCIddJn18VlFUw6ney38Pn5SHp0e8vyI
	7PH4IO2qA1w+pwgFPcRrmsp+fdo+h0P3i2JUwj7cDwTJHk=
X-Received: by 2002:a05:600c:4709:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-4922007472cmr139483105e9.11.1781534401612;
        Mon, 15 Jun 2026 07:40:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c05ebsm256627915e9.9.2026.06.15.07.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:40:01 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC clock ID
Date: Mon, 15 Jun 2026 15:39:42 +0100
Message-ID: <20260615143943.1610095-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the peripheral clock ID definition for the Real-Time Clock (PCLKRTC)
on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.

Note that the LCDC_CLKD clock is utilized as the operating clock source
for the RTC IP.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index f6cb8d649a46..aa47685f329a 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -35,5 +35,6 @@
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
 #define R9A09G077_LCDC_CLKD		25
+#define R9A09G077_PCLKRTC		26
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 312e563b322e..1c73d0dcef18 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -35,5 +35,6 @@
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
 #define R9A09G087_LCDC_CLKD		25
+#define R9A09G087_PCLKRTC		26
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0

