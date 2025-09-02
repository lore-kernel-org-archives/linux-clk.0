Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B764D2AF1B;
	Tue,  2 Sep 2025 06:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756795795; cv=none; b=F4W2qduvkPVvxwUuwtJQeo3pZCRITZUvwCpdvWPWcsarxF8As1wxaTA5buXpp+NkMaMr4NY1KnDakun6ZX6zGCa/VlLmzAKgn8H1sDVOKqfMnrYuL6SpfskPBf5up4I6E88Xrs+Sxtor0K2VEgl6KkSAkOwqQa4z2ZBY57mlNc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756795795; c=relaxed/simple;
	bh=CXjRLXB4rHcdrzMNHUS/e7hmZlrGT0FCxSbC/ubzzhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wmc7WzMwEROXZgxTrqgOwivP8gBrvJadsucYJnF4MhdkIyPhblZHDVi3fHTnLl1RugAQzYiEBd5YB1Uo4tnoVn0o+oC795g/uTTn5BZMMDW4rfZCdE2rIJnQO5TkYDwidusUpWEsAhaW4AEYXmo/H/2KI2A0jEnXkYo7f4DJKTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cjdiXPnW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cjdiXPnW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=L3hysh1IuHC3Dp9XzTNJn7TLfYrR5FrB1YWba0t3M3k=; b=cjdiXPnWzvSvRuv8Q6fPuIwF/4
	sHkk1gs59SSS6D16goSAnv08ppr71gIlpiKtrGwjWSvhv/ZyOouGVsLmf/Y429du9uAXmv4M0fI6m
	3MGd0rZ+b1Ov/laSJ9w6G6KiRBdYw0EY9D+m8gLKaNAmsu7ZVCx4rTzWsZUT9tg5QP3vjCPShjeVM
	yjDna1BAzyPmkD7XPvRdHZJbHHl/nR2PPOubn74Tcg9ShSIoAb5F4xv6GPHW+CcBaXkr++nwz/IyV
	FYAFPYqj9qz8406lYoZvNonf6I4XZKG8SUeRI1mjUFsr+hYGhtOlCSJbmM0HHuS3kLH+pIXpjwEgE
	r7DFLeNg==;
Received: from [61.8.145.255] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1utKpf-0003Qz-Ke; Tue, 02 Sep 2025 08:49:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Date: Tue, 02 Sep 2025 08:49:29 +0200
Message-ID: <5052759.PIDvDuAF1L@phil>
In-Reply-To:
 <CAPEOAkQYA+XSx9QJSmNFLypH0ifE1jvui=MHiEHZ+5a3SR7=uA@mail.gmail.com>
References:
 <20250831104855.45883-1-cn.liweihao@gmail.com> <2235041.irdbgypaU6@diego>
 <CAPEOAkQYA+XSx9QJSmNFLypH0ifE1jvui=MHiEHZ+5a3SR7=uA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Montag, 1. September 2025, 02:17:00 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb =E6=9D=8E=E7=BB=B4=E8=B1=AA:
> I actually used script to get the maintainer list, but I was not sure
> whether I should send-to or cc every maintainer, so I consulted the
> AI, and the AI said to try not to do so because it might be considered
> noise email, and only send it to the main maintainers.

please don't top-post :-)
https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interle=
aved-replies-in-email-discussions


> Should I cc all the devicetree maintainers with the next patches?

Looks like we did get an Ack still with even only one maintainer listed,
so don't need a resend ... but yeah, please include people listed as
direct maintainers in the future.

Workflows differ, so when submitting a patch you can't know if maintainers
work from patchwork or directly from their inbox.

So it's safer to include more people than not enough :-)

Some trimming of the list can be done though, for example your drm patches
would list the core drm maintainers who most likely do not really care
about individual driver patches ;-) .

get_maintainers.pl thankfully does list the role, so you can decide based
on that.


Heiko


> Best regards,
> WeiHao
>=20
> Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=
=E6=97=A5=E5=91=A8=E6=97=A5 23:00=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> > Am Sonntag, 31. August 2025, 12:48:51 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb WeiHao Li:
> > > Add a clock id for mipi dsi reference clock, mipi dsi node used it.
> > >
> > > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> >
> > you missed a number of devicetree maintainers, Rob thankfully does
> > not need to do this on his own anymore.
> >
> > so please get the appropriate list of maintainers via scripts/get_maint=
ainer.pl
> >
> > Change itself looks fine though.
> >
> > Heiko
> >
> > > ---
> > >  include/dt-bindings/clock/rk3368-cru.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bind=
ings/clock/rk3368-cru.h
> > > index ebae3cbf8..b951e2906 100644
> > > --- a/include/dt-bindings/clock/rk3368-cru.h
> > > +++ b/include/dt-bindings/clock/rk3368-cru.h
> > > @@ -72,6 +72,7 @@
> > >  #define SCLK_SFC             126
> > >  #define SCLK_MAC             127
> > >  #define SCLK_MACREF_OUT              128
> > > +#define SCLK_MIPIDSI_24M     129
> > >  #define SCLK_TIMER10         133
> > >  #define SCLK_TIMER11         134
> > >  #define SCLK_TIMER12         135
> > >
> >
> >
> >
> >
>=20




