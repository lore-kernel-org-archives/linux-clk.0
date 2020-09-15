Return-Path: <SRS0=RhxI=CY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3421BC43461
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:42:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07727216C4
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600130556;
	bh=tSvYgWITG618ScNZPrYOvOWrjyVMTzt5zAq+Wo9njl8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ZG4cBmT1pvl3gdyYg+VzGApiRQegW2EG7tD7J4Lt75ib9pyTgScrkdINyKBo+BwKL
	 arXMuzIEZIGfv9HNEZ6OFKXzRYj5BmTPLQGIPdiqmI32HXb/ZDZxtyE087YbDkBAFG
	 mMqopFF1o/xAUGutAzS/OwhYgHBKOq4K+HrCxZJg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgIOAmf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Sep 2020 20:42:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:39556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgIOAmf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Sep 2020 20:42:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D81921655;
        Tue, 15 Sep 2020 00:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600130555;
        bh=tSvYgWITG618ScNZPrYOvOWrjyVMTzt5zAq+Wo9njl8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kCjf7Vy1ZkQ1cWEK7IMybM7mXN4k7TK1jwJpUAB8lPlCM5aUxhhi3oPCGsODPi5cG
         Pw157t9GLeXNiYG6+WiWg40x91mjXDDmr8O3mtpSPZplv5IFlrWJZ8Mlmy6bL8RV8c
         VHE3CtTLhNbmoiaqN0XDhGiS3wm2mlf/1RaNUzig=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200914022316.24045-1-zhangqing@rock-chips.com>
References: <20200914022225.23613-1-zhangqing@rock-chips.com> <20200914022316.24045-1-zhangqing@rock-chips.com>
Subject: Re: [PATCH v4 6/6] clk: rockchip: rk3399: Support module build
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
To:     Elaine Zhang <zhangqing@rock-chips.com>, heiko@sntech.de
Date:   Mon, 14 Sep 2020 17:42:33 -0700
Message-ID: <160013055393.4188128.10814302034407989418@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2020-09-13 19:23:16)
> support CLK_OF_DECLARE and builtin_platform_driver_probe
> double clk init method.
> add module author, description and license to support building
> Soc Rk3399 clock driver as module.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
