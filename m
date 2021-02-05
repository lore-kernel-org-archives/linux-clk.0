Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F586C433E0
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 22:18:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B49264EE4
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 22:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhBEWSE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Feb 2021 17:18:04 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:56141 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232708AbhBEOeB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Feb 2021 09:34:01 -0500
X-Greylist: delayed 595 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Feb 2021 09:34:01 EST
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id CA236A62;
        Fri,  5 Feb 2021 11:01:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 Feb 2021 11:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=Z
        Ug4YBs2NZzkbzAyFNlphluvR52IfC1jIWmo0WKohOw=; b=nxRBtTKEPua4sw3Z8
        I0u/zm1He1XiJfi2ef2lobVAa2QN6TgPTXwIYOg20BQHcix0353FjZlSEYd8MsTQ
        /iMk/ZOHCsGgBc0SHiIzrherfhIqwAwYo3rml5oMY66SgWEfSnYSZqarq0w0gunN
        PhOyW+dQ0P/ViGhWpGfw34cKymNsCpdZQoy1iRTNCJlcD5SyCqt6uo+czNjnxNB+
        ikUA5vd2ErUwsGqyleyuqynKoJOZNWGuYbJJcynWP/ER9ifWYq4RfcStecbrzApF
        m3pmFZ6HOWgbDPD40qrRqtQpIEbNLUXUNCB28Frl9SwIH5ASMy0YffKPqtDadVoe
        9HSlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=ZUg4YBs2NZzkbzAyFNlphluvR52IfC1jIWmo0WKoh
        Ow=; b=hRplnt8x9ng0QnsOvO3i9NBNgMtWLVSZe60hMQH0bSWl0L+JVAN/QDvwT
        lmaMsbuEOqOYGd/0yIHIQPR6ICh0LLQrS/U+KhnrgRk5J8Iexnv7XsBNLpcm5MbJ
        rCke763Yu3tyZLGrRLH+xIavxaXOWl2Jg6xwRWqWJtL8kFqxD95c4LfQrHohdsvW
        p3lwjBE/+yNLwVu5HNYXFcZtf279iKGR1nrf2dLdI16n2VJepaiQFexELUMIukI3
        hTIg7oS2ZC8xjsFIoLv6yyDTihP38gJpS7BUR6GuHvq7QwOVXmvxx5fCeYwpw7vl
        Bl2O6/JJ5olR8CY/tEH8nfMzw710A==
X-ME-Sender: <xms:22sdYH6uVesoFeifE_6Eim4_m8mI1wJQHMNhWcFuU9UujeO0fs8h7w>
    <xme:22sdYM0A3rY-jZ89sLUxMJv7mFvqrt_XMp7bInrQNQ7bXeCTRyvJEHHw7-tcQi1wX
    rD47nzU1NvDRYuN5BA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgeeigdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
    vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:22sdYLV6X3XqZNzrMwJ2n4Hy0dSUqRdjoh64JvXReh8gYEOnnw5dXg>
    <xmx:22sdYP7JbJikZS5zxnmcJbqM_T7xUVyS_dw46CZ5EvDC_4XtWN0_WA>
    <xmx:22sdYKI-8yxGdsM6Sc9unBBUGB2DpORZJw9RS2R5szP48uOZ2Y50rQ>
    <xmx:32sdYBnFqP1GOh1T62GmxtqopTP3B251EHdToE5EUEUmlkBEbQk6rXL-23o>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9105624005D;
        Fri,  5 Feb 2021 11:01:31 -0500 (EST)
Date:   Fri, 5 Feb 2021 17:01:30 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Andre Heider <a.heider@gmail.com>
Subject: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1 channel
Message-ID: <20210205160130.ccp7jfcaa5hgyekb@gilmour>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <20210204184710.1880895-3-jernej.skrabec@siol.net>
 <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Feb 05, 2021 at 11:21:22AM +0800, Chen-Yu Tsai wrote:
> On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> w=
rote:
> >
> > Channel 1 has polarity bits for vsync and hsync signals but driver never
> > sets them. It turns out that with pre-HDMI2 controllers seemingly there
> > is no issue if polarity is not set. However, with HDMI2 controllers
> > (H6) there often comes to de-synchronization due to phase shift. This
> > causes flickering screen. It's safe to assume that similar issues might
> > happen also with pre-HDMI2 controllers.
> >
> > Solve issue with setting vsync and hsync polarity. Note that display
> > stacks with tcon top have polarity bits actually in tcon0 polarity
> > register.
> >
> > Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
> > Tested-by: Andre Heider <a.heider@gmail.com>
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 24 ++++++++++++++++++++++++
> >  drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i=
/sun4i_tcon.c
> > index 6b9af4c08cd6..0d132dae58c0 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > @@ -672,6 +672,29 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon=
 *tcon,
> >                      SUN4I_TCON1_BASIC5_V_SYNC(vsync) |
> >                      SUN4I_TCON1_BASIC5_H_SYNC(hsync));
> >
> > +       /* Setup the polarity of sync signals */
> > +       if (tcon->quirks->polarity_in_ch0) {
> > +               val =3D 0;
> > +
> > +               if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > +                       val |=3D SUN4I_TCON0_IO_POL_HSYNC_POSITIVE;
> > +
> > +               if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > +                       val |=3D SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
> > +
> > +               regmap_write(tcon->regs, SUN4I_TCON0_IO_POL_REG, val);
> > +       } else {
> > +               val =3D SUN4I_TCON1_IO_POL_UNKNOWN;
>=20
> I think a comment for the origin of this is warranted.

If it's anything like TCON0, it's the pixel clock polarity

Maxime
