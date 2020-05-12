Return-Path: <SRS0=sCEi=62=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C3EC2D0FC
	for <linux-clk@archiver.kernel.org>; Tue, 12 May 2020 21:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6465520659
	for <linux-clk@archiver.kernel.org>; Tue, 12 May 2020 21:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589318019;
	bh=ah3PdDBco+3zTv9xUB/UM1YD/Pr1jnR3JXdj8wparF0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=XrVLRsniJBCHLmsV2Nj09pVYCC3WRtj+L7TEULXnY5tukmMBHCXlt64c6/MqoyN4P
	 HlPKO77obCtT4OHf/fd66ly/cGw5gh2CpoJ/rmwwM8NDt/aYDbXCE3wwoercB9mdhA
	 2ML8jlk4+xsmpgC2WAv2Y0bgScken/eEflaLEt/M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731320AbgELVNf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 May 2020 17:13:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:57278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731269AbgELVNf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 May 2020 17:13:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F43420659;
        Tue, 12 May 2020 21:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589318014;
        bh=ah3PdDBco+3zTv9xUB/UM1YD/Pr1jnR3JXdj8wparF0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iV/KGfOY59MtJj5Ob3NsTxLpiOWQjsg1mRmMs2yjp7xAu48kFEvOkBgtLLq7hSHq0
         ms8bGIOtRVZoFPR+UVgpkf9MoTden6TFNlXTQo04J2nI+lGMHB6FGKpTv2Mg/WiMYY
         VIqdFaiPhP9v0UXQ4tcEnPmrINoQMcwY1c6ppnuw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200506120304.31550-1-geert+renesas@glider.be>
References: <20200506120304.31550-1-geert+renesas@glider.be>
Subject: Re: [PATCH] media: i2c: imx219: Drop <linux/clk-provider.h> and <linux/clkdev.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Date:   Tue, 12 May 2020 14:13:33 -0700
Message-ID: <158931801390.215346.6065473068389157307@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-05-06 05:03:04)
> The IMX219 camera driver is not a clock provider, but merely a clock
> consumer, and thus does not need to include <linux/clk-provider.h> and
> <linux/clkdev.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
