Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Fri, 3 Jun 2016 18:54:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lin Huang <hl@rock-chips.com>
Cc: heiko@sntech.de, mark.yao@rock-chips.com, myungjoo.ham@samsung.com,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, airlied@linux.ie,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kyungmin.park@samsung.com, dianders@chromium.org,
	dbasehore@chromium.org, huangtao@rock-chips.com, typ@rock-chips.com
Subject: Re: [RFC PATCH v1 4/6] PM / devfreq: event: support rockchip dfi
 controller
Message-ID: <20160603165426.GC21013@ulmo.ba.sec>
References: <1464947719-6245-1-git-send-email-hl@rock-chips.com>
 <1464947719-6245-5-git-send-email-hl@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
In-Reply-To: <1464947719-6245-5-git-send-email-hl@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 03, 2016 at 05:55:17PM +0800, Lin Huang wrote:
[...]
> +	ret = clk_prepare_enable(data->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to enable clk: %d\n", ret);
> +		clk_disable_unprepare(data->clk);
> +		return ret;
> +	}

This is going to give you a large WARN. clk_prepare_enable() already
leaves the clock in a proper state when it fails (i.e. it calls
clk_unprepare() if the clk_enable() part failed), so calling
clk_disable_unprepare() upon failure is going to unbalance the
reference counts.

Thierry

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXUbZAAAoJEN0jrNd/PrOhAhIP/RY+DaI46Gf5oh6uxf4dw7+3
5aXkSzzNwXZesOYWpUovhm3+fVCH1jASEvkShtUZ+WkayGDqqxSbOCvnr6uEJcv/
3UWIzvsdtCa4SNRevpFH/kgU8ctVjKu14wEVVurmjfPbjIgmlTvdLqXZkaZTcx3V
bFg8yhalEPds798whFjMmcCGSmLinNy3EhRU5ZFhxanny2VWMM3FT4G1JGGANE7X
Z1UjW/ySjTtwZzuyVeIa5hpuYVg3aspmrJCpwKyFdVQjo6x4aO3CexniKj1dYF54
0wyvUa236sQRgOLGi1jHYiTasoahPkVayoH9dwmS+iWIEaiSU7xJMSwClEYvudKp
6QlNJ7UaLIYQk6kOHiHA5fBlmeIrvBBz4ROpsry7kGBYEhVH41+iLH2w4a3Hn/lv
07a3JYeoRanotZ8ghp8/EfeAVOniwELw+QBNkVygRDw7iDjzxpFfbclYOojI5EkD
QHdpVde49HJi4xF46vqYXhcCe5IxKJN7uBiUCvZyiv5/L/u/5EpidATAWT8MHJJG
e0qdIm0dfw81/qHu1w13KUcOMH6ZGSpnmc8jzwmTWKhP7f3r5Y2SLKYXfZEWrlSF
R71w73nTM/ROmQGEnQW+16woYed/cvpwhGaCuxWFR+RaIdkqPJ0Sy9Z5uwb3EiMg
b9UFGXJ4VidTdIDPRF2y
=3fNt
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
