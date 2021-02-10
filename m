Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F10C433E6
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 02:00:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E80964D87
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 02:00:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbhBJCAl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 21:00:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:53716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234792AbhBJB7N (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 20:59:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F140764E54;
        Wed, 10 Feb 2021 01:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612922313;
        bh=H8gmXCdcOK2KGSYjzwAznMmDC7V/NTqVn7CK1R0CcTI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cvV8b0ekScUhfccdLHFum5M2Lub9dqFayg7xt/OJD+2JMR1IY1Fbzj4CQbuLBdykG
         S8teH72X3uREcuZeuF2mQWFrA6qaX0hk9NdgBX4WzTBIxtL0Frqjk+llT4qj1sTIeP
         dMDAClLoJzIiq0yaHZuTR70Y9EosPpGUOga7WNUSjbtdiACTp5ENCm/JnyKfRGFjvm
         xwsuN3qK6qAzicRuIrWMHZCzlOkM+0KyqYp+SXmiTqd5dHzKuCDvTZMlno/Gc3Fva9
         UAgSBGtSdRoESJ605NgwDL/hDX/DT9kJ/syp+ZOXNYfQkO1yvXVIKbGHn0IPMszxbg
         mIUcBGrO25OkA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114124032.12765-7-pali@kernel.org>
References: <20210114124032.12765-1-pali@kernel.org> <20210114124032.12765-7-pali@kernel.org>
Subject: Re: [PATCH mvebu v2 06/10] clk: mvebu: armada-37xx-periph: Fix workaround for switching from L1 to L0
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek =?utf-8?q?Beh=C3=BAn?= <kabel@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andre Heider <a.heider@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        =?utf-8?q?G=C3=A9rald?= Kerma <gerald@gk2.net>,
        Konstantin Porotchkin <kostap@marvell.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Pali =?utf-8?q?Roh=C3=A1r?= <pali@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 09 Feb 2021 17:58:31 -0800
Message-ID: <161292231125.418021.8310551532294838376@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Pali Roh=C3=A1r (2021-01-14 04:40:28)
> When CPU frequency is at 250 MHz and set_rate() is called with 500 MHz (L=
1)
> quickly followed by a call with 1 GHz (L0), the CPU does not necessarily
> stay in L1 for at least 20ms as is required by Marvell errata.
>=20
> This situation happens frequently with the ondemand cpufreq governor and
> can be also reproduced with userspace governor. In most cases it causes C=
PU
> to crash.
>=20
> This change fixes the above issue and ensures that the CPU always stays in
> L1 for at least 20ms when switching from any state to L0.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> Fixes: 61c40f35f5cd ("clk: mvebu: armada-37xx-periph: Fix switching CPU r=
ate from 300Mhz to 1.2GHz")
> Cc: stable@vger.kernel.org
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
