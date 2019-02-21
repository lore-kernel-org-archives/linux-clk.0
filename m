Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3CFC00319
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 21:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F11A92083E
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 21:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550785858;
	bh=h6oZyCtlYLrGZq8wIDGwta/uWRrekXkscDhXsehQGP0=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=c0MmgWGroqaCaKiWY9bwXcmIkJb2eFXjJK+loFuCQ3wjyMw4+DgIuN8RnAbWma74z
	 QMyFvsk4RHgDliF9Swg+Je9IvOjyhEvmGS/hBedmv9xUo016AfgCbTMARnpf2lb/Od
	 9UWk+kJ0qxTX643Xc/LNniC60BeZNm4X/p6mrSR8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfBUVu5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 16:50:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:56300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbfBUVu5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 16:50:57 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7690B2080F;
        Thu, 21 Feb 2019 21:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550785856;
        bh=h6oZyCtlYLrGZq8wIDGwta/uWRrekXkscDhXsehQGP0=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=T188J0YVNc0dIoMKTxgimFU8KK7aYmHL73lf4Be/lVqHSlik0ukgHhSi7wh0T2a99
         zo+U/jzSzoR1DiAappPqkxuNTWk73ypdTW8oFvn1+N09oWo0fEwtYInEDso4hmtmXb
         9e5NQVXX+ALS2WS1XdGkCirMdS+uNDZgjUvbzJTs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: uniphier: Fix update register for CPU-gear
Message-ID: <155078585575.77512.3010881838838127902@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1549592723-18494-1-git-send-email-hayashi.kunihiko@socionext.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1549592723-18494-1-git-send-email-hayashi.kunihiko@socionext.com>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        linux-stable@vger.kernel.org
Date:   Thu, 21 Feb 2019 13:50:55 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kunihiko Hayashi (2019-02-07 18:25:23)
> Need to set the update bit in UNIPHIER_CLK_CPUGEAR_UPD to update
> the CPU-gear value.
>=20
> Fixes: d08f1f0d596c ("clk: uniphier: add CPU-gear change (cpufreq) suppor=
t")
> Cc: linux-stable@vger.kernel.org
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---

Applied to clk-next

