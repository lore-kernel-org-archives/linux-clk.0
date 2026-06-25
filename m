Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757723D091F;
	Thu, 25 Jun 2026 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382950; cv=none; b=C7YXWuqVQZTIFKrlzUaHIRWvPCkgtf0U+WQccvYF3klbhqjZoJP0Vq9ymFJi6qWx47FDpg0k00fJOMbEvxGXHLNJT8vuQ/uSFCqVjqyNTnIFVwYmL6iacgJNxQ1KpE5syQbjIUYjMlPh+LZ8AneoMY286X/pwyZtQHH/xjKWbmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382950; c=relaxed/simple;
	bh=Zgb8jOr/HEc4Ur1Vi859ZvSPUmk+MCKTF/b3Mnfnwwc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZAkeRs6Ymjad3vepwq+eAQSMHpj1H/mbezc7p7rCiTSwcj6FSt8SeV/1rF34aNQTua2sj9hIPGAcDxKsYwQ8o0wS++mozz8zAhYvTxPqtSNDsM7uZVpUf3TRD0MfXoPAGRkYfze4+cymFtGOQcuwn2XxxXZnaSrNH13Ey2yJolA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B42EA2006B1;
	Thu, 25 Jun 2026 12:22:18 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wchDu-004Zgc-25;
	Thu, 25 Jun 2026 12:22:18 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wchDu-000000006AZ-2JJx;
	Thu, 25 Jun 2026 12:22:18 +0200
Message-ID: <36c8a3db6038db4973b6cd80c554339f5b71d32c.camel@pengutronix.de>
Subject: Re: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset
 controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yu-Chun Lin =?UTF-8?Q?=5B=E6=9E=97=E7=A5=90=E5=90=9B=5D?=	
 <eleanor.lin@realtek.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>,  "sboyd@kernel.org"	 <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"	
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Edgar
 Lee =?UTF-8?Q?=5B=E6=9D=8E=E6=89=BF=E8=AB=AD=5D?=	 <cylee12@realtek.com>,
 "afaerber@suse.com" <afaerber@suse.com>, Jyan Chou
 =?UTF-8?Q?=5B=E5=91=A8=E8=8A=B7=E5=AE=89=5D?=	 <jyanchou@realtek.com>,
 "bmasney@redhat.com" <bmasney@redhat.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, 
 "linux-realtek-soc@lists.infradead.org"
	 <linux-realtek-soc@lists.infradead.org>, James Tai
 =?UTF-8?Q?=5B=E6=88=B4=E5=BF=97=E5=B3=B0=5D?=
	 <james.tai@realtek.com>, 
 =?UTF-8?Q?CY=5FHuang=5B=E9=BB=83=E9=89=A6=E6=99=8F=5D?=
	 <cy.huang@realtek.com>, Stanley
 =?UTF-8?Q?Chang=5B=E6=98=8C=E8=82=B2=E5=BE=B7=5D?=
	 <stanley_chang@realtek.com>
Date: Thu, 25 Jun 2026 12:22:18 +0200
In-Reply-To: <f3b747e20110424c8a434cbd271edb87@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
		 <20260624112940.3475605-5-eleanor.lin@realtek.com>
	 <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
	 <f3b747e20110424c8a434cbd271edb87@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Do, 2026-06-25 at 10:05 +0000, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=9B]=
 wrote:
> Hi Philipp,
>=20
> > On Mi, 2026-06-24 at 19:29 +0800, Yu-Chun Lin wrote:
> > > From: Cheng-Yu Lee <cylee12@realtek.com>
> > >=20
> > > Add support for the ISO (Isolation) domain reset controller on the
> > > Realtek
> > > RTD1625 SoC.
> > >=20
> > > The reset controller shares the same register space with the ISO cloc=
k
> > > controller. To handle this shared register space, the reset driver is
> > > implemented as an auxiliary driver. It will be instantiated and probe=
d
> > > via the auxiliary bus by the RTD1625-ISO clock controller driver.
> > >=20
> > > Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> > > Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > > ---
> > > Changes in v9:
> > > - Extract reset-related code from the previous clock driver patch
> > > (formerly patch 9 in v8).
> > > ---
> > >  drivers/reset/realtek/Makefile            |  2 +-
> > >  drivers/reset/realtek/reset-rtd1625-iso.c | 99
> > > +++++++++++++++++++++++
> > >  2 files changed, 100 insertions(+), 1 deletion(-)  create mode 10064=
4
> > > drivers/reset/realtek/reset-rtd1625-iso.c
> > >=20
> > > diff --git a/drivers/reset/realtek/Makefile
> > > b/drivers/reset/realtek/Makefile index c3f605ffb11c..9007c9d5683b
> > > 100644
> > > --- a/drivers/reset/realtek/Makefile
> > > +++ b/drivers/reset/realtek/Makefile
> > > @@ -1,3 +1,3 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >  obj-$(CONFIG_RESET_RTK_COMMON) +=3D reset-rtk-common.o
> > > -obj-$(CONFIG_RESET_RTD1625) +=3D reset-rtd1625-crt.o
> > > +obj-$(CONFIG_RESET_RTD1625) +=3D reset-rtd1625-crt.o
> > > +reset-rtd1625-iso.o
> >=20
> > Is there any benefit to these two being separate modules?
> > I suggest you merge them into one: reset-rtd1625.o
> >=20
>=20
> If I merge them into a single 'reset-rtd1625' module,
> both the 'crt' and 'iso' clock drivers would trigger the probe
> process for the same reset driver name, which would lead to a
> duplicate driver registration error.

What do you mean by duplicate driver registration error?

There would only be one auxiliary_driver, with support for all three
auxiliary_device_id's.


regards
Philipp
