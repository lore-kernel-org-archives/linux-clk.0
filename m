Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD78B51FCBF
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904725; cv=none; b=UhcRFrD9LGsQmr1z9EUuBb7t5xCndk/QAyDRMlkRis65Qs0AetKKtDMcHavU3DQALV4f1EN9H9tM61yosUsigZNqPzINCg7804lVcHuGpiR0Yd5kd5BhQkgzWcCkQchsgtPZ3ZLQ0RAGgrborlCleZx/XJBiYICKNlbLkT8S5UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904725; c=relaxed/simple;
	bh=CgYKKy5YlcFezMlDDmRgiWdoBgMJBSqoavgoqfha2dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obGX+C5J0HmJ4/ll3M3glZs47xs1i806NbxH1XrXTL0xs6ygtROLJ2gzH+RxzQyZBsEqJ7ZGW6P1nbpYf6roukNFMeuXnbMh3suBh+3uKAYTqDuBlw2lBiJvlsWkK8K3uRdkhFhUdWmdA+ZT4tF+lNsujBReu1ij8JG7bpebang=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAK5j5uW; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAK5j5uW"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1181743a12.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904723; x=1792509523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtzOa1NC8kzjOt9xbG2RWY9BgPG84LDft99j4Hfp8TU=;
        b=sAK5j5uW7BaSgNe6WoDGRhLkxChbAJphm/a3S72C8lPi14ChkPQLgrbw9Zt5HWe4yQ
         pjhIxU75I3tQWs7YBVKp75PqEuKR7GFSK/mZWJrUyq8JdJrD7+LxrWw0mYYctffawo7D
         9mb3JC0kx+2TtK8qRIWlFQFWepyc1vAG5/06KtIyeDPRP6pe3gsQFFdLqwKdg3wUzgX8
         XJoxicpyCtRD00JTcHvojduNVg5233Rx06uZQ1/Ss5+KOAne/Dqbc/mtFZ1rLbfeJQjv
         jxtQKVi+Ci3WfikbHVAX/teubpu/hqXdTGcbT8VQ8FFeu5DWP/wtZenEKrtFMHeGYvRl
         Wwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904723; x=1792509523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtzOa1NC8kzjOt9xbG2RWY9BgPG84LDft99j4Hfp8TU=;
        b=U0ZlroqxW7GyLeUvNkQ/kOSgCW6E8X4GgHkCmO5CxrIydyj+FzMxtcNxu3HRaUEi6D
         JobFH5QmCQNobpbp3NSB1hZp0uYB8DurOuqa2K8F/PbU287fz1fM2poZa6NpoFKfwEm8
         PI8XRnsgo6qffMQ06OMTXYvlX6sgEi4lKZwdhDhvAR++Wo4BLQWmOLTx1tXpRM/yaiM4
         BG+q/noHMGstapK3nwpt/VaSXyxuBoY5aPe1fAXzMjfNSrUXkfjtt+lREYWyNnPmABrh
         YIKN6saJ3D+usl8LbIRIzU93zIGoCGp1PmUCR5+qmeD6vyhQyYl6S6hSQiB3i79h/9n4
         2o5w==
X-Forwarded-Encrypted: i=1; AKwUvBzclApKOBgxrF1WEOfRXtG/KexSKOuckUZIYFwnqgatkVcq2XWX5wUC7Il4UancRXD1FgtZiXncOeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYITet8cZOh2O5REAZhQ5niAFdoG6HpiKTLPC7onmWi4GX3CKMlS
	dNe0UxbnbBj1oR6SicLaFxtQA1KWU3OYV7moIGRQj4DYNhR3hdP1xF2l
X-Gm-Gg: AYBFou0JY7hIVtoavfAebRVxS66tXZT++e7ZyZ0BRTy0JorYywydTFJro5v08T4ayJg
	zqPrmxOa0R14EthxOVtW7Hgp/roRL9lAJf/1WwcQbdO7Z3R3PJfGpJJ0oAuF1W4R5idbuIDXzzm
	vHXy/VZXtUOL/4xF8FwOFueFj4jNz5Jw5jnw101oGVyEyYiODeNO23UxW1BoVT3we1WnPxSAHeZ
	ubM9U0osfHsbeoSB3PdVRSq9188DyHbQfN65esl3Uq3PLYODztIi2QrUfYjoi6E5/wNEl0Kdier
	W0rA7w/P47IQFlg5ISGAtSUDUf95aqra7LXt3pJAXPIFzQJvgqnVIJ2fHgTDrYToyiMTCFCzHct
	ihF7Sxhjg1VtAW3i3XT5WMq9gNwwPSoSJyRT94UzkkEp56tTauQyj/enNrvc7cqmozMPM3TaauD
	mbwlKcGuTDUL/+xRgKIhRgep6lOFKCA8hfn7NCrlJGqGhEH7/Cxi8QSPi2416hr9mY2S9MJTqf1
	+nl7NDeHthHrc9qef+e+kuNlLUd
X-Received: by 2002:a05:6a21:4eac:b0:3dd:a00a:7ac8 with SMTP id adf61e73a8af0-3e16bebfd96mr10253819637.53.1791904723172;
        Tue, 13 Oct 2026 08:18:43 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:41 -0700 (PDT)
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
Subject: [PATCH v2 08/35] clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
Date: Wed, 14 Oct 2026 00:17:07 +0900
Message-ID: <20261013151734.3177690-9-akkun11.open@gmail.com>
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

Add MODULE_DEVICE_TABLE() to the MT7988 apmixedsys clock driver to
export the Device Tree matching tables.
This is required so that the clock drivers can be automatically loaded
when built as modules.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
No changes in v2.
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
2.56.0

