Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF0FC433DB
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:37:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 989A264DE8
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhBICha (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:37:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:34354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231199AbhBICgd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:36:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDCBD64EC3;
        Tue,  9 Feb 2021 02:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612838138;
        bh=6Y5iD0gee0DTauI8STNAeSd/353XAHSXWhgwNPxws2c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WGmfX1HMbdka260IwJXs+6AWZ9rigHxlG0qtNkc3neogkKj862rTPUz29sO4TGwuZ
         fB4nAlJW7PFaBUF4UZHh4DrOVEx6fyzcJYE4KZ7D1sjlMOgdzGMUGShEcAtSpHqLvo
         oLqHcwsd9FOp5gXEheVkiNlbFzUO7LUY/th3PYOINm2XFKcvx3NliwGmfqx3pAryLk
         rCmK+l7FyfCod/1KojYCQ79nDFltxRoD0fEg1MW6Hy+IBi2sLAUbwQAGozHm5cnjiq
         M6yuPk1TgPovJcKrQe8dqSBiXwa+EwbdlfixE2n05r1VADPYnBBZJugRQWf7FH9rN9
         l903aeF7hmf0g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-14-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-14-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 13/15] soc: xilinx: vcu: fix repeated word the in comment
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:35:36 -0800
Message-ID: <161283813679.76967.2793200013387177753@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:57)
> Fixes the following checkpatch warning:
>=20
>         WARNING: Possible repeated word: 'the'
>         #703: FILE: drivers/soc/xilinx/xlnx_vcu.c:703:
>         +       /* Add the the Gasket isolation and put the VCU in reset.=
 */
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
