Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F94DE81E04
	for <linux-clk@archiver.kernel.org>; Fri,  6 Oct 2023 14:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbjJFOxW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Oct 2023 10:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbjJFOxW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Oct 2023 10:53:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6661AC6;
        Fri,  6 Oct 2023 07:53:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D73C433C7;
        Fri,  6 Oct 2023 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696604001;
        bh=hrgggEGosELvz7tO/RqZ7JUeXLjbLpkBBVEktBc+OzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FUoSK0RyDwIcxEH0ffclHP1EAduYZpTlsvDqRskZieqin/bDUDy0NfLfBt5JQZtg1
         u1D6dOeK0pOSd9DLa5AHuGBxTNKhTa889M3k8HRKwGo6AY3G1Ve/e2lUzIaSPuscNz
         E7LURfSlYGJAVz31eOjjlH4pB/JANz08Puf+04V3CK6jUvGKRk5CnPBku9duaTZbBG
         Y9K0lMHVp2RGdrNcXhM2VCb2XMRnVVYeTCDTNUym5Qw0T1ufXhm14djgsnQJd1grEi
         5J7o/k+CxJusbREvVsqiaLeMVFhnwaPksgeA5Q4rjO5sGoht5TLs190HqXAXaozSLh
         nDllmk1JGarYw==
Date:   Fri, 6 Oct 2023 16:53:17 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Benedikt Spranger <b.spranger@linutronix.de>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 1/1] clk: socfpga: gate: Fix of by factor 2 for serial
 console
Message-ID: <h6j2pl35gxckhytyab5gsa3uypdv6trwseiludnwaxlnskuq2e@2bgyswbpbhwx>
References: <20231005095927.12398-1-b.spranger@linutronix.de>
 <20231005095927.12398-2-b.spranger@linutronix.de>
 <qpskbgigcaoyjuhzeguz366cjukv3ij7utlbkra5edhwn6uzh4@bdedm6vs62y5>
 <20231005203202.08b5d1cf@mitra>
 <77d94f6a6a4b45f8ad711f52ca6ba86c.sboyd@kernel.org>
 <20231006053906.1bb2a7d8@mitra>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ohme6vguvci4zhdr"
Content-Disposition: inline
In-Reply-To: <20231006053906.1bb2a7d8@mitra>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ohme6vguvci4zhdr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 05:39:06AM +0200, Benedikt Spranger wrote:
> > What's your analysis?
> Commit 9607beb917df ("clk: socfpga: gate: Add a determine_rate hook")
> breaks serial console output and changing the determine_rate hook to=20
> __clk_mux_determine_rate() fix the issue.

That's not a sickness, that's a symptom. There's something wrong
somewhere, and you're just papering over it.

Maxime

--ohme6vguvci4zhdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSAfXQAKCRDj7w1vZxhR
xV0ZAQCPKV9Ohe5ffLhTlsBGIFaJzXXHBZqoLRzKHrfWiLKtKgEA/MY/ea7a/A0c
QaXJhAFkt7vpAB634d2TDU6eTsKI1Qo=
=SBiv
-----END PGP SIGNATURE-----

--ohme6vguvci4zhdr--
