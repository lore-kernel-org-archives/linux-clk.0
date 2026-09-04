Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0313DDDC1
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 21:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558617; cv=none; b=bXLbZTY8Rh0G0cdXF26PFNnsEa8+7cuAdu+solsFpdw+07nzlnAhmDvCZQYLgf3D7d3EX6xJ9QJsPsm/PQHTk3Exc14y7BO9Ypig+Z0c3i/A/ARxkudovpRhRAFE9CVjzfPWbe2ldwCD9qvaA4dTGcc2gF8di+0RL2PUpvVuZMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558617; c=relaxed/simple;
	bh=HRpm/PikTeid4SxhtPG58lLWj9vHexiupAlM1DtQk2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qHSpiPyatpm1FhP2TJIyXULpL+QoqFFPF9ktj9nkM96oeFv+iQXg/0uOL2lYJgsY7c9at88pP0pfHoEPDGhuNJRxyG2ZdnIP6soBzUCkRvE3mnNdm6JNT8N7YAlmOD7r86rp/uP4lk+uMMjiuPtm68QUIQv1kZIyzGJrTzHOtuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed03kEpI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed03kEpI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db18e5cb56so11318345ad.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 14:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788558615; x=1789163415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sD9Hx1FwVR5Eafl6UTBAMgGfntaRlJCf0MQwhh/QWi0=;
        b=Ed03kEpIXy8yQrPvpbmFjdXOdxNu53kcAR1f2iBbxbOjJ+oX2Whpgjlv4eYvrav6Xn
         liKmE1GvXDvuwvPxc7/rjhU40nlNYNweKM+5lMS8xxZM9CdaGQJ+p4E2UHEZ2pTIGIIl
         ZmANXFkTcXMp81OXZ7Tp/wKFw05Bp4/FaU0pAWi+cSOgo5QuHtBkGjU+iEGdqA7bCme7
         5TonwIiAOeTwCOcweDUSVraB+XkV0mKXszMlvV/gWjWCMXOySwbJAJJ2oj/Vckq4iWab
         F8HvxeRe24g1Lzuk4p4NjDfN6PGTYY4Phx9tnYThLVG8dvKmzCFYg+/nLD8oWmr3Al5f
         l+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558615; x=1789163415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sD9Hx1FwVR5Eafl6UTBAMgGfntaRlJCf0MQwhh/QWi0=;
        b=Eu+nrBUo7Ktu7K6o/JE3bZP+tG0QDHj7UZO26XfxWQ/okrln/PmYExldxEMQkXP5He
         PQw7mfa6PQt0cjG0hu2kuPQdLH+xLh2MLwjcrAeVXnl6bP+A5dCdH6zZUAgiZ+JP2fFN
         oWaKsFxNadhhfRyq+hkmujSMTxbmbuwXhpaN6aFzL7l56hs1RWX2gE1OpaxdBBBjZxdT
         QGVe5SpTNH1WzWwxD0EpbhqJL+HPs7pskzw4O2GOy/WFvVr+a2Ur12jeFbM5ZK6/f+XP
         oYUnAtbVqoD7yNJYpRdRF7FyTzaqILm90itJ2B+6P7oUN1K6TgELDMUilh4owvbBr4Ic
         FgzA==
X-Gm-Message-State: AFuF++mmCPx2xbPKPMdZG930bJdqWINefxm3YnKXk0z/C1djVv2c42BL
	hNyA18an7rieZe8Hs4r1e+BZtIMz6VkwhT7TiyBlRjG0W/70+UHlGWfRid0BFQ==
X-Gm-Gg: AYBFou2+M2DAYoseTvEu4YUs8Hq1tYg6fRU+WREQu58/R03EFltQhQFYIiw5nLWRGvm
	BpPzZtbScK/LMmyeN3RmZNIkB+t0j10S4izrKSnVsUZjd7htyDS/g+YGjdNiwntfmJUc4fyYfrS
	r2Or28Fv4QlVF1WPJDZ9RYyytsgTEmiQtJ67tTzCvCVZ6hj5VS49djYYeBgx8HOJOV3fTYDnloO
	bmcasNeeZdiYluMJvHNXsKXEDMiPmJOUw894iX5ibfqxpg5hPGIjwW5pLvXV7i4wDsowonak9F+
	cltLYSco389yG6z9BIDbkem2ygXV/LoVAOOI2s5HVvoGz+SYxmqSpgCbPQMMSlAIxclW/Yjjc29
	TeCDocL/auMg6HctcpD4y00WaSny6/BhIrzkgGC+aotE0cpo0/KMFsA6pBnHPsAXGhcWZfGj7wY
	cnKd6FR8Fqy+3fh/WDCKTYMP1QEBhbW7jEvMnnHozdwllRvg5uz8a0C9hy/vxgw4sQuPgFzFLtY
	CngyjbWaDV924/DdcUedcEiZWJkVfKCioweh5Y0XYZrKEdG9HDiMHjDsNxPYOMuLnPueECwgaxD
	aWPfHF+bPUlVNJP0jnZDTHAJCnfEiS1SDvgiAQ==
X-Received: by 2002:a17:902:f64d:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2db125c83dfmr131050775ad.1.1788558615405;
        Fri, 04 Sep 2026 14:50:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149cb5f0sm14512185ad.67.2026.09.04.14.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:50:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: actions: owl-pll: cast delay to unsigned long for uelay()
Date: Fri,  4 Sep 2026 14:50:13 -0700
Message-ID: <20260904215013.98283-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'delay' field in struct owl_pll_hw is u8, but udelay() internally
compares its argument against MAX_UDELAY_MS * 1000 (2000). Since a u8
can never exceed 255, the compiler warns of a tautological comparison
that is always false:

  drivers/clk/actions/owl-pll.c:189:2: error: result of comparison of
  constant 2000 with expression of type 'u8' is always false

Cast the delay value to unsigned long to widen the type and silence the
warning without changing behavior.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/actions/owl-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/actions/owl-pll.c b/drivers/clk/actions/owl-pll.c
index 869690b79cc1..5e30ce35f2f5 100644
--- a/drivers/clk/actions/owl-pll.c
+++ b/drivers/clk/actions/owl-pll.c
@@ -186,7 +186,7 @@ static int owl_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(common->regmap, pll_hw->reg, reg);
 
-	udelay(pll_hw->delay);
+	udelay((unsigned long)pll_hw->delay);
 
 	return 0;
 }
-- 
2.55.0

