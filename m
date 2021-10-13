Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CD8C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE314610E7
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 12:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbhJMNBi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Oct 2021 09:01:38 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33301 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233852AbhJMNBg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Oct 2021 09:01:36 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1B0A3580FDF;
        Wed, 13 Oct 2021 08:59:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 13 Oct 2021 08:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        tX3xk8CBgYEN4SGA2ydJjebcCLI9vsqCGuf6LeOmxws=; b=EANt+pVQzOLfkNsO
        F1Cw6u9KjCEaqZuJZ1u6F6lnywCEOOUxA10PwrrOO+S7DXf+P5mk12/8z01wB41k
        mVc6hIWcxYZzukPD9UULzGwh9spIs7CT317R88opvLC35Oh7sm9uTnesB6C6Ys+u
        FZuTnh3k3XjIyz6Qem+zeRMZNslear77vUmvHSLh37IH9mHw70HD0bmq65OjKplG
        gZ9SH9oUcTC48BClKDvYxiBTlH/wPbMZURn00RChShS5/j+tpm89pp74vMP4Vy7z
        16agVKdNQwxCZBJUWXe/1meNbUV7yoHLWFdG7RNM6NhEZNITTyVSLrtA7TWDWzWj
        UzrzXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=tX3xk8CBgYEN4SGA2ydJjebcCLI9vsqCGuf6LeOmx
        ws=; b=oClDH5gVHGjGg4m6oRm0GBIVfk3g7HqoeJqcrRlcQ2Jhpp5JEHIyoFx9u
        GGAiffnt8lcKelZKIqIjGQMRG43J7Nj2lu7YFIqY36YqJa49ahQoYdzfH5H47rHj
        4SDBR3IIf/6n5TJPHrYEGRVzkelHuHa5fjfhY4gDiHWZfG5muCt0K0bJiiheA1Tn
        qWz2NMsW8xXZCiaiCVaeQW9fs1jAtIgxx0HI+mkUQI+4/A7Vm8mOJsn/yF+TjStg
        HKutfuSyob2b7FpNB88a9wFu23vw4x7eq6UmIcxz8zePkx7lE6m8o3KgWUNRT5jj
        FSDwrv3kS+w+p+/1sQisSNo0sK8eA==
X-ME-Sender: <xms:NNhmYYeg7iMH4_Scf-yd320jV0mQwjQ6h1Ob_w6SVDzvMchtcyGZww>
    <xme:NNhmYaO_PQctUv7x257PosVtSWQ0cY91xqkncmIgMFysT0HZGmBuuakxNjTqvX-Ea
    YJkB5PCiCZ_kyL8BcE>
X-ME-Received: <xmr:NNhmYZhiG4tSLfjo8JqiLJH_dievKdctXtkSNJfQp4cBawJd07CASkL_zRhBo967gick3su1eoNI0UmdqsaMNTO-3zVlloQeSznYUgwK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
    ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NNhmYd_2QM5xARRwT4b1fmYzcl0RPTnDyxDIrXhqxa8GNYpPd11mwQ>
    <xmx:NNhmYUs7TWNBGtKp_Moohbmd_ktHZhe5DU-4I27TyHqSIqJLNOV9Sw>
    <xmx:NNhmYUE9Mt-xSgNFN-f0FxX4KlsDiTn5Uk8zkC6RM7PJvUVR6Vvldg>
    <xmx:NdhmYVF_WaumvjgugJWLFbUWaojQTVgmdkYyh8OmGkjddSyl5UDXSw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 08:59:32 -0400 (EDT)
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
Subject: Re: (subset) [PATCH 3/5] drm/vc4: hdmi: Set a default HSM rate
Date:   Wed, 13 Oct 2021 14:59:23 +0200
Message-Id: <163412979204.237205.18044025820599349772.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922125419.4125779-4-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech> <20210922125419.4125779-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 Sep 2021 14:54:17 +0200, Maxime Ripard wrote:
> When the firmware doesn't setup the HSM rate (such as when booting
> without an HDMI cable plugged in), its rate is 0 and thus any register
> access results in a CPU stall, even though HSM is enabled.
> 
> Let's enforce a minimum rate at boot to avoid this issue.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
