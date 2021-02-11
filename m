Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7C5C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:53:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD0A64E5B
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhBKTxS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:53:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:36548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229940AbhBKTw0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:52:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C080464E15;
        Thu, 11 Feb 2021 19:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073105;
        bh=3GyocaC5z5Ok2h+VErVxeQ0NnYDCjrGbznwV298VfRM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FUrXvzOfuxssLcLjLSXBgqiebxKYMcEOhK3zsdTP2U8AkgyE8YnQNuYZalj/BwWsf
         y2Ies+p80BrhIT+/RQj/AyGwK/YN8hM7IiyKk/kCAcDnfoKpjaJHBZufpnZR8M84s5
         uYsSqiYelGvJzYAZMwffabnZxvvWH/WFPYn+q82aQowP9NyCUdUA550Vlqw+z5npax
         adaKVbqgbNczRk7CTMfKxLBnlEVqIMUYYxzRa/QxlpkXhDdTFqfGvovCsHlOMflo5f
         PZsOcU9SR0/ypRL8LQ9aZRBfaWfpc9oQoJRr19ZggO8IyVaADujr2ROoOepEPl0srb
         sZBpswM3D7Z3A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120093040.1719407-12-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-12-lee.jones@linaro.org>
Subject: Re: [PATCH 11/20] clk: st: clkgen-pll: Demote unpopulated kernel-doc header
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Gallimore <stephen.gallimore@st.com>,
        Pankaj Dev <pankaj.dev@st.com>, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:51:44 -0800
Message-ID: <161307310452.1254594.4196599201990630125@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-20 01:30:31)
> And remove an incorrect entry.
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/st/clkgen-pll.c:142: warning: cannot understand function pro=
totype: 'struct clkgen_pll '
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Stephen Gallimore <stephen.gallimore@st.com>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
