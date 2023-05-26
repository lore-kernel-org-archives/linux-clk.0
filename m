Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35AFC77B7A
	for <linux-clk@archiver.kernel.org>; Fri, 26 May 2023 11:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243407AbjEZLkH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 07:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243395AbjEZLkF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 07:40:05 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A59DA7;
        Fri, 26 May 2023 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685101205; x=1716637205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lYuy1LD8bWujUTSaX1+mmd0Ol6dxdh+UWPikKfhDyxQ=;
  b=CEY8WoPFrtzFWPttZ0L/VkL86EyQxG59XUHPWmLNED8xdw93HBL7U+TE
   4wmi1G3Sgd8WP4HKuNwmBiBIK7IcPL9IspY58Yz3RGpieYrYh7eR7jcFo
   QkshciaVTXWOKJKmdTiF8egqBqsJLoZ0hhOEklg3zU3CRNu61p97mWICJ
   33uqkSJa9llGWIW0hNURMTKlwqvuswQ/SMlehaCkPqYLjBCJVJfpGII/W
   5vSaKj9WygfVXjh6VkYYKgHDxu8nwamSGjVO+sxa81V0H4hletc73iyFZ
   WB307kGJTiPDvwM4ejxfkb6FLrVQhnyE7aLaNrpTbFExZgaiEpVOwrGyF
   w==;
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="asc'?scan'208";a="215607885"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 May 2023 04:40:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 26 May 2023 04:40:02 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 26 May 2023 04:40:00 -0700
Date:   Fri, 26 May 2023 12:39:37 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Alexandre Mergnat <amergnat@baylibre.com>
CC:     Conor Dooley <conor@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: replace unusable
 clock
Message-ID: <20230526-acorn-unwound-34816283b187@wendy>
References: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
 <20230517-fix-clk-index-v2-1-1b686cefcb7e@baylibre.com>
 <20230525-snuggle-twine-ed1bfc2aee51@spud>
 <c1e706f3-9d80-3dd5-eeab-c24830f9ef03@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ia81GYyjYwkAUf9K"
Content-Disposition: inline
In-Reply-To: <c1e706f3-9d80-3dd5-eeab-c24830f9ef03@baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--ia81GYyjYwkAUf9K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 10:54:04AM +0200, Alexandre Mergnat wrote:
> On 25/05/2023 19:51, Conor Dooley wrote:
> > On Thu, May 25, 2023 at 04:50:27PM +0200, Alexandre Mergnat wrote:
> > > The =E2=80=9Cmcu_pm_bclk_ck_cg=E2=80=9D clock is used by co-processor=
s and should not be
> > > added to the kernel driver, otherwise the CPU just halt and the board=
 is
> > > rebooted by the wathdog.
> > >=20
> > > Instead, add the "aes_top0_bclk_ck_cg" missing clock to prevent
> > > re-shuffling index and then preserve the ABI.
> >=20
> > How does this preserve the ABI exactly? Please describe exactly what you
> > mean by that.
>=20
> I mean that reduce the impact of the change compared to the v1 where I've
> changed the index of the following defines to be clean.

Oh, you can't do that at all as you probably discovered!

> > Also, what about any other users of these definitions, outside of Linux?
>=20
> The clock driver and bindings are only a couple of kernel versions old, I=
'm
> pretty sure no one is using it.

Pretty sure, or sure?

> Also, if someone use CLK_IFR_MCU_PM_BK
> define, I'm wondering how his CPU is working since Mediatek told me that
> shouldn't be used, and after some try, I confirm.

Maybe that person is actually using the index to make sure that the
clock at that index is left untouched.

> I've a question: If something is wrong in the binding, you don't fix it to
> avoid ABI change ?

I don't quite get what you mean by "wrong". These header files just
define a set of arbitrary meanings, since the clock numbers are really
just something that developers came up with rather than being lifted
=66rom a TRM. They don't prescribe behaviour for each of these clocks, or
that these clocks should actually be used - just a simple "this number
means this clock".
It sounds more like a driver or devicetree is _using_ the number
incorrectly, but that does not make the binding wrong :)

> TBH, I just try to clean the binding. I can fix the driver index issue
> (patch 2/2) without fixing the binding if you prefer. But IMHO, keep an
> unusable define isn't great...

I, at least, would prefer that.

Thanks,
Conor.

--ia81GYyjYwkAUf9K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHCaeQAKCRB4tDGHoIJi
0ljiAQDW7cAtkJiUVftFCHctuq0rAX7Y8PATQhIkWAgesm/55QEAgD3TxCEUtXrf
7eREpLfSvnpwJMHbf49qtnOj7Rw29gQ=
=PFKY
-----END PGP SIGNATURE-----

--ia81GYyjYwkAUf9K--
