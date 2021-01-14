Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2BCC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 19:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4A4C2343B
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 19:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbhANTvI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jan 2021 14:51:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:35444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730066AbhANTvI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 Jan 2021 14:51:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 959552343B;
        Thu, 14 Jan 2021 19:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610653827;
        bh=fGRfb+uzvSfVtSrTeW0rJPLOJ7N2m6M0yi2blEq2sWQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YG+D7Q9QAN2GUysBFmcjGi4pVyq11MhdSb9QD+DKCYTTCXWbTRpmwA32ioBmgwkYt
         1QBLjucKL9lqqQDiV3ZqzwDmA22TtvIQKDBCbu2fj5DPm4LFCGGdS9M8yZ3n+4bo0T
         q1A3PUCaRnha4GlnnK1wkCxJ+bsqTg7rZ6eopJFeIn6aaHcbL02wXFM1NoIBThsV4I
         RiJuVwqHbZKuW+VhrruRD/ELVmIVoRslqvNzsb8B+upF5YQEevubsBFl6ICxC+hUJV
         k5HS5SDLsRwBbSBv9Y2TJ6eYWCzNREukpl+tY/2gS3LvyVhANhBnn+NcFpNyR6ZwLK
         QVD/fiJ/JHWOg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1610542388-12078-1-git-send-email-abel.vesa@nxp.com>
References: <1610542388-12078-1-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH] MAINTAINERS: Add section for NXP i.MX clock drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Thu, 14 Jan 2021 11:50:26 -0800
Message-ID: <161065382626.3661239.1937640801346146443@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2021-01-13 04:53:08)
> Add a section for NXP i.MX clock drivers and list myself
> as the maintainer.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
