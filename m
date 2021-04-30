Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF8EC433B4
	for <linux-clk@archiver.kernel.org>; Fri, 30 Apr 2021 02:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1CBC61418
	for <linux-clk@archiver.kernel.org>; Fri, 30 Apr 2021 02:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhD3CSF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Apr 2021 22:18:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:43228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229577AbhD3CSD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Apr 2021 22:18:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F239613EE;
        Fri, 30 Apr 2021 02:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619749035;
        bh=Hv1C2LyXJqO2i3JKRnZtQbt4ua6L32rnPt3ObKyL2NI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=M6wiVI4fIVtHzldUu5wZztmxWCZp/lKGbCnzCkiorRaFxMy9wHWvnfcvh94LQBi5H
         nZI/789x4cNgbLqMo8Yp8QxSnE8+h/fZ6Gm2cM0pZ81pShzZ0H26VPHJGENYglAjdA
         exSaEp/8+m8mgKr+kla8Qd9+Ha6TylTvNXhbiAElKBso+qbND2N0hL/bH2VyIUL41m
         ZF1qzzkM8QQaJbPNICeTiB1wQ2ezV/XCHgsXOUQOccmAnxhhNppNiqHUYxjFPtv+MZ
         Tkyit8DYSzQc+/TcCA7SVUcUMLTSaqrOox5m3rFyw/xBemDFGnLB2gxnnr6XVcqAoF
         ZIRxFXwmjZL4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87v98dqzfe.fsf@kokedama.swc.toshiba.co.jp>
References: <20210421134844.3297838-1-arnd@kernel.org> <871rb2swd9.fsf@kokedama.swc.toshiba.co.jp> <01e78b64-8ad1-dfc8-9fc0-6afff4841492@xilinx.com> <87v98dqzfe.fsf@kokedama.swc.toshiba.co.jp>
Subject: Re: [PATCH] clk: zynqmp: fix compile testing without ZYNQMP_FIRMWARE
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Quanyang Wang <quanyang.wang@windriver.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
To:     Michal Simek <michal.simek@xilinx.com>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>
Date:   Thu, 29 Apr 2021 19:17:14 -0700
Message-ID: <161974903429.177949.6659170601321970979@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Punit Agrawal (2021-04-22 23:37:25)
> Michal Simek <michal.simek@xilinx.com> writes:
> >
> >
> >>> =20
> >>>     rate =3D  parent_rate * fbdiv;
> >>>     if (zynqmp_pll_get_mode(hw) =3D=3D PLL_MODE_FRAC) {
> >>=20
> >> The changes make sense in that the functions error out sensibly when t=
he
> >> zynqmp firmware driver is not enabled.
> >>=20
> >> Acked-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> >
> > I think code should be checked that these error values are handled how
> > they should be handled.
>=20
> I only looked at it from the point of view of getting rid of the
> warnings - based on the commit log, Arnd's patch is only taking care of
> the compiler warnings when the driver is built with
> CONFIG_COMPILE_TEST=3Dy and likely CONFIG_ZYNQMP_FIRMWARE=3Dn.

The subject line basically says this.

>=20
> In practice, the code should not be hit at runtime due to the dependency
> on the firmware driver. Even then, a better fix would indeed be taking
> the returned values at call sites into account.

Still needs to be fixed. If a better patch is sent I would apply it, but
if that isn't going to happen I'll apply this one.
