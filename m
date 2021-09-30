Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624C5C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 18:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F91B619E2
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 18:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353075AbhI3SLW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 14:11:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:54942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353064AbhI3SLW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Sep 2021 14:11:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BBEA619E5;
        Thu, 30 Sep 2021 18:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633025379;
        bh=Z2yAhY7WjcPBaDoUdlRPsE13pBWHi7VldZaOZhS4eZE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YyRHf6fdr6My+4DZ+ADeoFX5RwDlHek63UnT59puU/nl5Tv4Y/juDrIWcNq8AzHkj
         XXFXTLRrfEtqt5c+n8UkGRjZl5iT7n3DstH5EhmiEySYuFX9J2MD0lneBNwEHwof1p
         ZwrlvAp4xnGQino04WJ1HvRuuf8/U7D9G6EXXAwQuQ5N9ch8wnGTPpi+B2P6TcElZy
         im/5c+IvBUVIPgp9qQX41ntnA9OAKDH+jx8CyWLrqgoUM8eBAP26TZtu4jEM2Kx4Ao
         S5v32NyviMws1DXmQjp6HaRxGF78cTezlVYp5MAFSY60GuTcYnSCPUxufg5iMq2mM6
         EBtiWKN5kX+Tg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210928130549.wi6hvvcvqahzfkw5@gilmour>
References: <20210922125419.4125779-1-maxime@cerno.tech> <20210924074044.e24kbxr7lhdtb3eg@gilmour> <20210928130549.wi6hvvcvqahzfkw5@gilmour>
Subject: Re: [PATCH 0/5] drm/vc4: hdmi: Remove CPU hangs, take 2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>
Date:   Thu, 30 Sep 2021 11:09:37 -0700
Message-ID: <163302537796.358640.5802901948949661491@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2021-09-28 06:05:49)
> On Fri, Sep 24, 2021 at 09:40:44AM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Sep 22, 2021 at 02:54:14PM +0200, Maxime Ripard wrote:
> > > Hi,
> > >=20
> > > Here's another attempt at fixing the complete CPU stall while retriev=
ing the
> > > HDMI connector status when the connector is disabled.
> > >=20
> > > This was fixed already, but eventually got reverted by Linus due to t=
he same
> > > symptom happening in another situation. This was likely (but not conf=
irmed by
> > > the reporter) due to the kernel being booted without an HDMI display =
connected,
> > > in which case the firmware won't initialise the HDMI State Machine cl=
ock.
> > >=20
> > > This is fixed by patch 3. However, further changes in the clock drive=
rs were
> > > needed for clk_set_min_rate to be used, which are patches 1 and 2.
> > >=20
> > > Finally, patches 4 and 5 are the original patches that were reverted.=
 Patch 4
> > > got a small modification to move the clk_set_min_rate() call before t=
he HSM
> > > clock is enabled.
> >=20
> > If we merge the clock patches and DRM patches separately we're going to
> > break bisectability. I guess the easiest approach would be to merge the
> > clk patches through DRM. Does that work for everyone?
>=20
> Anyone? I can ask around for reviews on DRM, but I'd really like some
> reviews on the clock patches here..
>=20

Looks ok to me to take through drm.
