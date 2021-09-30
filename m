Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC502C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 15:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAE9C615A7
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 15:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346577AbhI3P4d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 11:56:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:41278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347054AbhI3P4b (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Sep 2021 11:56:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD97E61411;
        Thu, 30 Sep 2021 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633017288;
        bh=yAvF0oaXK8W6D+jFlTBiLLGWoEkjwCO7hRxYI1y/LrE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=khJZ+J1xtOwUA7n2tTPgk7Axqa6ELe8mTWSzitgz7UZG7gix2Ali9FUD2vieswtJi
         /WLPjaU51EP+JEEMT2LfjfvEONz6/ftJO0Z28eHuc5MCeMePgvWgQEfUt6yh+f6I/N
         ksZUl1fHtaS4WSicVOSvY/bBB/HNGdMoCvdlZeeKbk9NlQM8BmomsvxiLbyIbA00fS
         zU2qesN0/NbDlf1nrDONRrMDr4buMEhbPTi73drjdJ2OmrBWVgDDoe9DpPzztcXE8D
         w2HVnUCD3SYELwuGh5KGBrPPblNult6tqzItuBh4uK2PoiENbFf2FTfNbDThk8xd21
         hrZq+kA+d3FQQ==
Message-ID: <25e5880dc5c2c00bc2c261bd12246289a2adb8b5.camel@kernel.org>
Subject: Re: [PATCH 4/5] drm/vc4: hdmi: Move the HSM clock enable to
 runtime_pm
From:   nicolas saenz julienne <nsaenz@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 30 Sep 2021 17:54:43 +0200
In-Reply-To: <20210922125419.4125779-5-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
         <20210922125419.4125779-5-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2021-09-22 at 14:54 +0200, Maxime Ripard wrote:
> In order to access the HDMI controller, we need to make sure the HSM
> clock is enabled. If we were to access it with the clock disabled, the
> CPU would completely hang, resulting in an hard crash.
> 
> Since we have different code path that would require it, let's move that
> clock enable / disable to runtime_pm that will take care of the
> reference counting for us.
> 
> Since we also want to change the HSM clock rate and it's only valid
> while the clock is disabled, we need to move the clk_set_min_rate() call
> on the HSM clock above pm_runtime_get_and_sync().
> 
> Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Tested-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

