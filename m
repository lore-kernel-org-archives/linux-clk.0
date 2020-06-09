Return-Path: <SRS0=69cD=7W=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75183C433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 19:47:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5794A2072F
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 19:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591732074;
	bh=srb+yLge4UbamThaBCnCsU4kYexMkaHc6fZIBE7XQ1o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=SFZy3mOIq19tPg02LQEBwsu4dtBuz77PlJYdTZO2kP+7ZiBkX27lqezqiZYjFe2Ww
	 mdvMLEXi7dk7MqMVySNlR9o4LB3WTlQLK7Ns25sat0+qIHT5vnDVYA8lTzSv4JFU5J
	 tKT4M7hbka3e51J6DusF7XL3bN4LlLv3P2w/CFpw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731712AbgFITry (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Jun 2020 15:47:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:34622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731711AbgFITrx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Jun 2020 15:47:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3AAB72072F;
        Tue,  9 Jun 2020 19:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591732073;
        bh=srb+yLge4UbamThaBCnCsU4kYexMkaHc6fZIBE7XQ1o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=2NZaUIxuqfyqz6g42xbgJDeALCXpo6f4kVf2AHJCqU65LFipJQsJMHIoUVjPfzzRn
         Enzq9ql2NTwXMzB2eAgdM/U/I/Sy8FcfmFzv0wDT+fxKpLScQQo6ODiv7msCNDmKFS
         jLT3i16Uh+FyFfnJczrdvY02DTdJDmb0aCMm5hg8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200609000816.23053-1-sarangmairal@gmail.com>
References: <20200609000816.23053-1-sarangmairal@gmail.com>
Subject: Re: [PATCH 0/1] Lockdep assertion caught with clk_hw_round_rate()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sarang Mairal <sarangmairal@gmail.com>
To:     Sarang Mairal <sarangmairal@gmail.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 09 Jun 2020 12:47:52 -0700
Message-ID: <159173207255.242598.9143213917467037420@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sarang Mairal (2020-06-08 17:08:15)
>     [    1.193083]
>     [    1.193088] Call trace:
>     [    1.193092]  clk_core_round_rate_nolock+0xd4/0xe0
>     [    1.193096]  clk_hw_round_rate+0x4c/0x80
>     [    1.193101]  clk_populate_clock_opp_table+0x16c/0x320

Presumably this is DVFS from the clk driver? We've been over this many
times before. Don't do it.

>     [    1.193105]  devm_clk_hw_register+0x88/0x9c
>     [    1.193110]  devm_clk_register_regmap+0x54/0x60
>     [    1.193114]  qcom_cc_really_probe+0x110/0x204
>     [    1.193119]  gpu_cc_sm8150_probe+0x1e0/0x248
>     [    1.193125]  platform_drv_probe+0x5c/0xb0
>     [    1.193129]  driver_probe_device+0x2ec/0x420
>     [    1.193132]  __driver_attach+0x9c/0x120
>     [    1.193137]  bus_for_each_dev+0x8c/0xd4
