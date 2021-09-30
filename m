Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832C6C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 18:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5983A61164
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 18:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353122AbhI3SKP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 14:10:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:54396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353118AbhI3SKP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Sep 2021 14:10:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DDE060D42;
        Thu, 30 Sep 2021 18:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633025312;
        bh=up1Y8uZVLAu/iEs7rscUfSneE+i7Ha2oaWuGAGEjhnw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uR8sgLR+fTwSt52Nm+Q+bIUS274VUJ0r9+3X5jfyIiNy10WaTPmzH83Uc9UA3zqfo
         0CVMWzZoQlwiIU7gSsvwde7fxjH0zPmJYp6KbczRSpJ75efQDhxnLgC0+pXUwmBWXN
         KIGntyWQoU4dldXqN8u/K3qhlNpuGmBYYgzR4Jdu+Llo0+L+fnz5SPqjaJxD9a+Z7L
         tG4HhF8tVsQd/PmSVF+dCaQnRM5eNbzknZCQdipmhlYDjlaTEXpsl/cFxBpFY5nDJF
         qR8kidjCcaygrhDyxoWCofndoguagjlnD3zpibRU8s3yCWkIK94nDWywtsmtHLlOf3
         b+yHCvKZqhFwg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210922125419.4125779-2-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech> <20210922125419.4125779-2-maxime@cerno.tech>
Subject: Re: [PATCH 1/5] clk: bcm-2835: Pick the closest clock rate
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
Date:   Thu, 30 Sep 2021 11:08:30 -0700
Message-ID: <163302531087.358640.8106942675928507251@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2021-09-22 05:54:15)
> The driver currently tries to pick the closest rate that is lower than
> the rate being requested.
>=20
> This causes an issue with clk_set_min_rate() since it actively checks
> for the rounded rate to be above the minimum that was just set.
>=20
> Let's change the logic a bit to pick the closest rate to the requested
> rate, no matter if it's actually higher or lower.
>=20
> Fixes: 6d18b8adbe67 ("clk: bcm2835: Support for clock parent selection")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
