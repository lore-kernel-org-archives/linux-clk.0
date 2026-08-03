Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540338F624
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766675; cv=none; b=DaHEjCUpwnDl6EB0vQuh16cBmxvf3MPlPYACd6MNopHdijUGE9IdbtjQByWaVArDZdU9LoQ7kkvZ+5GuFnWPe5mKx/tFtPrca8Scv3z0UFdmHRqkWbrqHw6ZfjuyEuGyiYZoPEmfx9GilAj/K6aXIEOCHIpTtvJTaHofMba77C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766675; c=relaxed/simple;
	bh=G59FL0kwCIrlNHdd8hEsY83x8QP+b4bNhWMWSKXFaE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ojbx34e83nR01xFs752mMZvDaQ0lGIJ/YxN6u5OaAEhCMVXLu2kSpFN9aRtAfCZ8f2SFsKRmKbLs6xOtmXl12Sq/J8zEfACAEdk5JRBRVtmBmNAbVjzuw36sjXVx+IMq8u/otWP8b2X5LCF14KNN89bsSp3GtqXLc7tlFmLzGzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0PGsxYJ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0PGsxYJ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3564237a91.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766674; x=1786371474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1YUTKcwC82n8dRAk6Rq6PaXfV44JobcORSU/s+vRUxE=;
        b=n0PGsxYJi3Zcw+1Xviepu4tR1udQgxMMX5zE4+lqLoOLQcj49+H4dz2TZbyqvNvLpF
         std1ZJJOmklckUJDsi1AKmPkX1M+OhquwW7TGydssSkgzG2I1aqtt48vg/8ifkvjE8Kk
         pIHrNSENB48djBcDhPKMsJ8Ami/++Io/A1L4CMviQjrl8CaQ1UUSAJDL/I6cQaxV9qIN
         SPhZZCL9nZe/jNj+lT3fOtJ4iBOufGVtHAuNvxgkNwPEfapH1I8ZTpobLIBNsEteNmcS
         RhIrC61RUq6Pn3y/pSKNjDXv4hK7ZFhC4J36dG6Y14bfsXftkn3ovjv70Q5FMxE16ekP
         7tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766674; x=1786371474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YUTKcwC82n8dRAk6Rq6PaXfV44JobcORSU/s+vRUxE=;
        b=g/DOyXS+gOeZhMg8AE556ovpYvh+ZxCeqFHYjfMcTiZc9Be8mrAiJ3XtwOcyRQI+yq
         a7nN3hIsSFqCXy3CtXVnEfWPK2Um5+T+MK4m1Y0Am6dZRYXb9IY6acoCz2QZEJz3G9Tz
         NwgbaqEDMHWHZsJIZ7RtWExDuG4ZrQkbascr+FPBaoilKJSzATW9noPA6WoDCCnx5G24
         WJpx7YZMh4wtc7kGubw4IbfMn/oKvx59N3XplDBQMcUx1YQQWu4bfsOjiFbQgQwlHmCe
         AvP2JPQ72gD6gBeMEEmJVg1VRysMAQQPTdyBZs8/+H9Hajo9e7IcophP8cC952wHNRBb
         kjyA==
X-Forwarded-Encrypted: i=1; AHgh+RpwM0cabwDmsgY6KPEtwuN6oKi9MQXPXbu2ShzlGYaYjApAAtiJiqkm/1J31UEHjzjaEBF4WWOOL1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysy6cuT2JLvHiQUBYZU6zerwWQp0JCkQgdarfeOrqaQcbKT7tY
	sUFKI0qrdrjaqdyAnWRZh2fdDKfQe6+6bwq7ZYo7mPUQVvhyhbN4up36
X-Gm-Gg: AR+sD13WOkQv39h/fMyqlHXoafR5i4S8+232qwDfl9pJTdj4gCgKfrneP6W08l0udT0
	NwWmpCjvs5sd/cxASLLpOCqhiW9/GgyAwrH6GEkCyPyjoslPbBgFxW1tF9UTS/AVDmywbFf+35G
	fiK36NCBy3t52Xz8qUQNFlSEGMH0plCcjLVWbIaJ/9QPbCjdae17tzVnO5gmpnx0QZNEhDZTm98
	ZtgnNxQYLFNdH2m1hmrgALy9eKUEpfmyFpTjANNg/tZqvVS7rhWLrWXHGpeDgnaEu91yD0UlJ8d
	9uxe9MY+EWShYCv8yvRK9slE9AU+H4GZEkaW07qhVe4kqEQfZrXEM37e2RO1WB6rg9OFnHsr5+K
	ubneZMFbhc21ENMd6QzzuFux//wyNC0UnDloaQJJvTCGo2ntlFBPwlLPGTblwvqHgNu7yPU1AUv
	IBsB2DuhkiYBQSnQUDjKEE+/RlQvoNMcptu/1nT6BWlCBcifkMmT2zux/RKawTLMLl8UHWBrTwq
	O+MHUQfJYfs6sJMJXmXz3lt/BVc+as=
X-Received: by 2002:a17:90b:4acb:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-38fbc4313c2mr9516829a91.13.1785766673989;
        Mon, 03 Aug 2026 07:17:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:53 -0700 (PDT)
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
Subject: [PATCH 06/32] clk: mediatek: mt8192: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:33 +0900
Message-ID: <20260803141659.559129-7-akkun11.open@gmail.com>
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
2.55.0

