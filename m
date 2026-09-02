Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA5438488
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344135; cv=none; b=hvGewDizaqjk3tL0z2clS/b8xAMWxgb63PBszZ867d+z42f5rpNIhvo/1wuydOg2CyF8Nx19/EY9nt8foVJBN/Zd3GKqB0w+Z8NWscIHGwZbcIfb4eVeDWf3rmY6DhDtyHsxtnW8e++XKQU6JL7H+K6Jyd/H0OGD/STSo7+A9KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344135; c=relaxed/simple;
	bh=CQGqaHstw50mvsxoLWvDW59yPPK1sfLS3F7EUEGmbcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+BSVzirrHWIiIDebFjkkeJ+uq9X0K1BpVE+/KQ20DpsNiKLK5s8ZbnPpNvvZVsD3Bfx1ew4sJJTu6aayhgyqzBVdaf0wa4yNT/L4WM5811uIux8hhUhUBWALLg5u+jH7EqswUQxx+PRlPNhdew8t6EB/gvVOjgaPphlJqfw0uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YlAK+Kzh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YlAK+Kzh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8687630fso6545755e9.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788344132; x=1788948932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vA/vjABT1jnzam7kJz2zSU4WQLgLEnlH7iz/BFpMd5E=;
        b=YlAK+Kzho1JrBx69SQlHxmCGwOZ1adz9pDR8f61580ZG4iJ5eyrXFmeL7BvIMC9mpj
         68AIrVfacE1dSJU/DZ0jZ1L7Tpk15HcrG0yZ8N/sEPvVipTheM/w1q42HcAwa6k/j87q
         2jSCNbPsgb+Ckr+zTFxSmAgIglTY+OP6msDuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344132; x=1788948932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA/vjABT1jnzam7kJz2zSU4WQLgLEnlH7iz/BFpMd5E=;
        b=ElKcxfJvk3uRHKJMxczQoh2gtQuIrlrCLCRtw0EdE9lTtmCbmzaQUMVPHXNCRMEe0z
         C1/QpxTN6VRgoP3cnbV5OCmzN/Vb/jGTDGrNBhgmuAWGSK0VypZToJysGWhkXklA3wWh
         23S2ttw7I5tGH0Jar2eb5FCUoBfC1yi+5NX0uH3Ee5ouMZfvvbIr2J2aJVBQCRvEHKit
         Fwhwc8ewd8rA5ZZ1UmLIO42LXkPSzObLc2uPM7+nwkvWdzbJukgploU/eEto39qpX2mi
         seJahaMllr7UpOgPqtEOD7YlxEB4gpnzy+s8ldRdJQC1yKdgCkHyc2TF9MllIMIfE48G
         yFVg==
X-Forwarded-Encrypted: i=1; AHgh+Rqdh6Pwfar6V3W3qZpxoCCvRoda2sJNLUB+PIvZTl00EqpLoWnfxAKnPsZeZYpYjdYzZlQqWkOi04k=@vger.kernel.org
X-Gm-Message-State: AFuF++lnrmeXZfFZxB1kX0LAvUzQ/SflNHB+DFWVo0GUYCIHVqc6LeNC
	oLbDjh+Fg+hM0Am8pLBkcquWf8N9CfoMuEvvnMtmB9evIe2aRQ/tkXgtPry1WVWLfeI=
X-Gm-Gg: AR+sD13JfgHTRrHHVOBZ0omfoCxKzhqfa+FgovqIjPTVLTbdtylMFYbIfsFjJ9SLO4w
	igVbs3x9Fa1Hgsag2vJd87GrwMrVtMPEQ7QbeTinqWxVSNunqk9nySgsPgv3MuvJU11uILu63ix
	JN4bs5NDWW856I4SQnmJ/qDDGEuq4sTn10ve8lpfppyTrjFKKBmi4IJg+eSKtUc3CXiOMUk9cQ/
	Hy5XgOnZ1qrBAM8lCdkeI5bKa4QkkMRQfYbFzedFeluanl+yM1hfNsqxTzY6ibGNVZNk+YWjRdl
	UvuIMLnSG8XaMZDIJyJ/apQeEBrqMY/bh5ub5r/iQyyLf/5FBamHE59lSJcv2/aRh3+qCd7n8ws
	Pq6J92WLvYosrEIK5MG/7SL2qekzyJmev4KvSXhVo8PqaaVlstrGUXiHkgxLk+ttKG5WLiYdp11
	w34qsjGxe5WidHCYzdTSfgZGTIMkj8MArMfsBMP2KbTLdbEvN8M/MB3Iyv1dVYt7dElPpIJCA1G
	nppsFTjfD8818j6JQf9lxOtg8tOWClDLgYqPPHY61Nnr50DsG+/7nY3YAYdwgWpbxS+WjrRMqvb
	mFq834CFiKDgbZl87Snm6oIm1sd0Ct3bhYskzs5nHMSL+tORWd188yxpXXGucw==
X-Received: by 2002:a05:600c:310e:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49ce55906cfmr48006695e9.0.1788344132449;
        Wed, 02 Sep 2026 03:15:32 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm139618475e9.12.2026.09.02.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:15:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 1/3] clk: scmi: fix SSC permyriad conversion
Date: Wed,  2 Sep 2026 12:07:33 +0200
Message-ID: <20260902101515.167819-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
References: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spread_bp field of struct clk_spread_spectrum holds the modulation
depth in permyriad (1/100 of a percent), as documented in
clk-provider.h and in the assigned-clock-sscs binding. The i.MX SCMI
OEM extension expects an integer percentage in extConfigValue[7:0].

The conversion divides spread_bp by 10000 instead of 100, so any valid
configuration is truncated to 0 (or to 1 for a 100% spread) and the
hardware is silently programmed with no spread at all.

Divide by 100 to correctly convert permyriad to percent.

Fixes: 77369b1e6a37 ("clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/clk-scmi-oem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index be11d359b4ec..3e56e91ae68c 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -44,7 +44,7 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 100);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
 	if (ss_conf->method != CLK_SPREAD_NO)
 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
-- 
2.43.0

