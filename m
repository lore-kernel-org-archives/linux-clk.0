Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCC63CCFD0
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438733; cv=none; b=uWVFRiUKG7gTQ9A1rw6IPqQy+fmeljC4efti44FVBqvvmPYlzcOPXuKWcUNgtwJ529WwAMTIIOr7qFWyL1Aij2q8+Me9FyrWRvgb/n91YnKuRsgYUJfqQm0VK8/dq9e9xJtHP73OT5Qxm98PyPblSyLv3lyoaLcCbatTzXOy6RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438733; c=relaxed/simple;
	bh=MJzTscokaYVjaUenKSLbKoiovLeIQbNEzqwhkopLKGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lopilK251/ijR8qFCeW3ZX87qjQisc+BQdkcpu/jiol6sJMbxGN7eFV2eikC/AFKLgpGXeg5I5z1MIn/by9V51axWVUYPXeUC5zrUB1ARgl/sx5hVRx47Dm3ln5QtoPa9cTsAbXmKrJ+gTItGLPwd1+V+vZH+s2PCVt9SCh3gs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=1vObfbSC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="1vObfbSC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so10240465e9.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438731; x=1777043531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=az2KIqgV5YqkPRGM1cxImWSRMVebKiNjnNol2i4MAlI=;
        b=1vObfbSCKpsl6PnOHTD7JXnMHgIHpiMj6lvufrwLhxUxCjoLg1nnpF/lcyS1Z+wK/7
         rylYi5u4SOWkJPaw+UvVuNKoatRoTbeTQ9BiZIhRh4AdJMyNF8a6REeac3+YgyQoR2I5
         uvp0SVOdogm9OUyP4sFlV1o3eGSvGBZfbrvzb8Ko1ee3MfXfzj9ilviIX997ONe4T+Ai
         0jeO0VlYN55uP5Iqh9WtxjRZTD7wnNGfKj/BuEkVh9eeoyOt7AvfA5N5H9u44IPuM7q1
         hR/s3ePfTNKEbM1G/sno1j0Z1t2IYxgL+KHETiwu+W0cQctFE+SqydCrf1DNtoN9/dH6
         c6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438731; x=1777043531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=az2KIqgV5YqkPRGM1cxImWSRMVebKiNjnNol2i4MAlI=;
        b=EJmJILl3ZcOYo6zgplz2Xm0mPRn4Y17+UbyU3y62YvUTN6SAG5dT4bptGYIr8KPkkY
         7JXIQV1SRUvPhvRtHI+axjb0F4cBc0SN9BPKr39Kr6NFX4aVGP6bO99USiYZzlHR3vAK
         oM+h0E3v9pRsxcDiDlU0rjkJa60KS8Fan9LeA2ijBjd+5ePnnMWT0/Yi+x1GbKhbNOsC
         5Fw6Boc3BuzFmA0HZodmr75K+kCNFeoiXggxCaivRfp1IAz4q4MTj4AIRVTchSWmDLSh
         yLyP3UP4yPdWp2qbCFQM9pt64+DayfVv34s7mzbzr7Hv6/weYkRd8vWSBmGxKaClO2ca
         5FGQ==
X-Forwarded-Encrypted: i=1; AFNElJ84D/hlbYCRQle9OmJYZUSG/9keoLstVnViYlN0pQ25l2PMQEPo52g5OkEZwxpmd/y7fLaKXdy1bEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoBfPK/XWKwerAJDbtqSyuEzZZvyr4ASdlFBfzV76JF1Hr0Q26
	V/Daxaeoe/ZH6GTnxaP4VNZxgSiOKeaV+mT99+KTSGFYlcEtPe3bht+VtVwbErXC83Q=
X-Gm-Gg: AeBDiettDvXX9VhjizfOJo9kBrqPcYoOPyaO8IkcRXdZ3HX/JTfLx4op8lhegAuTPZp
	yE2IWkp8dkVgOcAzgEbVhSp0KPZ8XtE1aNCPEki51PbV2OYZxmRqv5NIYz2m0orqOXnXC/ZTsjT
	j58LW2qbedQPXmHThgyrx/kWNHyiAKbJ6/0WM2tLJsLlGU5eT4MnhUEwU8VdahTXATLxUSUO4S6
	BBcEGBIYOnNU+g5U/OJ2WpPLGn87QOusrVOQBWFE/QSXVsuHhfbnabVsOxIk9GQFfS01I4cw3Xk
	5DHSkcGfg2Y2WEJdlSkCpgKvMg+3D41QP3ZnQWOlOdyMP+xvSgRZU+49WL3LXoi3Q2DgzjOI525
	fHhGhq4pZJ5qOlI7rjmAasrxujqGRpIG3vefao+dGIFInNg9vRdaUtwNGdJomxjNT0yLmCAJiUi
	b2DRxRXHBdDQNyOjHqN1CyJyUOWsgEGDYeRsHodwXR02vZ1bySsjEQtp+TElOFabrcyiWV+MVzY
	YUNW66eZCNDXDF9
X-Received: by 2002:a05:600c:3546:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488fb7880camr48839705e9.23.1776438730645;
        Fri, 17 Apr 2026 08:12:10 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:12:10 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 17 Apr 2026 19:11:47 +0400
Subject: [PATCH RFC 4/4] clk: rockchip: rk3576: add ROUND_CLOSEST to
 dclk_vp1_src divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-rk3576-dclk-v1-4-26a9d0dcb2de@flipper.net>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
In-Reply-To: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Zhovner <pavel@flipper.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924; i=alchark@flipper.net;
 h=from:subject:message-id; bh=MJzTscokaYVjaUenKSLbKoiovLeIQbNEzqwhkopLKGI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t2+8RTP4gqLYob2DNVSvTrzxQ82/a7SW+3xNOBIi
 PINS76WjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb67UtGho4P594u/vp4E6vSzw6BvvkfkrjvvHc1nO7fp1LJ5CvF9IPhn8bhnO2
 79F2iasptjeP2Blz4f7J5xZTLyz353lo8+H2fnwsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Without CLK_DIVIDER_ROUND_CLOSEST, the divider's _is_best_div() only
considers candidates where now <= target, rejecting any rate above the
target even when it is closer. Combined with the PLL round-nearest fix,
this causes the divider to still pick a suboptimal rate: with PLL
round-nearest alone, div=8 produces 249.0 MHz (0.048% over) but is
rejected because it exceeds the target, and div=3/248.0 MHz wins
(-0.354% error).

Add CLK_DIVIDER_ROUND_CLOSEST to dclk_vp1_src's div_flags so the
divider picks the rate closest to the target regardless of direction.
Together with the PLL round-nearest change, this yields:

  VPLL 1992 MHz / 8 = 249.0 MHz (+0.048% error)

instead of the previous:

  VPLL 1488 MHz / 6 = 248.0 MHz (-0.354% error)

This small difference appears to enable more monitors to lock to the VP1
clock when driving output at 2560x1440@60Hz via DisplayPort.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-rk3576.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 28eb5a802e83..9fc3264ef322 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -1106,7 +1106,7 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKSEL_CON(145), 8, 3, MFLAGS, 0, 8, DFLAGS,
 			RK3576_CLKGATE_CON(61), 10, GFLAGS),
 	COMPOSITE(DCLK_VP1_SRC, "dclk_vp1_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
-			RK3576_CLKSEL_CON(146), 8, 3, MFLAGS, 0, 8, DFLAGS,
+			RK3576_CLKSEL_CON(146), 8, 3, MFLAGS, 0, 8, DFLAGS | CLK_DIVIDER_ROUND_CLOSEST,
 			RK3576_CLKGATE_CON(61), 11, GFLAGS),
 	COMPOSITE(DCLK_VP2_SRC, "dclk_vp2_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT,
 			RK3576_CLKSEL_CON(147), 8, 3, MFLAGS, 0, 8, DFLAGS,

-- 
2.52.0

