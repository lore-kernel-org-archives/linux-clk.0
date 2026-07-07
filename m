Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C4282F28
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410563; cv=none; b=C9QcQsQjBpRhvpCiCau7kYcmzrFnCN7SGlLyB4vrzmfRqhqz1ngH+f0lQG+YuZCwpLZaEbjcigVtnhnLp2Q5RTOMRGXg7PnJ0lIpsonTtS8TusIevDdzcb8CSLxb7Afi2NdVV1verfM0RWg12R86Ko8oS/Mdscl0wo8fS0720RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410563; c=relaxed/simple;
	bh=eY51WQQZc0PqgaEP4HmOpEn56bT9Elp2UnTCSVBcAYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0wMzScLhjtbXY9mB5NYY7SFAR2UKpKvt6I/iBtPzUJZn0rG3gqighpKxEnoKnEwx6Pe6YyldsqXMxd86vNEMwsCak6tEnzew3SFJnyLZaVRScSpklMBkiBXCp3OC0CY8yByFhu/KLS8DD09n8DBqD2boTgITW78w9Tj1IY0kB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhp6g8fa; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhp6g8fa"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso2896651a91.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410562; x=1784015362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKjhuNgKv0qFJ22JEcdhdHesMNDXvsHgco0Wjw4pG2I=;
        b=hhp6g8faUUnVfcB1O+KuWsk42R1RsxqRxp6htFwnwohmYQMrdyVRxGCDJmc2WpPT4A
         gqOvPyqIdrvZ036JlGZh0EwZ4Hox7uPuGOYOkHoinecH2BUjoeLzDv2HjFssSMSkOcxi
         dE7Q2V871l7jmA8014o+J7CR2psmapouY+HckKu6pH1/1GvVJLsSSUWdTCC9IKJfxWGN
         ukHfQN8/B2Q8kXXBVTchUVouGceGuAaNviQjT2K6rfEo1A+R0IVKv+UmHtEPXMsYMOwZ
         eNs31Q9JQt9bpYpjFd+duQffWRM+oTVJDzLGR3b7UMDONT6Le+HIihFbLiCnbQcF2SaP
         7SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410562; x=1784015362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kKjhuNgKv0qFJ22JEcdhdHesMNDXvsHgco0Wjw4pG2I=;
        b=RRryvMmhRPOnkUvqN1i6pulKrIFJvcOExvy1ik/RajuPRIxETEEUZeK4pjMev3eyfp
         I84wIb9j3qMpSppLDKzs47RHidcB6vRQvqJ2rikJac5TCGrSDW6KD5uy/eNu0v0YgfCB
         9tkmLLKDsYXLxF5GduZK+ziUrRxTtT5BAYNBYkT/7kr75AUmRYG/0Mc6/5lGjQLyBY9C
         YHJqZkcDkUaHIoO6qRlziaQfAjZlZKtk8hoPqkd+lgBlvA8Z/D3CiJPTW5Nm1sJy6oxU
         tnAdFmdW/71oRDRMrFv5jGPIFiOKPaYCUGMUUKlamkj7GxvWu0RZwk9VfAKcp8upmCNy
         AWDw==
X-Gm-Message-State: AOJu0YzmNRqrMLi1bSHtJ/Si0jeeJ7vn7rz3RrT0JpUY4aRoxQLHPbje
	eUqFlB3KcPuL8BVhEPYuKWaUavTFEKoYWHD9lzzZHGSrnPKD8L1rbq9HXuQ2hx9i
X-Gm-Gg: AfdE7clLkddGR7DE/80jDw8q/Mj+3eCZDILMTxFexXRhJu59pCF4nev4utQge3GjOP6
	+80BIrGVBsEYPmtJykiYD3mFzFuPBRJOdVUzcgr5mSDTZC2urIBz3jByLQYhgRqtLvq2rmdX4tS
	CEjO/hHiwIqBAouYi6OiGHk8XF4KWBXSU/0d/4ehO8mBtFrKZBpe6pQi9L0UDYIWG/UrnJHYfhr
	fpNlxT9l4rlmiN3+Qz70t3i9I1zWV0sbW6Cp8oCsRSfUfkrFHFHsdvZfrQIJTpw/iJHTxiGmWYu
	LyP9F6UdStHrRrHVMgCPngpH581gGxJ4l5sCWM0/GOuOEOPluzEG4ozNmvqyx53C0y2Cuc1f3wd
	hWpKYAOs1JHeedwWQLbX+58J2694ywUQyYjQPZrRk1JkRkspo+Q+mWQhBlwxlYmEJu4t1WLnHsP
	4g50rymvPew/TdgiH/zBy1CdrL0zm9gPQpbw85tHmySshN
X-Received: by 2002:a17:90b:3d88:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-38755573768mr4083401a91.2.1783410562030;
        Tue, 07 Jul 2026 00:49:22 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:21 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 2/6] clk: mediatek: mt6795: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:31 +0900
Message-ID: <20260707074839.240676-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk-mt6795-apmixedsys.c, clk-mt6795-infracfg.c and clk-mt6795-pericfg.c
do not call platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..239a3f5e1760 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -175,6 +175,8 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Performing initial setup for MD1\n");
 	clk_mt6795_apmixed_setup_md1(base);
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..914bb069aa85 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -116,6 +116,8 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index d48240eb2a67..27d0ef7d7b2f 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -125,6 +125,8 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_composites;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_composites:
-- 
2.54.0

