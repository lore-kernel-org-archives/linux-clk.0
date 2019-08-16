Return-Path: <SRS0=XVLz=WM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4C3C3A59D
	for <linux-clk@archiver.kernel.org>; Fri, 16 Aug 2019 17:41:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E84342173E
	for <linux-clk@archiver.kernel.org>; Fri, 16 Aug 2019 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565977280;
	bh=J8VYVOIVhLsJYaE9Qe6vQ2Z5DlEIP+q7HLw3LXz0pdw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=MQ4xRsIQR4DaCT3dgEmeuVmM9bF0cO78D4LTIUMZ5CA4+oVAIpZNdr5hJ4oRTBJje
	 XaB5dqp10e9BMxyy3hgYPWH5fp4lHGQIBI9V9nQEM45+/2N221uN6JZ8/tIyIksRbH
	 g7fYSJo6aqdqWx9GszvmFA/nuN4PAetFNU2t9LBM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfHPRlT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Aug 2019 13:41:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726947AbfHPRlT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Aug 2019 13:41:19 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFDC9205F4;
        Fri, 16 Aug 2019 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565977278;
        bh=J8VYVOIVhLsJYaE9Qe6vQ2Z5DlEIP+q7HLw3LXz0pdw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=r+NcP6Zo2WaFxxjfOrzu1OcBsSI7xkZRAZ2ckjcFwdRkgTXWl9jzVThZ/LE6ofjIp
         K5csCPhO32Izmydl7rNNVr1p8UvKYNGmKrplexjeehky77JBeBUkpwoiBKqpezVOvB
         G5yfofaobHKdYulWTjzD3noBQWhxY3c4ruC7aDZ4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1565713248-4906-4-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net> <1565713248-4906-4-git-send-email-wahrenst@gmx.net>
Subject: Re: [PATCH V2 03/13] dt-bindings: bcm2835-cprman: Add bcm2711 support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>,
        Wolfram Sang <wsa@the-dreams.de>
User-Agent: alot/0.8.1
Date:   Fri, 16 Aug 2019 10:41:17 -0700
Message-Id: <20190816174118.AFDC9205F4@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stefan Wahren (2019-08-13 09:20:38)
> The new BCM2711 supports an additional clock for the emmc2 block.
> So we need an additional compatible.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Eric Anholt <eric@anholt.net>
> ---

If you want, just send the clk patches (this and the next three) to me
and linux-clk list as a series. I will apply them directly once the
minor comments are fixed.

>  Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt | 4 +++-
>  include/dt-bindings/clock/bcm2835.h                             | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
