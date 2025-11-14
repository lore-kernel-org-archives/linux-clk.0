Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7051F2580D7;
	Fri, 14 Nov 2025 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104097; cv=pass; b=teZQrOI/iGAOh0KFccz8jjY3wxixPCiYY/iXkxUcjpprtdvW6rS5Q9soBYM5dbczFuWkaDc4oTbMNPa+Ex27e6yqX3OKM5gouaMgSvW4X/YljjDJPfHePTCJ0fWMbLhuMGzz4D1Cx7VXwDVIAluvmPQFyyGMj3cokL80W+88f5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104097; c=relaxed/simple;
	bh=iC+mgltNwb/6TnBtEL9kwPSjqaqHA5+5TY9cLqiISLU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CmbDbjxz4jCiyDT0LSsQxQJ8+WHAHbdfojD36uE1Fj0ynF91YLU2TVLXg4Tcuwx/pc0KlfZUEYiDMDP1SYZoQeWA7DGImOvX/i3Unftjon0+qKSFhrhikMW6SEwaGeVUEeHo1UvpfGI1WLzMNM8ekj49x4zfCXnmifFAm58qhsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=Yd6vZtKP; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Yd6vZtKP"
ARC-Seal: i=1; a=rsa-sha256; t=1763104032; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jk8AIvOvE/8LILOk2DAILmhafD1+Kg+0XgQZHPcvLjJXSs3Qx5wAXkzN5cm/OxTZ51kk7c6QgLrcFAGR355r+9xNXVNZGIu6GDQVIA47uKMXSlZKpaZhKMbG/skxbQxmTi+2HJww9siVp6dDOOeh9j8biyYC5chBoMAyIPdjZ6k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763104032; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iC+mgltNwb/6TnBtEL9kwPSjqaqHA5+5TY9cLqiISLU=; 
	b=SMLZwHprsnx3D00elMkDAh13b+oJs8sHl8Sm9UQlfTbjAYanSRGYNDvHwmvIar8Xa2ELh6OZExv8bnPxCVP/6IwacTlLs4UK7BQU36CdBlIc4xsUH0clvzNVfXIdd896rin/1aX4hZYouTbL9x13nknClax0wwN6HugVdoTvRcQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763104032;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=iC+mgltNwb/6TnBtEL9kwPSjqaqHA5+5TY9cLqiISLU=;
	b=Yd6vZtKPbUx5vWV+zNJtZtt5NR9BWsRdyN8Gw4lNM4SwZ6FAE6/Rk7VRnLKUT/v6
	sELB7aNzp5H8Z2YbspkYpXkuvsQF0W+fkXmB0JYpIRUgf+qRhxpew29OIpCi3HhxdkX
	29DoCJAuPPZrDkrzlUJ9d7fQ4kMo5WOC+XUgfn6jPLk1o0EFKcak8CiZg4N8uL8jPRE
	K+UK2V5lb5YkC2rdGSGEOYgfgsOMvc/j8YCVjYgN7Cddi7uua0UDXan8YvpIHlX9J7w
	ctZax5B1yJ9tck3DyVIfWhhgYo9KBtNBD1JKLOTnYrE47mZreU0zMzkvSRqIkpFDLQ6
	74JW1oXADQ==
Received: by mx.zohomail.com with SMTPS id 1763104029433118.5268080863134;
	Thu, 13 Nov 2025 23:07:09 -0800 (PST)
Message-ID: <0109a90fc464e3cc63dd6c11e699db0143906256.camel@icenowy.me>
Subject: Re: [PATCH RFC 01/13] dt-bindings: soc: starfive: Add
 vout-subsystem IP block
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>,
  Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Maud Spierings <maudspierings@gocontroll.com>, 
 Andy Yan <andyshrk@163.com>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  linux-riscv@lists.infradead.org
Date: Fri, 14 Nov 2025 15:06:55 +0800
In-Reply-To: <20251113-irritable-unfold-da619d52026c@spud>
References: <20251108-jh7110-clean-send-v1-0-06bf43bb76b1@samsung.com>
	 <CGME20251108010453eucas1p2403ec0dd2c69ae7f3eabe19cf686f345@eucas1p2.samsung.com>
	 <20251108-jh7110-clean-send-v1-1-06bf43bb76b1@samsung.com>
	 <20251111-massager-twistable-1e88f03d82f8@spud>
	 <20251111-unsaid-rockslide-67b88b2e34bd@spud>
	 <0d8e3a626b037dd348378e5ebca8005c1e715871.camel@icenowy.me>
	 <20251112-skating-robust-81be8dee0a8b@spud>
	 <1d54524d7ef939232b4512ca59c78794484103ca.camel@icenowy.me>
	 <20251113-irritable-unfold-da619d52026c@spud>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2025-11-13=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 19:44 +0000=EF=BC=
=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Nov 13, 2025 at 08:48:33AM +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2025-11-12=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 18:36 +0000=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > > On Wed, Nov 12, 2025 at 02:34:39PM +0800, Icenowy Zheng wrote:
> > > > =E5=9C=A8 2025-11-11=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 18:36 +000=
0=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > > > > On Tue, Nov 11, 2025 at 06:18:16PM +0000, Conor Dooley wrote:
> > > > > > On Sat, Nov 08, 2025 at 02:04:35AM +0100, Michal Wilczynski
> > > > > > wrote:
> > > > > > > Add the dt-binding documentation for the StarFive JH7110
> > > > > > > Video
> > >=20
> > > > > > > +patternProperties:
> > > > > > > +=C2=A0 "^display@[0-9a-f]+$":
> > > > > >=20
> > > > > > Personally I'd like to see these being regular properties,
> > > > > > since
> > > > > > there's
> > > > > > exactly one possible setup for this.
> > > > > >=20
> > > > > > > +=C2=A0=C2=A0=C2=A0 type: object
> > > > > > > +=C2=A0=C2=A0=C2=A0 description: Verisilicon DC8200 Display C=
ontroller
> > > > > > > node.
> > > > > >=20
> > > > > > Can you add the relevant references here instead of
> > > > > > allowing
> > > > > > any
> > > > > > object?
> > > > >=20
> > > > > I don't think that if you did, this would pass the binding
> > > > > checks,
> > > > > because there's no "verisilicon,dc" binding. I think I saw
> > > > > one in
> > > > > progress, but without the soc-specific compatible that I am
> > > > > going
> > > > > to
> > > > > require here - if for no reason other than making sure that
> > > > > the
> > > > > clocks
> > > > > etc are provided correctly for this device.
> > > >=20
> > > > Well I didn't specify any soc-specific compatible because that
> > > > IP
> > > > has
> > > > its own identification registers.
> > >=20
> > > I still require one because I want to make sure that clocks etc
> > > are
> > > handled correctly. You can ignore it in the driver if you wish,
> > > but
> > > when
> > > the next user comes along with one more or less clock, I want the
> > > jh7110 one to be forced to use the correct configuration.
> >=20
> > I don't think for those generic IPs requiring a SoC-specific
> > compatible
> > is a good idea.
>=20
> I disagree. If things are complex enough to end up with different
> numbers of clocks or power-domains etc on different platforms (which
> I
> believe GPUs are) then I want one for validation purposes on
> platforms I
> care about. What you do in the driver is up to you.

Well I think Vivante GPUs do have such case -- a "shader" clock that is
only present when 3D support is here. But that binding still contains
only "vivante,gc" and the maintainer of etnaviv rejects extra
compatible strings.

In addition, as the addition of SoC-specific compatible string and the
real DT are usually written by the same person at the same time, I
don't think this introduces any more validation (because when the
author gets things wrong they will just make it wrong at the two
places).
