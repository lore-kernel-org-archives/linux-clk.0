Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D88C10F03
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 17:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 450F42183E
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556041209;
	bh=OJ5HFdYrclCj1KQA4C5FoU+iSAcjqOdxVRhLB+Vkg7s=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=2NAGHCkxKr9D8lYXR/ZljzLSTsviJ7YhPVtq0V3QR6a6iWYeQpoDM826p4opS+dpX
	 XQpAnkuQ0F3ChNyB+tgCLMyPd2F+jZkiPy0YBcr6shaRpj19uJkt7xSfjABxNs6tD3
	 qZiq04lxeK4rJfn9PVx83gTdwlIKuvnTkFVMxHW4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbfDWRkI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 13:40:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:34066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728826AbfDWRkI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Apr 2019 13:40:08 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB05921738;
        Tue, 23 Apr 2019 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556041207;
        bh=OJ5HFdYrclCj1KQA4C5FoU+iSAcjqOdxVRhLB+Vkg7s=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=SwWnyRFo2YdYR6iHb0xVL3qx7KO7SGmmOgc+HN2CD+qg+RZNZKFcFe4E/+C2WaKU1
         aKGB6bLEEK4YCxRHqEYTVA3G7IbQ/+QM7NWl5S2h2Ogohu6Vpy1mqWUrnD+OMCxOd2
         LT1sfl3Wlao8gHRTlvc/56DyhmvugBnYCvi9IxDs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAOiHx=mjhzG-i8H5R0A+Mu3mcBXTNEaaBhC8rwCQPMWArDA+1A@mail.gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com> <20190418111211.10474-2-jonas.gorski@gmail.com> <CAMuHMdX7E8fR+2s-gPgGLKUCdW_--YUDW7w+op3BDurgACFEmA@mail.gmail.com> <CAOiHx=mjhzG-i8H5R0A+Mu3mcBXTNEaaBhC8rwCQPMWArDA+1A@mail.gmail.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Fabio Estevam <festevam@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Paul Mackerras <paulus@samba.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thierry Reding <thierry.reding@gmail.com>,
        Anatolij Gustschin <agust@denx.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFT V3 1/8] clk: divider: add explicit big endian support
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonas Gorski <jonas.gorski@gmail.com>
Message-ID: <155604120699.15276.12116926593244975174@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 23 Apr 2019 10:40:06 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonas Gorski (2019-04-23 03:39:59)
> No purpose at all, it's an uncaught artifact from rebasing ._.
>=20
> Stephen, which one is your preferred way of fixing that?
>=20
> a) a new V4 patchset without this line
> b) a follow up patch that removes it
> c) just removing the line yourself

I'll go for c and fix up things. Thanks for the catch Geert!

