Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5125AC433ED
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 01:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FD156023F
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 01:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhDABsr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 21:48:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:50474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhDABsm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 31 Mar 2021 21:48:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0872F6023F;
        Thu,  1 Apr 2021 01:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617241722;
        bh=llB1PBxOwriT2KB88xNWqRmVzTqkcfQJvdyDOxSw/gc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QgH7L8Rg2ojIqlubkguMFnNLyoWe6gmH/mYl4+TwFjSxEvv5r5Sygi1J+KYPwE4O8
         Jx7OCtuCVSTIs4nvWxdIFGuNATht0+/Gl1Mnth0tcQ0A8UR7y66MGfJRgTbfCmt1yD
         memC7ZB51SH0TgPFbWOmolaY8bDOmoyyt5wUJ/73xDqxWorLjpyKRqSxcplM1OComW
         qnYY1zwnm/D4vumn9FpGWrNQfeQqErP9RpuF1Z0kTW9chcqrq2uoKJjqncICK/+Nx1
         fdJCCSp9PZzpg0jSo9p8Kpr2gTVHPKSICBU1+d+PMtL914THs1TVMFk7xd9FQ/8tCr
         uVMRvsSFqNAxg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210331090018.3464094-1-quanyang.wang@windriver.com>
References: <20210331090018.3464094-1-quanyang.wang@windriver.com>
Subject: Re: [PATCH] clk: zynqmp: move zynqmp_pll_set_mode out of round_rate callback
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Quanyang Wang <quanyang.wang@windriver.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        quanyang.wang@windriver.com
Date:   Wed, 31 Mar 2021 18:48:40 -0700
Message-ID: <161724172079.2260335.16388981768978108196@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting quanyang.wang@windriver.com (2021-03-31 02:00:18)
> From: Quanyang Wang <quanyang.wang@windriver.com>
>=20
> The round_rate callback should only perform rate calculation and not
> involve calling zynqmp_pll_set_mode to change the pll mode. So let's
> move zynqmp_pll_set_mode out of round_rate and to set_rate callback.
>=20
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> ---

Any Fixes tag?
