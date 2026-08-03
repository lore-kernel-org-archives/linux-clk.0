Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B2940F75E
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766663; cv=none; b=ENlhDvGaotpgIZnYjdpG3G5sj5QxxLcBHh9PiXhfLdEnMflZ9GpZrs7UDgvV0bIzvUWeAZkr5dH9LO4LIp6F+6lsuYkG4xiLqOG3uxQ79z07j6TjcINYtjGU/sqzHsuOZZlGmdHUseVXcqTNrXC7QMaBe4LNADRABwdARpIQaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766663; c=relaxed/simple;
	bh=J3vrVWoQoo9SDz7Fu3bUlFwKeGghiPaMM54JY4Dk4aM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hzibtw+rxbxxCptngA0IMHXdFomPejlP7/jxIGXmOweehFj9pdNtvXEv6XX2zXcIsAbwix+Y4JttHfNll1qMM3JTn9fsggimUlfQQg8oUbDra8p7k0qvabLWI0lFEgpJjjBqwUMnN1ou04nXavsGFdtoo6Bp7FoyHv+g5jLPYy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAGQs+em; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAGQs+em"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3811f512167so3468358a91.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766660; x=1786371460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQTegJW8Vwp7QjW3gCxx6DQBByocZqrqYYXa3MGI9cg=;
        b=rAGQs+em83p6rtehKwfH3GNyiBRVLVTpezTVT6oGWud3x1dQTM42uj0shafNr3cHNX
         VraHzXeVroxeTY+J4QctFngWoGJL2qkHhNsIy7osIXAU+yX8kAJdQPHyT+T9pVZ2H9iy
         ex+aadc/8kmf9Rlf3NDFWCBcM9IEklwJF39BObM4u4GcZbYwIVsTyTaLNUH8TPwyG2EO
         EjuPL3GuB8zhmHwK48D0p4+f/gqe2cq8NJaZo7Uq2WNCNq9LYJ0dSFUiu6EDGPB8IZI3
         WqRHE01SZkuHdjfVbzf+k48LbNF+5eNRMAn6Hf2Pl1+dvsE9vEPx7H5ELwvSO3i2q4MG
         /sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766660; x=1786371460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQTegJW8Vwp7QjW3gCxx6DQBByocZqrqYYXa3MGI9cg=;
        b=K1LBhef5gCy+xKB7zpVCCMeX2RPKCFE9KUORwwMnVqSpqdWdslhQlsLu80vr8UZRhA
         WckgWMkAcYWjiV93VKCLrZpXiJOFnVbJ+xnI+vide30BMLEqwWTlnhTmj+/zA3qvghHG
         deze+bZCJmfjjJyQZT0QoXGJR98ikL2cvBSy3evgXMVDJqrXFp4IejLX9jXIu9021sIX
         IeEpnE8+VqFGM5l/myduWGq9yyj4bISaiMdXrgRiy1S0krb0ksCt1gjbYtvWX3CGzMiU
         NJFhhImzMHkexKpVa3K3UxQPaRjvUXssV63BgM/13sKoHHkEOkPiLuXBbmYUTJGl6M3m
         G8Bg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+jZuu8S0/6JVV5hQJ8m3v3vtmXi169U2uZUQt+ZNslHlgxHK0opgfRaxwkfrpq9On1Ep+fJfkerg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLRnRXElFJdgX9TNjBloLxT/qzxylcqPUXOjt0Ckm67XTyQ3n
	LdrgJREo+KpVznqTfRdfrz8T2zZEMrlfq2XaowEnbNyIvpxMcV/kCmbT
X-Gm-Gg: AR+sD13W2fqMZZYNXQD9S9nPTrP0WsuNHsf6xTHGsQX/bGHbe7yAMSnlxX7jkgNb3op
	im0z2pYrN+BMesIYSi2ZHjaapPnVdw628MlzwFmYyHsGebOLv5YbhflJFk2VMHOCeK8wortpIe6
	aGYbQzON1andNNInz0m9LhhiI3dHjRfEPh5KN63LP3VpIIh48a+PNcZGS7GQDJmVzpFyOTZn5+b
	LsQteggWGtrxvEpnF1kEUR138Kjtr9UVHUKZPbbDLId5Epo3lgzpwvU3nHMXY/9k/o13+65jB03
	SWxvKb//YAR+9AqkHNp/Lp5+z/+JvwLFSO2faIUaLA8x64D4NxxZVaMwHrBIJiUbczDCuCcZujZ
	mW79ro9XZ1lIqo327OgVvwQIxagT7SGzIgAwR0mRPO94oykLOMC6G/IR2qkrEb1cfow22DBb/i0
	4Bn/p7EFRSjtQ4b225O+RKWBcmKSQZ3+otcyRnCoYYQgI19NsHc6r5sPIqg1NC75ifSD++OClMB
	7/UKFHc5lXJjcEDj1H5
X-Received: by 2002:a17:90b:51c3:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-38fbc0b4881mr9861203a91.0.1785766660245;
        Mon, 03 Aug 2026 07:17:40 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:39 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 03/32] clk: mediatek: mt7622: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:30 +0900
Message-ID: <20260803141659.559129-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..fae8abda14b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,8 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..cec19447d637 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,8 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
-- 
2.55.0

