Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1AEC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 16:26:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1BB061206
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 16:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241743AbhI1Q1z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 12:27:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:58858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241702AbhI1Q1z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 28 Sep 2021 12:27:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3737960462;
        Tue, 28 Sep 2021 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632846375;
        bh=oFzMNd56P/Bc6DPh2ju3WdH1InmiJeQKxMtO1+IROrI=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=eUO4pKcvbbdSTakQ8QNE+mtbLlsywDXXnVYi8Yaj6zIDjOtTwKee/gTMXHm4nDaW6
         IDPZKT24kQfJidzd8aLAFyDqFaCRoEUMfHRdNMbCqz0XKeXPWMoOAiompisRLzUozW
         dz0o/1CKzRXpiW/jpTZkUVdYd/xEmq8T2R7QDa7rvw9RjGH4OEBhq2gghY5Uh1e1q9
         ot/Nrl22pyxGn+mzqQNHReadorxYl148/+ph+UrZUQSGFyuNz+MLM51hpCpAE7y7Qz
         wdPKwMiwXFionZv1uRg+GOlImIhJOU5W8LcFUOe+Q6o0OO8ZBfmAs3jJu3tRx7S5jq
         gDB5t8AbnVOww==
Message-ID: <f44655307df14c8e18239551faf581a49d2ef1fa.camel@kernel.org>
Subject: Re: [PATCH 1/5] clk: bcm-2835: Pick the closest clock rate
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
        Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 28 Sep 2021 18:26:10 +0200
In-Reply-To: <20210922125419.4125779-2-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
         <20210922125419.4125779-2-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2021-09-22 at 14:54 +0200, Maxime Ripard wrote:
> The driver currently tries to pick the closest rate that is lower than
> the rate being requested.
> 
> This causes an issue with clk_set_min_rate() since it actively checks
> for the rounded rate to be above the minimum that was just set.
> 
> Let's change the logic a bit to pick the closest rate to the requested
> rate, no matter if it's actually higher or lower.
> 
> Fixes: 6d18b8adbe67 ("clk: bcm2835: Support for clock parent selection")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Tested-by: Nicolas Saenz Julienne <nsaenz@kernel.org> # boot and basic functionality

Regards,
Nicolas

