Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07F7C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA80B610E8
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbhJMNBi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Oct 2021 09:01:38 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35803 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234043AbhJMNBi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Oct 2021 09:01:38 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id CABF2580FE1;
        Wed, 13 Oct 2021 08:59:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 13 Oct 2021 08:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        7ADouUXy2EOCuLTfkeoi07/lcc+shosq3x53UUrurao=; b=lSCcgqFNa6fg9sG+
        aa84hq8HxkSS7qkOfgTl2zvK2Rv0RmKY57KpzO3/xNl5zP8DauTqSWVnQWT1einm
        5gbuQqBDVjWh+lGU9w5qOyiIu/H53qYrdXgtNzX0BqR4940sODU+XZ+8c/k0Nzkw
        9nNnoYi/rbwfyrf8TWNrzTCjKFFZpFd7kIihlFL0XFcmFPYhr9unAU33KXgIsO/K
        /UpOkTNb1W+LorrLOn+0Qm3bofZAn+bbdzBRJ+KB+v88BIlcPwnAcPslmacVT53F
        7xen2s5jnMKWFGQLZRUFAYMszQEzfwFrHT1U6J+3RPcV/gjiBmfm0yjOpo0rHqv/
        WV493w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=7ADouUXy2EOCuLTfkeoi07/lcc+shosq3x53UUrur
        ao=; b=U5o8PCmwvo7sX6L7mncaOEBSVrtoIHqwlTlq9bAKcanaJrbtFuqUp1auu
        MCoGXbD1Suwu8jcYLBRYjnouEv0hl5msEMZyfHwBHnLi+02cHgniFoe6rJV6U/pk
        Sui6dvFGhC+1R3L4Z4UI8o+HULXO9XZDgEPxXOYY3D/PVzpDLCx4LYUxuz23hzpe
        ym008AvRsNCxIiu4RH+QMfObthSdj0DVfKIF0pJYKWuBAXg51r14mMGUqMwgF3XG
        u7zr1Y0TLJBQxkr6zzm6ybjooWNwWWR8mmHYoljqknT10O1b8OzrP26hOhBMWdEM
        p/nMujULSO0AgTTlmSYxHXERHWmeg==
X-ME-Sender: <xms:NthmYaDxuq8awGKz82lxLagpO-q6JyHHn5DREO8t2OmsFx8E6iO3sg>
    <xme:NthmYUi9JI_InYRIMuENposEqwgniwPZlOB4rMVtCPS1k55yH9LPC-RZpShuH1whK
    J06w36C_hGshl5AV9c>
X-ME-Received: <xmr:NthmYdmfc9q9PFb1-eqsdRq9eJ00NdjwMYlwz2gQqXNoWknfNQRFprvsIo2mOKH7kgW7B5ZgVtHVmeBKdYqsTyUX2r35uRwNgTGt3FI_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
    ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NthmYYxxx7ObgqmDVo1W4HcsMFc_uAxpHVJ5sOW6hmoM9wNnAsuoKQ>
    <xmx:NthmYfTkQg3fSGIT3bQijZzHhSagevkYgKO3O0GAaW0q_YzzKf4VKw>
    <xmx:NthmYTZQBemIYkw8kIWr_mau8wpbXy8_vRKx7aUSdqsuwjSjb4cI2Q>
    <xmx:NthmYdDoJvDBG_zWBQ4LgxNXWEdJYeWOp-0ErhkpL_50q8sPQVvU2Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 08:59:34 -0400 (EDT)
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
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH 4/5] drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
Date:   Wed, 13 Oct 2021 14:59:24 +0200
Message-Id: <163412979204.237205.12467000827023929362.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-5-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech> <20210922125419.4125779-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Sep 2021 14:54:18 +0200, Maxime Ripard wrote:
> In order to access the HDMI controller, we need to make sure the HSM
> clock is enabled. If we were to access it with the clock disabled, the
> CPU would completely hang, resulting in an hard crash.
> 
> Since we have different code path that would require it, let's move that
> clock enable / disable to runtime_pm that will take care of the
> reference counting for us.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
