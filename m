Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026A2C433C1
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 16:10:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D07E661A1F
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 16:10:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhCYQJ6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:09:58 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:35783 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229592AbhCYQJp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 12:09:45 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 55DA91809;
        Thu, 25 Mar 2021 12:09:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 25 Mar 2021 12:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=Q144IAj/XeRE6/ClS/WlFX41ZIU
        PNkAazPcLJ7XGT74=; b=k1LAzeoewe/QR8hI4QRwqtOAGb+hetMN7XhPeI1Wn5J
        nS/GsH5IpvB9aOMR98iyhqCBoNTeHNKTzk42woSBOuHsg6gNWdGLY59IvMHm0d7G
        DmRsYoNk39t1CZ+D3CK8+AScuiEAlVZ7W2cfipc4JLBls1kzkzyM4tFH2VfRkGCY
        QCrjZPNtcjZtUu/EAhJZU1bnOHx6tjrMsMFyxTW7k/eHwNRTUvBXAD+qESNMZTkq
        81sLJgFSj2JfrWs2fvad1Qi1w8st3YgJNVOHNbq8I2co0mZFHucYygTT5zHirHhG
        Rw4+RJAwSqWSaDsAxoA3NmBXnvvoSnAvZe0nZQ+S44Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Q144IA
        j/XeRE6/ClS/WlFX41ZIUPNkAazPcLJ7XGT74=; b=H3KbbS4ylnANs5uuTT/5mX
        VAo0wz9WuwID4X+62oJ6oLCdTol2oJ39yrhWW02slGeO9BOo28vcZ4SPGB4ytHZ4
        ERGzas8DxQ2+sPBSHefaEnbC2ZgDl9K9MI2IalAbOchMXvgZBcN4HwXIQyfDeDWL
        MceK2d8Heeb73wJgmT6upJGwQ3kHsrA3hDbS2DGAdpVV9tli4Qxf+CS8tlbx0exn
        G0TmyYYKXy0eXo8kYxNhpcAAVGjSoFBViaqdsWNpbglXiRgrvs8XvqFhhYSY7hUD
        +6Kd710xef3L35OS0tP3d+q5TfhCS92gO4ixaO5Z7wUGKjLFf/vZfc93hrt7WgyQ
        ==
X-ME-Sender: <xms:x7VcYA7zluKKbbHGFKdhYkqEG27AJ9tI_ZvhrPk0U1oZG2pljH08zQ>
    <xme:x7VcYB4tgpV5kvmdlNAkbeoWDH8tvdW6uRjnpVLeuK3b-SbfChP7XO09fbWKnW9Qv
    1i0x-1lohPbQmkYgIc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehtddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:x7VcYPeB_i8SvZTTfaDGyujMsIkJC6wPvwrfeI7XGEU3qguTRSWkTA>
    <xmx:x7VcYFKsuF4OkSR6bZ9cl7LFuu17jmBty8GBA5nk3fm32jZhjEHaUg>
    <xmx:x7VcYELPTnOlY5gA4aWaHQPpgcFko2NIXLLP7fKnklDh0MWsPuGYxQ>
    <xmx:x7VcYOgM48hA6uXR-NL4EV8LWBYhvbKslYXlv5YgT2diE4cDUDYWjw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id CCE89108006A;
        Thu, 25 Mar 2021 12:09:42 -0400 (EDT)
Date:   Thu, 25 Mar 2021 17:09:40 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
Subject: Re: Scaling back down a shared clock
Message-ID: <20210325160940.odqcsr37ue5d3tvf@gilmour>
References: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
 <CACRpkdar4tNTLLd9NFV-nG3kQnq-cLhLDB10EcLyN_Sew+uRAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lccdkvrumzutibqg"
Content-Disposition: inline
In-Reply-To: <CACRpkdar4tNTLLd9NFV-nG3kQnq-cLhLDB10EcLyN_Sew+uRAA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--lccdkvrumzutibqg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Mar 25, 2021 at 09:01:31AM +0100, Linus Walleij wrote:
> On Fri, Mar 19, 2021 at 4:04 PM Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > How could we put some kind of downward pressure on the clock rate to
> > make it run at its minimum all the time? It looks like the PM QoS
> > framework implements something similar for the bus bandwidth, except
> > that it's not really a bus that have this requirement here.
>=20
> Unsolicited comment: this is similar to what _regulator_do_set_voltage()
> is doing with voltages that can be expressed as linear intervals or
> selectors (fixed voltage steps) when a consumer calls
> regulator_set_voltage().

Thanks for the pointer :)

It's definitely relevant, regulators and clocks are fairly similar in
what constraints they have and how consumers would want to express them
I guess.

To some extent regulator_get_optimal_voltage is also something relevant
to the discussion, since it will try to find the best match for the
opposite scenario: a single user with multiple regulators

Maxime

--lccdkvrumzutibqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFy1xAAKCRDj7w1vZxhR
xUE3AQCDCtLQ71X//p7/IiLe2JUKYkrjG86uj2RhyShKydci4QD/dEUX8jHVOtFL
zfuX7vBigJ1QZPcXQhCKMoy7OMktwAU=
=bfVo
-----END PGP SIGNATURE-----

--lccdkvrumzutibqg--
