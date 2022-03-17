Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB915C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 17 Mar 2022 19:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbiCQTZE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Mar 2022 15:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbiCQTZD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Mar 2022 15:25:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DC618F225
        for <linux-clk@vger.kernel.org>; Thu, 17 Mar 2022 12:23:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 881F8B81FA4
        for <linux-clk@vger.kernel.org>; Thu, 17 Mar 2022 19:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D59C340E9;
        Thu, 17 Mar 2022 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647545024;
        bh=BEl5GS9JIMQfQ1MkCJBWVVQ6FDWSvD1QTBgcnkzcfZQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gU/c/vZyXZz07tBG7LqHE0b/FNpzYoVyBjppv/oBj+5Bd/3qLpL12ETm79CgPszR/
         ztJJ4BeXouFwUZfwCI0iJdWLaWprNDr4t6A/2GWABpg9Xd6JqB/sPHIFwx6uk7sInj
         X6t1h7w15IyGv8T3MsvhKJWYeqc+qOIODhNHtHQ+7JejsjO5gbfqwR5G/3CqUJZJHr
         RbyyY3Sw9OUSMrHqoMe1xowv2ySK/k1kU84TYRuYV32ciUX1bkVRy2hSL9cNTEwdaQ
         KRK5MnEUr2jl2fO8OD/yuPEg8UdQvoHuVKHZhpALQ8f/ymtORCjToAu7YUGuLJyNIs
         1kC/6KdeMlsdQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPDyKFrpN3+4aEqQzkQJjOT0VaNEbNhFbSWXH1uP5aNfVRYXWw@mail.gmail.com>
References: <20220313232926.1004842-1-linus.walleij@linaro.org> <20220313232926.1004842-2-linus.walleij@linaro.org> <20220315222049.DA563C340E8@smtp.kernel.org> <CAPDyKFrpN3+4aEqQzkQJjOT0VaNEbNhFbSWXH1uP5aNfVRYXWw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: ux500: Implement the missing CLKOUT clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 17 Mar 2022 12:23:42 -0700
User-Agent: alot/0.10
Message-Id: <20220317192344.45D59C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ulf Hansson (2022-03-16 03:45:29)
> On Tue, 15 Mar 2022 at 23:20, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Please use clk_hw_register()
>=20
> I was just about to send a comment like this. I assume Linus just
> tried to be consistent with the existing code in this file (which has
> turned into being quite old nowadays).
>=20
> So, I think, either we should start by converting the existing code to
> use clk_hw_register() and then make these changes on top - or we allow
> Linus $subject patch to use clk_register() and on top we convert over
> to use clk_hw_register(), for the entire file/driver. I am fine either
> way.
>=20
> Linus, I am happy to help with this, just tell me.
>=20

Sounds fine to me.
