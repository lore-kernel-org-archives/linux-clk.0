Return-Path: <SRS0=3pyO=3L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4823AC2D0DB
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 12:19:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10B132467F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579695558;
	bh=CJw8miJvxW1hlsZ3JA/fqmJdHu0+CsP0QegqZjCmYsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pPGcJdB+RWKCYeOoffZZwUAQhUmoTiS22UbFvy30+qFMghhpcHCxm+DL9nuGoFuMv
	 LAlIxNla1IadTvzjHbYtOvdj4ioUE+K1V/ddBlWtjBoiLWfaEy2+4ypHJa+jQkFe3O
	 /tGEoEGU/Vfo/b9wymrS6oeU+FUlftPCN4q0/e2Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgAVMTR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jan 2020 07:19:17 -0500
Received: from foss.arm.com ([217.140.110.172]:55746 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728900AbgAVMTR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 Jan 2020 07:19:17 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C76328;
        Wed, 22 Jan 2020 04:19:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83C073F52E;
        Wed, 22 Jan 2020 04:19:16 -0800 (PST)
Date:   Wed, 22 Jan 2020 12:19:14 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@ger.kernel.org" <linux-gpio@ger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200122121914.GC3833@sirena.org.uk>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <20200120135446.GD6852@sirena.org.uk>
 <70ac7b71d5d54d4b90ded032214c473569b9fae1.camel@fi.rohmeurope.com>
 <20200121131100.GB4656@sirena.org.uk>
 <9609ad80c432360a5b6dd41c32ac2a249973863b.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline
In-Reply-To: <9609ad80c432360a5b6dd41c32ac2a249973863b.camel@fi.rohmeurope.com>
X-Cookie: Sorry.  Nice try.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 22, 2020 at 06:44:06AM +0000, Vaittinen, Matti wrote:

> Hmm. I can do that as well - or just resend the cover-letter + changed
> patches untill I get all the acks and then do send the (hopefully)
> 'final' version with all patches for merging. But this needs to work

I think the ideal thing is if all the dependencies are Kconfig
dependencies so people can just merge the parts for their subsystems
without needing everything to get applied at once, you can't do that
here due to the refactoring of the existing driver unfortunately.  It
also helps if the drivers in the main series are all simple and don't
struggle like the LED one seems to have here but that depends a lot on
how well the hardware fits the subsystem and is hard to control.

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4oPcIACgkQJNaLcl1U
h9Ap3Qf+JL7BJnVKGcnsxwpP0www+fMegYuEkFlQXpNEjYBiWImRcPdR9NyS40kh
X7lAYKLoFYbK8giHoZ019kO4WAFhkCPl/QEL4QQcNmhbC6wwVi6IJYsDUOoYnscm
9CF/bQMUhfuErK0KV66VkiVExfJOD1y4GHoUgc6zsfVFcKj/TZskaVBaE6enw2OR
K38Q86ac4VOBgShQVudk01T6ZsvWPga3S2q3wwHizgYGFS5WpHBJVve1bTTZKUIN
IZVxVWgGL+V69jPFMnBoKVvJBZP7eepG2AV0r9DlYzmI971ArFIKzm1wNXkz5pfa
NdCMa8H89nas7mnsRmEgXOM31622CQ==
=CykH
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
