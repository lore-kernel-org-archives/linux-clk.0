Return-Path: <SRS0=xpy6=EB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1727C2D0A3
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 17:03:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6BAC239D2
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603731787;
	bh=Vx3kwhUrgAstRm7ol0WS1C7y+i6SeJQpZ/usDeWwXjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cAtsJdX6wJCgzBMHVamrIY32wDz9lUZKCLRtTDetG/WbQ4WsmUQRfXqGgHfQ7FB6+
	 fPC5aQhctD3/VqJ8aBqsWlgFAsfouw0z916tVfAU6l99WHfJjbWHAuk27ATdddrpFs
	 se5OsGLmj2aRum/4wBs/bc0zscS+0retioC6KC3M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1787093AbgJZRCz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Oct 2020 13:02:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:50896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1787091AbgJZRCy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 26 Oct 2020 13:02:54 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7878622450;
        Mon, 26 Oct 2020 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603731774;
        bh=Vx3kwhUrgAstRm7ol0WS1C7y+i6SeJQpZ/usDeWwXjw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1HGmyQZdomU/Kcotc6fonPISgftZKhHwL7gHb6VeyrwzgMJltpq9pWE80mmu1RFE3
         x3zRvpo2a5VLA1Ht1UohZDgVrhKlBQxFrV83VyfrPOV6ZDzbxhiwhmStcsZeqO4uPA
         e4IRJW31qs8XutTP77u+GSEVcLP9WBLbvvFEWSX8=
Date:   Mon, 26 Oct 2020 17:02:49 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: regulator: fixed: provide bindings
 using power domain
Message-ID: <20201026170249.GH7402@sirena.org.uk>
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
 <20201023131925.334864-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ewQ5hdP4CtoTt3oD"
Content-Disposition: inline
In-Reply-To: <20201023131925.334864-2-dmitry.baryshkov@linaro.org>
X-Cookie: Safety Third.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ewQ5hdP4CtoTt3oD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2020 at 04:19:21PM +0300, Dmitry Baryshkov wrote:
> Define bindings for fixed regulator using power domain performance state
> to enable/disable corresponding regulator.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--ewQ5hdP4CtoTt3oD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+XATgACgkQJNaLcl1U
h9B3ZQf/b7wpRLW/WpVwlv/42X+6gg4wtsqgDCgaVyn4HGeEN0DFdW6WdAmKTygm
eQwftDetW7iOVVMC9hOjWcqjqsv9mOEerwPyEwv9PN8GKtf6RKpBl2+6q0Bazv/Y
45WSBguDbosl/Km4cHIviwAgfiTNFvPLKsm7I+OJGSkQgjeO9sIAel7NbcHoOH7p
qBimFcit4Ztw2p7MNGzsg2G73ddnYQAWHosVs6fdClGIOJ0y3jfCG0FKrvrvBpdz
fUqrlurarkaR+C/2mnI5S2wGMXsd6HGLV+YkThN71hYjUKovn76o0e+LTPaXltIL
aj1yZK1NiGho3IJDqRjeudSZa5R20A==
=6lYt
-----END PGP SIGNATURE-----

--ewQ5hdP4CtoTt3oD--
