Return-Path: <SRS0=EEPi=MY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F22C43441
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 11:08:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA6442077C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 11:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6442077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbeJLSjz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Oct 2018 14:39:55 -0400
Received: from sauhun.de ([88.99.104.3]:46522 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbeJLSjz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Oct 2018 14:39:55 -0400
Received: from localhost (p54B3365E.dip0.t-ipconnect.de [84.179.54.94])
        by pokefinder.org (Postfix) with ESMTPSA id CC0A82C3256;
        Fri, 12 Oct 2018 13:07:58 +0200 (CEST)
Date:   Fri, 12 Oct 2018 13:07:55 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210
 support
Message-ID: <20181012110755.qdnevfoyq5qymf42@ninjato>
References: <20181010150642.73890-1-chris.brandt@renesas.com>
 <20181010150642.73890-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hiadxleck5bwbuvf"
Content-Disposition: inline
In-Reply-To: <20181010150642.73890-3-chris.brandt@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--hiadxleck5bwbuvf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chris,

> +/* RZ/A2 does not have the ADRR_MODE bit */
> +#define SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED 2

First, there is a typo: s/ADRR/ADDR/g

Also, I think it would make the code much more comprehensible if this
macro was named SDHI_INTERNAL_DMAC_ADDR_MODE_BROKEN. Or maybe
SDHI_INTERNAL_DMAC_FIXED_ADDR_MODE_BROKEN. Currently, on first read I
thought this mode was fixed on this SoC and broken on all the others and
was confused.

What do you think?

Rest looks okay to me!

Regards,

   Wolfram


--hiadxleck5bwbuvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvAgIcACgkQFA3kzBSg
Kbbm1w//UEi+13JYUznxfmxVXj9qbxY2IDh2wOJVgiRXeMGy4J3WtyLbn5Vtk/Rs
ZClhLg3ZxQqNpxEmDuBzxLGCF0GPsOzTKYXumgTVNCe6seKVuEvgLRwMRIaInDUg
yvDguToE3rLXQM8y7exAIPlCnyQzJrM2c/RNvP79hzva8tF09DJxJkhKdBLgvRaV
BfHIxxtOAFzYUhBLrNHoUN0pA3A73/bkifVsHALOfRJar1xJbKeLQumbyb5Lb0wR
94kmqsP13nTCL+caFNdeUsBngOlbDxN2Ehxd4577rcD6yt09gmXRLzONTwIQJYrH
PXhnt15jGn+faKxoGkfWQN/+2b5KFqKoeOHWJNnNCw6XIFhXekd09AnBCLQu9AgU
CBIvGWlbPVLWzXxoZf46A+uxpH9GQipCl4gM7NMTrv9LqYU9QvK0+feJ0Mk2GHKX
RUnjvhhWqHr+q22QoF56nZRGidFuhWrJW4zHWAGIethcXGr254iotYcuiEAFoOtF
WIEVbD5pO84QQnMXOnXHJ94Es3TgRmcF+PkcPJeZwB7oaJMFZ3pxKA/+qItrZoH+
ZodETlGthNTs+EYZDtjSC6wlPu9nx6WFoua8uH9o7rjUrSZyE7M35xZrfRS6E64w
jzYX5p7y5/L4D4oFIf1kwUw9AdmPpvYskpTCQtlGjSKZR2mHCxM=
=11CP
-----END PGP SIGNATURE-----

--hiadxleck5bwbuvf--
