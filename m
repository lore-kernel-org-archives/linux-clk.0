Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3DDC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 08:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbiJJIuI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 04:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbiJJIt7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 04:49:59 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B565F11813
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 01:49:53 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 6532F320091C;
        Mon, 10 Oct 2022 04:49:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 10 Oct 2022 04:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1665391790; x=1665478190; bh=PDUGsxkNb0
        zX9FMpRQmfdedIVIHDsvqu4K9UBawdbe0=; b=mV4UVnL53OevZwSQjXU4tq5Z2j
        BGzaKs+yLbeRyElZUGz1dhqD/X5LGgR4DUlXviWXvo/M5+r9DqaPruouh21w1r7o
        DX9ZFVPp7nvgFT5BZuL3lW1ALZ/Wv/GACkRC1OZyNFgtBdJ/WDLBijdEWrFjGacd
        9hiYuiCy4JqaHeDhwjo2bEQ8rI3+DpVsysvcya4SIyC39QifZAQtsvx0xIyyHFQ1
        nLkK5HtIjhfnOISJF4hS6D9Mrsi8/pOeSN5obE/H1SIkhuDiC8sd4T2tRfqxRLrf
        S0m6iL4HA4wmNabCiA5VLa8CGG9Wc0srDqhuWUUj0NMKuhGHj26PwZHXdH9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665391790; x=1665478190; bh=PDUGsxkNb0zX9FMpRQmfdedIVIHD
        svqu4K9UBawdbe0=; b=WIDNulpygqj+j4VRyOpxa8TLhpRApMe7V77uwYiXRl8a
        x9usxVxAT+7hYRWL2eXgJod9cSefztoZwWm/G9fSuaMsw4mpUEkzz95QsYKhGDZc
        BeCBcslv9T8XKMwZO3cdBBPbA5Un6wNSxapLRK2CrKdTHktrrkEd2RluGhmWn+R2
        QDNHOXzIB2ok6QQpC/gDcrmdjmd/mM/seII+IxhMof0rZVopAE0HeHo7228P5Kgj
        KwH+57ZhBqdheHiNqNv9VWbt4O2bpkVXTPCIJ4FjaZTYZ1QtXrdx7+XtwxDkLHYC
        9oQWNeX4fMB9gGzX2YBlvdodocGXC3e6rM8bQNdVjA==
X-ME-Sender: <xms:rtxDYw-vM7bQ2WAS1pkxgQiyThQrorrLVB2pnUHX3ckJWVlIYnfKBw>
    <xme:rtxDY4sfE68zFOWke2kbPP5092T0YmXVURR8fNqHRR8qerG3pfkotKNdjgaOCZJ0P
    FPFQRS_rmMCMEYu1Hc>
X-ME-Received: <xmr:rtxDY2Co_06XKizH9fP7AmuxL3zPhoxxApgtQB9ewyTZe-Zxl_TnRP0yYv5e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
    geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:rtxDYwddhBEMLuY5IkLdlfws3Otf78uIb1xy_32e1VSE5eVVZI7YbA>
    <xmx:rtxDY1Oqp3HCgJGxqzTiFEGFhFkLLbqSwYZ0L_wEEhDspwEyfsE4CA>
    <xmx:rtxDY6mz1IaQwQETwRGg38dUWvWg0I3_-G5CQYoWt4Rf-r-1psKztg>
    <xmx:rtxDY5l7krmZESaowySg18-Ko2AOKNMBVpMRC9a_m6jqUR4HVC31GQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 04:49:50 -0400 (EDT)
Date:   Mon, 10 Oct 2022 10:49:48 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Quanyang Wang <quanyang.wang@windriver.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid
 out-of-range rate
Message-ID: <20221010084948.5ikovoamsfggsxwj@houat>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
 <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
 <20221001000503.23268C433D6@smtp.kernel.org>
 <20221001104001.r7r2utwymm32tv53@houat>
 <ba5bb9dd-8a4c-3f24-c7e2-c8469ef693be@windriver.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="auji3pxqgviqzbkv"
Content-Disposition: inline
In-Reply-To: <ba5bb9dd-8a4c-3f24-c7e2-c8469ef693be@windriver.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--auji3pxqgviqzbkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 02, 2022 at 10:17:24AM +0800, Quanyang Wang wrote:
> On 10/1/22 18:40, Maxime Ripard wrote:
> > Hi
> >=20
> > On Fri, Sep 30, 2022 at 05:05:01PM -0700, Stephen Boyd wrote:
> > > +Maxime
> > >=20
> > > Quoting Quanyang Wang (2022-09-28 18:05:10)
> > > > Hi Laurent,
> > > >=20
> > > > I have sent a patch as below to fix this issue which set rate faile=
d and
> > > > it's in linux-next repo now.
> > > >=20
> > > > https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-1-qu=
anyang.wang@windriver.com/T/
> > > >=20
> >=20
> > It looks to me that the fundamental issue is that, in some situations,
> > the round_rate implementation can return a rate outside of the
> > boundaries enforced on a clock.
>
> In my limited view, the round_rate callbacks should return a rate within
> boundaries as output,

I guess it would be s/should/must/, but yeah, we agree.

> but can take a rate outside of boundaries as input.

I'm not sure what that would change though?

> Take Xilinx Zynqmp for instance, VPLL's rate range is 1.5GHz~3GHz. A
> consumer dp_video_ref wants a 200MHz rate, its request walks upward throu=
gh
> multiplexers and dividers then reaches to VPLL, VPLL receives this 200MHz
> request and call  zynqmp_pll_round_rate to "round" this out-of-range rate
> 200MHz to 1600MHz via multiplying by 8. zynqmp_pll_round_rate returns
> 1600MHz and clk subsystem will call determine callbacks to configure
> dividers correctly to make sure that dp_video_ref can get an exact rate
> 200MHz.

Sounds good to me indeed.

> But the commit 948fb0969eae8 ("clk: Always clamp the rounded rate") adds
>=20
> req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
>=20
> before
>=20
> rate =3D core->ops->round_rate(core->hw, req->rate,&req->best_parent_rate=
);
>=20
> This results that .round_rate callbacks lose functionality since they have
> no chance to pick up a precise rate but only a boundary rate.
> Still for Xilinx Zynqmp, the 200MHz rate request to PLL will be set to
> 1500MHz by clamp function and then zynqmp_pll_round_rate does nothing,

I'm a bit confused now.

If I understand your clock topology, you have a PLL, and then a divider
of 8, and want the final clock to be running at 200MHz?

If so, the divider should call its parent round/determine_rate with 200
* 8 MHz =3D 1600MHz, which is is still inside the boundaries of 1.5-3.0GHz
and won't be affected?

Why should the child be affected by the parent boundaries, or the other
way around?

Maxime

--auji3pxqgviqzbkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0PcrAAKCRDj7w1vZxhR
xZryAQCbZwq3zD2Ca2U2w1Cn9iAXp5oB49pjSVH4AG6FwXMsrQEA16atQ06WVU9R
tJvefoa3vp7tjUmMVw2Za+udwbPXhAg=
=wCL2
-----END PGP SIGNATURE-----

--auji3pxqgviqzbkv--
