Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F346C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27678610E8
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbhJMNBg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Oct 2021 09:01:36 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:39245 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233900AbhJMNBd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Oct 2021 09:01:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4D8C3580FDB;
        Wed, 13 Oct 2021 08:59:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 13 Oct 2021 08:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        m7Wk+o9eb+1jYrjPniBBUwm5auLtNNx703yBqXhdVNE=; b=fETQ+U21aFdAr/QS
        Vg96EIO8u2rRoAMZDtkjg5J8ohERFYWACu72Sf8ZSUbsgw/Emo41Rl3OgxyQdQwz
        yQvgir1MXNkqFXcJ+R2eYrkKFANp70JRA6fTK9TCyRuwqJMMVLVfPpbZyQ5ysDU0
        ktTNXNdVhjDdU0KdE9MtgR98dk5AUhuPuy6VeKziw67j1vj26NJQFlrw5uV9BVaI
        XTRkM5VjcbzJFtxfxtY5009JdPuVn4+HX312o9NMIfhTgW3j7lxVOGFT9LQLcArD
        biXI9ZsRCQd+noq4coWQSzqxSUQXqRwNycDCQaesnKzIEit4UOA45EaCWL/pJdj8
        kGCtKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=m7Wk+o9eb+1jYrjPniBBUwm5auLtNNx703yBqXhdV
        NE=; b=HA8R7jdxcvQsIrSev5ysTDc6buuQvT99G579BEDDSMYas3Lw0KCapIBFL
        bDiwOdqxwzqQmKZ3v8VaEn6YvkgweYG93LTYViVPssEN3+jYIuM30pQm41ydILQI
        nHdQGQbC4J1c1fhCBudHhU1lptTrdClfhkgATNMz5Nzx4JYOextP+sOOzA0xxIBr
        dD2S06bDZUE5hyOq8ILXfjWeefKxRw2ScvEwNsWOMEOIkJsXD0XuJ9tjIJIUZqGM
        Sl5KYy3OoS9WY+EMVR0V5HIun+nCYI4nd8DeddXx6/yx9yqBoXashnnC5LKzvNjn
        nkLMG5CxJqhG+y2UXT6YfD5pHUUHQ==
X-ME-Sender: <xms:MNhmYUGBmJCmN5PuCwS1jhXTHSydr5bTkloTow-tHnadEc-pEjr3aA>
    <xme:MNhmYdWK8WJqHhI4xSOhpNKcGmhzwsSlBBLqj8KVSwZtLrOKwS-oCkLuvU9oxhT4e
    Ev0lMV8jl8_SSE5UIU>
X-ME-Received: <xmr:MNhmYeLST80dXFS8qOuzunRQINbBRg93UA206bvBBk_Hj3O8LggBtSizc9m0UX3mjF9LLqbipYKaJTF24D2xUA5-bpE4OYZ3cGB8Q2ZP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
    ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MNhmYWFCr8sRIDrfqzesvpwFBj91_QodSI4xoKJBaFNor-I7eagFyQ>
    <xmx:MNhmYaUt8rq7w0EtUlxLku9XK4nS30IWw92SEK8bzdi7oreU4nt6dQ>
    <xmx:MNhmYZNJItkHPML0eU_Hkf6RqGK_IIOAfdOQN9PCwe9CAzfTv0hpKw>
    <xmx:MdhmYbv40KDhuHrNIi8-hTwKWZWMdm0E0KLfURaCVNtfkd6jZTJKzA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 08:59:28 -0400 (EDT)
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
Subject: Re: (subset) [PATCH 1/5] clk: bcm-2835: Pick the closest clock rate
Date:   Wed, 13 Oct 2021 14:59:21 +0200
Message-Id: <163412979204.237205.17368769057180677603.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-2-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech> <20210922125419.4125779-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Sep 2021 14:54:15 +0200, Maxime Ripard wrote:
> The driver currently tries to pick the closest rate that is lower than
> the rate being requested.
> 
> This causes an issue with clk_set_min_rate() since it actively checks
> for the rounded rate to be above the minimum that was just set.
> 
> Let's change the logic a bit to pick the closest rate to the requested
> rate, no matter if it's actually higher or lower.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
