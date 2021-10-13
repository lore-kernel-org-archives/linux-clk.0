Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA3EC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37E1A610EA
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbhJMNBk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Oct 2021 09:01:40 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:43089 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233852AbhJMNBj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Oct 2021 09:01:39 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 967F3580FE2;
        Wed, 13 Oct 2021 08:59:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 13 Oct 2021 08:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        zu+J5SnYekd5o27sO2Ss06dMfXDXMjdb+rzQI1bZb34=; b=JVEBR4r7lQTeS92D
        E70LH2Zj+nNUvNlhpN4xPVifydKsBjkTEQCco+xm8WnnhP20fuPcDG6eUk9sawR8
        rAu/HDuFDr+Pj5EZkuklJNm8KZS0mjKJ0l3JbUJxLblc8DIZ1ON2ljuDyHd9OZZr
        tJVnHEL4aUN1yYYg1obX3wvSI18R4O04WT5L4u7T5juOBamvHHdHSnDVBQYBT21r
        irc7ghk0cwOtbyK49Wr40YdW2OppEgs3wuz+H+OW3V6F30jK2LfIaMYlSxqKt5Fg
        i9DEdRmOmTBKUWtDH+geu5ytug76TGdwu4XPPYTVG4R5pP/HQ9VwaJK8EZq+ikuk
        NfuEyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=zu+J5SnYekd5o27sO2Ss06dMfXDXMjdb+rzQI1bZb
        34=; b=QvvjXzgzoVcuA2SfF7cusQyGfRcBB2ckkrbg0etexf/P2bm+T3l6XOoYZ
        97yoPywEy8eW9VensxD7jyE0CEHSikJtEae6648pCEm4I5v245yeZ0xCKyLgdesj
        Y2U4LR2DdD4/BsFOlVCvwsC0JpOVJQ6hWAuu08uRQYUTEP7bw3GiJuyoUsXnxu9s
        OFf7PAs7Bp2sZMHObjFw+DaTPfYmn3UL+sQgpmXyWWkCRF97Qomvh0RntUNugk9Q
        QvbNjK8jNy5L9D/a4HIwPLhzmdHnXKdhpEBQOcnK2juRuT1GDUNxnKCUhtsK0Ui/
        ncIaDkxZgjOL4Z0G/U8BBsR1LLDrg==
X-ME-Sender: <xms:ONhmYRiQF7eQHfFjx6EnBdXs12ROTPsAR77HZUjbFIPlZi3yeP9sDg>
    <xme:ONhmYWAGlA7o-P6oQZKgRFsA2rU5HkA7w5GpTBAKxL2QBF9nPcKo7IEBlj-L4pWNN
    oQprD7iDgNvG-0k2Mo>
X-ME-Received: <xmr:ONhmYRFPoUr6p9eimawN52SYxUUzHqaMJ9Eu7lXZMRFGlJJBYyWzjW0o2Jpzq8VE3ldb4EEhjDZAS-FNytpcyUulZzI6G-kU5UJ2WUvh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
    ieekkeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ONhmYWRcR5oJG2XBAkrRbO5l5rhWL7UQWduuQ3q__633aJWOiT9Bxg>
    <xmx:ONhmYezy1-3n_8mJqi7xp9BpXXZ9zerfYsCiN2xthqPpatC8Mo5-ZA>
    <xmx:ONhmYc4SqWNmqpsTMPCrW8RvBiDtgSnag1Z0KcafZZ9aDfabnfqCxQ>
    <xmx:ONhmYShvfB66Xa2SD4Doos9XxzKkNeHu4Bjxpxa2_1e0sA1fkgkexQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 08:59:36 -0400 (EDT)
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
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH 5/5] drm/vc4: hdmi: Make sure the controller is powered in detect
Date:   Wed, 13 Oct 2021 14:59:25 +0200
Message-Id: <163412979204.237205.12502576005063521363.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-6-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech> <20210922125419.4125779-6-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Sep 2021 14:54:19 +0200, Maxime Ripard wrote:
> If the HPD GPIO is not available and drm_probe_ddc fails, we end up
> reading the HDMI_HOTPLUG register, but the controller might be powered
> off resulting in a CPU hang. Make sure we have the power domain and the
> HSM clock powered during the detect cycle to prevent the hang from
> happening.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
