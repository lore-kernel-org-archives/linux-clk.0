Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20778C433DB
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D561A64EC6
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhBICdA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:33:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:33450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230326AbhBICc7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:32:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E99364E82;
        Tue,  9 Feb 2021 02:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612837930;
        bh=QvPK38stZ2jjAa/twNDRhe01CbxwuEgWlEH0VGbRpDI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iIJHFs9Ds1M8Unw3Me2T8W5m0hAonOkVSV/nSCbSjOmHFqAvKqQXLsPoD/IgXHMas
         6iSLZQyL/Y9YyuGMrLE22id1Y2NdFjICmUW86n7C9snqWGs3YOu5mEJD6kUZqmadF0
         VTZQAGRi1FZ+z61E12+MZF6UuHRZ07dwlEk8ibLv6VtaJWFeJsDMccASDAnCnL38n0
         WvocYXwytOASWwpiv0fdmBqzX3+baLvCdF411S7A/t8hQUhYhPciLyVlI/EgGxnd3A
         xQdPt3hpESyZV6JY7f5is0HktMVjhnms3DZNnwFEvP4DQgeIhV7MFCw8ntKU2tbEEL
         ji/B3WaT/cpqQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-2-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-2-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 01/15] ARM: dts: vcu: define indexes for output clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:32:08 -0800
Message-ID: <161283792892.76967.9739997471395289538@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:45)
> The VCU System-Level Control has 4 output clocks. Define indexes for
> these clocks to allow to reference them in the device tree.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
