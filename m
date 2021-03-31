Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6240EC433DB
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 02:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3914A619D7
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 02:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbhCaCcG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Mar 2021 22:32:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233411AbhCaCcC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Mar 2021 22:32:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E0BA619C5;
        Wed, 31 Mar 2021 02:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617157922;
        bh=k+q8TaFoKuLxinMGNfEFG+REsQxiLnl31ZVAcep92F4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nqqe7QZnzhEXPtJH9eoMxY+G0wLr4b2+MemF3yx8uaz6eaBJnXch5F4FdV8n0wlgv
         TuDRqobE0bnljOdD2vvtEmnn0PpaqaQ5BAlMO8ijnOcFKGa33V7g2lxt8Uv0++widp
         gIp0xUiTfzmkWu1QG2BsvPuNh+uUuT6mPsn3qRd9GITDKm8CUF0Zbd3ZabHteACKva
         zyAOF2Ks3UuDxRtHgTyfOII4yhJL7wsIw6BYeZ337Y6TCQiA6NFxPhM9GN8yOzTAcH
         KKyT++Nz1H2KHslYRo4AjS99HwKL9CNbrrWsgZ3GSwC91y62UmwvyENrdm7kFTpFF7
         qoJduVJk3svuA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210302214151.1333447-3-dinguyen@kernel.org>
References: <20210302214151.1333447-1-dinguyen@kernel.org> <20210302214151.1333447-3-dinguyen@kernel.org>
Subject: Re: [PATCH 3/3] clk: socfpga: Convert to s10/agilex/n5x to use clk_hw
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Tue, 30 Mar 2021 19:32:00 -0700
Message-ID: <161715792081.2260335.10703442040302436703@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2021-03-02 13:41:51)
> As recommended by Stephen Boyd, convert the Agilex/Stratix10/n5x clock
> driver to use the clk_hw registration method.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
