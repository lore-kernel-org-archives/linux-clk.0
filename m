Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44198 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390076AbeIVAC3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Sep 2018 20:02:29 -0400
Date: Fri, 21 Sep 2018 11:12:17 -0700
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com,
        sboyd@kernel.org, mazziesaccount@gmail.com,
        heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/7] regulator/mfd: Support ROHM BD71847 power
 management IC
Message-ID: <20180921181217.GI20825@sirena.org.uk>
References: <cover.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
 <3996792a07fea45d94d4d712ed05527199cc4ac0.1536912922.git.matti.vaittinen@fi.rohmeurope.com>
 <20180921172959.GG20825@sirena.org.uk>
 <20180921180241.GA4358@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="byLs0wutDcxFdwtm"
In-Reply-To: <20180921180241.GA4358@dell>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--byLs0wutDcxFdwtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 21, 2018 at 11:02:41AM -0700, Lee Jones wrote:
> On Fri, 21 Sep 2018, Mark Brown wrote:

> > This looks OK to me - Lee, the patch is almost entirely a regulator one,
> > are you OK with me applying it?

> The diff in rohm-bd718x7.h does not look significant.

> You can apply it so long as you provide me with a PR in order to avoid
> any potential merge conflicts.  Especially as Linus is out for this
> release.

Great, thanks.  There's also the MFD DT bindings and another patch later
on with Acked-for-MFD tags on them, should I convert the tags to acks,
apply those as well and include them in the pull request?

--byLs0wutDcxFdwtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlulNH4ACgkQJNaLcl1U
h9DfCwf/QRitJXFwyEvF50vNqxKDcwssX4NjRuVep4MnngUEVqS0EglOeKChgTVe
wMCqzduSR6k4t91hxuSSgm/p7PuXDFEDnr2fnhHGWyY1Jsw2AAPDpja67xPguNAx
6DeBbNlkbKTM8qVoEHYLjm57eZKO9VwH2Y3RJt8xRh3occL+XYVuZRb6U2XpErfr
P/iH1uHitrBdZMBx5datBKNlTe7Gi1ETpLq1viJ0b2hT+7XgOZy9MZikIzSU9Zgo
+s2sFVJZIurlgyZjD5PpciXsvMZPxWIDBVrnDZ0HVYqQhtot1Dts3XVlHZ3ZhMgz
/VXk2Emz8TkLq3RMLSqlEtOXsHwHsg==
=uNGQ
-----END PGP SIGNATURE-----

--byLs0wutDcxFdwtm--
