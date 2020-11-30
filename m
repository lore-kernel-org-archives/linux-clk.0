Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5232C83014
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 01:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ECC221973
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 01:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgK3Bw6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Nov 2020 20:52:58 -0500
Received: from gloria.sntech.de ([185.11.138.130]:40878 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727543AbgK3Bw5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Nov 2020 20:52:57 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kjYME-0007OY-Vw; Mon, 30 Nov 2020 02:52:03 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
        mturquette@baylibre.com, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, broonie@kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        daniel@ffwll.ch, robh+dt@kernel.org,
        linux-rockchip@lists.infradead.org, lgirdwood@gmail.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/7] Enable rk3066a HDMI sound
Date:   Mon, 30 Nov 2020 02:51:58 +0100
Message-Id: <160670107988.1055391.2625216014157320355.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118135822.9582-1-jbx6244@gmail.com>
References: <20201118135822.9582-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 18 Nov 2020 14:58:15 +0100, Johan Jonker wrote:
> First fix some legacy things in clk-rk3188.c that was never updated,
> because probably nobody used rk3066a I2S before in the mainline kernel.
> Update the rk3066a HDMI documents with a #sound-dai-cells property.
> Include the code for sound in the HDMI driver.
> Add a simple-sound-card compatible node to rk3066a.dtsi,
> because I2S0 and HDMI TX are connected internally.
> And as last enable rk3066a HDMI sound in the rk3066a-mk808.dts file.
> 
> [...]

Applied, thanks!

[1/7] clk: rockchip: add CLK_SET_RATE_PARENT to sclk for rk3066a i2s and uart clocks
      commit: 5868491e1257786628fdd2457dfb77609f49f91d
[2/7] clk: rockchip: fix i2s gate bits on rk3066 and rk3188
      commit: caa2fd752ecb80faf7a2e1cdadc737187934675e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
