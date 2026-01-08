Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B848335097
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907036; cv=none; b=BLGP+HmRYx7ZyxIE6uvxoUWFWFY/E5/kK4+sDUvLyJy7Qbj2n1kO1hSpi3a+FXeFlbyAgVFA/qHpwl4mxZhPX7FZeKE2A8vVX+8Qqv9O4EtM7+M7w1AbBaA1VewUkhm5WlJUiDxa/9bmz6K7wP+z5DlXlBxJdTvNJ9TJ4ugZRFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907036; c=relaxed/simple;
	bh=5gEzfGrJrZBcK9ab2+97vww3qO4uDY2TibGccFpsz3I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=azgMkARoQSw7D8SAB2ghOQmJOSiekeaVzMjGIQluLtOMS0V5JxpUTMQw59MZncP3ttpLWcXPlrAXdczmzCVOUMVBUU56jwlyBX0Sf9cU09VlHCQxeni8dE6OJ6o9MvNAZr7/78mJE/7uPBgEyqw+t5JkwWJYCpM+q9c/JzQZWR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ODCe3Vnz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p+4ri8QJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ODCe3Vnz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p+4ri8QJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
	b=ODCe3Vnz1vZYKwVB88vCCIdv96/Ttc9BA+m9h25A5QAvpkDoD0v8HjXpBHgxVPUKUxcfUc
	0tBiWjEuF7nWQJAj/isHfTzGRLkHh2Fst0Tg+k3O0DxC9bLEXDY6mJg95au805Lmz24Rpy
	H5zxCenqqpo5h8lSSRusB3wSTOMeMd0=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-4pOzc3O8P0WiVyHxpYml_A-1; Thu, 08 Jan 2026 16:17:05 -0500
X-MC-Unique: 4pOzc3O8P0WiVyHxpYml_A-1
X-Mimecast-MFC-AGG-ID: 4pOzc3O8P0WiVyHxpYml_A_1767907025
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f69d06fe4so3663766241.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907025; x=1768511825; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
        b=p+4ri8QJwFCJ26x1u00s5MsGP+cATPO+y4dg/CSbkLtgP1aFco1DKB91M7p0KftLC/
         mGm27JaaOQ/rnaFqLgVWW7x8VjzYWnY7z2D+C5fk9lUi9vHufcCgvnGco7loOi3meeW1
         dbYB+Ben0m/aMErLqW+NhK4m7EjWeUaKgVFZVKEVZHAI1cUzas3j/h6Li5rzWcAolraD
         ES64kaYiuYl+aRXFGBI7oDqHQmXELo4+6n/1tLehB50KDpOEmvpsxu6XfLvzAVscaasi
         FWyKV8fz81qfL2AdE26ljrHoXP3VoDl6aIIBCf1/Xk1TcGGAHa75RsQGJF8Tt1WSPM6G
         +RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907025; x=1768511825;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
        b=dZMtsYj6Nbrey1+G/3onsUaJr3Cyadn39kam6zzQbOxcTeCG5U4p43YtHoEr8RBz6A
         kPk9DPEY3RaeIPkZL2U68nzodn4RkD/M7Bsj1QF7rZivPW8wdEW32tDtME86/EQWrD7/
         8emX+ZJAT5SDV5LfxPt+VK2XLieAMHXA12zfX8PnSJrJzUBwQK6Q3CvKXgoL9/fxdak5
         ZgXf3nBWJiSLb3GZ5HYu0WFicZcep/RpB8GLj7G51FPp2EvZwxwn9WD2nYGXSfgZ2aBp
         v6xPcQEOlzGd2V/uTw3lRNLU7dtX22E2VIq8OLTKooBAgx+5qHrHuByUlns9s06Deggi
         gtHQ==
X-Gm-Message-State: AOJu0YxL58KTsc5uy2pZNj+PIZqIgG5R+3RDi+SJ1WxsjFXHlOci4rV0
	/ArbfpYjjANUp1/7DA1rczC+0rEtiEZSDAWxb7UGFiNai36WYiJHc8efiT1w/VUY2uXXcESBJma
	SDGotF7thojY8Ym/MARAfXJgXxuykp7Hr+5OSkS7+Xy1a7SAgBZ6E93aug1bL9A==
X-Gm-Gg: AY/fxX7J6H04vdW2vNE1KIaSTkcj2JTwCIuVPS0xpFLLxm1QH7+b5H4cGS13h7s21xC
	C1Mpt+no0Ph3+sfcDQtA+5CUHNVwT0s+X3XTRVp0Un/SvSamQ/+Hr8pcV6KD8PrfDAUkpx34+qr
	nQ4iTUi6yp62YJE5YU2Dp6B+bfpQuqasyEncYL2Fe2Ib5sqqDWkogGrH17fU7kF6TrGIs8Mxd6y
	WBbnG7v1JUwkv7MbU6HWy0kqBM3rhaBNkVHHO5oxC/yaxzE20eWC8U1bKN3oDOg2oKYk9Wcs1q6
	z/N6xbr+nd3GNHyyIHyPF2uk7Hgrt0MlmbiDk+Kd32d1noFPNtlnk+/lbNaRavX3RIVvRLy1tDW
	HjPyKf2ZG0jZDygY=
X-Received: by 2002:a05:6102:554b:b0:5ea:67f4:c1ad with SMTP id ada2fe7eead31-5ecb68aff05mr2988589137.21.1767907024795;
        Thu, 08 Jan 2026 13:17:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz/p7kGP9fvfk2vXLPq3R9VUjKVw1cdN6NrP5mq/P0PGpCjqA4/hKeGKMrVWaYIPrb1wIVZw==
X-Received: by 2002:a05:6102:554b:b0:5ea:67f4:c1ad with SMTP id ada2fe7eead31-5ecb68aff05mr2988572137.21.1767907024314;
        Thu, 08 Jan 2026 13:17:04 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:03 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and
 friends
Date: Thu, 08 Jan 2026 16:16:18 -0500
Message-Id: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnA0kHizsVcYO2kQNG3WkKkLpu
 6/s+B3+v0BWN83w6Aq4XpZtTw3cdxC3Ka2KJs0w0DASU8D4eaPYZaKOvp9J0KdDkeMizGGmMRC
 0+Ou62P0fP1+1/gDlVpEzaAAAAA==
X-Change-ID: 20260107-clk-divider-round-rate-1cfd117b0670
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
 Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Michal Simek <michal.simek@amd.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-phy@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5523; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=5gEzfGrJrZBcK9ab2+97vww3qO4uDY2TibGccFpsz3I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Lb+j2COyZDSrq1aGtHuW3Hnjb6jSZa7wqEZi1UKM
 +/wfPfoKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCLePxj+cE8JZ4ir1XC94hPf
 wLfqhfvjO0u5RdiClDPF9/n9TrNyZGT4NKcq8ciUz4qK0XG3a+4381Zd+31jtWu5nMfx+TvuVsY
 xAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a series that gets rid of the deprecated APIs
divider_round_rate(), divider_round_rate_parent(), and
divider_ro_round_rate_parent() since these functions are just wrappers
for the determine_rate variant.

Note that when I converted some of these drivers from round_rate to
determine_rate, this was mistakenly converted to the following in some
cases:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value. So this series fixes those bugs and removes
the deprecated APIs all in one go.

Three of the patches ended up being a more complicated migration, and I
put them as the first three patches in this series (clk: sophgo:
cv18xx-ip), (clk: sunxi-ng), and (rtc: ac100). The remaining patches I
feel are all straight forward.

Merge strategy
==============

Only three of the patches are outside of drivers/clk (drm/msm, phy, and
rtc). For simplicity, I think it would be easiest if Stephen takes this
whole series through the clk tree. Subsystem maintainers please leave an
Acked-by for Stephen. Thanks!

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (27):
      clk: sophgo: cv18xx-ip: convert from divider_round_rate() to divider_determine_rate()
      clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()
      rtc: ac100: convert from divider_round_rate() to divider_determine_rate()
      clk: actions: owl-composite: convert from owl_divider_helper_round_rate() to divider_determine_rate()
      clk: actions: owl-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: bm1880: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: bm1880: convert from divider_round_rate() to divider_determine_rate()
      clk: hisilicon: clkdivider-hi6220: convert from divider_round_rate() to divider_determine_rate()
      clk: loongson1: convert from divider_round_rate() to divider_determine_rate()
      clk: milbeaut: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()
      clk: nuvoton: ma35d1-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: nxp: lpc32xx: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: sophgo: sg2042-clkgen: convert from divider_round_rate() to divider_determine_rate()
      clk: sprd: div: convert from divider_round_rate() to divider_determine_rate()
      clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: stm32: stm32-core: convert from divider_round_rate_parent() to divider_determine_rate()
      clk: versaclock3: convert from divider_round_rate() to divider_determine_rate()
      clk: x86: cgu: convert from divider_round_rate() to divider_determine_rate()
      clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate()
      drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
      phy: ti: phy-j721e-wiz: convert from divider_round_rate() to divider_determine_rate()
      clk: divider: remove divider_ro_round_rate_parent()
      clk: divider: remove divider_round_rate() and divider_round_rate_parent()

 drivers/clk/actions/owl-composite.c        |  11 +--
 drivers/clk/actions/owl-divider.c          |  17 +---
 drivers/clk/actions/owl-divider.h          |   5 -
 drivers/clk/clk-bm1880.c                   |  13 +--
 drivers/clk/clk-divider.c                  |  44 ---------
 drivers/clk/clk-loongson1.c                |   5 +-
 drivers/clk/clk-milbeaut.c                 |  15 +--
 drivers/clk/clk-versaclock3.c              |   7 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c  |   6 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c   |   7 +-
 drivers/clk/nxp/clk-lpc32xx.c              |   6 +-
 drivers/clk/qcom/clk-alpha-pll.c           |  21 ++--
 drivers/clk/qcom/clk-regmap-divider.c      |  16 +--
 drivers/clk/sophgo/clk-cv18xx-ip.c         | 154 ++++++++++++++++-------------
 drivers/clk/sophgo/clk-sg2042-clkgen.c     |  15 +--
 drivers/clk/sprd/div.c                     |   6 +-
 drivers/clk/stm32/clk-stm32-core.c         |  42 +++-----
 drivers/clk/sunxi-ng/ccu_div.c             |  25 +++--
 drivers/clk/sunxi-ng/ccu_mp.c              |  26 ++---
 drivers/clk/sunxi-ng/ccu_mult.c            |  16 +--
 drivers/clk/sunxi-ng/ccu_mux.c             |  49 +++++----
 drivers/clk/sunxi-ng/ccu_mux.h             |   8 +-
 drivers/clk/sunxi-ng/ccu_nkm.c             |  25 ++---
 drivers/clk/x86/clk-cgu.c                  |   6 +-
 drivers/clk/zynqmp/divider.c               |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |   7 +-
 drivers/phy/ti/phy-j721e-wiz.c             |   5 +-
 drivers/rtc/rtc-ac100.c                    |  75 +++++++-------
 include/linux/clk-provider.h               |  28 ------
 29 files changed, 257 insertions(+), 408 deletions(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260107-clk-divider-round-rate-1cfd117b0670

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

