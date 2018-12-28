Return-Path: <SRS0=9SV/=PF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE42C43387
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 18:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 253D721479
	for <linux-clk@archiver.kernel.org>; Fri, 28 Dec 2018 18:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546022658;
	bh=5ucgzehciUsfwkLcIW5LiJpNmO7fSiObPonJP3wuR8Q=;
	h=To:References:Subject:Cc:From:In-Reply-To:Date:List-ID:From;
	b=y38GHAStNkU+zfCru8P3rCUzRz6+zkhb7R2xiNM7TkVvVtX+i+euV7i6ozc0wCm2I
	 AusqxuEb1Y+p1X18gxIDjTw7qDjr1gPolr9vME0ebZ23KSDa1dOSqSCgUgBjSPEQFx
	 v9UTOJB83z9B1bNtmzAuWvvsMnThsLGQeu5G5hu4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730011AbeL1SoR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Dec 2018 13:44:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:35788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbeL1SoR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Dec 2018 13:44:17 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0622820874;
        Fri, 28 Dec 2018 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546022657;
        bh=5ucgzehciUsfwkLcIW5LiJpNmO7fSiObPonJP3wuR8Q=;
        h=To:References:Subject:Cc:From:In-Reply-To:Date:From;
        b=JQK/tQyBkRsoTKzqF8Hhv3ojKM7XTE6mEV9iycERDQM46xM7ZQqjrZy6HCD4Z3YpE
         6ctHkYd0WxI97tpxXAKLC2phwNBV1Ud4mxVTHmI/V19Dlsh8WbBkggTjdnBY2r8wV5
         HLQS6xM2lL+FA/i/UOmytXQl1n/LPS5fDmL+6tlM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Message-ID: <154602265626.179992.3181140733519451401@swboyd.mtv.corp.google.com>
References: <1545581665-15446-1-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V2 1/1] clk: imx8qxp: make the name of clock ID generic
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
In-Reply-To: <1545581665-15446-1-git-send-email-aisheng.dong@nxp.com>
Date:   Fri, 28 Dec 2018 10:44:16 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-23 08:20:02)
> SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> Let's make the name of clock ID generic to allow other SoCs to reuse
> the common part.
>=20
> This patch only changes the clock id name and file name, so no
> functional change.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

