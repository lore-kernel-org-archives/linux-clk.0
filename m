Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E47D3AFD15
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410570; cv=none; b=QiUiA4iXckrk3aFuKwlVoHfqhDm9k47eh290mOptMQFENlspjBCKy909FCoYJaZ7MTvjpYfM0km9vhFzcQcGtQXH31Y7QEu0fwqPLy+p/y5+dGsIouRbVzraQGbqs2PFDVw2kuaQ855Bu5r5r/I/82XiegHCDOpQImkx1Q7dHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410570; c=relaxed/simple;
	bh=eFufH7LT3CdItIJOBph0MNu+wwyaWOrq8umciX1p/6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XF2E0yQB0lupn84VVi23AfARSnhMRoWCYnx8VqyrmCBS0t1xedC5izDHgwPszL/y60rtU8JLyMkRxfCObk76X9CvynEA51ekMCS8fPazX2W+vMI4jhGonX5yXl0GhrZ2BrfGNaX2s5XvhgOLQSGvZvdm1x+ZAyFoBwx3U/1g9Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR9uKKCp; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR9uKKCp"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so3071091a91.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410568; x=1784015368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0usj1Azn3b9r2TvYMyi39ADdH0kaKf4fB0NJ5kTbFs=;
        b=CR9uKKCpcnbViGJQFdsn1d+0qx8p8n2+RgvojUQdAQrRp8t71tBgmAlAgeHPbihERu
         b16d/9QNeqXwHl1El8tK87oXwWoB/ytaw9Ipq+XdnedZwMnIUZ55PAIhM/DsqPEVhd1e
         DINaTL5ItdsG/SRovOHAUJYVYE1upcp8nDXg8mwMbKSw/S3VZU8cGGrb1ailHs4OszHe
         s6ZtpkpduhR5vPb+YgGbIRcfQWufiz+gv29Schuu6phEJ1sxcrayBKNRm28C/EFLs8Kk
         A05YKUKuEFc+z27DHWVHALvvTASZd2Mh7OK63ylncZ6hJFMIromhUKSai+jlTakoJsXR
         ++4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410568; x=1784015368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0usj1Azn3b9r2TvYMyi39ADdH0kaKf4fB0NJ5kTbFs=;
        b=hN8dY5IfXE4YfTLnKfJrdrR5LFerGYWWN00+ZHb2S4+T0F9cKLgY7TnSBFiw/rCzsg
         OIhlIuxndN+P1Lk3bCKU634gh92FvWAtG+MNrXE4EWbKLZUoTRgdZ97sI9QUo9CFPUmV
         YF4LTNYWELItvsK5BTy86Dj0Ou1nm/GdhZ55o/ERgm+xmv3YaXropcWGuqTUv/HHiPgS
         gdzuicW78Isxoh6U9Otboi80WRtMPG9UTRLbtS6xyF9L3suf0EIqGlr20ijHxKUrQMbK
         wvS8A19o+fGtKfSUFbg84ZuvdZ6B0u3TgxqyCCHcB+xiL2FrPV4hg9+09CyMlzQ8mtVe
         NPZg==
X-Gm-Message-State: AOJu0Yz9TlLQczc8hWFKra/+VrqmcANd8V1pXS9CpksaPUirR9kMOoRa
	Ek98cF7fJuNono/PCaHFWXdNJLTmJ4H/kzpkTjzuGRZ+hcbvfxyOvnlk
X-Gm-Gg: AfdE7clpJ5JdVpNpk3E0KeIQUUoh+frGxYEl2UN6dPoq74lncO0Kw/a1yss3YUPDbr3
	nqx7d/gV7WiyhVwGUODSzzNir3nZNUOc0kV5RbuALY2RLziCIm6J6SsTHUHN5hoFEFno4F/h9jV
	JLMMHl60MbPa3YqKAxEMYE+B+YYYDTIRgM8R+ZfbG6cdPgnHocKKp+MPP/bEi9c/jVldfvptG1g
	/9BHLip1389O/uPRE5F6TOFYYGxfYPv4ClMAnbE/EoL2OXly54+VF0vIrt8SD+/tI21oYO5nd6E
	1hlh5zRC2/KRjAdFxbqm19XA0bzxS2bSzBqrLgIVAMYNnRXD4gy1sLvBN5+5XAiHferKJqO+wcJ
	ezJTG1/6XyNiT5Nuv+EL5yvrwROoSNI1wb7pgC6+vlaHPh+eI8WDuT8OSp/u30f2YrJv6VSVspv
	2KmWMmxdMkFwV2sUcxoLuagD1GYq6fSTvpFZF0xE+ng0DG
X-Received: by 2002:a17:90b:4a0c:b0:380:873:49cb with SMTP id 98e67ed59e1d1-387572b380cmr4047566a91.21.1783410568403;
        Tue, 07 Jul 2026 00:49:28 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:28 -0700 (PDT)
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
Subject: [PATCH v2 4/6] clk: mediatek: mt8135: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:33 +0900
Message-ID: <20260707074839.240676-5-akkun11.open@gmail.com>
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

clk_mt8135_apmixed_probe() in clk-mt8135-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8135_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..e3b7dc13b458 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,8 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.54.0

