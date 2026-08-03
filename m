Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE03F419FBB
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766685; cv=none; b=Dl1+oEuKbE5s4NmM+0zJ+Li7rJwSuHFegl+BsG3MDzsx8LImsUUuBYX84YzMzllFetRgT0KLjmJ7bMMGVEUR57kzW7t10YKqJF9YLC4YA3p33wdpqaBst7rgAnnjO+y7dVFqMEUTlsjVlOJ0Zt9F3HKXeB1vfVT+5saj8NZsLko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766685; c=relaxed/simple;
	bh=7h3J0KJRIBj4TZbgkPIpnUg4BNLSixuEuLBm1vCS7vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3zkibeNENOD2p6Rh4s75mF5vu6Wc1nV4uPkGiRrErOq3Ggem5FPNLWckxIDP+M/WqnfhB5j46kH9gEafVZwg7ojySRr47NhPrPvwD3XhUvZ23MRJXSmzNCZtZLAuuiZZoUfEw54+iRhFnDc2XCFWDbiGd2U/CffioUbFdlf+ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agPAT+9t; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agPAT+9t"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so849289a91.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766683; x=1786371483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWFicEK01U6Ib303mAzU47Nrzec6N90vhxPL4yip0pg=;
        b=agPAT+9tuwf4Jn1YfhRPz0IaKYkRrpLW6lMB4HultJlcY9CMMpRoS60fiEmy52qjNp
         RIgf5Q+ZaPq4NfuWzTB5HPp70KfpBf32yfhIoq6G5j06D2inq/mrzVrET+MA30nTPtoH
         6yArbHkcGUsLadjlheyauyBM9LAjLpFltAU5NeISXPB85IfuPl2jvq4fj+f1kP9DuGFX
         H/KcaWICtna1ySz/pPf7L2O5mp3Zl80maHp+HC9i0fZIe4PYx0j5/wMOYPpLpg3iK5qs
         7OxxoAMILq0IUdZcWGBVxd92yg3n9hJDIQ37Bzxkyjp8eleogP0u9ZRK5QCCVaRbBoGx
         BMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766683; x=1786371483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zWFicEK01U6Ib303mAzU47Nrzec6N90vhxPL4yip0pg=;
        b=DBegSSLoAFzW4TuOC5dwfR1ZZxK9o00laf2KOxd2u52fNbxTQEyV31QsJ8LmajJZ1/
         5ylHimYesfkKhcQYssxPhmZTCp2P+/kDmyUKLq8BmbjZ5HMGTSXer7KxB2SXI1br8lNS
         ht2zLgvUKAyudN0t8lBAbdnLPUNTEcsUZqMHqkmy2WHn9DNVK881per9C0VvM+69ddvA
         YhpzBDxu4vWSjYOQCzNcyKvRsxIssbHiRmPL5wH6US5ev8e+bw7B5Kyv6nCNDnjDdR7i
         dT8uuJGOH+7P15F4xTJkiKuXSs/zrDZLPGAp/AaDBslDJYoi00K71rzes/QqU7BCkif+
         rzUA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7W/M2j9hMpyJVqpvMXMAdxXpBkLqXSLFyzPdd1awRzElkI3+8a8diMx2PZMA1Awm7nFgPk8scgIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHdVJKXrYzgOnBk33Ci7hgRYVcaHYDxvupj6uiUc1F73lhjUTt
	gD/jzOtq/d5PL5IAtstARxU//G1vFiXaM10kRHBEf7zqTJuCyZ1jphkn
X-Gm-Gg: AR+sD134SUPQEDZZJqzoBgiivA8idkJAWB9WhPJ9DCcz4mOjW5Y5dnGxvaxCTgtoyFa
	1P9ADfSliLWDoSl7pn0+AB5zTmZB3E9NecI2KIXLVe43W2VV/PxOxeFsF852PT7V82bt40KyI8t
	bHrgfUIueHxtUkpks3Ak/uewBXXoI1JYSebq5/T1rcUeSVg3e5mylVIiRshja5kmFch05JAo8D0
	+IZ4o2h8k/6JefGEsWBmdx/hHtifW6bD7XLcjZpL/V8d700zE9JjHkLHDE8J2ZXKPmnhMmsxwjl
	mXnvf8SNZI0sfPsZtuxUi65tvTY0c6JDjPgJxekDUc39v0Ye9UR9tAq2/0oUJFKUzwnlzoOiCTE
	iEEB58mW67D238vRSNc6jhKX+zUSSp2Zqqr0qnDvpdjDbmAYvlhKmaRVHf3/birywBnyVtti+eZ
	xoMXIh7iLkJfygo2PY3IgpGIhqzy1x80LSPrVPFva/+uyRWr1xIUp4vEEBpYCdlMSUdxOuxwxpj
	KuD3byOG2lVVgxaY3Sx
X-Received: by 2002:a17:90a:d445:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-38fbc53109fmr9002290a91.21.1785766683087;
        Mon, 03 Aug 2026 07:18:03 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:02 -0700 (PDT)
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
Subject: [PATCH 08/32] clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
Date: Mon,  3 Aug 2026 23:16:35 +0900
Message-ID: <20260803141659.559129-9-akkun11.open@gmail.com>
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

Add MODULE_DEVICE_TABLE() to the MT7988 apmixedsys clock driver to
export the Device Tree matching tables.
This is required so that the clock drivers can be automatically loaded
when built as modules.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 416a4b88d100..24f4e7b87a31 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
 	{ .compatible = "mediatek,mt7988-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
 static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
 {
-- 
2.55.0

