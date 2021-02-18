Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D080EC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 09:23:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86A2F6146D
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 09:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbhBRJXT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 04:23:19 -0500
Received: from mail.manjaro.org ([176.9.38.148]:43728 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231693AbhBRJUH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Feb 2021 04:20:07 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.manjaro.org (Postfix) with ESMTP id A82EA3E60036;
        Thu, 18 Feb 2021 10:18:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OJqSfgt5Bh4M; Thu, 18 Feb 2021 10:18:42 +0100 (CET)
Subject: Re: [PATCH] clk: sunxi-ng: v3s: add support for variable rate audio
 pll output
To:     Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <maxime@cerno.tech>,
        Tobias Schramm <t.schramm@manjaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20210212135725.283877-1-t.schramm@manjaro.org>
 <20210218075835.o43tyarpimrcwbvk@gilmour>
 <C1E55B65-370F-4875-B7D6-7CD7A82A91DD@aosc.io>
From:   Tobias Schramm <t.schramm@manjaro.org>
Message-ID: <914aeb08-0534-48aa-2c2e-4e87d4360e29@manjaro.org>
Date:   Thu, 18 Feb 2021 10:18:39 +0100
MIME-Version: 1.0
In-Reply-To: <C1E55B65-370F-4875-B7D6-7CD7A82A91DD@aosc.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Icenowy,

 > We have introducee SDM-based accurate audio PLL on several
 > other SoCs. Some people is quite sensitive about audio-related things.
 >
While it is possible to support 24MHz * 128 / 25 / 5 = 24.576MHz without 
delta sigma modulation, matching 22.5792MHz is indeed not possible. I 
read you'd prefer me to use SDM like the other SoCs though? Shall I send 
a v2 utilizing SDM?

Cheers,
Tobias
