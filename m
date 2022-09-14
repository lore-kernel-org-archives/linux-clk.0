Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D94C6FA82
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 18:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbiINSFM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Sep 2022 14:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiINSFJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2022 14:05:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437A5C46;
        Wed, 14 Sep 2022 11:05:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF54161DD9;
        Wed, 14 Sep 2022 18:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDD9C433D6;
        Wed, 14 Sep 2022 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663178708;
        bh=e2slHSgeoUgIh3zoiTFJXIXJMSZ4aPFjE289S3cMQXc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CtRKZzYcmdo9mBSod6ZxSQ9g/KI0FkHzt63GRo9Z5DDOVT5i9b/Gz3YIRgJvTb+V+
         I0wtOcGf5epD8SP8k63ozUjFRZe39PFNghx5I+UYQa1nmthhRT0bOZZ3q82isApGL1
         /xyvHo5LZMTR9y4dapbH32H8Y29c7n1kH4cAh2IOo/Vm7Kx2XiZA6mM6tZHpQqu6/p
         uYlXXcVqpYyI0aVHJT0oTej5Heg9JyY+do6Qz9p68+nNA7+WdjJcWqHdN2LiPCgFQr
         xomfQcBAI0WsHa8zm2gETtS7zRs0e24stjyb4zwiPcC2eq5p2HvTeFiK5+kH1dGYKW
         F1gcNlftXe4pw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech> <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech> <20220914155035.88E45C433C1@smtp.kernel.org> <50e8f1e8-806a-3599-7cbe-0c7d4bec1c51@i2se.com>
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the maximum
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <stefan.wahren@i2se.com>
Date:   Wed, 14 Sep 2022 11:05:06 -0700
User-Agent: alot/0.10
Message-Id: <20220914180508.0EDD9C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stefan Wahren (2022-09-14 10:45:48)
> Am 14.09.22 um 17:50 schrieb Stephen Boyd:
> >
> > Furthermore, I wonder if even that part needs to be implemented.  Why
> > not make a direct call to rpi_firmware_property() and get the max rate?
> > All of that can live in the drm driver. Making it a generic API that
> > takes a 'struct clk' means that it looks like any clk can be passed,
> > when that isn't true. It would be better to restrict it to the one use
> > case so that the scope of the problem doesn't grow. I understand that it
> > duplicates a few lines of code, but that looks like a fair tradeoff vs.
> > exposing an API that can be used for other clks in the future.
> it would be nice to keep all the Rpi specific stuff out of the DRM=20
> driver, since there more users of it.

Instead of 'all' did you mean 'any'?
