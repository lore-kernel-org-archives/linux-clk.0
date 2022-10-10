Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379DFC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 12:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiJJMtZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 08:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiJJMtY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 08:49:24 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D716D18E1D
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 05:49:22 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id C0F093200976;
        Mon, 10 Oct 2022 08:49:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 10 Oct 2022 08:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1665406158; x=1665492558; bh=epuO0h+BJ4
        HWlXnfso2mj1MR6ZTdFavu1mmVcQMLwbQ=; b=GM2PNSrZHLI9H5Lw4ruoBj/J1M
        BowGGAs04Tr5Smqp4ooKqtL5MSqqN3Afmt//DNFwSyLnPk+ZScDuThxabXhQDRd+
        AhIvtu5Vd6GjPv+ahF1ZPhTWKPMtq+VD49ZTyucCh0hQfte8iXtWysyxQuxqY30H
        eT/Ezspc6mKjKi1Bw+wjg2fDN/5rl19wnm+4SqWfsqvTrdFvgnpM8v8lWZID7ghh
        1wwx6QVB9tG3z8rH1JTUejJT/w5qIR7W861oPRsBud0uwTIxMsafgqzp/5c/Zrq1
        bzoEOAjkidbL/E5QTpPF2ks6z1YosdX1sCnq4jrCkneF8xz/FCFYvJ5eUTqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665406158; x=1665492558; bh=epuO0h+BJ4HWlXnfso2mj1MR6ZTd
        Favu1mmVcQMLwbQ=; b=CFsG0VkQ4JFnTanlbnlEX6G+gZxh9/Z+DcAkvF8H3jvp
        kQ/wp0yo4AFCXhNS5v0EZbz/nojsWEi/RFKoPzX7chxjReKZdW6Yhy8pX565RqEq
        SuLLyCO+jHIYPmVyuWWuWT7g57Ycppuqc/ZPICDZuwQM/pG1K0ZawWV3x58SB9nd
        qMt0wgdEhvQkPGC9M1VIENxm3l7+CSdT388lJ9NzbhzAlq6+aVR4boSxEpyc6SAx
        WRJyd6/iH6nF7rYusm5DFCC4BSLSQ+7gaAggbTNTdICfRN+Ujv+JSQcBqrRxAfNZ
        0aqeA3ha5ZPRKwY2Uxz20gdPKVlhC1ic6eBZjQxykg==
X-ME-Sender: <xms:zRREY1GB1PY0CPZgXisdZ_oNt2cCcmDcBmIU2Y2j25PTI2o1TvDPZQ>
    <xme:zRREY6XxS8EgYuksuiw8E5TaK9pPNzgNl7Nfzl7VXRKBZpQHYlzGK2b8PAvIAREEc
    OSUm_OmP8CikONsvlw>
X-ME-Received: <xmr:zRREY3J57Fnf4YK7LJ2jTt_OZvqAsMY0Kux0JqO6ZnimpIDYGsO4KrRCgJCL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
    geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:zRREY7GNx9QKXVT36Io-U7m7NhEFUdgXTybPmLki0EHxmxTFhXNtCQ>
    <xmx:zRREY7UetDtd2dUKpO46pq5gmTb6RiaLlwooAbf0xwATav1apFQx3w>
    <xmx:zRREY2NNCgXoP8_nB5_qmVQ7OltaL2jLgyfyaRCiMVyU2ecEL6tjUA>
    <xmx:zhREY0t8pqFUo_faJRCIhizM5StYHCyzssp0pD_VLz2WAyTNU9JnAw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 08:49:17 -0400 (EDT)
Date:   Mon, 10 Oct 2022 14:49:15 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Quanyang Wang <quanyang.wang@windriver.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid
 out-of-range rate
Message-ID: <20221010124915.25pl5jyxtaepimhd@houat>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
 <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
 <20221001000503.23268C433D6@smtp.kernel.org>
 <20221001104001.r7r2utwymm32tv53@houat>
 <ba5bb9dd-8a4c-3f24-c7e2-c8469ef693be@windriver.com>
 <20221010084948.5ikovoamsfggsxwj@houat>
 <5dd52fa0-1507-fbf4-8e98-90e50675b83d@windriver.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zdyt7ikmuh2wq5g3"
Content-Disposition: inline
In-Reply-To: <5dd52fa0-1507-fbf4-8e98-90e50675b83d@windriver.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--zdyt7ikmuh2wq5g3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 08:12:08PM +0800, Quanyang Wang wrote:
> Hi Maxime,
>=20
> On 10/10/22 16:49, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sun, Oct 02, 2022 at 10:17:24AM +0800, Quanyang Wang wrote:
> > > On 10/1/22 18:40, Maxime Ripard wrote:
> > > > Hi
> > > >=20
> > > > On Fri, Sep 30, 2022 at 05:05:01PM -0700, Stephen Boyd wrote:
> > > > > +Maxime
> > > > >=20
> > > > > Quoting Quanyang Wang (2022-09-28 18:05:10)
> > > > > > Hi Laurent,
> > > > > >=20
> > > > > > I have sent a patch as below to fix this issue which set rate f=
ailed and
> > > > > > it's in linux-next repo now.
> > > > > >=20
> > > > > > https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-=
1-quanyang.wang@windriver.com/T/
> > > > > >=20
> > > >=20
> > > > It looks to me that the fundamental issue is that, in some situatio=
ns,
> > > > the round_rate implementation can return a rate outside of the
> > > > boundaries enforced on a clock.
> > >=20
> > > In my limited view, the round_rate callbacks should return a rate wit=
hin
> > > boundaries as output,
> >=20
> > I guess it would be s/should/must/, but yeah, we agree.
> >=20
> > > but can take a rate outside of boundaries as input.
> >=20
> > I'm not sure what that would change though?
> >=20
> > > Take Xilinx Zynqmp for instance, VPLL's rate range is 1.5GHz~3GHz. A
> > > consumer dp_video_ref wants a 200MHz rate, its request walks upward t=
hrough
> > > multiplexers and dividers then reaches to VPLL, VPLL receives this 20=
0MHz
> > > request and call  zynqmp_pll_round_rate to "round" this out-of-range =
rate
> > > 200MHz to 1600MHz via multiplying by 8. zynqmp_pll_round_rate returns
> > > 1600MHz and clk subsystem will call determine callbacks to configure
> > > dividers correctly to make sure that dp_video_ref can get an exact ra=
te
> > > 200MHz.
> >=20
> > Sounds good to me indeed.
> >=20
> > > But the commit 948fb0969eae8 ("clk: Always clamp the rounded rate") a=
dds
> > >=20
> > > req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
> > >=20
> > > before
> > >=20
> > > rate =3D core->ops->round_rate(core->hw, req->rate,&req->best_parent_=
rate);
> > >=20
> > > This results that .round_rate callbacks lose functionality since they=
 have
> > > no chance to pick up a precise rate but only a boundary rate.
> > > Still for Xilinx Zynqmp, the 200MHz rate request to PLL will be set to
> > > 1500MHz by clamp function and then zynqmp_pll_round_rate does nothing,
> >=20
> > I'm a bit confused now.
> >=20
> > If I understand your clock topology, you have a PLL, and then a divider
> > of 8, and want the final clock to be running at 200MHz?
> >=20
> > If so, the divider should call its parent round/determine_rate with 200
> > * 8 MHz =3D 1600MHz, which is is still inside the boundaries of 1.5-3.0=
GHz
> > and won't be affected?
> >=20
> > Why should the child be affected by the parent boundaries, or the other
> > way around
>
> Sorry, I didn't explain the problem clearly.
>=20
> As below is the vpll clk topology in /sys/kernel/debug/clk/clk_summary wh=
en
> reverted "clk: Always clamp the rounded rate".
>  clk_name				MHz
>  pss_ref_clk                          33333333
>     vpll_post_src                     33333333
>     vpll_pre_src                      33333333
>        vpll_int                       1599999984
>           vpll_half                   799999992
>              vpll_int_mux             799999992
>                 vpll                  799999992
>                    dp_video_ref_mux    799999992
>                       dp_video_ref_div1    99999999
>                          dp_video_ref_div2  99999999
>                             dp_video_ref    99999999

I couldn't find any of these clocks by grepping in the kernel code, are
they upstream?

> When call clk_set_rate(dp_video_ref, 100MHz), there is a clk_calc_new_rat=
es
> request passed from bottom (dp_video_ref) to top (vpll_int), every clk wi=
ll
> calculate its clk_rate and its best_parent_rate. vpll_half will calculate
> its clk rate is 100MHz and its parent clk vpll_int should be 200MHz since
> vpll_half is a half divider. But vpll_int ranges from 1.5GHz~3GHz

Still, I'm not entirely sure what's going on. If the only divider we
have is vpll_half which halves the rate, and we want 100MHz on
dp_video_ref, then vpll_int should provide 200MHz? Why would we increase
it to 1.6GHz? I get that the range of operating frequencies for vpll_int
is 1.5-3GHz, but I don't understand how we could end up with 100MHz on
dp_video_ref with 1.6GHz for that PLL. Or the other way around, why we
want that * 8 in the first place for vpll_int.

Maxime

--zdyt7ikmuh2wq5g3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0QUywAKCRDj7w1vZxhR
xSfXAP93IvWrVQ3jUoBotefpPG++a6/rN5aw1XAHaR8Q43C6jAEAlomXuhStP6aD
N6NI1x1yXnaUIg8NoDOmvVKza37cfgw=
=o1g+
-----END PGP SIGNATURE-----

--zdyt7ikmuh2wq5g3--
