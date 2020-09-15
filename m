Return-Path: <SRS0=RhxI=CY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9670C2BBD1
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2475212CC
	for <linux-clk@archiver.kernel.org>; Tue, 15 Sep 2020 00:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600130537;
	bh=+eBiPWtisKSOBNoDvftUDv6/9NvioRdnaf75WqJ/MW4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=DLuPlO2m/l95aw1AGlcVTb3p5kNXv4mVYn3UFK/XDpy8tiZv0aJsUbtdswmg5Df8q
	 l6AptGrWX7kOolNVBasFYoOBoVJVGPof88wx8QvmUBgrBtNqUvTEA94LMvNe4mjGuc
	 so++voS7Yerw93QuCPFjhy9pDC4wNJp7LkML4Ng4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgIOAmN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Sep 2020 20:42:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:39246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725994AbgIOAmH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Sep 2020 20:42:07 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDD6B216C4;
        Tue, 15 Sep 2020 00:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600130526;
        bh=+eBiPWtisKSOBNoDvftUDv6/9NvioRdnaf75WqJ/MW4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lm8vFh7zBgfGHTUcoYyY3pO3vxIM3fWEIrPDQvyciUdcIEjPbaw2sJH1sq+Bom4vr
         FJbvS1zGuHdSSPz/G/GBBk2Ja0O0Pd4TN4QcSRNqnbH/PTBHtBpjhtUOOjy6qKZwJi
         bk3pAIeK8md8seUaYQUWjj66Fljs3mUPWJ9vNVjQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200914022225.23613-4-zhangqing@rock-chips.com>
References: <20200914022225.23613-1-zhangqing@rock-chips.com> <20200914022225.23613-4-zhangqing@rock-chips.com>
Subject: Re: [PATCH v4 3/6] clk: rockchip: Export rockchip_register_softrst()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
To:     Elaine Zhang <zhangqing@rock-chips.com>, heiko@sntech.de
Date:   Mon, 14 Sep 2020 17:42:05 -0700
Message-ID: <160013052566.4188128.15928428507087082730@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2020-09-13 19:22:22)
> This is used by the Rockchip clk driver, export it to allow that
> driver to be compiled as a module..
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Reviewed-by: Kever Yang <kever.yang@rock-chips.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
