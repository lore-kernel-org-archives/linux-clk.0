Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C486C3BC668
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766653; cv=none; b=DfLR1DCGzfQOCKST+MfwUYmq+TZmD/q9NYgaB+7e4HfA0izhl+aceMo0jDH3Z8gs/xX1e8F0yPL+1tqEFPgFEqzoRe9kyJiqmtIm5kDfSbolPLxCx2kPLB7MGGEGpQz4mEpoO+DUpEZJkXAL9uaBFCDR+MnWbxFnxyv/hTkucBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766653; c=relaxed/simple;
	bh=E+PMGIEqdJEzntNkc/cXlKmXnPZXFP5wyGQ4Xlmg9rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kImjDBtfBXPbAZIac2MgGU04FyD81RyKV4paMkw5s21EqQLP28XFjXU4wtSkJNMD/BJCDM8IjmDr/MA88twjJ6U8CjYxMk7Gz0zb9XGbkSZ1CfFT8Coa06B/8J7TKWyypXaw88JFNSD9xAKPUAC48bijr6Hspp1ctFPKuacCC2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWryKh7E; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWryKh7E"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3406345a91.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766651; x=1786371451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4R15TfQbT6I06GeZOzblPl7rBfwuRyPXGr5wu9wmhkM=;
        b=CWryKh7Eqc60/syD0xcBd1GR/qAJENWYNqRupto/eY3v1p7XLby6WUY5xNGk2PQT6b
         Zhg0to5yuYa9V76jJLtDlO7OjOPifxehfvEMPpVMeS9zB852p5DBmttdS5JNpuDatM0T
         pDW4ujTJALNVZpUzmwm5sh2pHO3p9RwWCC1BlexYTQoUk+xS+ZhOnhQkR5w174QQhMXZ
         w+CRA92qWx3DkCcvzStgiKOFM29NSYsUdEuDwKGCDsmr3pUbneLQ876we1s6IQvDII/y
         37z63r6SGOnJTisaFwIedo3oCK0YL/3kkXyZSkFyipxCix+o3b9Dud/IfvX0E7Yw7NMD
         UZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766651; x=1786371451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4R15TfQbT6I06GeZOzblPl7rBfwuRyPXGr5wu9wmhkM=;
        b=E4Z5UnOReIGUozWJSi3m21n31q1n4ltovgdvvc8fwoxhnA/R0e7cg/X+/ZZFPlSTUm
         JLkMhVSLxWpBopR5nQdgPgY15x5EZNqSNfPSSLM9K0J97q5AKxPnqvuZFoW8T/AdI783
         g3l6/EFyQvCLmGrjMFJFOqsJOUK4oeZPbfLcKuLw7S3pfTKpZUu+m8wVzhy1xQO1z5Jh
         x12xumFjVA0agrwmBjM8wxTI3AoxoMBWkfwMeAMDhr03HKLqDZuXx+iXosxRw134pmEg
         6CWILIQ9HsZoOCtb384fJBJJvIlEp1d/6YKW1E45o1PQsuwsqcyK4PTtt15vOhR90iZj
         A8fw==
X-Forwarded-Encrypted: i=1; AHgh+RryDp6d3gATA1wItvMa2CMRuVdqCYK7y2O011rDBqZq16qtSka6UQ2P05WwcHOWr6CbH72CQATMtfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLSM0yUx6Z8HVMwPR1KLW+2UsaMPsgJn7MLX+e+LsBlqNAlfYf
	FmytCC+FBXxbZxjOnYh+ZHWHhXrtDMN2mGeP4DpoyXodgY85Th0YGjtV
X-Gm-Gg: AR+sD11IaGaO/dB6lWKWLwhZaB1BbXhQh149CDdBUY8KYnT2vd9IkqEARRKD7wmbTLZ
	sbou0bZ5TG5Y3scMkGjdgqvA0H4977nxy6urLTTOs4GFaTwwDm9aQR2yPz2mcZQ8QXaQu/GlMiw
	DtqjFjMIe1fBspBDDbYediVpH0aRYoLgB8PwnFadAVTiEh9bQ6WnDAOAM2keIdvErwX+Y+H2FhG
	yibqGmSQnajhsLLysIXkElqcFz6H+tInQxOqqeCMaBFT2c85jP8luNjo4IxFqqnqZa6myOC6GXP
	5nmXTw8xT1kF2fIzTOHAZs15Tm6mCEvVxQBksxyDIBLzps4PEVpV6QXb4sJbGt3VeWyGzSrgjX/
	6pH2v/fbi8oAQCWJPFFNvE5SMNySf1kPbkL4+y6shxXIidNegbBFOLzaLkUoOH5JELJzKk4lBes
	vnp5o4aG7CU0rGHP4AZSBTqkOHtB15+d+yIFvnaemC0bQqVFUdAQEVptAQda5ocy72ddb7cC0fU
	J2xVfzkkvGl6oeRUM3Y
X-Received: by 2002:a17:90b:48c7:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38fbc3ff29dmr8848847a91.3.1785766651087;
        Mon, 03 Aug 2026 07:17:31 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:30 -0700 (PDT)
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
Subject: [PATCH 01/32] clk: mediatek: mt2712: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:28 +0900
Message-ID: <20260803141659.559129-2-akkun11.open@gmail.com>
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

clk_mt2712_apmixed_probe() in clk-mt2712-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt2712_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 54b18e9f83f8..087cf574bcdc 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -129,6 +129,8 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 		goto unregister_plls;
 	}
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.55.0

