Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B42C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CF04610E8
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbhJMNBh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Oct 2021 09:01:37 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:59885 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234117AbhJMNBe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Oct 2021 09:01:34 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 49B35580FDD;
        Wed, 13 Oct 2021 08:59:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 13 Oct 2021 08:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        791G39jFrJZONJnbSy58yWoM2GVK7lalZlPVC7suoWA=; b=PdxNWxqn6V1R+QuM
        FoTeKnBfrH6s0tP5doa29y0i6RbYImnGOe2hn4gCvNi9oT7g9IBYmtPx4Spx3WxK
        UnFDLRWIhgLSVESQeCM4Uc9enYOB3nQHHPzVb9ZIV5r6zTScBBV1GDNEIYoAq/0N
        UNQ/+EWx4LblqdsAolBZH7kU7azzNeHd+huaSZuMj8ECBDE6Um4CL6PNyxUrK3yB
        9WZ9KEf4BDb16CeelzCqBeaqPqxNNQ+GpyBcH0PyKDs0KxsYRtwIcj/aOtw16klJ
        ynb7TP2KQPnVfs+5nJ5JbrC6XVruaK0qln3MDvyVfLGtt8Y5eKs/pUTJ/puhM0av
        IFUcOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=791G39jFrJZONJnbSy58yWoM2GVK7lalZlPVC7suo
        WA=; b=A2f0Lj5g6EBh6vkLa5gGVeld86Ar842tVnzptQ0vzYsbsVsE/0fn6byOX
        eRe+V3pepi6D9pNyDkdVPzv980QVwvaJdenRMTH3HyeJxjEbfF5VPtWprBuGp3r2
        lMviyDpoOQnH1mT+DBz7ryIUdM2srzB8hehbDZwE6OigPsJV4TJMjqvgXgMhlrod
        7am3AQgciAKZWBVsIHQriks2m0vL937FuWCgcaN7sem47anIG328CHL6pkhaWkr8
        m2aS0ZO+CqWWe4q6KPHG/Thz+xPlc140Ei3k1w5u1aizQ7B3z0VJTKsbmqeCq+kx
        uB0j42h6u7Md9vp4w/1JIBICFu0Vw==
X-ME-Sender: <xms:MthmYU4ysyMiI4VwTbEHfFg576bV-FbxYpJCKIbA3n8g4O7GG8fCFQ>
    <xme:MthmYV6bXH6sSGg9usFJPUYFsQ-vgL6dc7PPFkBNhUyTeZqV_jc-7KyqkgaKCIaz6
    gb-7rcCt6VYI-ozFlw>
X-ME-Received: <xmr:MthmYTfzDLemwwjzHA89q1ld2v6DUJctQ4L5fdI2iu6qrJ2nGAa4QSM_UpnUhMypcH0QzxL8JbgTPFdkcRmIRw4e4sXFzNaga9Vqzlfr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
    ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MthmYZJknsAFS1n3icCbzFjfOBO_Op-M2GIWG7JLxrp6lFiqZ8Ri0Q>
    <xmx:MthmYYLCp-DaM_0FnO72psIACyP9RjYrS_wR7daB2h0ZYNsr9WILpg>
    <xmx:MthmYaw57eylM4fYZD463CjXEIaXTloranOmKLz5rnIUvGlm-RAudw>
    <xmx:M9hmYaAczTF2DYwJ7y4mABhGWh_thMQBZs9O6LXGZ37P7mh2Ci99bw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 08:59:30 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rpi-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH 2/5] clk: bcm-2835: Remove rounding up the dividers
Date:   Wed, 13 Oct 2021 14:59:22 +0200
Message-Id: <163412979204.237205.8541013897768601342.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-3-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech> <20210922125419.4125779-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Sep 2021 14:54:16 +0200, Maxime Ripard wrote:
> The driver, once it found a divider, tries to round it up by increasing
> the least significant bit of the fractional part by one when the
> round_up argument is set and there's a remainder.
> 
> However, since it increases the divider it will actually reduce the
> clock rate below what we were asking for, leading to issues with
> clk_set_min_rate() that will complain that our rounded clock rate is
> below the minimum of the rate.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
