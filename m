Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61ABE784AC
	for <linux-clk@archiver.kernel.org>; Mon,  2 Oct 2023 12:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236904AbjJBM1H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Oct 2023 08:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236908AbjJBM1G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Oct 2023 08:27:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0E69E;
        Mon,  2 Oct 2023 05:27:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D961C433C8;
        Mon,  2 Oct 2023 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696249622;
        bh=w8AYa9jSWCvyFzRLt95+X5yycPvHIG/9JRBOBasctx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pCyz1oxPwmLo9NVM2aeDkfX6vf1B71W9voXCZo/LIqgOaLMCN218FGy11g0DYjwBc
         QA/fR0WxKWdOhdKhueGaEqepEV/VVs2rJVQJAv/b98uIZDHPpO3KQB9cnFQ43cC6y7
         XaRf4NMdc3RSGTkHRjtXV7sTxjUWzSwnKsJLhdSA8ch0zRmMpcO9K1g+w0CjTm4ARA
         57g8RJyePJGNYgE5Xzk2HgJK+VyXIHP1yu4dTCzejKYQjDuoAh3iWpV7NQQPgSTbyQ
         Dy//+XbfDleProu4kB2UkpyO8cnkvdJKecHbnf+UMtNybTHQfzks9ZQJ+NksVIyxhb
         xj8RA7Pz0u9Uw==
Date:   Mon, 2 Oct 2023 14:26:59 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Frank Oltmanns <frank@oltmanns.dev>,
        Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH RFC 0/4] clk: re-set required rates during clk_set_rate()
Message-ID: <cjow276e3hsgtaqq6e2lzv3xdxyssoh34wan7lcwunh636wsqv@35eyi5cvbbwd>
References: <20231002-ccf-set-multiple-v1-0-2df5e9eb3738@skidata.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7jad33yup33wioar"
Content-Disposition: inline
In-Reply-To: <20231002-ccf-set-multiple-v1-0-2df5e9eb3738@skidata.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--7jad33yup33wioar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 02, 2023 at 11:23:31AM +0200, Benjamin Bara wrote:
> This is a spin-off of my initial series[1] with the core-related parts
> picked out. Without the core part, the rest of the series only partly
> makes sense, therefore I wanted to clarify the state of this first.
> That's also the reason why it is marked as RFC for now.
>=20
> Background:
> The CCF is currently very rigid in terms of dealing with multiple rate
> changes in a single clk_set_rate() call. However, with the
> CLK_SET_RATE_PARENT property, it is very likely that a shared clock has
> a couple of children which are changed "by accident" when the common
> parent is changed. These children might be clock inputs of hardware
> modules, which might have set a required rate previously. These required
> rates are most likely still expected after the parent has been changed
> by another clock (e.g. a sibling). Currently, it is not very trivial to
> get these required rates inside of a clock driver's
> {determine,round}_rate() op. Therefore, I think the core should also
> participate in the process of ensuring that consumer-set requirements
> are still fulfilled after a rate has changed.
>=20
> Idea:
> The idea is to have three rates set per clock, which need to be
> considered during the whole process:
>=20
> 1. req_rate: This is the rate required by a consumer. It is set during a
>    clk_set_rate() call.
> 2. new_rate: This is the "new planned rate" for the clock, which it will
>    set, once the "finding new rates" process is finished.
> 3. req_rate_tmp: This rate is set if the clock is "required to change"
>    during the process. It basically means that the clock is an ancestor
>    of a rate-change trigger.
>=20
> With these available, the core is able to validate the changed subtree
> in a more simple way. It also allows us to re-enter calc_new_rates(),
> which is one of the key components of clk_set_rate().

There's a couple of things you didn't reply on the first version and you
didn't really expand it here:

  - Most clocks don't care, and only the clocks that have used
    clk_set_rate_exclusive actually care. clk_set_rate never provided
    that guarantee, you're effectively merging clk_set_rate and
    clk_set_rate_exclusive. This might or might not be a good idea (it's
    probably not unless you want to track down regressions forever), but
    we should really tie this to clk_set_rate_exclusive or merge both.

  - Why do we need a new req_rate, and why req_rate can't be changed to
    accomodate your changes.

  - Why do you even need the core to be involved in the first place? You sa=
y you
    think it does, but you haven't answered any of my mails to provide more
    details and figure out if we can do it without it.

Maxime

--7jad33yup33wioar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRq3EwAKCRDj7w1vZxhR
xdKpAP0VDVuWWDrEwuF1Czb6SRj0XZTiVPHCsQQR8XlTeC4JNAD7BK2WHHeUHSY/
pPYLbyZw+pXgFtSFwickTIvdmJCfrwE=
=ZnMP
-----END PGP SIGNATURE-----

--7jad33yup33wioar--
