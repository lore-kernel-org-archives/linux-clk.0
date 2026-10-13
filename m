Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7082151FCC3
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904713; cv=none; b=akpAfLY6zlVXwQF7vp7y2g8atyNY4qfL9JIZpNLmMUR1eLjBjRjnaPb468IeFfVSMS+El+KFEMQUb+U5nT731IsIgsTBeP2Ic2Ij7aO05s14T43ofgfyHYZ5otXogbZeDZvHbT0CAWXklooVtI5tRr0eCbTKJDSITv/unLWL3ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904713; c=relaxed/simple;
	bh=kI48R3fJE4JTl82VzeEKG7bnMrIy6krPzjytHDhI1KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0EJRr58mjvHXpe4/ERqs6iw7f62ugGmIWQCHXf1AWsIj73Os3BfLUlGkCUQI3nVo8QwAXtfuIr1cFzqzA5lgP8X1czyt01TU7HSP9QWL/Twh9waQiSYvpaR566NTAuLODDubcDt34BYtpLqWG+9SPeC4geZnPyohugnG6ps9NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5zM1+8l; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5zM1+8l"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1206780a12.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904711; x=1792509511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=;
        b=j5zM1+8lKv8jz4VFmzHpU75dcnRBIoBwktsh4QVNeEstlvTZAR7G1NnE5c5V3LNLmU
         DwykOagHGOOhHtkVRNaaORjbfY810DH/djWk5ckNsT7ze9Ji4eSlF9OAXcU7z6gIjh1N
         dcN/28XMLxOPzGEYBxytrdAeGOuFrewj+AO6Rb926l06/w2hbmdrH2k8rhraGEgV/TTB
         /PMul6E26vI/uvqj3GJVCYBd5F2QvFWCLHvptOCkWX5eU5HMiixoLrcJqRH7yJFHNeOU
         GBo7i14nZ3AHRoTJARJTyXm4PXHltq0Qf+RxyW5L7RnEOqxm6mZ+mCQHsj03WC86kYhh
         eI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904711; x=1792509511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Sh7oprtwXxfenbG/+R5+LvA/DuQZDqOYjTKSD5ze8U=;
        b=pyBTxQ+VmPSy+G463iHT9+QnmeTmpZAKX5lLbyrW7e55J2jRbZssNqSGnIFVBfHxH4
         90VN6hbsU/PVSzyExVcYqxDYKYSSsJZhlgQdAXxPGfDl3w5UHcxbrrMbZGZAcz1N2z4e
         +XoYpHFazMa0ZGKaSne1WgpnKxP3rDInL4x2iwXLhCIh0ZKKRUUjmSjDCraP07JA0h79
         2sz9wp3VQM5PGM1/aJ83QwzQt/43Wzl/U0DFlS9v/rA28gIKWSnifcrHYqIXMU7yvAHi
         r89gwKU/ucWkYXHjIYlMd9Pf4p0zzD/vvzMmtXldaZc4RD7r4ykuhFgC9GuSmA+YCpGT
         KDkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxruiv0kbFkFMmbG1C63Be+YTSSHZYV9f13BCyFIOIRfftlFWsUbGPF4vCP/8o6z8B53En3i3ikoZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU/BwXZybPWDrlaXF77zMrkpPWH1uUwpJBgQatABd++pg9QFeV
	V72jvLPmT784xRyT+SzQcxUWi9BxdZ70cNFgSeeVGCVZE08Svn4c6AzA
X-Gm-Gg: AYBFou3HgahcHudBsC63COH3uZD3o5eJx25aIQb510zvhocUvGTrNX5AcwTmo6N1Wvb
	AcFYDesuDdssZUJV6hVCXuEN0ZMPOt53gWf5wnFgKJo8QKXfAyMvU/f8kC4dkI3cYpdwQ2gcg07
	sClljNIubxxgWiOFJgf1/OtXe/dwYM2Ot24FNbChpLeHKWDet+c4FO1mF8EM50CayPMQ8xETVkJ
	hWWlu1/K+dWZdDqF/wFTU9rLKcpXqb9MnbvyJf7XL6juHelmtj7X3oEU88ndTevy0gDHj45TEja
	Glip7rf0QjiCJ4cirUddqOtW4RA0m5Wpq5TJWYrNjjHwVZ9bG/YeedOrqY3GaK8YEOM5e/UQ1aZ
	w3rWpbYfNpnhymD96qk2MEQ2s7jw5AjnhYhkstUQdbKjTfGTS3j4oBkjtium26qcAq5zi1+2LSn
	dltreh4JrxTqqX6N7v3nQZai4IC2zli41eI+zMuF3lhvQPBN1HbpN8z/PzHr3CsXDLwRlXh1q6I
	iGJysV98zbO86gpwKfS0sTQj8bf
X-Received: by 2002:a05:6a21:394c:b0:3de:3f4d:f2bc with SMTP id adf61e73a8af0-3e16badf2a9mr12154427637.1.1791904710777;
        Tue, 13 Oct 2026 08:18:30 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:30 -0700 (PDT)
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
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 06/35] clk: mediatek: mt8192: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:05 +0900
Message-ID: <20261013151734.3177690-7-akkun11.open@gmail.com>
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

clk_mt8192_apmixed_probe() in clk-mt8192-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8192_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..e6ac40e2f12d 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -176,6 +176,8 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
-- 
2.56.0

