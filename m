Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC4272E56
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410557; cv=none; b=KPuANlDIP+mUF3iUvP+dc0x/EP4wJbfuQkioPTTST54RFoM7i+fCK5x/XMRM5RHS0KWV+hOiS7WrO9zPOYH1VDBGlhMl2wj7liv8NWPrrMC5HI1TyyhqWaHckCiyUCJgHTqJ/vJNimyPcNgGoPjwCkIYMf7xZEN/VK9YXxHHpzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410557; c=relaxed/simple;
	bh=Ll69jwTycTVdStJZVNDDkPg2Y7noF1LtSQhw0u/t8tY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eK2WA52zTHOnTUxsnlDBl2DJShexmNoARk8st8Map4FOPqP8dt8YBZJdymuIQtAOXB9oSLv8nThMp2Icajzv0wBeS9pOOJvyJTW6s0lUqV5xO2k7m3yOVVXZYORxkX3nB072zqU/6K36lCTjwsJDGTqvv73/ssodM10WVvngOFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NF81gmrE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NF81gmrE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso4201651a91.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 00:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410555; x=1784015355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=47qH9DhdGsXSvcnn2TMzn7MFl2kXpbMH9aBDXUUfcBo=;
        b=NF81gmrExriPwHcYQxKufEChkycKDwPfgnoPb4kOq76khlCZIbGRS750MmLLj+B15N
         1hxEEU7pN0gVLk5fIJ1xBTY1I1bqDgjKKX/vO79nHrVaE0nVhYJ7HfUYUOM6pQKseMmf
         0lXUIIEFZ7QKU5e7hvDW/wvBGGzMA2S/lHK/9EK8z9+7+WJQoVJL7RFhPmLM2vGw1P1Q
         14ErFbrZiBg3N+COpbjduLz20wtLX19w+hUSKGZll4kMYcObwyYezgtXeR4RpCydcS0Y
         sMBWEqR0qL5gbsI53NoODoXBGo4cQah0osjGYVCHqRaBW6ZraRJ81x1oeTDLse6Rr2wr
         +9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410555; x=1784015355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47qH9DhdGsXSvcnn2TMzn7MFl2kXpbMH9aBDXUUfcBo=;
        b=FdQZT/gBCU+mJDvuk8tclx6rZBL5PRFX/kXt95rSzfJ2Urik7QLTl5zd1uaztAmMng
         3O1I1nS4sUFK+xTl+wRrx7rIPPVYBsKMFf5UnyQdrNm09djJOsXdFM+v4QvYxILq0oRE
         ZSaDEwRId429KQBnAjYybv/rX1KvdKBULMXN59vVTbeAjib+8qGaRayRX8/31v/x3jch
         AmwJjX5NGyWcTafAuS798nDDKqPo08QslRZ86F01AWvm7FBTFrBbagHzLGNE6k9NDhoo
         ngnGtO2aldRIX9bVW8gBvzHITqXQp/Q2q3s245Zh6M84UFyMRcXc+NcHiGbOH2+K7LEK
         lqdA==
X-Gm-Message-State: AOJu0Yx5Lja02lqHpLHyWr7pc5JyOn9KT3xVJI/VGk/WnSOEmiy8iWDq
	kYMenLVOx0NKyE44QQz3C8kAtTZN2EQBKl198/515yx9VIVlVn5RS5kN
X-Gm-Gg: AfdE7cle5V/Tb03oJW7li9p8JhwF4wARnPSGK5n8jaj9jJeU2nvMqFdVUjFgo77n2G8
	HyYgnHG9AGMicr1dAoChRCASvGPV7cQbEz0nLbtz1HyXYaAwYyiWv4WdV9El3wy2ZyRyat80ptv
	04NdRlf/QA6UR7Cx264DA6+OBVQqV3hwKHr9VG8BL0/nBeuaKqozflNl5TpcEgMoXgaEQ47TG1c
	O+RkDG66N8QbOqAGl/8GAoAD9XmfPefaNlT+n/tAPFMulT159KX7zyNNgaE6MHFLaQwHHupjoVD
	c838IW2cPyzjuxBBsKGfJ1NFZi9ekuYjIQyEfX9HGLMSUz/JksQVzGY/Yv0BkQXiefBeOu3dFXX
	DQFxPNkwmtFRbzADIYpJNbNZVI6uC8M7BdTkYb9QD2w0wAwjIEScHdCUlHw7cbT96I5veipL2Tw
	jj9pQZhOrBRiWu6zyTBxoFo89Ke2ayviJ3td1wnvl6hKPN
X-Received: by 2002:a17:90a:da86:b0:381:28e0:624d with SMTP id 98e67ed59e1d1-387597e83dcmr4179386a91.28.1783410555332;
        Tue, 07 Jul 2026 00:49:15 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:14 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 0/6] clk: mediatek: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:29 +0900
Message-ID: <20260707074839.240676-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some MediaTek clock drivers do not call platform_set_drvdata()
during probe,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Changes in v2:
- Add a newline between platform_set_drvdata() and return
  (suggested by Brian Masney)
- Split the patch per SoC, (also suggested by Brian Masney)
- Add "Cc: stable@vger.kernel.org"

Link to v1: https://lore.kernel.org/linux-mediatek/20260629142348.273766-1-akkun11.open@gmail.com/T/#u

Akari Tsuyukusa (6):
  clk: mediatek: mt2712: fix memory leak on module removal
  clk: mediatek: mt6795: fix memory leak on module removal
  clk: mediatek: mt7622: fix memory leak on module removal
  clk: mediatek: mt8135: fix memory leak on module removal
  clk: mediatek: mt8173: fix memory leak on module removal
  clk: mediatek: mt8192: fix memory leak on module removal

 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 2 ++
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 2 ++
 10 files changed, 20 insertions(+)

-- 
2.54.0

