Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1233CC48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:08:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D248E2086D
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 23:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561504129;
	bh=+7gD6UcDw7O0WDPqhEgoReqjFVO8K+id601YM56G/0k=;
	h=In-Reply-To:References:To:From:Subject:Cc:Date:List-ID:From;
	b=XuReQopq2eTdkNzLoNu61Q916NNBDLz3V+XEB7SktYqVKopORJKUipNfOoooLmKsw
	 9EL0ZCnDLgArNzDYJAXQs5IG28fKueZ6KV+MR0T+Zuz7Gtt7M53qEX2LKz0GW58wup
	 c9gpFnc89GIo9A6P68Ua+pTW5+yn7IrvR2Bxy9jc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbfFYXIt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 19:08:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfFYXIt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 19:08:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C28CB205ED;
        Tue, 25 Jun 2019 23:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561504128;
        bh=+7gD6UcDw7O0WDPqhEgoReqjFVO8K+id601YM56G/0k=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=kgUSLpB1cYRRMNOG7SwTBxVfTpXg/EzJMLon2DQ37iqKRC7N9//UcXeRrds3QDcHx
         x8XMnhjczjNu2VPC/HSbbuDy9JYNm3N+0O5Y71l5IjX8rmKxw2i8lwc0O7DSDedtX6
         cMwAv9nrDYW2iN5grQanVQbYM7dK/rfKN59sUfMk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190612031434.10055-1-jckuo@nvidia.com>
References: <20190612031434.10055-1-jckuo@nvidia.com>
To:     JC Kuo <jckuo@nvidia.com>, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        pdeschrijver@nvidia.com, thierry.reding@gmail.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: tegra210: fix PLLU and PLLU_OUT1
Cc:     JC Kuo <jckuo@nvidia.com>
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 16:08:47 -0700
Message-Id: <20190625230848.C28CB205ED@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting JC Kuo (2019-06-11 20:14:34)
> Full-speed and low-speed USB devices do not work with Tegra210
> platforms because of incorrect PLLU/PLLU_OUT1 clock settings.
>=20
> When full-speed device is connected:
> [   14.059886] usb 1-3: new full-speed USB device number 2 using tegra-xu=
sb
> [   14.196295] usb 1-3: device descriptor read/64, error -71
> [   14.436311] usb 1-3: device descriptor read/64, error -71
> [   14.675749] usb 1-3: new full-speed USB device number 3 using tegra-xu=
sb
> [   14.812335] usb 1-3: device descriptor read/64, error -71
> [   15.052316] usb 1-3: device descriptor read/64, error -71
> [   15.164799] usb usb1-port3: attempt power cycle
>=20
> When low-speed device is connected:
> [   37.610949] usb usb1-port3: Cannot enable. Maybe the USB cable is bad?
> [   38.557376] usb usb1-port3: Cannot enable. Maybe the USB cable is bad?
> [   38.564977] usb usb1-port3: attempt power cycle
>=20
> This commit fixes the issue by:
>  1. initializing PLLU_OUT1 before initializing XUSB_FS_SRC clock
>     because PLLU_OUT1 is parent of XUSB_FS_SRC.
>  2. changing PLLU post-divider to /2 (DIVP=3D1) according to Technical
>     Reference Manual.
>=20
> Fixes: e745f992cf4b ("clk: tegra: Rework pll_u")
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---

Applied to clk-next

