Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4E181ACD
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171533; cv=none; b=kABqCSInmiiswbJKazsi6DqHSo116eFL4rZqrbTg2xEBI+AMYeSh4IyrIp9cif2s1HkZ8gk3p8rZoNaNHjWkLrX/o+tIp20EeuYqK9E0cEWYL/2xnc2mZtZoh2guUbmJrM6K0Na4SCxas3ngH48mJAoJbwDYK/iE9Lsqqr5PSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171533; c=relaxed/simple;
	bh=/rAmJh/EIGGw58+WmpOp3WZLjb4iciRyMYt4abh+ONQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ppLF7Tg9rf0+saFL7u32s9FcsDrd41qW9PPWY+GJW7G33toHfPeFPmkoE9I2ewL1Wl4EjLrHZTdur0wlkx7rL+cJ4iVjWXQI/ZjNtEPl0O928RKGae+DnYauoEh/QMmKv12Tb5MRmW9N1q3AnuFYoVlbAA3AA5O7s3dTAEat8Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4xlz+km; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4xlz+km"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb766bfd6so5741241cf.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 17:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789171530; x=1789776330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXFkUUSERusmiOZxFKcpCM04OYHSm47q3Lv6FIZm0GU=;
        b=K4xlz+km1Skegega25yy4h9wPGY94a7XNqS2RjAiO3K3R/032e5s6m9lqJ2ERRx2HI
         Vhn3+XpFZUdjy0IrYJWD8otSathNu4U5tRCkhU/pnEZyp8BbvOMTHfSkyxOEq2RdvmDj
         s8krs5pOOev7d6VDfPaUNFFoLGKw1FDaMFXdhauRh9nltkOE/rW/1ObS93SVODuQI1lU
         27monnh5Rwom6B039liTE8CKz+yVow8Tfq7iNg4h462JMkRUzbDnnIo7fNEvR4uIqikW
         UQXyP3u/cdgGvsZfeM2NVjmnDq7XATuxXxJIh0Dp30t+xKfDHgy+D9QyJqLM2AP1xXbw
         vgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171530; x=1789776330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXFkUUSERusmiOZxFKcpCM04OYHSm47q3Lv6FIZm0GU=;
        b=crO+bllEPqZ8J061naL5ocm1VwSTEU08lQqOVAZ/8Y885ARjB+vJ/a7SzJoEf1C65g
         PzOE2pUQYjif/hHtPrlDALitZC9Uhu4FDNVwT4RT4lJ6ACClTbbWTm94xtc4B1CxpfM4
         4wa1cfg8NJrkiJF4mecOFEi0GWG9rXz3aNBflqD9+yvaWWBoA9aQm0w3eDplJdVUiUnF
         mY40kSz9h5wfkuSYa3bK+MY7iNct2f7wDUB3j4hRZkAdZhkS1uRTNfM8QUHN7kCo9t6w
         z+RL46KolweN6Gsqz9w6O2ZLvjaHxHhpKLyHC+Dzx+LzhhW4tOfGeyD39Jlv9kAfkd8/
         OWPg==
X-Gm-Message-State: AFuF++kw5W7eZG+Unu5Joclw9Sjj3u4+Jer14yxc8XhVEZQRtDrwL9gp
	z+IDJsi/N3OPquzhFjSqc7PcqcNMldBnuadvHqg1EH366vDplsg9znNdeai4Bw==
X-Gm-Gg: AYBFou0TXsmVmWfZdGHvPlCUllpaF+2ayMsH6siSfigtKjzwSdmZHW09hRFkh8UZ3HM
	EiSgt2idxQ3ydrndXe9BJVIYbbcH9N/RnDxzKdcgf9Cgj5sykEPLgKHXZXajOrSsQK59kGO+Tqt
	Dk1GtaNCVMaFrKqxPKCoDS7IgJTccFLWOwXZ2op8qSoGcBGup93MBv54m32FR7dFD8mPcLXH1wt
	1gks35KI+W/Gjhb5IzIsJuMGfoaXAS1x9z5dlAtH0taaSKSTHvijmRvGdaOQ3KNvFF+SGU+bDPp
	hWhsgzSp7RiIZtTwQ3n894KQCrts+1sIEHnkSzvLKR8GWuJi/OlNqrfdptbrTnCPlT/U0wFqWGK
	gU+GW/L0OmE/hUurd/jSLYHU4AXh4AZfxYJC0H7yrHWj9DY5fjMxft8hrACythEx+ysljahTov/
	AMSiK8IBtU7UI54uhXp/p0oebmWwHISvBHCLlLKdnbRMLEgWjVeVCqbQeHJCQ5unsrsXt9wjNUx
	q2OIOl7aTcZww6OV/pm09Pun8j8j+RPN0/GgQSQRvITFmk/qR8cpp0RRJbIcVKKJMB67yYK+MEl
	DAXGz+d9M9TTl8Xp2KpK8clcQLbQn3Y1W0ftLCUszBHzqR9Q
X-Received: by 2002:a05:622a:4d8d:b0:530:430e:8126 with SMTP id d75a77b69052e-530c876fcfemr131514161cf.47.1789171530137;
        Fri, 11 Sep 2026 17:05:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a239sm32910836d6.26.2026.09.11.17.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:05:29 -0700 (PDT)
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
Subject: [PATCHv2] clk: actions: owl-pll: cast delay to unsigned long for udelay()
Date: Fri, 11 Sep 2026 17:05:27 -0700
Message-ID: <20260912000527.231245-1-rosenp@gmail.com>
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
W=1 warning without changing behavior.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix uelay typo. mention W=1.
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

