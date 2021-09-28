Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074E4C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 13:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7EA061159
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 13:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240745AbhI1NHf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 09:07:35 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:38501 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235776AbhI1NHf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 09:07:35 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 1C1EA2B014E5;
        Tue, 28 Sep 2021 09:05:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 28 Sep 2021 09:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=OewulyQkxW7M0HdZfGu1vzBRMLg
        C/FBIB7nFILSJNYc=; b=YzUS/n4QrmsRtFH8dVdSrSbPhtANfIbNxMeUMVaZM2/
        0itGncvKcLfwnxJOllCwdSGpnmUn/+z8DGYLhEEfhVXRfYBKYGnJnMRBmAzg/2n0
        KF8nUzjA+7/+NnNWjkzT0xM1nW+hmIVBg2gKvj3tGMqAeNUzra6Lv4Kr733wLPgS
        0GUePN9KqtL93D5QCoDTXZVvY2WGdmoC8YKZvOnUBh74as8YFHUtX0coe43yeyjS
        ldL+J00SHt5DlesyTJ1tKrT2Idm4QMtIUsnBWOhTNmtqFldVmHZAqTwoTFUlqvMP
        GXm5u7aVNVC8nm3TUKDz6XTV6d10qwNrUWWOi0FZj2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Oewuly
        QkxW7M0HdZfGu1vzBRMLgC/FBIB7nFILSJNYc=; b=CvmXZ7YudxXN2pIWWPdzTC
        Yw5ZeD8IfMcr5V2OrxCC/Twv3q0/SsGhlOGfCTx1phOce7HBPEKY78kUZ0gx08Ze
        4v3jsdalLxqbr0TivQ2hc2cA+hp7fzD2k798eLxPAmsnf7k6V9fjADUWVKZX4oCK
        uUkRd2XkE9FpxTKhmLyHSIgVGFGCm5iYz32rXqVL8GcY+MESwWGiN2e+Ygr8drKn
        FSoMgS8TOP0AZibgc64jdaVT6LFc1SjxQ1/0oZ0hYQvXKHTZp7yXPIiilPLKoINX
        OBUfzAnl3kzbVxevaqomtJdYqUKMKhRE2VmUdRMy9vpBZfc2+ZBPOWoBhBDIcjXA
        ==
X-ME-Sender: <xms:LxNTYSl7KMtc11fHWJ303RiHmX3TAYr_CGlGQrTpwU6DZLSswd6OFQ>
    <xme:LxNTYZ1ipT5xxnH-CIWAl3DOzEevx0z5v_pA5kSLFJ5lHKBWxkB_dKn78XPKZtqJn
    TbkCwGeYA0Qs1jQ6cw>
X-ME-Received: <xmr:LxNTYQpjIEkSVJBoSXF5OHMENBeoXteDX1mVZBy7hdAxdMiY2_5lBAbiuMRU4tttMBOC-z5HHi7MKfbSyl_nGz5sLQvX0QCDcs9iOqUM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LxNTYWmT4Hl1-NXlskgLlDLrEzXrIXvve0M_YtkuSCBKDO_NOT-ltQ>
    <xmx:LxNTYQ3eHtgkcV0BTfF3_ZLlCtNb8axK052KbtRNhu4kLfrut1A2cw>
    <xmx:LxNTYdvVhjsAHYZZWIfbVzyLxIFWy-LG27zzOSwdScr4THPEEa7eFw>
    <xmx:LxNTYVsVunCt157HDSUKmEeH1vYUOvdsAUPnZRjBWsBKX4XyMwcNUchkLUU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 09:05:51 -0400 (EDT)
Date:   Tue, 28 Sep 2021 15:05:49 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 0/5] drm/vc4: hdmi: Remove CPU hangs, take 2
Message-ID: <20210928130549.wi6hvvcvqahzfkw5@gilmour>
References: <20210922125419.4125779-1-maxime@cerno.tech>
 <20210924074044.e24kbxr7lhdtb3eg@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tkxdn235uef745fa"
Content-Disposition: inline
In-Reply-To: <20210924074044.e24kbxr7lhdtb3eg@gilmour>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--tkxdn235uef745fa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2021 at 09:40:44AM +0200, Maxime Ripard wrote:
> Hi,
>=20
> On Wed, Sep 22, 2021 at 02:54:14PM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's another attempt at fixing the complete CPU stall while retrievin=
g the
> > HDMI connector status when the connector is disabled.
> >=20
> > This was fixed already, but eventually got reverted by Linus due to the=
 same
> > symptom happening in another situation. This was likely (but not confir=
med by
> > the reporter) due to the kernel being booted without an HDMI display co=
nnected,
> > in which case the firmware won't initialise the HDMI State Machine cloc=
k.
> >=20
> > This is fixed by patch 3. However, further changes in the clock drivers=
 were
> > needed for clk_set_min_rate to be used, which are patches 1 and 2.
> >=20
> > Finally, patches 4 and 5 are the original patches that were reverted. P=
atch 4
> > got a small modification to move the clk_set_min_rate() call before the=
 HSM
> > clock is enabled.
>=20
> If we merge the clock patches and DRM patches separately we're going to
> break bisectability. I guess the easiest approach would be to merge the
> clk patches through DRM. Does that work for everyone?

Anyone? I can ask around for reviews on DRM, but I'd really like some
reviews on the clock patches here..

Maxime


--tkxdn235uef745fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYVMTLQAKCRDj7w1vZxhR
xcvsAQDxKhsDP22GD43Lx/O+AaKX9Che1s2gN5v6ULUQwlNDCQD9GRoiomNxCpu1
kBfejcbPla1BuEPCa+nLgompl7GSJw4=
=c5UX
-----END PGP SIGNATURE-----

--tkxdn235uef745fa--
