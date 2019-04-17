Return-Path: <SRS0=liI3=ST=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46947C282DA
	for <linux-clk@archiver.kernel.org>; Wed, 17 Apr 2019 23:32:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1541B2184B
	for <linux-clk@archiver.kernel.org>; Wed, 17 Apr 2019 23:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555543979;
	bh=DkLfBXz7QckibvrhYartWi4ACIDU+PRQRk5yJBZ1KQw=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=YsW1x+/SfRGfyfDmuHTQA9nJ/iB9nLjMkC0sRAAjYEJkUfGqx6VCbKXQ3bRKvfkrC
	 2eqA7hzBxtxjSgQRuK+UTSiS+xICtbI4XLaArZsnfjdt5b+nDbRpSlRH5EmYumOKbK
	 kbF3TCe/Eb6CEZElztvLozznzJ998TUQxCEr8z50=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387539AbfDQXc6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Apr 2019 19:32:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:45638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730848AbfDQXc6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Apr 2019 19:32:58 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC8192183F;
        Wed, 17 Apr 2019 23:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555543978;
        bh=DkLfBXz7QckibvrhYartWi4ACIDU+PRQRk5yJBZ1KQw=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=HiiiZ130ch0qnBVFwAZQbxVaWPvT/mTMLNZoJaAq6J+8/U9/YkCwlHDLe+DZ+KJa8
         kwzzR5xuNhiHt+ElJjtZhWyhE4K/htDUgVlKRjiZJHiTGGyYrOI7ts9BRuxgbeBBvP
         K1sG9EvGko3EBdEE3vWdKQCnm53zDgcHivaAwgBk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190415101046.5872-2-jonas.gorski@gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com> <20190415101046.5872-2-jonas.gorski@gmail.com>
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFT V2 1/8] clk: divider: add explicit big endian support
To:     Jonas Gorski <jonas.gorski@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Message-ID: <155554397723.15276.10863024281240089015@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Wed, 17 Apr 2019 16:32:57 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonas Gorski (2019-04-15 03:10:39)
> @@ -370,7 +388,7 @@ static long clk_divider_round_rate(struct clk_hw *hw,=
 unsigned long rate,
>         if (divider->flags & CLK_DIVIDER_READ_ONLY) {
>                 u32 val;
> =20
> -               val =3D clk_readl(divider->reg) >> divider->shift;
> +               val =3D clk_div_readl(divider->reg) >> divider->shift;

Good deal that kbuild running sparse found that this was supposed to be
divider and not divider->reg. If you can fix that and remove the else in
all the basic type readl wrappers then this series looks good to merge
for me.

