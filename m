Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A19C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:53:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ACD064E44
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhBKTxU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:53:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:36574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230073AbhBKTwe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:52:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C54A664E44;
        Thu, 11 Feb 2021 19:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073113;
        bh=K/hY5wVeIwYX5AlxTPUqycqd1GGGOBH+wQu7HORNDRc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QAxVqIHq0W3ZVr86OmizDDxR6jBdjsimnX1OH4Q1grGhozCVFTupqsjcu43vLCaar
         yCzj2IpcK2MQFaSiBPbqx2K1pogGKd55F/XSRbBcvDJcynADu5AYUJar5M9brfxlFS
         6wRIz+shzyIjdPnAQc15Vio8Iu39HjmOMz/Y+BfuyyoG4aw2FfH+WV5ZENL+4jWvgR
         DnA8z2xxpLCihp2T0KWvpYX1dO7Dd45759yZ6jZjCjZd68MU0QmKept8BiiWUZ1t/l
         H6weIpikhwy4BjnI4FT6LWyFWINO8sI4vmsN9lOHg7Dkp1VINF8ySp1Dk2DpofbWpr
         RYzBaM7IOgOZw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120093040.1719407-13-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-13-lee.jones@linaro.org>
Subject: Re: [PATCH 12/20] clk: st: clkgen-fsyn: Fix worthy struct documentation demote partially filled one
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Kees Cook <keescook@chromium.org>,
        Stephen Gallimore <stephen.gallimore@st.com>,
        Pankaj Dev <pankaj.dev@st.com>, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:51:52 -0800
Message-ID: <161307311268.1254594.6065734191013956676@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-20 01:30:32)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/st/clkgen-fsyn.c:186: warning: Function parameter or member =
'data' not described in 'st_clk_quadfs_pll'
>  drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member =
'regs_base' not described in 'st_clk_quadfs_fsynth'
>  drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member =
'lock' not described in 'st_clk_quadfs_fsynth'
>  drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member =
'data' not described in 'st_clk_quadfs_fsynth'
>  drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member =
'chan' not described in 'st_clk_quadfs_fsynth'
>  drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member =
'md' not described in 'st_clk_quadfs_fsynth'
>  drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member =
'pe' not described in 'st_clk_quadfs_fsynth'
>  drivers/clk/st/clkgen-fsyn.c:466: warning: Function parameter or member =
'sdiv' not described in 'st_clk_quadfs_fsynth'
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Stephen Gallimore <stephen.gallimore@st.com>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
