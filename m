Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACAC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  5 Nov 2021 22:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 325FC6120A
	for <linux-clk@archiver.kernel.org>; Fri,  5 Nov 2021 22:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbhKEW3V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Nov 2021 18:29:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230498AbhKEW3V (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Nov 2021 18:29:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE86B61108;
        Fri,  5 Nov 2021 22:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636151201;
        bh=w+LpsuffWQzgJ6nJBQmL8Y6UbI/mL4O3jP8HsCr4Qd4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YmD/wrcPglOe2+7IdvGwBeWzU+jUovuswabo0Xe2hypjnyNqxTQC8BBA06TR5iZRY
         fUZJOw0p5EdO8cnIbg4HCsnEyZGt1FzbxXvt5XY9Ep4KEjLkl4vk1KAtN8wt9hXpyj
         hulaCbgas7mJ/1dhwMuBfrLroLbcI5Nrw3br5i9tV3JFEwVUL/x2tmkauWawq+cPSG
         PPEB1mVZydu+vTJz68SZJY7xgDyhtwpM+cdywvuS0WsjPaVsOkHJEQfbQzEuupsl+S
         J57mQWF05rwNaINskhj5XZQmzZ0xVLWp+bued84SRm6ZMWM86Qdw+NnJSH+az2Y/PM
         vt9bSUHWUFSjg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YYL0/hpn83XI84LP@ryzen>
References: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com> <YYL0/hpn83XI84LP@ryzen>
Subject: Re: [PATCH 1/1] clk: imx8m: Do not set IMX_COMPOSITE_CORE for non-regular composites
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Date:   Fri, 05 Nov 2021 15:26:39 -0700
User-Agent: alot/0.9.1
Message-Id: <20211105222640.EE86B61108@mail.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2021-11-03 13:45:50)
> On 21-11-03 13:39:47, Alexander Stein wrote:
> > Only imx8m_clk_hw_composite_core needs to set this flag.
> >=20
> > Fixes: a60fe746df94 ("clk: imx: Rework all imx_clk_hw_composite wrapper=
s")
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Looking at the commit a60fe746df94 it's obvious this change reverts the
> flags as they were before.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
>=20
> Stephen, will you apply this on clk/next or should I send a subsequent
> pull request ?
>=20

I picked it up.
