Return-Path: <SRS0=ypW/=D3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11003C433DF
	for <linux-clk@archiver.kernel.org>; Tue, 20 Oct 2020 00:17:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B72972242A
	for <linux-clk@archiver.kernel.org>; Tue, 20 Oct 2020 00:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603153020;
	bh=tZT7sWuz8c1hvr10guCDW3+G39WjrKlazjDfJy7HCCA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=y7M3CZd/PlBJxP4SDUAx1/OZsjY80bPlGFrJkz7G7cOM7ufOfv4tMdgFG4XwTGFSu
	 LW25vBgAwOMFzrBpDGiZvXuM/lDXWFA5bxYmC3U2vhvMPtMSIKre9mNxMIJZaq5zYQ
	 W67JvZ9iX8jtkH5ShfCX4+7Juv9RnOcPgYavbNoY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389309AbgJTARA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Oct 2020 20:17:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:60756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727220AbgJTARA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Oct 2020 20:17:00 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5F8620637;
        Tue, 20 Oct 2020 00:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603153019;
        bh=tZT7sWuz8c1hvr10guCDW3+G39WjrKlazjDfJy7HCCA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZpNGVBvWrHges5zua3oES2ZJm+47tqhKSWGyXrTvI0prS4tRp+O1TLZT2+hRCzEJ5
         rXwvz1T4+IUrJinqLqLsAkX429QrmUDkx6zKNw6YkTr2z7ZzMds+v/LSPH+o9HwX1s
         AjxavIcmpE5GaoKAAlx4xYcCjD6zJ1zP5xcqBjj8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJKOXPduq7OSeSD9nbJG+DFK4n-WUzvED2s9d7pUNTA0+ya1Ww@mail.gmail.com>
References: <20201015114725.23137-1-daire.mcnamara@microchip.com> <20201015114725.23137-3-daire.mcnamara@microchip.com> <CAJKOXPduq7OSeSD9nbJG+DFK4n-WUzvED2s9d7pUNTA0+ya1Ww@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] CLK: microchip: Add driver for Microchip PolarFire SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        padmarao.begari@microchip.com, david.abdurachmanov@gmail.com
To:     Krzysztof Kozlowski <krzk@kernel.org>, daire.mcnamara@microchip.com
Date:   Mon, 19 Oct 2020 17:16:58 -0700
Message-ID: <160315301824.884498.14688775786937252027@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-10-15 05:52:30)
> On Thu, 15 Oct 2020 at 14:25, <daire.mcnamara@microchip.com> wrote:
> > +struct pfsoc_cfg_hw_clock {
> > +       struct pfsoc_cfg_clock cfg;
> > +       void __iomem *sys_base;
> > +       /* lock is used to prevent multiple writes */
> > +       spinlock_t *lock;
>=20
> Doesn't the core already provide you locking? Why do you need it?
>=20

Please keep the lock. The core has locking for itself and it shouldn't
be relied upon to ensure that register writes in this driver are
protected from each other, assuming that clks are sharing registers and
need to be protected from each other.

> > +       struct clk_hw hw;
> > +       struct clk_init_data init;
> > +};
> > +
