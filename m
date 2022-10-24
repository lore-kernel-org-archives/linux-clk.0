Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7E9ECAAA1
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 09:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbiJXJqF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 05:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbiJXJpu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 05:45:50 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042B72F02B
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 02:45:03 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 4F73B320091A;
        Mon, 24 Oct 2022 05:44:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 24 Oct 2022 05:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1666604698; x=1666691098; bh=kpWktj27I4
        k8T5qMMaSWVj0Qu/gWew82s03ebW1Qs4U=; b=FhQJjB0qM4zbG0Pb6SA73Oc9dd
        IOcZwsncfTl+TbsWIza5+0YMAk1SDSgZmieByNKrHiH5ArbPftR4MFEYgMzJKz9a
        WN5F3wY61ivmiBMzkRX+nF9ifjaVHk0fBYOOSH0p29kWaxsete4GHsSB/omGubMC
        zkFfXevglkR39/nzLtmcXx9m+VqJSy28j+30Uc0R23dSra8WDkPbgvuqrXwwH2MJ
        HVe4NKkP0bvejJrLM+6WyqqGOErSNCK51QVT95cEtED3ny2Jb4L/r2OJE+TSZCCu
        EBpqSn0r/eVn6Lan6BCx5x2dU0yU79Jf6GvElMK+AAhf7VUcOgmVDY0QyK+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666604698; x=1666691098; bh=kpWktj27I4k8T5qMMaSWVj0Qu/gW
        ew82s03ebW1Qs4U=; b=DZjfQ/WDG+vu0i+Z4E0LTKB3nTZKNFJ8oawMyP0Rgl5l
        c6oY12J2Vtzmb2RQsSIVNFuTKYVRuqqfHRdfxOaa2emvgj9mPoAfShWVDFjynWPf
        h7odVCuZ/pi8z31XKPQP0WkbDVoDx7fBf1N/qO6r2k3EDkn4uGIUimJ3bOO7x7ih
        I5NqV+N0x2f0m491jBwJqoYdijjeo7k5SWX3Qi1chcyZNJS9k8NL8XEzEsfwGguG
        hpCA/7eA+3Byk+c9ad7JuvnXw41wTzCdyZZ1er+6Mz1dUnFVBcaItoc45WrZSLtu
        jO9ae7h5HRw/ghINL18H3Gk1ecqV0LfRvSz+vCX3+A==
X-ME-Sender: <xms:ml5WY5ArCjsnwgQ0SvOstB-v-4kVb4EbAG0RuMoN-nbCdwzA7YCQVQ>
    <xme:ml5WY3gILpeUMCfwNwgJMU-rflCvuiUMxVzAFiBNxEFuMaZpcPT4gLxOtag4GmYOo
    HTw7lajK5YA-tz1ApI>
X-ME-Received: <xmr:ml5WY0nDNZBcqQz5ee3Uto2cEM3HkDzIZCnAwRw_EA7MJE2IDBgU5DTt-exPdKgAM3gshw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepmhgrgihi
    mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpedtjeevtdfhvdeiueetfe
    euvefftdegtdeutdejvdeujeevueetfeeuuefgtdduheenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
    hh
X-ME-Proxy: <xmx:ml5WYzwoh05FS-MjDAejREbCvMUJClzSiduRXDlIs6q3iFcU1ouWqA>
    <xmx:ml5WY-TNRTkNMQulPPLqTpfOCUhMHlrDIFFGOMse_kSAcbY4uMtepg>
    <xmx:ml5WY2YeyiCVqw24DxSsZbSMMDskAI6ndAEg1r5jEWqVONNAx2YadQ>
    <xmx:ml5WY_LGnKdGg5pPJHkNw2JVf1oJ6rQcSqDkhRegPPa4l4AHoKnqeg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 05:44:58 -0400 (EDT)
From:   maxime@cerno.tech
Date:   Mon, 24 Oct 2022 11:44:56 +0200
To:     Dom Cobley <dom@raspberrypi.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>
Subject: Re: BCM2835 clock driver, power domains and CLK_SET_RATE_GATE
Message-ID: <20221024094456.yz7thvtbsqb57c3h@houat>
References: <20221021140505.kjmw5x4s6qhnrfif@houat>
 <CANUESCHbXTC3Z6JgZLq6Em=1ftK0nJuryVRcK=kWVnRE1Zy1Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hgzzyvy7v6wpzazp"
Content-Disposition: inline
In-Reply-To: <CANUESCHbXTC3Z6JgZLq6Em=1ftK0nJuryVRcK=kWVnRE1Zy1Vw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--hgzzyvy7v6wpzazp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dom,

On Fri, Oct 21, 2022 at 03:26:23PM +0100, Dom Cobley wrote:
> I believe our view is that clk-bcm2835 is fundamentally unsafe, as it
> writes to registers the firmware is in control of, and any calls should be
> migrated to clk-raspberrypi which should be safe.
>=20
> If there are any missing features of clk-raspberrypi, then we can support
> them.

Thanks for your input. I'm inclined to send a patch switching over to
the firmware clocks for the HDMI controller then.

There's one thing that isn't really clear to me, is there any difference
in terms of firmware capabilities between all the RPi0-3 versions?

Thanks!
Maxime

--hgzzyvy7v6wpzazp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1ZemAAKCRDj7w1vZxhR
xYbvAP9eArdB/VvHRaTlR5aiTS8GsmLcFRmlSjBbF/Chde5XdwD+P+KMlaOz8OEd
tSdYLjJjVNmMlRBnVvH1fqjBKMSuJgg=
=ZnKU
-----END PGP SIGNATURE-----

--hgzzyvy7v6wpzazp--
