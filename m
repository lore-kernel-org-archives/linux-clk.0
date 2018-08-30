Return-Path: <phil.edworthy@renesas.com>
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 1/2] clk: Add of_clk_get_by_name_optional() function
Date: Thu, 30 Aug 2018 08:30:59 +0000
Message-ID: 
 <TY1PR01MB176960BEDC23EA64095EF6F2F5080@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1533039060-18779-1-git-send-email-phil.edworthy@renesas.com>
 <1533039060-18779-2-git-send-email-phil.edworthy@renesas.com>
 <20180829171039.GD11447@smile.fi.intel.com>
In-Reply-To: <20180829171039.GD11447@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Andy,

On 29 August 2018 18:11 Andy Shevchenko wrote:
> On Tue, Jul 31, 2018 at 01:10:59PM +0100, Phil Edworthy wrote:
> > Quite a few drivers get an optional clock, e.g. a clock required
> > to access peripheral's registers that is always enabled on some
> > devices.
> >
> > This function behaves the same as of_clk_get_by_name() except that
> > it will return NULL instead of -ENOENT.
>=20
> > +		if (optional && (index =3D=3D -EINVAL || index =3D=3D -ENODATA ||
> > +		    PTR_ERR(clk) =3D=3D -ENOENT)) {
>=20
> A nit: I would rather rearrange this to be
>=20
> if (optional &&
>     (... || ... || ...)) {
>=20
> (disregard 80 characters limit for second line)

Thanks for the review. I'm not particularly happy with the patch as is, it'=
s
pretty messy. I was in rush trying to get things done before holidays - alw=
ays
a mistake.
Would you mind if I sent a v5 that I feel is somewhat clearer?

Thanks
Phil
