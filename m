Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1F39769B
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410576; cv=none; b=GLt5rykjABrOfP5pjEXmEK53BynR8Ko3YEBLOBl0Rwgb1xerD52dhopQ9Vr5mqDNufLZbceLlZojhNEumDmFpy/wMdlqwH5RN58DgPNWRbN6v7RE/BEgaPxfpSXqYrQXzZxJKb0UuegBodyzTfOsElEybvbpku9JVNPyvBcrhSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410576; c=relaxed/simple;
	bh=iKfTNxYnjS6abQQ8md24/nEgVzBAsjHRbhhBMnu5sIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+pIqom5g9idBupScTfWsU+PKiYW5M/8s+smTZyCX+5CMSzvp8lSepya0UuVriA1pld6q7e/+rmZLLVwIHSf/Ec6Mdn6YC4lScLa4PeqnUgcrvWOAjFBoBUWMGyl8CPizLnmCuemvLnbr19ZB1YCBfvhsAyUS+UofIJdeLwRE+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ9E3DeH; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ9E3DeH"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381216921aaso3501047a91.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410575; x=1784015375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKaH37G0Ewqa53zWdK8uHBZRlRPd7/8BawFkzA4KWg4=;
        b=dQ9E3DeH0kh8Zafp9q7fH+hBU9U1oKTP24KHMdIuNb6G1l0P8CZ3BRnITagEZ3bdRp
         ujxm2tXkqomabAMVxA0AC0oamxPL71tAqzdx7f1cEAfFd0qwDUr4XE1C4BJf04xE8hX/
         g4tMH+gumgqIdvjDBpyGJD6VnR33uaLUEZj/GhaQF1aQEiJNASwNYcuY1tqvLmlxh6fF
         qRnw/dqTdUaNp1MPKR7wuU88Cqnp4aLItQNhg/6l7LjB/2Zb5AUKAhaRdF+oBHWXpBwo
         a6F3PLkcd3Myz/kuUBaAEbwLiJvP78uiWO8NRc8AsG+IYQy4vdIXD+Vq6cXuiPcrpfXk
         /7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410575; x=1784015375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TKaH37G0Ewqa53zWdK8uHBZRlRPd7/8BawFkzA4KWg4=;
        b=SvcNEzPGcTxF7iGOhBOV4VmBdGzLSpYqpbgiSya/Zz772HdSDwUvbdXh4GqGWa/See
         ZQ+09TYg3dpFdSQwSuyoPrUvXq9uaV+UyUEXVdWATKKesOy9w+o2OGq+vLCLzzVWcfpp
         lpowXwUmMsLkcY2c1HYTedQXwxDNe3M57wSAGfogY1w3ucyTqrF3twuIzlv4GBOnM1VL
         iTEUQ8Zjx2X/x5gD7xcgw7L7YR7+3nN9Xbx0kFoYx4xTPXa0JacGk0isQhZFUwzqyfVp
         QU2Lu7S5CknuMtU1sTmYvxN2zQrmmdGKlXx4XCTNY+/ADHM45HA1b3O3zjUfTTXUb8pp
         C12A==
X-Gm-Message-State: AOJu0YzWD6CJz1Ixt7CBPrAOHZUulSh7ZNT2vxp9O5cH8SaNkcMTfBPG
	T/ON/7KA6bMl1vyVuBhfzSb2UeQ+AipfLTsC+u36kjOplAUwxRlfrwlQ
X-Gm-Gg: AfdE7cnHItv9JrbmcRXg5Mc7T2lXGDZvSElJQE+Me6qsbTL+pa/QhxmGmvdDctqLbwb
	7hvJg0bd0TajC7b9YmMfjP0dXHwTT3PACI4PF8JIu7eZR1nb/B/0rRSxx9u90s9QDpkCfkpOh+5
	rez8uTAOPLkFQUfpWhXwKf9ATAlzUAhXvSjGSEXzel6BhXTvjYDMA3lh5MttYVW9Hs2aFaj2S7h
	3L/TcVue8myg712SNfOdQC3HfvGBHUKsQvPaUNX3Y7uNS5tI/qvgvQyyUp4ZUem+es/SMpCHTZ/
	0/F0NsIPZc9koVfux8aeGHnPf8bgibriIR5EnJjLAdaLesDcnKOykfoJWj2AnxttOL2fsaUfJZE
	fz9+Z5NmRJLdpit6HunkDVThQ58vwnakOnH3iOAT2L0pobfPAdTo5TCmoIK8noTeKpWa1GmiNrQ
	WV+YauWHZM3RztGjvatF1aa4CA2HNUpb/g7x+YvlaemGRu
X-Received: by 2002:a17:90b:2752:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-3875650bb6cmr3966713a91.2.1783410575001;
        Tue, 07 Jul 2026 00:49:35 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:34 -0700 (PDT)
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
Subject: [PATCH v2 6/6] clk: mediatek: mt8192: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:35 +0900
Message-ID: <20260707074839.240676-7-akkun11.open@gmail.com>
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
2.54.0

