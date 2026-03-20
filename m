Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847A395D97
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003800; cv=none; b=Yr64/4ZJ8D+b8vdnn0dva8THKPihtYWjEMc4qw6qJCkPWcDxakju3Yv2n2bEThpjRmefYvI9CxNTv5ABnADWmUqVkkbXMAfb4X+3+juxRgm4JeU6jJl4jGI/Y+4NPeYIzvziS3uB55+gbJBm3njpQioInuBrDJiLHQyrZ2pFEiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003800; c=relaxed/simple;
	bh=KV6RQJ0PMqXgl39fDov5/8rRWnSxE60D38ftJ3AsSuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2jvgzs3XKwyX6Mojy/POBGb4q4OQ/Ug7mOIWW+bEUFmFg7KrWGSrto4tEwToa60nZgQR2BQkME52buZMfK+ZfZUhauzdZsLmmBnaRXPt68xZJPOpBQOSGJKZgyQdmzuLUCAirAxpcUGeL+XCT9+xLDGqs1Hpt4fX65PhFOp/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpT7Y5v3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpT7Y5v3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b4d734678so1936121f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 03:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003795; x=1774608595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDoprgHu93ls7kHmqlV6l9UPsfd/brYSyxRd8cyc4oY=;
        b=IpT7Y5v3raw+RZdp+jC5c0PFbAwoirt4NpG6AmXItNJE6RogvPPjGiUjBTWmZ5GH+E
         Fi3mkvqXZ/G7WsdOISyLqo85Ri2VYaFxTEuc2XM89WxxAvrXxYCRJy54CzzH6doHPP1n
         4puUWGYWwFmRoPqA4AvCP4iKzOeJaL4gluJ00fD8Riz56jsTnQo0EW/Zv+fEH8WoCKD9
         /xiMqrSo5GLNV1eCYax5WV/BZx2+eI/4sM0H9ZgajYht2Ts1iPwFMR9jnoWUOnPsvHSR
         oofa45n7aKa0RVUq6m71GYY9v9ZQGvIbAc6cZB40Z3Biu8ObQEtBuCpPk5170bQUAFUE
         J3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003795; x=1774608595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MDoprgHu93ls7kHmqlV6l9UPsfd/brYSyxRd8cyc4oY=;
        b=lxSTPV1pD/92xMIg17gO71QtAnX+efsHGrI0i1xN91+2ePkjXKKXep+TaEvr+PIBec
         OFqws0UTmdAmYdOItyAN3hKsdpsmsV5Ny/H3gOKAVNxyF3aWMh1btHrlHICo+QyF7w1J
         /Rb48MkKf9QmPAY5EzBaJLL7ZqoxDer9TTLwXk/ty/9lnUR+lnrgiu1G+KYQwSDjM9c0
         93GgAtK3c2/xxaFUe8x1rW2478zeNb0vlAzvMdCd3M7PHHApqqBYXIx5yP9YNodjRB3d
         BLWOJxLHbNFtIP08fZ5ZGV206cJFz1neKN1PA3Qx62DJ88TN8qcUZSrZXZAT8JmTdBc+
         LcRA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8QujKvrPNo8TblKvlCbV2+uYPgt+pZPps5GoG3gMrJVmjAB8NrFraeU56dkVyH0ecMBF2SuayAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW76jTxURU8q9TPtfFwSvaYJ2LPRQOCZGhcoOhsDJ75JqrMUTX
	/5X8zFsy0lFo3vh7J+HMy7UuTckeIspcWuKJlWpazl04cBBtegwVjVZTq55/1g==
X-Gm-Gg: ATEYQzzj8fy4qH6F6v8ZBsXdJzYajmSJE0dTkvjCmyLQWB/6OuY+wZ79glChYZXqsEE
	YvVkbnUMsHctc6r/mtESiDpmQZHeHmOdR8rQSDlhzVoTlNU5iPqvndUrDZgxRYlRK1YZMqxBvXE
	pKjcfZ/JLZSEGqTTMu8GyaPZlwX38jLe0w3NaSTk6JZXGjkW6fVQ9CJm8WTxQdR6SnpDyaYpXTY
	qg5j3rND5dvLwsWRwjcUJ/lYkQk9T9HQiDpE/Tu9ETyhFZ0k3w4QKzboN6M82/IpBLA6qcHV3M4
	Wl//28xnIQ/SP1CVnklreW4d76xjiB9b06tFuFv7+EBnH0NCYMi2h/0QUlf4j22yGf9MccAm+Ny
	nJkp1BERHuVZjRbvovzcrG/ipsnt2jkmZR5YSbmLFkhoQX9VxGLgC0lo0XJSlNbdvoz8Yjl6hdO
	X2DXvLsh+p/IbbTT+UPSLkhDXA7M7VTsA=
X-Received: by 2002:a05:6000:4381:b0:439:fd13:5c4a with SMTP id ffacd0b85a97d-43b64234891mr4494405f8f.6.1774003795250;
        Fri, 20 Mar 2026 03:49:55 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 05/10] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Fri, 20 Mar 2026 10:49:39 +0000
Message-ID: <20260320104950.42220-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) may
be left disabled as there is no owning driver to restore them, unlike
regular clocks.
Add rzg2l_mod_enable_crit_clock_init_mstop() which walks all module clocks
on resume, re-enables any critical clock found disabled, and then restores
the MSTOP state for clocks that have one via the existing helper. This
replaces the direct call to rzg2l_mod_clock_init_mstop() in
rzg2l_cpg_resume(), preserving the correct clock-before-MSTOP restore
ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Updated commit description
 * RZ/V2M has critical clocks but no mstop, so move the mstop check after
   enabling critical clocks. After this, we need to restore only mstop for
   module clocks, so remove the inverted logic and continue statement and
   directly call rzg2l_mod_clock_init_mstop_helper() if the clock has
   mstop.
v5->v6:
 * Updated commit description
 * Dropped the list implementation.
 * Replaced  rzg2l_mod_clock_init_mstop->rzg2l_mod_enable_crit_clock_init_mstop() 
   for enabling critical clks and restoring mstop state during resume.
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b68b0312f0e3..038b3f8e85a1 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1600,6 +1600,21 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
 	}
 }
 
+static void rzg2l_mod_enable_crit_clock_init_mstop(struct rzg2l_cpg_priv *priv)
+{
+	struct mod_clock *clk;
+	struct clk_hw *hw;
+
+	for_each_mod_clock(clk, hw, priv) {
+		if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
+		    (!rzg2l_mod_clock_is_enabled(&clk->hw)))
+			rzg2l_mod_clock_endisable(&clk->hw, true);
+
+		if (clk->mstop)
+			rzg2l_mod_clock_init_mstop_helper(priv, clk);
+	}
+}
+
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
 	struct mod_clock *clk;
@@ -2095,7 +2110,7 @@ static int rzg2l_cpg_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	rzg2l_mod_clock_init_mstop(priv);
+	rzg2l_mod_enable_crit_clock_init_mstop(priv);
 
 	return 0;
 }
-- 
2.43.0

