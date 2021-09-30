Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B010DC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 15:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B7BD61411
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 15:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347086AbhI3P5Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 11:57:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:41698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346736AbhI3P5Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Sep 2021 11:57:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 003A460F5B;
        Thu, 30 Sep 2021 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633017333;
        bh=Vw9j2hmYCdVKgROcRVmIajyWW2TGwwU2KUfD/tya3gY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=mdsDtOgFK5I7LN8A9tlMyCunBd9gPsry6Nza7Z9uo1l1kU1n1k1TvGZT8qkcx5QYW
         4J5HW8FxzMz0TyYMKSf+ki092i9dJ0EOqZfwh1TGrfe/GaEvYkDopNjgLT8NA4/haw
         hTuTQUo/qnKgzFCQnbDjgnGTU+ikEsvSC9C3UeafjG7Xzi2Bx2o2ImbVCBA1JNLz+W
         LHZOX7NhUhhsvy69J7U8xzwIF1zFcfKwXuKaeeAuMtYQmqqDYjwXyG80BSMGzeVAe1
         Wb/wk1mTn27XeTVG8RyDik9WMAgR+NfdjIJYNpFmTi8CGUxpPabSOUF+WPxKG2ktCi
         qrGxTqH3bY9ZQ==
Message-ID: <878837a91b4174ec2534be7fe2506b975e23d8d1.camel@kernel.org>
Subject: Re: [PATCH 5/5] drm/vc4: hdmi: Make sure the controller is powered
 in detect
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
Date:   Thu, 30 Sep 2021 17:55:29 +0200
In-Reply-To: <20210922125419.4125779-6-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
         <20210922125419.4125779-6-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2021-09-22 at 14:54 +0200, Maxime Ripard wrote:
> If the HPD GPIO is not available and drm_probe_ddc fails, we end up
> reading the HDMI_HOTPLUG register, but the controller might be powered
> off resulting in a CPU hang. Make sure we have the power domain and the
> HSM clock powered during the detect cycle to prevent the hang from
> happening.
> 
> Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Tested-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

