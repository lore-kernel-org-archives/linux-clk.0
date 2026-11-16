Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824643;
	b=objhj2N2uYK2Q5fO9nttZ2cFMDzsv4SD3/omVE+nspAmvVo1bGLnfATIp8+mWooAE2gq
	 SkWaQGdboDDu/SSacQEc7y03CUuZUnMW8rD2scm4MeMXDVXoC+ZmOdsOKixB+JfUkQA9a
	 2C94bwgVA9lPwP6wI3PYQMzliqyUy4rajrj+boK9nad5a7B1KN9gb4CBh8DA5otxesM6t
	 rr3CwFOr2XmJ59Ir9ocO1cNMOeLqCA8MqY7jzeBvPT9BgqPMjVB2SubyAVxhnIA6EQVjz
	 JvKms3sTJb3oeVkLOoL4svvncrCCTDKLkk9GvFS1xWiA+O5hAs2Zo8XF6s6MP3+Wljw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
	b=uKcgjJR83C8ihUX9sZfeLusWfWIQ4kx1gnRPwxVaTH5xZcbBWIltIw98xecElzZUlDXX
	 GQtntA9V04lfoS60xiDQOHJzglCrXr7R9V6HqwO0hcu6K7q993Oq/ebV2rZ4l3wv+rejl
	 hp3Ehx8hplfm3+yRKVoBecniSoaMhHQOZMz5wtjCSu53bPNmcgM4T+d210Mcvn6f+80p6
	 jIdMvmeuSiGL4nX4Eoe8mbKB8/VGDdGDglKhCHgYgrS/b65vCk/cYU8LaOLhs+BVCJ1YZ
	 Z9iK9hosCvNH5n4o1aS6YV/shN87A1gJhhosulBQrnp2XG2Oj4+ktTmN9KvSeguJAJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX435Zha;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82257606A330
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 10:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82257606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX435Zha
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so9323952eec.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 02:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824642; cv=none;
        d=google.com; s=arc-20260327;
        b=Mgz29eDs7qCHaSfCQE4/7tBVKVRcDsOaYSviyQFf/U2QDTG5W98261BU2cSJ+3UF7H
         nMRxgcYscRM37Hhm1iccv6DUUBULM3FDZaCudpLaBOiPPdtCWr1kgTXwNWL6yE5QHbmV
         aL3RLv6+DNerJpjqKePaSFazRlWoNO5zRpZbU+GCfDvcC6rmMN8ZGN080yLx6ToeyCm5
         RnWzscZQihP9rKxwKNzw0rRjSQq9zsTKWW/WMDBPxrAdxF5m/2zgixKhydn+fvGVhfY+
         3INp/GS5FBiZa6gHYG0xCZmqqvcGnwt5pfrrFmlnUEQM0NP0Dgal03I5praVwfmfYcMr
         PVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        fh=oZSnDyJFToFSz5KzLkHZLfkSNTIOx1XSH7G5O56Ql7k=;
        b=N0RFln1JSVTv/9Wo8tjdMjG5ReFMRCnxHaMZWTdWjzyQk2yYSDG0QrhinZI9LFrao9
         DQKrOLKs0nRNIv+BJZZG/bBxZsMvDP1RlCY1NTP333iQ70KzNqh/QeeLknUJe1fl05AD
         X18XoOyLoF5nfv6V92xZIuAlEt5uyVpRwjjdA4O4THSZyaABPz65BejBBntvQpY8O5lP
         hUo/2M0grCg2Tgg/Eafu2CysbYwfgQf8jR9vv3wHxk5Gp45XAetWnF1raEMqwBPoOi9M
         XVxc9XO//HsH5MRtyqqYIdMGkRKiXXMNDTNcfNWXvf6qyiP7ETt1O7jphcFzzVz/NztN
         R2IQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824642; x=1795429442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        b=ZX435ZhasskBrHhsjUgMP8cj896c1igrqorRzLaGT99+Rk0Gxy0oLjQgxiD+VMpKvH
         D4U/tJpsIbzYFrDIoGSW3/RDIYkG+0LbH1+2de59HTrHz6bH8aGzM0nu9Ry7YWcuqrQX
         jjFe3WyoteY5ZsEsJQclpDK/18FEkpjdJ/PgBADOljyIGLYUou7waKJYgwxlHtzQLAQQ
         gaOQMidMuDB/sBsRSiJN5PrLFAYv8GN9IL3MJGgEP+PWSlUy0COJMLIsK27tZtPdkOOQ
         aU2ELLzPlC+ajDK/grAFwSF0Bwf/yHKHGmDd4g5/1GIh/bDbZl2gpu9Jv9a4O3g8+sYV
         Gv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824642; x=1795429442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        b=uVFA1bp4PUPsVn1If6UF/09n1GXwr6zZeWA7VPSo+IFFzAHxLAZPmvcC/ix9U1+4jk
         ySsGdUbvA2k0UlDo8rTXuq3boLJC/oKOOJwSCKZH63lbDtvsUpMhemaWnXRf3IPocii3
         o6mTgmXT3OzEbcHIK4hRDSvBHd/rcnyMZwP598yOLyp85GyP9JIHN9O66nA+1Xb5x8Pt
         8LaGb3p2dHF9kXMcXrQ5nRQaPNFiNBAIp5keDr0+uJRLSG10fYM7S/ZiKUstrw387zxC
         QkXyIxMEFJQzFlZgwRVVj+qWBQTJfKOBfNQzAxqKqYht92OPQ3Nh4XE7dU9yoAQ07Tmj
         0qqw==
X-Forwarded-Encrypted: i=1; AL+hErHaB3q1yk967VNOJF3fzz9+B2adJIQgJA95E53Eag92vyfJIclc/WdfNqrSAhkIzKgcPdGrMHWibNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ctPAYVwd/8mkmYwCCz7I+zd4Q6x6JECQ899Imp28s9mYD8uZk
	ORh2XW58pBiWmwG1l9iBfXozEwfXE5gkM5gf2mpH22ZTIANNlwq0naqS4n6Z1e/RczIIo3iY4dK
	WUqY0vlqZaftD+CxACU+Vp2rs/wXbqvA=
X-Gm-Gg: AYBFou2ZgFBKIs/t/L9ACZo8/Qv8LEfFwbuMGUrDbW6rT8U0au37j13l9HUgaR57qT9
	mvf74u8f6XKU4BRdZU1qCU7fwNwyvQThuh3PSojGmDu1inQN6W4gRs3PpflZUPvf5BiI84yO043
	5ezzRdbbdQe677h6k9QK2k7mWtGwKbxL0Z6jxve74NW/9yf3hb1FLmXdGFG4kF2G5swHt89DF2o
	HUf6TROI0RbnTftAUvjgcmIDKjPDMnn5FYf/Dog7/13kq7fKwnb3HWOQO6jRSgAvBqaWjIiO93K
	i7XOQOga0JdQ+CE4HeDK/T+GKzY93hpf4Pv7meMF8Dr1lMLZAtk7FPjhME0gxiv4h6ZLtV2XGbD
	a9/pQR2a2t9p212YQ3Cccs8mDfaHf5D2BKDLTX/nWxIY6sb/UkZ/5+G1R1CLfNG1ACqk/R180XI
	Ef+GZSwtWbMNnecnl5c+dCt+z5i0UZbg==
X-Received: by 2002:a05:7300:b0a5:b0:375:f846:5b50 with SMTP id
 5a478bee46e88-37967316379mr9974671eec.26.1794824641398; Mon, 16 Nov 2026
 02:24:01 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113145708.261530-1-clamor95@gmail.com> <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4> <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
 <179478265643.13037.17097457582246933781.b4-reply@b4> <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
 <179482363653.13037.14387881069650442772.b4-reply@b4>
In-Reply-To: <179482363653.13037.14387881069650442772.b4-reply@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Nov 2026 12:23:50 +0200
X-Gm-Features: Aa3M54omU2sMa-s9Lr8odEO1dEUj9Cu5RuZQ3PyJtArCZqRb5bI6Ga-XTy7PHCQ
Message-ID: <CAPVz0n2OamOweoLJLBvyt2KD+Zuino1ViYTFsSjL3mTA2V3F1Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:0=
7 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-11-16 10:43 +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
00:44 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > > > =D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 13:03 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that ar=
e required
> > > > > > for the correct work of the CSI block. Add CSI pad A and pad B =
clock gates
> > > > > > with PLLD/PLLD2 parents, respectively.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > > > >  1 file changed, 10 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/teg=
ra/clk-tegra114.c
> > > > > > index ec537efac692..08e425365469 100644
> > > > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_i=
nit(void __iomem *clk_base,
> > > > > >                                            0, 82, periph_clk_en=
b_refcnt);
> > > > > >       clks[TEGRA114_CLK_DSIB] =3D clk;
> > > > > >
> > > > > > +     /* csia_pad */
> > > > > > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_=
SET_RATE_PARENT,
> > > > > > +                             clk_base + PLLD_BASE, 26, 0, &pll=
_d_lock);
> > > > > > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > > > > > +
> > > > > > +     /* csib_pad */
> > > > > > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK=
_SET_RATE_PARENT,
> > > > > > +                             clk_base + PLLD2_BASE, 26, 0, &pl=
l_d2_lock);
> > > > > > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > > > > > +
> > > > >
> > > > > Change seems ok in itself, just a couple of things I'd like to ch=
eck with you.
> > > > >
> > > > > Seems both the CSI and DSI can use the PLL D and D2. Can they be =
used concurrently ?
> > > > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which th=
e
> > > > > DSI counter part does not have ?
> > > > >
> > > >
> > > > CSI pad clocks are used only by CSI and CSI does not change rate of
> > > > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > > > switched DSI clock parent while csi pad clocks do not touch clock
> > > > layout of CSI nor DSI.
> > >
> > > Ok but they end up possibly using the same PLL from what I can see he=
re.
> > >
> > > So if the consumer of csiX_pad calls clk_set_rate() on it, while the =
DSI
> > > is using it, it won't go well. The rate of the underlying PLL may cha=
nge
> > > since you have set CLK_SET_RATE_PARENT. Taken alone, there is no prob=
lem
> > > with this but can't CSI and DSI be active at the same time ?
> > >
> >
> > The clk_set_rate() call for csi pad and csi cil clocks for dynamic
> > adjustments is not possible. These clocks are used only by CSI block
> > and among 6 clocks CSI uses it can change clock rate only for its own
> > clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
> > design and are not touched by any other driver.
>
> This is not my point, and you are not really answering my question AFAICT=
.
>
> Right now you have 2 CSIs clock each linked to a PLL, with CLK_SET_RATE_P=
ARENT.
> So a call to clk_set_rate() may change the PLL rate.
>
> At the same time, I'm seeing 2 DSI clocks linked to the same PLL, without
> CLK_SET_RATE_PARENT, so those clock will use the PLL as it is.
>
> The difference in the model used is odd. If it needs to stay that way, it=
 requires
> an explanation. If adjustements "are not possible", then why set CLK_SET_=
RATE_PARENT ?
>
> If the PLL is fixed by design, then you should not set CLK_SET_RATE_PAREN=
T here,
> and possibly use assigned-rate to setup the PLL, as designed.
>

ok

> --
> Jerome
>
