Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ECBC43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 387B520836
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 20:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550781894;
	bh=UtI9MJV/kzN3+zq9QLlWk5QQr4uns4VCMffVh4P15s0=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=cuBVjFeRGAJUdb4aULmqBJewY082kyNyN5Ww/ENCAxrqnu4rj/pGzz3FDoRNaYOJV
	 7s7yVeVl6dlXVkjGVt2Ia0nuewman/RZ4NL4ILR/eN67Obr9Fmg9s66W7UGI6YZ7x8
	 4OuXJ6th/95z1ILKROuGhkeqaE0igA3tvToOkSd8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfBUUoy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 15:44:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:45700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUUox (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 15:44:53 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 584F5206C0;
        Thu, 21 Feb 2019 20:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550781893;
        bh=UtI9MJV/kzN3+zq9QLlWk5QQr4uns4VCMffVh4P15s0=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=ulrEh7IFuc29MGfe5zz7rG4T/WmUR/kbA6KKLXsoFeh4cYcR1xsATTo06azncvqd8
         hKJIyqGHoNUYmTBp9YrtpjHdGTUyHLOGfbcS14XMAx7nxF3jUSbL5VI3B+9AO//rzG
         6zbydBXvSsDG9ojQ7iAIivwKGrMYlvzp8N5QUdPE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: imx8mq: Fix the CLKO2 source select list
Message-ID: <155078189263.77512.18004354775400355628@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190130192102.7065-1-festevam@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190130192102.7065-1-festevam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        rogerio.silva@nxp.com, Fabio Estevam <festevam@gmail.com>
Date:   Thu, 21 Feb 2019 12:44:52 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2019-01-30 11:21:02)
> The CLKO2 clock source select list is the following as per the i.MX8M
> Reference Manual:
>=20
> 000 - 25M_REF_CLK
> 001 - SYSTEM_PLL2_DIV5
> 010 - SYSTEM_PLL1_DIV2
> 011 - SYSTEM_PLL2_DIV6
> 100 - SYSTEM_PLL3_CLK
> 101 - AUDIO_PLL1_CLK
> 110 - VIDEO_PLL1_CLK
> 111 - 32K_REF_CLK
>=20
> However, in imx8mq_clko2_sels[] only the first four entries are correct.
>=20
> Fix it by adding the missing "sys3_pll2_out" entry in order to match
> the description from the manual.
>=20
> Fixes: b80522040cd3f ("clk: imx: Add clock driver for i.MX8MQ CCM")
> Reported-by: Rogerio Pimentel <rogerio.silva@nxp.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Applied to clk-next

