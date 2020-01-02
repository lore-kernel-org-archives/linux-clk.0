Return-Path: <SRS0=1mk2=2X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEB6C2D0DC
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jan 2020 09:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B805521835
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jan 2020 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577957342;
	bh=pRLLWLshpdZaj7aSje6TIFcK62XHUMhFH6uF34UjPWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sIaFmgpKFXwky36NtmxU6Uh+MGWufLewi7ljva5SN0+YDBH1RMR4Ka9cRoA6uJBqa
	 sdAhKDyxIeq9YutF4Gt+2d9yRoIn15edP3Gp3RfnfrFYfQ43wsa8rcqpgkPRELZo4Z
	 lk/OS3DHFJEJHAsKDBhEp/oZiiBXoalPFA2i6mW4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgABJ3C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jan 2020 04:29:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:53814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbgABJ3C (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 2 Jan 2020 04:29:02 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F43C20866;
        Thu,  2 Jan 2020 09:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577957341;
        bh=pRLLWLshpdZaj7aSje6TIFcK62XHUMhFH6uF34UjPWE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qioH68TnAGoz6R8XezA9BL4hVOWCriMkL0fN0Za0boFI4yM/swDLfcwRPWMzCKTuf
         HKyYkBgMbDNYXcGEt9krDRjxThh6owzoXQTFPIqw6l9EWGkVB88gT9Iq8HryEjmuSf
         4p9Sg6GPF0yHKPT05z79Rtav8FmyWoZYSwJwxCqo=
Date:   Thu, 2 Jan 2020 10:28:58 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/3] A64/H3/H6 R_CCU clock fixes
Message-ID: <20200102092858.6n5uqymglia4t7lk@gilmour.lan>
References: <20191229025922.46899-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gk2aam5hdxft2et4"
Content-Disposition: inline
In-Reply-To: <20191229025922.46899-1-samuel@sholland.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--gk2aam5hdxft2et4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 28, 2019 at 08:59:19PM -0600, Samuel Holland wrote:
> Hi all,
>
> I was examining the H6 BSP clock driver[1] for guidance when porting an
> AR100 firmware[2] to the H6 SoC. I found some inconsistencies between
> that code and the sunxi-ng driver.
>
> I don't have a good way to verify the first patch. Someone with an
> oscilloscope could set the divider and check the I2C/RSB frequency.
>
> Patch 2 should have no functional change.
>
> Patch 3 was verified by benchmarking. Details are in the commit message.

Applied all three, thanks
Maxime

--gk2aam5hdxft2et4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg232gAKCRDj7w1vZxhR
xR/OAP9JY57TmyxiCqTZ5rQ+jSsbbgBIlK0MUpFXFJ60USVATgD+LwMfTzcDLCvz
GjShAjhcGPUCGqkJC8XOg5DyklsoFAo=
=gy/O
-----END PGP SIGNATURE-----

--gk2aam5hdxft2et4--
