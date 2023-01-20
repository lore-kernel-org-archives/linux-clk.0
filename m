Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98408C05027
	for <linux-clk@archiver.kernel.org>; Fri, 20 Jan 2023 22:20:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjATWUT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Jan 2023 17:20:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjATWUR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 17:20:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28069707FB
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 14:20:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6C5D0B82A94
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 22:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08932C4339B;
        Fri, 20 Jan 2023 22:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674253208;
        bh=u8TlcnpEFHkJ0OrUfCwiVsC5qsW8Ag9yzBUNjZyzS6E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BG1K4GzZZQlxRTlkn9DbvQueucfM7Fv3XlRziJOb7/swvNC6Ac3WATo34nOpQLXCW
         v/nvyPjrzIKSaeVqm00WkD+f+jTzNaN4yex/lBzta4raHPAkmFQJ/Y75FMRMhX4PUp
         8nu9M9LU8Ijwy8Ea8aB8H1l1BZkWL76+w+EXST4vMiKmkWsRKRMwhNLWkysHV6jaBI
         5AbVFnfQJx+Q6G8pGopLUo5zoj7WtT5v8407wQIJmKYZaDhQ25uH2a3Z7zjyZIZDLf
         WFAK7XNH/DG5Tjw0QuBwYCYK2V0yVBaTgkU3GGji55tqJ00LhV/SRaCD4+OoAOicaT
         kb+odCZlDpAZQ==
Message-ID: <13894482caafa864dc09628b1d2d1e4f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230119113551.43887-1-claudiu.beznea@microchip.com>
References: <20230119113551.43887-1-claudiu.beznea@microchip.com>
Subject: Re: [GIT PULL] Microchip clock fixes for 6.2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        conor.dooley@microchip.com, linux-clk@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        mturquette@baylibre.com
Date:   Fri, 20 Jan 2023 14:20:05 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2023-01-19 03:35:51)
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71=
c2:
>=20
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-fixes-6.2
>=20
> for you to fetch changes up to 86d884f5287f4369c198811aaa4931a3a11f36d2:
>=20
>   clk: microchip: mpfs-ccc: Use devm_kasprintf() for allocating formatted=
 strings (2023-01-19 11:45:35 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
