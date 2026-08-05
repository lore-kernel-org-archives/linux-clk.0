Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFA7472F61
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937523; cv=none; b=Qs2tIU2rZylELR8rr267YXkmVezdhCXAlwrJCNfX9NeEVweMSu46qiPFjCGMqiXgWj8ZRzMt63deK3jsK0y3FbHIzgiWXB1KfHsIwvBTSN+RO7lU3P3YGI9y6VNihZqvF5B6B0H68/jxn1ud5NZtxhEVSV6miGgfEwPqRxCLQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937523; c=relaxed/simple;
	bh=O1dK7PbUelw/4/J1OKfbGHie7DYKMuZjlf933Pye7bY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pfArYVq49cQv2VOMB/GiFMn0eIHmy0m89RubPge/mIubiid65BJVZ8xPuCOS/qBZCSLw/6MbKxStSHV3D/5sAd/UfXxT2bNCDmHfb2P9DdfF72WzrHTPSLotjnpk4wTbGA7i7/whq5TopJidoQGdCo1f5mfnt8mD+1p8rmw61Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Br5lAvfe; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Br5lAvfe"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so115814666b.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1785937519; x=1786542319; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WOcxr0r4B6mG0penADxapnFXlT75rDmS0IOhLRToCPo=;
        b=Br5lAvfeLUpYSMcGGxmN44RYkyXWZUanYQ39wGppGHcOFHJERh+24cH5H4ZaVkjcrF
         zWza8VWpR+tpQAoRdzcbXt4mYlR5e1kF9IODLIhkd/6RY9mQ8Uh/chOwjVL0+kW5+DRZ
         CnIJ3hefYEf4za79tE00gAn6qAPpf+o7cv1mLq8cefMNDEl8y7L0sbRixiGt59quCoiR
         HraGpxVkU4ehdN2p+MFvlrYZmz9KGs8kJY/Dn4E63kqFF2V28sSULl4Eg05CqGE3d2Zl
         4+9pjUol/KOLh+GfBVEgHVjfOAtJodSDYU2Z4fNyh4xFqJiVQuDOk1qhelB2lfEQgruR
         xHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937519; x=1786542319;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WOcxr0r4B6mG0penADxapnFXlT75rDmS0IOhLRToCPo=;
        b=NWEG+T8qYsaUH8UDrOsjjhYVg2fm92ij0VExYu/PqJPZ8D4ee/56u7bG5bfRt4W9DI
         ouUH4iQVvdHYXe4YbKtbVPdtbGMLKROXk3IW70qPqDB0BaTwfZ1g3j1o+8COGKiIi5u2
         WVNHAzf81UmO2g5LnsM1kwdKZ/JUHIlgp3+fcz7xfG58F8uhUKTcDyOLmP+vzunxp10c
         jcx7OB097rXRfeDOJ/ygE+7vx5xzEooEy66BI0s5Di0fYjBP5Xz5SzfkNll4QXBdRTt5
         Ad3TV8uXqckAfA7wC1n1U57jwV2PrV0TvMINO9kcueWWTOJh+YlBqy4oW/c08kfizCNb
         angw==
X-Gm-Message-State: AOJu0YzTnONx+aw5bFwxcuBQ9pMJCm4MeByZvRx+woLd3odK5ghY/maq
	9FNG14oAKkL3cYlHhDmztyR68EagzBQCMU/H5TitrpBVawhAfIcUMSAAKfi+w+P9Uv8=
X-Gm-Gg: AR+sD11XQESKpJi5yKq6uQ9C6SNqmfQh6R6moWgGHihN8IktRTuhUi15AARZKUb6pg9
	mVOfuDJxMd+KUJef7IbRkh8NFGo17jU84sLL0u6cAa8hVy6tmxwdJEG/X+CryWP0YYn7GNYtlZ+
	POh5ib59cL3hNfcITabblP6G2x20bExLIqxPgK7+E9V61nvzpKaAhFGb/QI2Mba2WtsNw+VX6Bq
	ZQJdYY0Bzpp5NZeifY8v/SaAOL6mKb1bAveRjiSGAME96y7rOVRLnsZi46zk8y11pbecLWI4Mzt
	Hj2k0Qp+NBnBDfKdLsnoIhnQAPtlUVUOZrsQRF3nPq2IgCzQty1NV4Ns2elFOj+xOTfKvvrY0Ia
	Eyb/D6QI+806Ges33qKz7NzMSCIxAEgElTseNKIEdyyx1oX6Huq53nK517ONc6Iiftd3NBBzEKZ
	KEi7anzqYe6KSX2T5cfcnv5s5JEPGnsdw5TKyOBnsvxWQfeGr4Es1TfFTpHMExXy1KrIUvEoWcV
	RV+2+oOsx9+4VZAvsx9nK45e9wOoHlF28FwZm/zfw==
X-Received: by 2002:a17:907:1614:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c2039ef1567mr294580466b.21.1785937519280;
        Wed, 05 Aug 2026 06:45:19 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-41.alshamil.net.ae. [92.99.174.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a16577d59fsm1617670a12.10.2026.08.05.06.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:45:18 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 05 Aug 2026 17:45:09 +0400
Subject: [PATCH] clk: rockchip: rk3576: fix source muxes for SPI0..SPI4
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-rk3576-spi-clk-v1-1-2f040d0d163b@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1IlZjYq4gLTUYdLVYyrQiSu
 xvb5Vv8f4JQYBJ4ZicE2ln4vSY88gzc1K0jIftkKFRRKas0hqXUpkLZGN1rwdJ4stYaM6gaUrQ
 FGvj4DZv2b/n2M7nPfYEYL9++TxRyAAAA
X-Change-ID: 20260805-rk3576-spi-clk-37de88877f09
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 YouMin Chen <cym@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3497; i=alchark@flipper.net;
 h=from:subject:message-id; bh=O1dK7PbUelw/4/J1OKfbGHie7DYKMuZjlf933Pye7bY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQV22XfvvmuqP1RUldnq1nfdpZ5hndVIz79f7PVW/4mp
 5fj5Tu1HRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1BSaG/85lXT8ibTi0Dv9zX5KQtMzq3YsFcfwX5U2Dg68fNH+meYPhDxf74pk
 Xn+Sl1rTNlldp2/O8b9pH/avLzB/EXXBV3n0kjBcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The TRM defines available source muxes for SPI0..SPI4 as
 - b00: clk_gpll_div6_src
 - b01: clk_gpll_div8_src
 - b10: clk_cpll_div10_src
 - b11: clk_xin_osc0_func

Which doesn't match what the current clock driver implements, making it
impossible to derive some SPI clock rates such as 37.125 MHz (which
requires clk_gpll_div8_src as the source mux).

Add a correct mux definition per TRM and point SPI0..SPI4 clocks at it.

Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Hitting the bug requires explicitly setting the clock parents for any
of the SPI controllers, which no mainline users do currently. This is
therefore a forward-looking correctness fix and probably doesn't
qualify for backporting to stable.
---
 drivers/clk/rockchip/clk-rk3576.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 63f229e73a45..2cdd667f4004 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -315,6 +315,7 @@ PNAME(mux_100m_24m_lclk0_p)		= { "clk_cpll_div10", "xin24m", "lclk_asrc_src_0" }
 PNAME(mux_100m_24m_lclk1_p)		= { "clk_cpll_div10", "xin24m", "lclk_asrc_src_1" };
 PNAME(mux_150m_100m_50m_24m_p)		= { "clk_gpll_div8", "clk_cpll_div10", "clk_cpll_div20", "xin24m" };
 PNAME(mux_200m_100m_50m_24m_p)		= { "clk_gpll_div6", "clk_cpll_div10", "clk_cpll_div20", "xin24m" };
+PNAME(mux_200m_150m_100m_24m_p)		= { "clk_gpll_div6", "clk_gpll_div8", "clk_cpll_div10", "xin24m" };
 PNAME(mux_400m_200m_100m_24m_p)		= { "clk_gpll_div3", "clk_gpll_div6", "clk_cpll_div10", "xin24m" };
 PNAME(mux_500m_250m_100m_24m_p)		= { "clk_cpll_div2", "clk_cpll_div4", "clk_cpll_div10", "xin24m" };
 PNAME(mux_600m_400m_300m_24m_p)		= { "clk_gpll_div2", "clk_gpll_div3", "clk_gpll_div4", "xin24m" };
@@ -706,19 +707,19 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKGATE_CON(16), 0, GFLAGS),
 	GATE(PCLK_SPI4, "pclk_spi4", "pclk_bus_root", 0,
 			RK3576_CLKGATE_CON(16), 1, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI0, "clk_spi0", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI0, "clk_spi0", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(70), 13, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 2, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI1, "clk_spi1", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI1, "clk_spi1", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(71), 0, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 3, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI2, "clk_spi2", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI2, "clk_spi2", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(71), 2, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 4, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI3, "clk_spi3", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI3, "clk_spi3", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(71), 4, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 5, GFLAGS),
-	COMPOSITE_NODIV(CLK_SPI4, "clk_spi4", mux_200m_100m_50m_24m_p, 0,
+	COMPOSITE_NODIV(CLK_SPI4, "clk_spi4", mux_200m_150m_100m_24m_p, 0,
 			RK3576_CLKSEL_CON(71), 6, 2, MFLAGS,
 			RK3576_CLKGATE_CON(16), 6, GFLAGS),
 	GATE(PCLK_WDT0, "pclk_wdt0", "pclk_bus_root", 0,

---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260805-rk3576-spi-clk-37de88877f09

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

