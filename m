Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E00DC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 13 Dec 2022 13:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbiLMN2o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Dec 2022 08:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235647AbiLMN20 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Dec 2022 08:28:26 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E960A2035F;
        Tue, 13 Dec 2022 05:28:23 -0800 (PST)
Received: (Authenticated sender: herve.codina@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0FF341C0006;
        Tue, 13 Dec 2022 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1670938102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wyBRC443lozfjF+VOaYzBsgDcI3m5T032gODarsDzKg=;
        b=Hdqil+3x6THnqiMLHbfmN86Acan5v1bCQ5HPG3uQIcXhP+ICOLbIDFRssRpEw7m5jC/M3l
        bsjWVT8yqyWEhpeyYjL6crJRIFWlmY3D3vdtNFpB6nTfsQWlMkauf7OwxHd+5dO0M8dDcS
        v/C8eChYb0xYMOwtjw4Q9E90fpIauPsySfR8N6C87MOoH87pSphmdSt09CzUc7CbU5YreC
        GBH3w3nuwh3u5MigEGCOCXp/63ipp/GJQc3Frgd5Yq4cr1ijrFBF2KJ6nPEusviTCqGqrh
        fIJt84E/hXU8uLmE7QMUlUJXBmiQw72h26lnJfipGFhXDLSLAZPwdWHOsGFqgg==
Date:   Tue, 13 Dec 2022 14:28:18 +0100
From:   Herve Codina <herve.codina@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 6/9] soc: renesas: r9a06g032-sysctrl: Handle h2mode
 setting based on USBF presence
Message-ID: <20221213142818.2925bfac@bootlin.com>
In-Reply-To: <CAMuHMdVxegUAK+C1X_591=3Uup6Qa_R=Q0TydYJ6TCP5-789pg@mail.gmail.com>
References: <20221207162435.1001782-1-herve.codina@bootlin.com>
        <20221207162435.1001782-7-herve.codina@bootlin.com>
        <CAMuHMdVxegUAK+C1X_591=3Uup6Qa_R=Q0TydYJ6TCP5-789pg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

On Thu, 8 Dec 2022 10:05:28 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Wed, Dec 7, 2022 at 5:24 PM Herve Codina <herve.codina@bootlin.com> wr=
ote:
> > The CFG_USB[H2MODE] allows to switch the USB configuration. The
> > configuration supported are:
> >   - One host and one device
> > or
> >   - Two hosts
> >
> > Set CFG_USB[H2MODE] based on the USBF controller (USB device)
> > availability.
> >
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com> =20
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20

Will be added in v4.

Thanks for the review,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
