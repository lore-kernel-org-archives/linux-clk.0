Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD49C433E6
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:37:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D08364F99
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 01:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhCQBgx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Mar 2021 21:36:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230236AbhCQBgd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Mar 2021 21:36:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57CB164F97;
        Wed, 17 Mar 2021 01:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615944993;
        bh=FZgfTha48+8fEpkTBH9H3veXQK0JI2YdcPNLkNruT/M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hP2a9k1y38HPYB4uzyW9VPwRCSh+ChjAyMH759aWt7AKxpm/VtW+0boTC90b4YiYI
         j+ybwX07XSEHHFjAHgJtO74TbjhxIpLf/6YUp308xeSL0/dvX/Ny2ulgu7ftwmUvG9
         vaSY/qN/5DQfvJE4Slef3wKZeCSyc1RUnfqpSChWIJd5JW/7cY/yRnk3siMMGxZaXb
         dNFQAgHWymxwsruDnTlMHPuVhiJ7NZRkCI4MRh7XSUHacbXVHAUZFCajFPP25YE2GD
         CoxPZPYJLzx1uepFRxQObli31TEMSjh5vjARYzShiRz7mk4E8BAqAdBlQvShO4QwNK
         nbrf9VoFC8JQw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210315112502.343699-1-heiko@sntech.de>
References: <20210315112502.343699-1-heiko@sntech.de>
Subject: Re: [PATCH 1/2] clk: rockchip: drop parenthesis from ARM || COMPILE_TEST depends
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, zhangqing@rock-chips.com,
        mturquette@baylibre.com, linux-rockchip@lists.infradead.org
To:     heiko@sntech.de
Date:   Tue, 16 Mar 2021 18:36:32 -0700
Message-ID: <161594499215.1478170.15629079546863596316@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-03-15 04:25:01)
> As suggested by Stephen in the series adding the rk3568 clock controller
> the depends works just as well without the parenthesis around the depends.
>=20
> So to make everything look the same, drop them from existing entries too.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
