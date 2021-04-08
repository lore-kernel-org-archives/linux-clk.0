Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE3AC433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:26:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9A6261182
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbhDHA07 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:26:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:43680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHA07 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:26:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B35A061154;
        Thu,  8 Apr 2021 00:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841608;
        bh=aI2thAlz9BnBiEc+6udmVzp8gfkXJ8Xq/CbCfKJZjWw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PJkzA+4LHL23WnPXrcfNsCTKHo4mTY07kq7yQAWoqoIf0CY/K9GDTQjgyxjhZ6JfT
         /zUaVUaOiM2X1l+NyplBHOcG0KZWI0SIBtrWEYegxajWAKI5CysLtn/cCkuqWjM5fn
         vCqmyPlEgpE8G9JBrcJWiwB/OkSvS8gm/F2Fm7aAiELyaRg145RsbmuChob6LWxAN+
         Oigglkk8d3JtXGFnS4svpTZ+F7G284iNj9r0DEXheNWoJfL0TIWKz5CDZ5UTwl0IoC
         dhw4w2TNu9yUgHNAToszUsRoX2/ht65lFlH1f4PpHJipqoX3LQrHvNSrgCiBhAvgyZ
         DirYO4J8Sf9Jw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322061754.1065367-2-punit1.agrawal@toshiba.co.jp>
References: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp> <20210322061754.1065367-2-punit1.agrawal@toshiba.co.jp>
Subject: Re: [PATCH v2 1/2] clk: zynqmp: Enable the driver if ZYNQMP_FIRMWARE is selected
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        michal.simek@xilinx.com
Date:   Wed, 07 Apr 2021 17:26:47 -0700
Message-ID: <161784160735.3790633.4474710839183921640@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Punit Agrawal (2021-03-21 23:17:53)
> When booting the kernel on zynqmp based platforms such as Ultra96v2,
> peripheral drivers such as that for the sdcard depend on the presence
> of clocks.
>=20
> Enable the clock driver if it's dependencies are compiled to avoid
> building an unbootable kernel.
>=20
> Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> ---

Applied to clk-next
