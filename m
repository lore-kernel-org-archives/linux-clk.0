Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF49C4338F
	for <linux-clk@archiver.kernel.org>; Thu, 12 Aug 2021 19:25:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28D026103A
	for <linux-clk@archiver.kernel.org>; Thu, 12 Aug 2021 19:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhHLT0G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Aug 2021 15:26:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:38480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229950AbhHLT0F (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 12 Aug 2021 15:26:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 263FD61077;
        Thu, 12 Aug 2021 19:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628796340;
        bh=TZpepGseTcLnUXVhyS6Gwgvz2b76eNkPaJx0xby2sJs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=obB6nFB5SW0TKNn0IdrIk6UWvtxuAB6EdPEwKY3yRHwx1uMUzL4FhDO6FTLytMPPR
         AisPIrSvdvbn9QCNZi7uDqPnSHfZK4p5YLgPJaIyuMoszTmoMsCsBCmghBMMo8h7At
         SyqHjBn2gjErp8EOuu23YjAD/7ikqPZosf3ipdMy2jiVr2bSIwKtdSbRj6wAA1h36e
         fRVNKPiFvSCUiqvuB26M7HcZvWBlEf7OdqPgN6NeCIrXY40biWzM2uypTnpNgewo86
         +aHxV+fwXCtyJb2WFkUCeIoIEy/ZPnYdF4N/ejYOdUGzLKq1DyPjqeascQfAYwoTF0
         b3yT3FFTNg2Gg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210811075719.1716886-1-msp@baylibre.com>
References: <20210811075719.1716886-1-msp@baylibre.com>
Subject: Re: [PATCH] clk: Fix *bulk_get* return value documentation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
To:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Russell King <linux@armlinux.org.uk>
Date:   Thu, 12 Aug 2021 12:25:38 -0700
Message-ID: <162879633884.19113.18202513608808069954@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Markus Schneider-Pargmann (2021-08-11 00:57:19)
> Some of the bulk_get variants document that the return value is a valid
> IS_ERR() condition but it is not. These functions return an errno
> directly if an error occures.
>=20
> This patch fixes that documentation and documents that the return value
> is 0 or errno.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  include/linux/clk.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 266e8de3cb51..56a741903963 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -340,7 +340,7 @@ struct clk *clk_get(struct device *dev, const char *i=
d);
>   * that were obtained will be freed before returning to the caller.
>   *
>   * Returns 0 if all clocks specified in clk_bulk_data table are obtained
> - * successfully, or valid IS_ERR() condition containing errno.
> + * successfully, or an errno otherwise.
>   * The implementation uses @dev and @clk_bulk_data.id to determine the
>   * clock consumer, and thereby the clock producer.
>   * The clock returned is stored in each @clk_bulk_data.clk field.

While you're here can you also use the Return: syntax so it isn't
freeform and doc generation can split it out?
