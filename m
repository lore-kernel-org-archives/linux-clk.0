Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835C6C433DB
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 07:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 516AB64EC3
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 07:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhBIHoY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 02:44:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:36854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229472AbhBIHoY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 02:44:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3327F64EBA;
        Tue,  9 Feb 2021 07:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612856623;
        bh=RsSHpxofKHBnQzI4qiCxa4IhQtmicOJUDgSvh3IidJI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XkQxOPRjgl4nvh/IG4BKRsHaDLNL4bvl+uG9oqKmA3WB3srxZ0UQZMYPYfNghHCSm
         eJUfVXC/CPmiFiRP678rjd2oQ7i/OPXBvxzW9l9NmYxaPG6HB+EpFQ1yp0V5sEuZAp
         kuGgapZEOxFHa5wQ/PxO7wdHzinF11GuasdivRobj6w8FTeOx0gifu0NS8mJ+wNAO0
         GEWY/tOaKWUoyXcBpLJdnUZN5ei0daEWB+e8K9GHar7QHy92P5dLQ91bdyoVAScOdn
         3nNukJggkShWFB1jjm3mzgnjDbHivYEYharQzTW0pNSdDbzA31R9o+hMuKs7gWqzK8
         Y2TFxs/en/+Pw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120131026.1721788-3-arnd@kernel.org>
References: <20210120131026.1721788-1-arnd@kernel.org> <20210120131026.1721788-3-arnd@kernel.org>
Subject: Re: [PATCH 2/4] clk: remove zte zx driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 23:43:41 -0800
Message-ID: <161285662197.418021.12291334320728498800@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Arnd Bergmann (2021-01-20 05:10:24)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The zte zx platform is getting removed, so this driver is no
> longer needed.
>=20
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next
