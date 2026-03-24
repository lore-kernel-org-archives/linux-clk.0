Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC4D3EF67B
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352626; cv=none; b=PLQvotHIKqDm0Ya+BkNGUKOTvdtrz5GpSRCJ1i6b/ilKz3VdZuzki0dBBZCXZLCsCBrpVKxTjTd54tdyZT6gPiI/jy5I7Y23PxeWRMcdV9US6La0jNJJI8c99OqersotvPDwQ/1y97iZ9c3/y8Jf0bVWYlQpbqd9GN7oXvvtQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352626; c=relaxed/simple;
	bh=j0Gd04+kJqJ6VR/s+a8qrHwz+JDzDy6zM8WFPZZZUj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOn3Nlk+HpJm8VgYS6mJgWJ8BQuU8Uc87VRV7nZ2qPJowAAF+A59cG2JO6j2ASnZpho/jal8jE6Z6trfueAdQubLWrLthgial13zeaWy61SbagXHHnkH1QatpMP5ZEJSheRO9sv/kEQCgjZLl01fph2rY7/DMBXf45fIx3QYaZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMAoiizq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMAoiizq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fd27754bso9617405e9.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352618; x=1774957418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNiRs4I0KqGZbcAMjICGT778jYVtsL4Bi7idhY15odQ=;
        b=kMAoiizqinLvsr+eMl2jDd8E5CqUmP/XQQAV6loJXxE+uwmPzUWfO6kmZxhYnnBQYt
         6zduq61pvDcXM97BeJZG4k/733igv08RLRwdTOsdCabDOdZKdqr9RHu52BvlPnihne03
         oC2QvtFBhkPNruAyzz6lp7gxuF/mrm4/7aEDzO2sDZk8Yq+mEM/hIXmwiNMP1BgzISaY
         S+ML02m3C0K2VGx7QuF6SfKY8KiZ3NfCHwupO6ZxYcIHHeklPQZT68sqmVIIk4x9LeGc
         ADDBAQPN1WxIRG1rMgt+GbrzEvmSaVyBfINhBR4i5OMPOA4KthQ+Ymcb0CsQYSWWHePD
         kjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352618; x=1774957418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QNiRs4I0KqGZbcAMjICGT778jYVtsL4Bi7idhY15odQ=;
        b=Hnb5LlYtbZcggREmurdlIYZpLcELVy1DtgCaxP8ZolVgKzE69Qpxd5dfnSLECwQ5v2
         KeO6rIQkLOFTYJFcrQVEge55xigNeXh44RNHWBPoJbTbjSRZg9vGHChGv2fzHq0BRxil
         HJu1UqbKgJaKrmanp+r9EMB/7CGI6TR+P3cU+NON4N2ygNXLSOyqnjLHgJLTrzu79RCo
         hYp35UvfnTFUt5QUPFEIowxAt8JDjnkfXX+g3VPDtJYylGG2gZf6nlkPR6mhAvhmc0ZD
         QbiAl+miGRbaJult8a0wZesrYsVMhLdEg1cbun26cfI8WEyqX25tcdU+WNLgSke/XYCN
         /vEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRZXYIyheb6LXNiAQlOsHSFBUuW9Mgs2KrT1nOI+eXSqujJuHfgIDGpWeTSP96B2DWxis/lNtF61Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZuX5/K+sq+eKhNG2NwOWckG5NQi88S7x3IiNK0XkEnPR/Trf
	+K43YeyCwtnv+ymtH2kWNRoffZalJAf+nRsJBeMlGG/OzEacjXdk70VF
X-Gm-Gg: ATEYQzzKK2He8ffg9G0M+6qV6TkLadPXraZOdp9q+638TrG2cdb1cLWx+rhrkZTZt+3
	teKwyCqMMdFd1Qpht5uJcejz6uW3CxBbcm5445QB7GedsMPSXq4IU9zAbCBqN9oe7bYm1nckd4F
	ZOwQzDVtSt4NH2EfHUmzKWXCIZ6avQwwb9omlVcTmEpZtIqyxSq1RXSacdlsGiYyLAyx3Si2Fdm
	lZAUUzAwcnQRHZKLHZrKLlYCt0D1INSu1sYyP5h0Ps52nZ/cptxLdiyG7imN4vmtbHUQbBqxDfi
	hREidAU1EoI68yJv0pGBGny/ClagcnzYcurrkES8O+muuNHNaHSq2/RQNWz9bN+eh8smtZwTQza
	83ZaUuSeSSTsGNhe+6h4yjlCaPJxR5px/ruNpsU6TLOCw9rksk0OSHUSPPwjKzA44JauS9QH7C0
	0AEB3cLDI04UYoGHR7DIRAz8EUbZ342lljm98dxUH1fxFJIlxe
X-Received: by 2002:a05:600c:2d14:b0:487:2b7:18d1 with SMTP id 5b1f17b1804b1-48702b718demr103827345e9.33.1774352618212;
        Tue, 24 Mar 2026 04:43:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 05/11] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
Date: Tue, 24 Mar 2026 11:43:10 +0000
Message-ID: <20260324114329.268249-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
decouples the logic for setting module stop state on disabled clocks from
the iteration loop, allowing it to be reused during resume to re-enable
critical clocks.

No functional change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Fit the comments in rzg2l_mod_clock_init_mstop_helper() to 80 character
   space.
v6->v7:
 * Collected tag
v6:
 * New patch
---
 drivers/clk/renesas/rzg2l-cpg.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a38401c18dcf..738a4b182f27 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1594,6 +1594,20 @@ static struct mstop *rzg2l_mod_clock_get_mstop(struct rzg2l_cpg_priv *priv, u32
 	return NULL;
 }
 
+static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
+					      struct mod_clock *clk)
+{
+	/*
+	 * Out of reset all modules are enabled. Set module state in case
+	 * associated clocks are disabled at probe. Otherwise module is in
+	 * invalid HW state.
+	 */
+	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
+		if (!rzg2l_mod_clock_is_enabled(&clk->hw))
+			rzg2l_mod_clock_module_set_state(clk, true);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -1603,15 +1617,7 @@ static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 		if (!clk->mstop)
 			continue;
 
-		/*
-		 * Out of reset all modules are enabled. Set module state
-		 * in case associated clocks are disabled at probe. Otherwise
-		 * module is in invalid HW state.
-		 */
-		scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
-			if (!rzg2l_mod_clock_is_enabled(&clk->hw))
-				rzg2l_mod_clock_module_set_state(clk, true);
-		}
+		rzg2l_mod_clock_init_mstop_helper(priv, clk);
 	}
 }
 
-- 
2.43.0

