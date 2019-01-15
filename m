Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0C5C43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 20:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9628B20675
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 20:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="iiNpF5J+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389750AbfAOUYe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 15:24:34 -0500
Received: from mail.andi.de1.cc ([85.214.239.24]:52602 "EHLO
        h2641619.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732372AbfAOUYe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 15:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bjZ0t6VVJuZjz/OQIcUjH2ule/fJNhALQPPlZOidNO0=; b=iiNpF5J+56frZ134cApo5can+
        pfojuDqdiMn0sLP+1oysmABx9vtKzcxssiCfQADdcKAx1lm9QDcmVASo9ZtsWuaunYuG1Pw6pbXG6
        LXR2jRIcVwBpuot/WOh5ki/xaeIW8RsPpBTsaDi6sBYN3SfS6R6b5+FXMNqV8NmM7uAEY=;
Received: from p5dcc371e.dip0.t-ipconnect.de ([93.204.55.30] helo=aktux)
        by h2641619.stratoserver.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1gjVG7-0005c9-8H; Tue, 15 Jan 2019 21:24:27 +0100
Date:   Tue, 15 Jan 2019 21:24:26 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 0/4] clk: ti: get rid of CLK_IS_BASIC
Message-ID: <20190115212426.1b0ff82d@aktux>
In-Reply-To: <b7571829-fb5e-c2be-59d1-b08d73bfca6d@ti.com>
References: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
        <20190115182021.GH5544@atomide.com>
        <b7571829-fb5e-c2be-59d1-b08d73bfca6d@ti.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rOvGcLiwcr/ym8Zz.ng8TE3"; protocol="application/pgp-signature"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--Sig_/rOvGcLiwcr/ym8Zz.ng8TE3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tero,

On Tue, 15 Jan 2019 20:31:54 +0200
Tero Kristo <t-kristo@ti.com> wrote:

> On 15/01/2019 20:20, Tony Lindgren wrote:
> > * Tero Kristo <t-kristo@ti.com> [190115 09:15]: =20
> >> Hi Stephen,
> >>
> >> As requested, this series gets rid of CLK_IS_BASIC flag usage from
> >> TI clock drivers.
> >>
> >> Boot tested on am3/am4/am5/omap3/omap4 series of SoCs. Also, ran a qui=
ck
> >> suspend/resume test on omap3/omap4/am5. =20
> >=20
> > Does this also fix the issue Andreas was fixing earlier
> > or is this separate clean-up? =20
>=20
> The series from Andreas would be needed on top of this.
>=20
thanks for this cleanup. I will rebase my work upon it the next days.

Regards,
Andreas

--Sig_/rOvGcLiwcr/ym8Zz.ng8TE3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlw+QXoACgkQfb1qx03i
kySQTQ/8DKWLs6eggkLka2mhyUVWAZHFws6gbI9BB9ywF08MwmCmjH5RMgc+o2UL
/YmVwbgyus3XAilZvsl8K4A5By+YZDgEGxprjJJdtWhYBMJ4Uv3DXgMa9OiUmaQw
/cX/0BAnIeyAs9UY9cG164A/exKUW0Uonb0B0wLMcgc0IVWVmGL+ZEl6jvg3vgIs
8Qe4MrQ0vWt/2glaBr5d9gPZkaI4DvbxCYxQM4XZ0RzrI3hKThokg3h1tMFBf+Z3
qPCSMChHFzHueHQulLZcl6w83fh48KMNQL1Rmygokd23txIHvchU/i3gyw1FqFbS
Szp6M5BMdr93Dp9y/+AK7BgN1Y727VbdYSU2R+6ZCJxhL3Wd7Akx3qesTmoAyqwJ
8mtm8GoqFm7QekgUMuhY/iWbQ4sNsspbqnPuCzXBM/3Cly28cmLu2WjR0SswXGNY
ogOf1C3xp8lFsKPv/Kfs2eMw3I1DIgxC0Xk/i2WyzCgIyrsNZpv1Yna5UNx16uaL
dNa+DVKleIIz4Zk8WRJb2r5bYZD0gLb7Za9ICbdr0ObK13m4p58sMb5JW+QO0Usb
IQbk3Alwrw78En1v07PMbBTW3GLzhwtJDI8cvY1A9J5YoIX+5klcoyb/c61BlRYd
JJknj+BqF/+xGtP5xy+ueyCC8oL6D+Ics2ovApchnk8Z2JYzXHM=
=LdRX
-----END PGP SIGNATURE-----

--Sig_/rOvGcLiwcr/ym8Zz.ng8TE3--
