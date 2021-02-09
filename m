Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B516C43381
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26CE464E82
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhBICdI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:33:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:33518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhBICdI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:33:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F48864EB4;
        Tue,  9 Feb 2021 02:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612837947;
        bh=RH7a+3uu233gEbbW33Up1EEnS9mrQ67SYI1UcHB+S3k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gWUS5CLd0u3a3hzyZ4R/2po2ODUiGJuxPwOI+GWLsappxRTChVtpmegwJORMHzUgZ
         tmt9Tnul5pg8nBnOdk/wMSUjIo9KDPvWV8xXCFxI12lMrPd2oa0Y/J0npiqdu4+lHj
         PNQGhMH9dMWJ1c11733puYTy3ZiJuQGsfVEpibVV0QN0Dd9a8/22t8u+71zqqdgSGN
         cLPaGQOf/7JJabFCsHNV6XxDSAgxrtwfyrRHMWGy6BIEwXZdO9arQOzH1DDC8oTdbu
         MQoVbOdvg9HmNG5/QMJo6eJM9PpRH/fb+fYHJu8y3XjRhicUbV4qi8VfqRYbW4xlLt
         nelexX9o2pWhQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-5-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-5-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 04/15] soc: xilinx: vcu: add helper to wait for PLL locked
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:32:25 -0800
Message-ID: <161283794563.76967.155861429844640781@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:48)
> Extract a helper function to wait until the PLL is locked. Also,
> disabling the bypass was buried in the exit path on the wait loop.
> Separate the different steps and add a helper function to make the code
> more readable.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
