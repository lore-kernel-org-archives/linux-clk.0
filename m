Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECBFC433E9
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B6C364DE8
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBIChh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:37:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:34356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231204AbhBICgd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:36:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEC0264EC9;
        Tue,  9 Feb 2021 02:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612838143;
        bh=c8N/CvFQdVkcuDF3WhwxY6VqjMPrrNC0DGM6PeXwV9w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oDdhzq76nMsU7UnehOEAuhJJuhP8qUmrY+GJ8CnLMPjU8EDIV9poLnbys03w29MRE
         uoWcDtCRew2sOr4hxVa9LNhXQVwImnHbNXBAtMmlpxmvjoYAYPgkSbsGczSqiocYdX
         w0pmULcIsOADj5rCTvlZvDOOXxU3cIn1cGfutQC370foOp+PCjQiYHZPpxGu5Y327p
         FaDFne0g9Z5fyLNXNwAwnFGv56PLRXB65FFa+hgiGP9nksnpmMlY46OWErXamw1F2Z
         SMH1pXpTn4xNFtagYjr+90VCU2U4uFKHy9hcFO0m5/sNmahKitLHqQgh5Aq44HUeEy
         XSk/9HqSRja+A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-15-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-15-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 14/15] soc: xilinx: vcu: fix alignment to open parenthesis
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:35:42 -0800
Message-ID: <161283814264.76967.14898594710478800771@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:58)
> Fixes the following checkpatch check:
>=20
>         CHECK: Alignment should match open parenthesis
>         #610: FILE: drivers/soc/xilinx/xlnx_vcu.c:610:
>         +       xvcu->vcu_slcr_ba =3D devm_ioremap(&pdev->dev, res->start,
>         +                                                resource_size(re=
s));
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
