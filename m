Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350323D0AD;
	Fri, 13 Sep 2024 15:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726240028; cv=none; b=eHsK++eF4Dd1evKyxeiKSdhs/lsuW3hW1jYqbPqcPXTqExrL3B68c3BbY+wEB9LJvHNdI1Xrs7JACB9JQ/O3nt2YN5UddL0SAIAUiwx/LiSlH6qZT6TcPKyHjCjx+I1d6f+LIU4DUSAoRY98r2qyOhnv1z58+qwsNuBLcsZcG5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726240028; c=relaxed/simple;
	bh=fdxr/+NcgOFEgpqvCcM0x/YMCOOjci/kaxB4FgoVlE8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FSm2bhwe/Dz37ijw7x6tFdy10xqPNXdvzAAG7WXEFtH5qdFmxiZLPXkPR9ER78nkrvSrkGHd/jt5QVvq2FEEGZNdX4yPUi3n9c3E4GFngI1XKTNXxQsopc/vlTSTlPumK6s169nzHa/syp+kxQcAHFrMpILJBOVCoNcNVu0i7lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mxF669fu; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mxF669fu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92C76E0007;
	Fri, 13 Sep 2024 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726240023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7hFep7FBNfQJPEegIvZJdJrOuXZLo3lloLOnAxbR2ug=;
	b=mxF669fuWKi5zWdc5tmGKBir+QS06sn6tr3K048hhE/psQQ0xgLHRjn7ImztcGQvKWp9aZ
	ER7uXeRy0a4QPPfiy5TukSfzd+Flr5J+DDwtQv7zWj2Ol3zs9Hnhcjn1Y4W0K6lSxDfx7u
	/OAbMZAsFdPWQrvbe/5vUYX2P7pIELgFKzj/VlgbmNX4mEQdTLO5GMguKf/bCfSlDFyhMF
	N+nIPS2IW7vQEP17SREY7AxM6+cxw5HrLRAFzh0raMuljH0JTYM+TiL0WhbxTH5n6Ne9Pf
	FlAic1nCNFS/z11Hv68FPfM6sk4BuFea/r1hhO+r/YVzGrRT8CoGhrw9epNqfg==
Date: Fri, 13 Sep 2024 17:07:01 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Sean Anderson <sean.anderson@seco.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marek.vasut@gmail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-reneas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
Message-ID: <20240913170701.156d8e82@booty>
In-Reply-To: <CAL_JsqKj6A=GvgaZCd9jiF71YPGuQSKJ9Ob6erHT45q8vRR13w@mail.gmail.com>
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
	<5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com>
	<20230124091236.1bf8c6da@booty>
	<CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com>
	<232f59aa-704b-a374-6a78-469156ccdbea@seco.com>
	<83f4f33ebd3706ec7d35acd807b1e44b.sboyd@kernel.org>
	<20230322093918.33690db3@booty>
	<CAL_JsqKj6A=GvgaZCd9jiF71YPGuQSKJ9Ob6erHT45q8vRR13w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Sean, Geert,

On Tue, 10 Sep 2024 17:13:55 -0500
Rob Herring <robh+dt@kernel.org> wrote:

> On Wed, Mar 22, 2023 at 3:39=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
> >
> > Hello Stephen,
> >
> > On Mon, 20 Mar 2023 14:27:56 -0700
> > Stephen Boyd <sboyd@kernel.org> wrote:
> > =20
> > > Quoting Sean Anderson (2023-01-24 08:23:45) =20
> > > > On 1/24/23 03:28, Geert Uytterhoeven wrote: =20
> > > > > Hi Luca,
> > > > >
> > > > > On Tue, Jan 24, 2023 at 9:12 AM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote: =20
> > > > >> On Thu, 19 Jan 2023 14:27:43 -0500
> > > > >> Sean Anderson <sean.anderson@seco.com> wrote: =20
> > > > >> > On 1/11/23 10:55, Geert Uytterhoeven wrote: =20
> > > > > =20
> > > > >> I'm wondering whether Geert has a practical example of a situati=
on
> > > > >> where it is better to have these properties optional. =20
> > > > >
> > > > > My issue was that these properties were introduced long after the
> > > > > initial bindings, hence pre-existing DTS does not have them.
> > > > > Yes, we can add them, but then we have to read out the OTP-progra=
mmed
> > > > > settings first. If that's the way to go, I can look into that, th=
ough... =20
> > > >
> > > > FWIW I think there's no need to update existing bindings which don't
> > > > have this property. The required aspect is mainly a reminder for new
> > > > device trees.
> > > > =20
> > >
> > > Is there any resolution on this thread? I'm dropping this patch from =
my
> > > queue. =20
> >
> > IIRC Geert kind of accepted the idea that these properties should stay
> > required. Which is a bit annoying but it's the safest option, so unless
> > there are new complaints with solid use cases for making them optionalm,
> > I think it's OK to drop the patch. =20
>=20
> The warnings related to this are now at the top of the list (by number
> of occurrences):
>=20
>      50 clock-generator@6a: 'idt,shutdown' is a required property
>      50 clock-generator@6a: 'idt,output-enable-active' is a required prop=
erty
>=20
> IMO, if these properties haven't been needed for years, then they
> obviously aren't really required.

I think Rob's point adds to Geert's observation that there are other
"idt,*" properties in the output nodes that may also be important to
have correctly set, and are optional.

So, Sean, I understand when you state it's safer to have these set.
However this is valid for lots of other optional properties in any
binding. Optional properties _can_ be set if that's important, just
it's not mandatory to set them in all cases.

As a matter of fact, we have been having for a long time some in-tree
device trees which don't set these properties, which I believe implies
it's OK for those cases to not set them, and to let them be set for the
device trees where it is important.

Finally, there is a maintenance/legacy issue: if we wanted to keep these
properties optional, who would chase all the boards defined in existing
device trees to discover the correct values?

Bottom line, my Reviewed-by tag is still valid.

What is your opinion given these last few discussion point Sean?

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
