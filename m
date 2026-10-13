Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4A0531629
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904719; cv=none; b=Plx0tktqBKgt1HDPhSyOiFpZlB3OtHjaJC/Q+6AP0OpwBKbzJ1NuPqE27581KRrD0mphRa0KYx3aVwtrh1+EJpoQa6kykVUNyvAqjG7OuPBSgTCjD/dRcMrWsXtl6VDRDfzdikSLnIvJSt0moQsKAfuHzk/NFWuSJE4WwT3byus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904719; c=relaxed/simple;
	bh=0Rg3trTDVXkz0wUUwVq33AVQV/Ql8DJF3Zmohm/+o8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkkEPDeCajYmTFei8VtDcY8KvohMLAFCJrMVGMvuQY90mXYL6xms7QkfBBDQCGXNmZ8eVBICSW5ohJML0hJy2qvsnD0oNMtlq434LfSdeUj0Lpi7O3OR/E9cFUCF1yNgogVUbmB3eSOksnkxDqQO2/lbuVySTjM52t+LHxuOnEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSFQ0auY; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSFQ0auY"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so87424a91.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904716; x=1792509516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSK+e0uR+hrpe/b9QMXoajdIs6DQrymWCkZkpBSheng=;
        b=CSFQ0auYDP+y2PP7RGugfVQFbHFY7/BZr1DfkyU1Oqud1oLaaRkogFhpBqBFDN3QL4
         v0hk8qyiYtGW51+1DUFzfrMFQZ+4+2rSZJxpusVh+++Au3XWF8PUfnuumsXnvImp4n4T
         nuaqf70OPFeT7q265wXXrWq1OfZls9L1l4E8jCmYHHETY/oUeHZGAnf2DFL1ffcJaNE3
         RY1YG66ykVlZsXs4FdweujEH/FOrMxejFyFg0jdTOcgfivKWlkOZ4s9a7F4I1uqhI5EP
         iuBOw4kpWu6Su+cPcUx5CeFZMzUlzBCOeUv7qZbcNlEXwBkqHTl8evN7cJpdYjKJqgdL
         KSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904716; x=1792509516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSK+e0uR+hrpe/b9QMXoajdIs6DQrymWCkZkpBSheng=;
        b=wR2InMazISuZVNVm4pjnYNgWy6QOE9Kr2eJ2qmBD1Eeaa0ljyQPXrzhnf6DjNnnJST
         E/JLrwIY2JBNJ/TSgfP/WyCAshCs55vp3GjWskI/9dj9qw/xeR59FLbw6N0t1mZeIFs7
         kKa901IR8AIO+D7ovpQ+TpGOCLsIMlfawFrrgLp+Xd2uVFI664ZJBjGVo+xI2YHukqeC
         UeZfksEbb+X7+2MkXTXugENa3KsHBLz0k5k3Pxch7KbyT3hmGEoQi3T/NdRQ8+1Py2Ww
         fZBlJ390F4kImHA2RE3Oc8C/PTz0CsCsOVfWwSMrvT53RJiOiBKLqPRDev8AgpxIq5L8
         sNqw==
X-Forwarded-Encrypted: i=1; AKwUvBxC+gSdmwO7PqB7FOAB6DN6JPcK/pNLhUG+nvPW7iQdfDIXX4LtgNDYnkZWCE9sMmRqaJiCaQ6thaw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa9FfKtudi8QeVW4atSAVfffWkOTxKmznZXmv7YDIJbO2syvxp
	UbhLNDLLwbeQ0H/se9xPN3hmeh5nzTgGEAp0qoUERmjyJdPNAFt+6C+1
X-Gm-Gg: AYBFou1xEMeFwbqzKpbgnXL13fDgDz19i4OU6/ph/clduXdf8BCYHUOu3yCw3JioJiZ
	h1a1gzKeFJ2ZWn7XGgL8w1MTOd7+a5QCSUKlbz1Hj716DCTKuvylIgPssUwqCJIAu0dRclsW9MM
	9DnjZjK0R7TRkGm/V2i7k6kvgVlyCVUzrr/fzDvKWxR8m2lG5uIKhXM3g44XNopqjRT3gh2srMd
	YFfb/qZZsCK8TS/KbU2lt7jX8kMFIekQdBc6GZ73Zs7HrgFznDJdeF929qAk6B7a7Yr+KAcwM8a
	TCSR/xM/DihY4oPHIov3RbkEt9z1e5FXXamBegH9Nf1ogZBmZoD31kynjjQtvuiDArna+wW763T
	27iEZtz+3PW9bFEj63pIbBUdDlomjpaLudcPVajY+H/+ePAjRAcuhXk+LT6Nwg7APNQDwSSxhBs
	DjgK/5x7Rn+AIr3URe+xKFZ9Ad/DnG8HcipLwgAcXGBFn8YQw3NPHdQmu+MPryKXCXIGKhHVrcK
	GFlTKgKKfCxA9QTiQAOoAo4nwqMpFg0SPFSiug=
X-Received: by 2002:a17:90b:4fd2:b0:3a0:b800:50a4 with SMTP id 98e67ed59e1d1-3ab36956d82mr9294604a91.3.1791904716462;
        Tue, 13 Oct 2026 08:18:36 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:35 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 07/35] clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
Date: Wed, 14 Oct 2026 00:17:06 +0900
Message-ID: <20261013151734.3177690-8-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MODULE_DEVICE_TABLE() to the MT6735 clock drivers (imgsys, mfgcfg)
to export the Device Tree matching tables. This is required so that the
clock drivers can be automatically loaded when built as modules.

Fixes: 0bd9b1211f74 ("clk: mediatek: Add drivers for MT6735 syscon clock and reset controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Removed wrong mentions of vdecsys, vencsys from the commit message.
---
 drivers/clk/mediatek/clk-mt6735-imgsys.c | 1 +
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6735-imgsys.c b/drivers/clk/mediatek/clk-mt6735-imgsys.c
index c564f8f72432..813241d526cf 100644
--- a/drivers/clk/mediatek/clk-mt6735-imgsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-imgsys.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_mt6735_imgsys[] = {
 	{ .compatible = "mediatek,mt6735-imgsys", .data = &imgsys_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_imgsys);
 
 static struct platform_driver clk_mt6735_imgsys = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
index 1f5aedddf209..8a18ee244a4d 100644
--- a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
@@ -45,6 +45,7 @@ static const struct of_device_id of_match_mt6735_mfgcfg[] = {
 	{ .compatible = "mediatek,mt6735-mfgcfg", .data = &mfgcfg_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg);
 
 static struct platform_driver clk_mt6735_mfgcfg = {
 	.probe = mtk_clk_simple_probe,
-- 
2.56.0

