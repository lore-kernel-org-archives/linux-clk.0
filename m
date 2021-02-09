Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5553DC433E6
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0041B64EAC
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhBICdE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:33:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:33496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230314AbhBICdC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:33:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFAA964EBA;
        Tue,  9 Feb 2021 02:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612837941;
        bh=Ck78olGU9J7zoIbTOspHWHtEBunTqEbuseRirw9Af4o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oqx3qGBD7FLzZhGz3jPpwjj/Z60FH5BzoJtvwV9eTg9rrUUJlJKKIpeeI4mRkOpPH
         aOOPzWDv2n9fCPR9Apm6KpKmpI+GHCQ/+QrwGINYf1Eg/lGf3Nkq5+/RGuoGZZCGBN
         hT1roFs3OpRq+79wwsRNhtMdvYeZ4k9ulMU/rcvkGmUX3OKtt0wEiQx4VF+OkKowT9
         1iuLFjJurgUTlxWnkp2Mjc6TXBCjzCuaJ2zzbERmCMsRLtzKCA9wtGAFoqIixvesQa
         su1r8zgn61YEUwQNo/CkvIBOGZHdpD9S0uQMu8wYTD7tda+sDh71iKLDCW5dFc3kcp
         0nH4k8gsEmO5w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-4-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-4-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 03/15] soc: xilinx: vcu: drop coreclk from struct xlnx_vcu
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:32:20 -0800
Message-ID: <161283794070.76967.16533995630093675413@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:47)
> The coreclk field is newer read after being written to xlnx_vcu. Remove
> the coreclk field from the xlnx_vcu and use a function local variable
> instead.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
