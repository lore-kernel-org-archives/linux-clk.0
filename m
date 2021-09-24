Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE61CC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 24 Sep 2021 07:40:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87EF46124C
	for <linux-clk@archiver.kernel.org>; Fri, 24 Sep 2021 07:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244166AbhIXHmZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Sep 2021 03:42:25 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33871 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244428AbhIXHmV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Sep 2021 03:42:21 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id BB54D58108A;
        Fri, 24 Sep 2021 03:40:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 24 Sep 2021 03:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=K3QOPik4vRo2PwF4S+8r6PvTMNG
        R4DNlcHp3C4PMAhE=; b=M8hnKTD50ReAPzl0RlF/ztAW4kotH682kO97BICtjBG
        fJp7GBylbLlEN3GvzlAcyNv/oy3L/jP+ojNx/eG+wmTLOOxY6VSXSJ8KqcPOTkRZ
        RDJGlvOcc2EHY1MjnaiR6+CMihq5pSWv8dInwJ6i3yGdGpkCBv91RgTQf2zsWWA6
        hvh0Zbm2Xw+QSggEVX9uC1EJ8Mw0d0fm+T4LZZAsmBgUwmPo+ORDQb7MzgprxaP9
        geQBiW8obyrbRHmQH0AlZcBbN3+4S70jClXmmPxd2eYRQaUDbhj9r3grTMiTWgJr
        m8469NC+UPGuNsumoWcxgR5E5tDeYnbNjrZ6Bhynq8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=K3QOPi
        k4vRo2PwF4S+8r6PvTMNGR4DNlcHp3C4PMAhE=; b=Her9lJ199ZKS6moX4znHgd
        P7t5m7vSo/Ks9ZAJD3g8dveBxBd9EulVPJemuOIr1PpbJd7RKvSpALZ7EpK3bHlu
        iTj+Ma+fC8WdbK6hk6i/qREQFjHTmWScIaZfWhI+mBEuh1keuEYpsFD9uaShwXj9
        1DULJ1aj7EgmB/LLdhMOhrR08oNWK4Xka5vnsYBfKaN2p4F5yQcxq2gDS7bG7feI
        FtRK5RRPXlDoyHTpl6mv21WlY/bfe8RY8A4jlcnxLphFCJCr8S5z2uwpM4bhoQ4j
        0k3vbU9B9Kx1lXLiGyvMRCfB9eGtWCbXxoDT/Ixf/hq7Wrt3oiFHc7MEkbrMG+Fg
        ==
X-ME-Sender: <xms:_oBNYeNFVozi6hW1WOQU9kH3ifPnkkG5d2BXTlPxMiHGIWXUI423ZA>
    <xme:_oBNYc_Pv9JZTGt3en9wytnhBbMJG8hykTKDQxpObmaHZuurWho7WPZhQ1eMklrFl
    aJe4mgqEg6mMPsvN60>
X-ME-Received: <xmr:_oBNYVTNkxw7BfqDMr1ajVQ1WycEJjlOyIM2elRXOWNCHwIYJ4ESHbPsTFAnc8gAi2NtFxKLpNL0xmCmQGDP2pzz9kUEoxFErLEv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_oBNYetQu1vCOlhHqNCP6oToqCX2v77e4sdOSPkA-RREKDChf-5vzQ>
    <xmx:_oBNYWdaXPidBfFybdeNWLRRn8yIEeNR4ozFBRFY9N8Tn2z86EVAcw>
    <xmx:_oBNYS2kZeKUkfzbsq7_ld3Z5d1vDdNkxa0R1p_qNtHJR2_Wto4xWA>
    <xmx:_4BNYS0cEco2t84_FJP8Aa_Qu5viUat7MnsyXaGweBO8DNEqm7t9iA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 03:40:46 -0400 (EDT)
Date:   Fri, 24 Sep 2021 09:40:44 +0200
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
Message-ID: <20210924074044.e24kbxr7lhdtb3eg@gilmour>
References: <20210922125419.4125779-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k62r2q7dvrx6knrx"
Content-Disposition: inline
In-Reply-To: <20210922125419.4125779-1-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--k62r2q7dvrx6knrx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 22, 2021 at 02:54:14PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Here's another attempt at fixing the complete CPU stall while retrieving =
the
> HDMI connector status when the connector is disabled.
>=20
> This was fixed already, but eventually got reverted by Linus due to the s=
ame
> symptom happening in another situation. This was likely (but not confirme=
d by
> the reporter) due to the kernel being booted without an HDMI display conn=
ected,
> in which case the firmware won't initialise the HDMI State Machine clock.
>=20
> This is fixed by patch 3. However, further changes in the clock drivers w=
ere
> needed for clk_set_min_rate to be used, which are patches 1 and 2.
>=20
> Finally, patches 4 and 5 are the original patches that were reverted. Pat=
ch 4
> got a small modification to move the clk_set_min_rate() call before the H=
SM
> clock is enabled.

If we merge the clock patches and DRM patches separately we're going to
break bisectability. I guess the easiest approach would be to merge the
clk patches through DRM. Does that work for everyone?

Maxime

--k62r2q7dvrx6knrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYU2A/AAKCRDj7w1vZxhR
xSzSAP45QmM9fnpXAlV7Z4FF/GWq+5uBTj+BJgYc/Sp1CRU8NgEApgY92jEO2DOp
O0tfsNiRmZTEEVL196/9ZqmSvH9nWA8=
=aOPg
-----END PGP SIGNATURE-----

--k62r2q7dvrx6knrx--
