Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B741C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 07:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbiF3HpB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 03:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbiF3HpA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 03:45:00 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E611A36B54
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 00:44:59 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 5EBF13200910;
        Thu, 30 Jun 2022 03:44:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 30 Jun 2022 03:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1656575097; x=1656661497; bh=A+U71uKJdO
        d2smRluuKdX1mOFQDd+vmvxx2MN/bO4sI=; b=A6Wr9ZNCXusjBLUBmhI96qpec9
        VTCoqtjFM1RJcfDZsrWvkVx2rxQodIsFknfqft4GspjaQpyHijEMx/NOJpEdbkUF
        YIOiLKflRxvfjk3DPw1noPGINRpkSxbvrvdQFMm3wYgzAK4v36vViTq5eOtXuufL
        OyPo6hP8xHIYAgoDfJVZTrO+SD9nkSpahLcgrumHYSf7pev5AecC8SNx4tTnEF/s
        KcCIuBfbIArquos812N7NcZj5R7HxMmYin53oakS4xWM3zO/Y7GdSLlfL/ea5BoK
        LtXB62gKPn69Hi1uqx9F2XVHnua+Ir33xc3XMywQmLkwj23HnH7hE0tqaCeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656575097; x=1656661497; bh=A+U71uKJdOd2smRluuKdX1mOFQDd
        +vmvxx2MN/bO4sI=; b=NP4tw73V2KIp+uS0HZNTctuElDD8su0Y5mNTxyVNtNCQ
        rEDXu96W+zSja4nU7/vpP5BpuJEVK1dzgWeOqdWzDOR0MvSECRZ3NegePYYh+Qsb
        jXZ1Per0uA+Zs3C46kK5uH395ixheh/YIyzlJr/iwb5rRWDNGtXS+PALb9cqk8EX
        ZDNuF932BrLmDyGMuE5D8OHSqfVYK+Qld6PoNII/ak/ILdaAR+L/hSs+wUw7pfx/
        gR4XNY4c//YpUf668bCr8pD/wmLi13jDLeXIGk3hkC0E9P0syM4GEdcRDPXtBhlz
        ZyWaGVCRyaZSnrwWvjC+r+VI3aNrpwh+PuuICqiphg==
X-ME-Sender: <xms:eVS9YkoOxZcQ6FGzmB2u2kvCnluprEmwdWiDH0qwMdvnPxjtBMXo0Q>
    <xme:eVS9Yqqt60nTfUnxzRo7yYtBEDSl36lR6WtoO0Y0dvFFZ7WhhSUWZxIi_UTZF4rQe
    L0d54gUdI5sR9DvYwI>
X-ME-Received: <xmr:eVS9YpMFeLMjPqBmqCT52Xe5ZMooz-IHuFa3P_6fbgA7Xfsvj0uNXV7CaxHRpm3Ji_EsNJ3KA3bI_fNgYutbC7EE9ZUGJ08bfAsxdhc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffvfevuffkhfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepgeehtdejvdeiieejkeegfffgleejffdvjeefhedtheehvdetlefhfffg
    jeetkeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eVS9Yr7dgyF_rAlKHV1YgskSjQkepG0-emMTTVZSyV7w286bD-M9tA>
    <xmx:eVS9Yj7iySnfERUvEiN_gMPOZwDDhjHcVGP9B4pybpmsd29xlbnMvw>
    <xmx:eVS9YrikRwLNPQt0Y2BCn-oD5Btle67yWW5jCXewuSQbnhil7usPtg>
    <xmx:eVS9YgHqY2HpM3tM69pTTTY1LA9P-_X4PK3bFxSQa5-kFILsx8ENwg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 03:44:56 -0400 (EDT)
Date:   Wed, 29 Jun 2022 15:12:56 +0200
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v5 14/28] clk: Fix clk_get_parent() documentation
Message-ID: <20220629131256.vqk5t42r4paainsq@houat>
From:   Maxime Ripard <maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
 <20220516132527.328190-15-maxime@cerno.tech>
 <20220629090545.52719C34114@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vnwsaaoohljytiwq"
Content-Disposition: inline
In-Reply-To: <20220629090545.52719C34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--vnwsaaoohljytiwq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 29, 2022 at 02:05:43AM -0700, Stephen Boyd wrote:
> > diff --git a/include/linux/clk.h b/include/linux/clk.h
> > index 1507d5147898..39710b8453fa 100644
> > --- a/include/linux/clk.h
> > +++ b/include/linux/clk.h
> > @@ -755,8 +755,9 @@ int clk_set_parent(struct clk *clk, struct clk *par=
ent);
> >   * clk_get_parent - get the parent clock source for this clock
> >   * @clk: clock source
> >   *
> > - * Returns struct clk corresponding to parent clock source, or
> > - * valid IS_ERR() condition containing errno.
> > + * Returns struct clk corresponding to parent clock source, a NULL
> > + * pointer if it doesn't have a parent, or a valid IS_ERR() condition
> > + * containing errno.
>=20
> I'd rather not update this. A return value of NULL is a 'struct clk
> corresponding to parent clock source' already, and we don't want to
> document CCF implementation details in clk.h because there are other
> implementations of the API.

I find it slightly misleading still since using IS_ERR still doesn't get
you a safe pointer you can use.

I'll drop it though if you feel like it's too troublesome

Maxime

--vnwsaaoohljytiwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrxP2AAKCRDj7w1vZxhR
xaz2AP4tY+13t6REay+/Cy/avofxV/ew/321dejMmTnib/rgOQEA7foiHxTvxAmI
S+IRI5hwXu26Wbu0Wznj2XBFgwg7kAM=
=BYjp
-----END PGP SIGNATURE-----

--vnwsaaoohljytiwq--
