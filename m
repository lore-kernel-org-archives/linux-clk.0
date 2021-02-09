Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE16C433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8F3264EAC
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhBICdA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:33:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:33474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230356AbhBICc7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:32:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A76A64EA4;
        Tue,  9 Feb 2021 02:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612837936;
        bh=S6iLzuGPeY+N+or/ry9M4UozdXWgz5CuOJHOn5KUZhs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XyEFF/ibOZj+a83hfkxzy3KGOgFobP9jNsa7GJjmx40XIM3O2dVAFeGxJ8KwULIzo
         /I4JvA08j4XdkiJ8d8OQK2FVcKNWVYPD5G3i3mG9AHcSLC31O7VeglJBUPMHLHC0IC
         3m05fdEk3+KJ/rhyIa8zq1/H9z4+vJqhPeLSTECepBoQ45Exw/tN4a1pF6joa5ckiz
         Nw3vMPYkxzwjNjQ+R3s1od5SLC+F3WQ3PBN3RRQsxIRmt1MASaFuip2GjeCohKqmbO
         okDTUd9IcyiyRM8aNapxQEr0azawRAEIRuEgPf5A4fHsmHGuDDCopDczlTLH3pRfBS
         JOsv+YnvtAuZQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-3-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-3-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 02/15] clk: divider: fix initialization with parent_hw
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:32:15 -0800
Message-ID: <161283793507.76967.324152230339718838@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:46)
> If a driver registers a divider clock with a parent_hw instead of the
> parent_name, the parent_hw is ignored and the clock does not have a
> parent.
>=20
> Fix this by initializing the parents the same way they are initialized
> for clock gates.
>=20
> Fixes: ff258817137a ("clk: divider: Add support for specifying parents vi=
a DT/pointers")
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
