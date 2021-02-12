Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FE3C433E6
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 03:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8184364E3C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 03:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhBLDdP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 22:33:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:55704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhBLDdM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 22:33:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D86EA64E39;
        Fri, 12 Feb 2021 03:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613100752;
        bh=RMEFgOzFiltHrVxSKPBO9qssLaG41Z3LLQhahcVjLxE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=t6PDJ7hoA7tvuF+9wX49Wc8PnVALhoMaW4NLHvaWdQrkauj2uidrzmFeuCB45LkW9
         gXfU1Yd9cqXmJrBL/yLwd2CnPHFhp0H3lTa7PnKEVbGazxrDCglErVmZh+vDid9nXY
         eBUloANXZLYqy6dGP2+7Z1+/M79iBF5RO93rBY1SWejDst5jCpK/AxI4rOA0Rqhtmz
         37O7W9qbn/+uVpWMF7xAZEMU51hQ+hHXjaqhc0nvGRLhYj57frX8xhDZeq7INmp7zL
         toMpvkf/QUojM0KQJ2tA2AA/4xSL24M4BjBtpFoNawIEk7k7uRHr9rSdJWuHP3Cf35
         2vu+vH/Uj2zrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210125142513.3919014-1-wasim.khan@oss.nxp.com>
References: <20210125142513.3919014-1-wasim.khan@oss.nxp.com>
Subject: Re: [PATCH] clk: qoriq: use macros to generate pll_mask
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Wasim Khan <wasim.khan@nxp.com>
To:     V.Sethi@nxp.com, Wasim Khan <wasim.khan@oss.nxp.com>,
        mturquette@baylibre.com
Date:   Thu, 11 Feb 2021 19:32:28 -0800
Message-ID: <161310074861.1254594.15086479842768097422@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Wasim Khan (2021-01-25 06:25:13)
> From: Wasim Khan <wasim.khan@nxp.com>
>=20
> Use macros to generate pll_mask to make code
> more readable.
>=20
> Signed-off-by: Wasim Khan <wasim.khan@nxp.com>
> ---
>  drivers/clk/clk-qoriq.c | 62 ++++++++++++++++++++++++++++-------------
>  1 file changed, 43 insertions(+), 19 deletions(-)

The code also got longer. Why is this better?
