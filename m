Return-Path: <SRS0=nM/p=BC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383BEC433E3
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jul 2020 08:00:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13EAE206C1
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jul 2020 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595491230;
	bh=pGPzKcuxyGWKLdWYejxg6swYecMJYtb1UVby11vpLuc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=AUUaRdQ9yVf+rA8iE6GXpFQv2pR9tHekrYlbdgNaWTmAcowDfMi2G8bszw6pLSzpR
	 GIijZ5SXTl/CzRNWtwuR0NvN8RnolJlmBczEL7a90tYtbq1kd/a6yMlwWBzdp5gMpW
	 Sj77gZDJl/C3aTMzT8cHVHynQA5SBRVmtkFcLsMM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgGWIA3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jul 2020 04:00:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:36322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgGWIA3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 23 Jul 2020 04:00:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5022E20658;
        Thu, 23 Jul 2020 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595491229;
        bh=pGPzKcuxyGWKLdWYejxg6swYecMJYtb1UVby11vpLuc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=c6n+TYUaT0ZE53JgEcwjf8udTqdOXU0aRCxWxyqMHbsavWMFUhpi12C3uW4r+2+m3
         +Sv/86FGezUOLUJO3xmNjxaPZVZ+dY7GpbjGJ0FME+DbXRJFCsDtTQ7cw2dSXHQnVC
         y4GaJUskQwReZC5HzoUWli4tf/WETSlszGylhWWA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3212743.Cm9O4y8ZXk@phil>
References: <3212743.Cm9O4y8ZXk@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.9
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Thu, 23 Jul 2020 01:00:28 -0700
Message-ID: <159549122852.3847286.1522918168884370729@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2020-07-22 16:42:33)
> Hi Mike, Stephen,
>=20
> please find below Rockchip clock changes for 5.9
>=20
> Please pull, thanks
> Heiko
>=20
> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c74=
07:
>=20
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.9-rockchip-clk1
>=20
> for you to fetch changes up to ef990bcad58cf1d13c5a49191a2c2342eb8d6709:
>=20
>   clk: rockchip: add sclk_mac_lbtest to rk3188_critical_clocks (2020-07-2=
2 20:05:19 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
