Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1252BC433ED
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 20:04:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDCE161221
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 20:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237674AbhDLUFO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Apr 2021 16:05:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:40474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237103AbhDLUFO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Apr 2021 16:05:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECC6A6121F;
        Mon, 12 Apr 2021 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618257896;
        bh=YY9pKz2vlhmxdkKlhUIcO4njNqcmfLlMsmhh2me8RrY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XPutQQbLgcBF/3gznPrDZs/wm+xdjEMA+c3FbSJxPbkd1caWmmruW/QmmcWvi7ptA
         XxXtn3wcM6zGETB/M0zNsWJmv2cu9BMOKMKd3lGt5BGJn49toMCY2mI3yGulf0XOsi
         X1L+rKKcPYgBeDVmljvPOw5QA+EIzybn/y5/zm9WNkaZ23msFyrD6AxANsvUu6Jhnr
         LrM33axZDcxatv5vkHAZw5dw3T0/BQ/3DTTlTcbT3enI7BQlGkpPqrg+7M+Y2zvH4m
         rwT9jJHR8s1nJn1cPEVTstNRdyyV7Dn3kmEuVaQFtROUtNkaf99wB8IwlkK2iziPj2
         lE2KASY6aUYNg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5450499.DvuYhMxLoT@phil>
References: <5450499.DvuYhMxLoT@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.13
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Mon, 12 Apr 2021 13:04:54 -0700
Message-ID: <161825789457.3764895.15448626758621267117@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-04-11 02:42:05)
> Hi Mike, Stephen,
>=20
> please find below Rockchip clock changes for 5.13
>=20
> Please pull, thanks
> Heiko
>=20
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab=
15:
>=20
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.13-rockchip-clocks
>=20
> for you to fetch changes up to 40f29839d8bef5aecaa772afa8e5f2ff8434b49f:
>=20
>   clk: rockchip: drop MODULE_ALIAS from rk3399 clock controller (2021-03-=
21 11:13:30 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
