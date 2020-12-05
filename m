Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5511FC433FE
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 06:27:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26CE822D07
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 06:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgLEG1g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Dec 2020 01:27:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:36392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbgLEG1g (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 5 Dec 2020 01:27:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607149616;
        bh=xh2ELT50oSaVLdd5L5L9+Aywd9ZFOZnSLphqXQRx0VI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AK4VPZOjUiRAV/aIe4Wl8+ooY4U6Zkj2CRo4N6qz4nnuXgowtaK5Q8A1UaYWMm878
         qsrcjT730d/P0/zmFFBerCepRthRCruTRWuZVXcckoPueZa7VQ2zYYmyj50H1x7qiu
         vHY6X83fR+JPGf7J/KE6NkLpKBCWnVb8LvKnjO+ecvsTFIRwdUjoVVEE6xS0X8eTpa
         00R1pG3xZ1ddB0x7vDmNnUfCi2T2LzHz79SoIKDlv4E+3Yhza8EdIOEL+2mPtpfL+A
         vt7F9BOmLImgdaTsyR6tgVMgSLW3I22JJRLWx5CIYcKD5VKRNZoD5gdplsNlX68vVv
         SqJO7vk+WCP0Q==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jtut7yjj3.fsf@starbuckisacylon.baylibre.com>
References: <1jtut7yjj3.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic updates for v5.11
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Fri, 04 Dec 2020 22:26:54 -0800
Message-ID: <160714961471.1580929.6506196779990620974@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-11-29 12:50:40)
>=20
> Hi Stephen,
>=20
> Here are the updates for amlogic clocks for v5.11. This is based on your
> clk-hw branch, instead of the usual rc1, since it depends on clk_hw
> stuff you've already applied.
>=20
> Please Pull.
> Thx.

Ok. Where do I pull from!?

:)

>=20
> Cheers
> Jerome
>=20
> ----------------------------------------------------------------
> Amlogic clock changes for v5.11
>=20
> * Add MIPI DSI clocks for axg and g12
> * Make it possible to build controllers as modules
> * Fix Video PLL clock dependency
>=20
> ----------------------------------------------------------------
> Jerome Brunet (2):
>       Merge branch 'v5.11/headers' into integ
>       Merge branch 'v5.11/headers' into v5.11/drivers
>=20
> Kevin Hilman (2):
>       clk: meson: Kconfig: fix dependency for G12A
>       clk: meson: enable building as modules
>=20
> Neil Armstrong (6):
>       dt-bindings: clk: axg-clkc: add Video Clocks
>       dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
>       clk: meson: axg: add Video Clocks
>       clk: meson: axg: add MIPI DSI Host clock
>       dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
>       clk: meson: g12a: add MIPI DSI Host Pixel Clock
>=20
>  drivers/clk/meson/Kconfig             |   7 +-
>  drivers/clk/meson/axg-aoclk.c         |   5 +-
>  drivers/clk/meson/axg.c               | 824 ++++++++++++++++++++++++++++=
+++++-
>  drivers/clk/meson/axg.h               |  23 +-
>  drivers/clk/meson/g12a-aoclk.c        |   5 +-
>  drivers/clk/meson/g12a.c              |  79 +++-
>  drivers/clk/meson/g12a.h              |   3 +-
>  drivers/clk/meson/gxbb-aoclk.c        |   5 +-
>  drivers/clk/meson/gxbb.c              |   5 +-
>  drivers/clk/meson/meson-aoclk.c       |   4 +
>  drivers/clk/meson/meson-eeclk.c       |   3 +
>  include/dt-bindings/clock/axg-clkc.h  |  25 ++
>  include/dt-bindings/clock/g12a-clkc.h |   2 +
>  13 files changed, 979 insertions(+), 11 deletions(-)
