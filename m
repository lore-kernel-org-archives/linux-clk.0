Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E52C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C78464E45
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhBKT7q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:59:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:39880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230013AbhBKT7d (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:59:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9F8764E74;
        Thu, 11 Feb 2021 19:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073532;
        bh=yqabmSw3ky4+SnSU9gnfBJ4L6nA5dwv7h9Ao3lfzpnw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WTxgI/dxE8hvLy0kEAhHdK+g1IIpj5QGJhK4BAVQ6uLruQl2IUJEbEUS87iyDSe5u
         j4ArlxgUYMfFGzs08UuiiMj9TXkk9kaX/rIKX5xMLwOw5MsU9rGKFjk87RfX2WVAW/
         8a5No6cGQCn3tRoNF4md4MN7hgpQmXJ0zlhoTIapI7iMfMbCuJysqQJQ4HukWAdX1D
         XjF9WScr9JGi+EZHgLkz+oON5f+h2dzZi+ngOfcTAeimAow+SzVn+XpzZMwohGMm6p
         xxV32x66LnU/xlnPLnMZmraC+q/L4qlyaIPk2WqVN+Ic1mVlf7oUvyPAG1Ne5XGfYU
         kCHtuK20+uKrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-22-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-22-lee.jones@linaro.org>
Subject: Re: [PATCH 21/21] clk: zynqmp: divider: Add missing description for 'max_div'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:58:51 -0800
Message-ID: <161307353161.1254594.3642417051770254144@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:40)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/zynqmp/divider.c:46: warning: Function parameter or member '=
max_div' not described in 'zynqmp_clk_divider'
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Rajan Vaja <rajan.vaja@xilinx.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
