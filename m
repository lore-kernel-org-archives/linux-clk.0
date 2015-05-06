Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Wed, 6 May 2015 13:33:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Alexandre Courbot <gnurou@gmail.com>, linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 0/8] clk: Minor cleanups
Message-ID: <20150506113354.GA9421@ulmo>
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
In-Reply-To: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2015 at 01:46:15PM +0900, Krzysztof Kozlowski wrote:
[...]
>   clk: tegra: Fix inconsistent indenting
>   clk: tegra: Fix duplicate const for parent names

I've squashed these into the patches that add the EMC driver.

Thanks,
Thierry

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSfwfAAoJEN0jrNd/PrOhVSwQAJ/rA3S2D6xMynluMc5UstEk
UZ72ZR6v0z5S9VzLenuIhtSsuk7oVJbTmDgMvf8XAbbOWtbGHJQn6ZmR3Me6GG+x
zzIGolMjNHrBRK9MOdni1ryv3/F81BE7QZrGHvnMpeXRbDerQJz3C+PUlcZ1nsu6
6hGfCl6+QCVT82nX3oj3qEdQScMMbiG37VTTluW63wQY3qaSZARouMLou1/MY+ln
4GUa09KVJdiAlASQ6llRQVAPVas1WGX2OCmhNeqhk8ERQVJj1orjxl4rOyTVux14
PvHHdfJrTA1w8WxzrLKjvUCm1aJgc5sNTQqZV9TcA0ktdjMtjkFaWAFS70J9oWrG
/bk+CbeJtEDWhTOIvclVlbwQ0kyZtFexSZgc1uICHB3PABb2LdZ3HDHrZs3KskCD
7FrUSakBBB5c9USKnaBDmBxuRW5ORDHQfPlrAB46Ye6SBB2GvgsW/S9JxVDRioqX
BB83VnMMxSxPyGCqgmvAkAV06wHMy3RwVs+OMi8FqhQwb7f+QTo/ERxwTBbtk/WC
SRJaopAR/sz6igINaL1Nx21Z/kju4xMjCZraLcII4p3CJvT6YtT9Q78xWJGGribj
U6bHROgmnJxNnb9PTq/nYL4j4GeOfr6+sbp/If0v4WkS7BBtQAxXHXLgVbmPR1Un
IO7lmnPDceWy7YJedk4F
=LSUk
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
