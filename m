Return-Path: <SRS0=EEPi=MY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289AAC43441
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 11:09:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E05572077C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 11:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E05572077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbeJLSlE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Oct 2018 14:41:04 -0400
Received: from sauhun.de ([88.99.104.3]:46552 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbeJLSlE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Oct 2018 14:41:04 -0400
Received: from localhost (p54B3365E.dip0.t-ipconnect.de [84.179.54.94])
        by pokefinder.org (Postfix) with ESMTPSA id CB0CD2C3256;
        Fri, 12 Oct 2018 13:09:07 +0200 (CEST)
Date:   Fri, 12 Oct 2018 13:09:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
Message-ID: <20181012110907.oy7vw5w5yo7jj7na@ninjato>
References: <20181008162349.42957-1-chris.brandt@renesas.com>
 <20181008162349.42957-3-chris.brandt@renesas.com>
 <CAMuHMdWNe2Z=q1tHO5_YLX1Q6+ef5BiQU=feBdcJfzcNvzo8HQ@mail.gmail.com>
 <TY1PR01MB15625FE2255DB4877C4F27068AE00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nefruxzpi24xec4t"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB15625FE2255DB4877C4F27068AE00@TY1PR01MB1562.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--nefruxzpi24xec4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> As you can imagine, it does have this bit. And it worked fine from me.=20
> But the chip guys said they found something not right with it, so they=20
> removed it from the v1.0 Hardware Manual.

Do you happen to know if this applies for Gen3 SDHI as well?


--nefruxzpi24xec4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvAgNMACgkQFA3kzBSg
KbYrCg/+P8ScT/mGtmdUSggRSTMSO38kY1xe8wfE7hF5XH4grYk5y6krRBbIFRcZ
3HLZ+1oBMOYmjIfBvDARYVlCA/J3vDiQx9SrwKipvCISIzHdddM2zKr1Sjed6eHG
oXb1++8iGU9oRib9udkBkoH/nv+9W6Dsv4f8kfFU2FOsVwt6ox8P/8OGPd08Q3zS
1r2wRZ6NaMVll1yHzJwS+6GnoeT3D0Co44fs79aNmeAUrJaZnslp/8OGu9Xo5KIx
7rQW9r/cgB5h7yr7sbZMTfo2uyon7wxzp7t8RmL4EaxmfyN/mw5XUQ2oiuMSKEnt
DOglgVqkyExa+aHn4hmy3Q7YtFWuHAzVtRodaOamTNo+6qZ01Bcrnsc3jsb+qKQR
k6j9EtARHIQgRXjOX3KoEleRNqfJH6EvVDVNKfYz9ew8Ngfg3cg83DAWE6Py+11q
s2YQCb7NlqHX60rRGsgs3U0KwPZTcZmvZqyl/2NrhvYfZ+OqXKj7pd3BcW0yg46s
ejMVYaWWBx+FpfLGSCw7pJ4/ItFV6rKEmlHTxNO72D9bQCjoqFPgj6GXmhAxJ/Z/
qggXjqpd9MyIDcxxF8PB/zBqZMU+u6fxiKSE80mzVJC1TOn9BOr+lCfaspDDvr2d
7lrz5PMEnpzm1Uk6OQnJ9OsHCSaegfwMYJPY9dVxI6Zkw2l0XHI=
=9Hk6
-----END PGP SIGNATURE-----

--nefruxzpi24xec4t--
