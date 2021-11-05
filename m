Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE09C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  5 Nov 2021 22:27:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 176FA611CE
	for <linux-clk@archiver.kernel.org>; Fri,  5 Nov 2021 22:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233376AbhKEW3z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Nov 2021 18:29:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230498AbhKEW3y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Nov 2021 18:29:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 576DA60EE9;
        Fri,  5 Nov 2021 22:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636151234;
        bh=wkcKAA5CPLc6sVm1QrPPPRn8RN7KShdtsSLOBoemL4g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=knCLS9wQzpV+K6QC+3jXZzQBiWpE7N2VXXi2I5vcNhsbsn0w+WZJ272OhND39/Rty
         jCqvFIIwGuhnKvMbpECTMICb86OHn35hU4HCl6cMf3v2KseZb1lAjk0jSgBXiasg/W
         AdC7BVfwtTxhS1rLlJCH2pwsH9iReo5eHEGHSVdfod/2al+dyWxQNtRKAeF6sYcyW1
         5VisXZq2uBuWlqYGnSTOuw9oJ38t9+0gIEgYGHruymVAn0DcEiy5aY/sTJCQCK6AG/
         XPxSFDn9kS/tDZGfxsQYOnokbptuXFYcjvR4hU60rv62xo5CxBRywxBuDm2UFnbOtK
         nN4YfrGzgu/qA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com>
References: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] clk: imx8m: Do not set IMX_COMPOSITE_CORE for non-regular composites
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Fri, 05 Nov 2021 15:27:13 -0700
User-Agent: alot/0.9.1
Message-Id: <20211105222714.576DA60EE9@mail.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Stein (2021-11-03 05:39:47)
> Only imx8m_clk_hw_composite_core needs to set this flag.
>=20
> Fixes: a60fe746df94 ("clk: imx: Rework all imx_clk_hw_composite wrappers")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Applied to clk-next
