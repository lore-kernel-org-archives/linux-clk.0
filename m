Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B76C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AF4B2173C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555008072;
	bh=5zghQd09S+6L7Gy+aLpbQMq8BG3HYZakj4hTqCHon9Y=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=tsGc9BPGGv9MDtl4HOHd+amGSNAxTA5kEUCJVbw7B1Auy855oxIWSneoBxDxmfQ9p
	 wyus3bKVtYCGxz0yB3a/GoBqKyQZ7t8tHV0sh/wu8HWnqIbtNtOwdFmhA7+hv5mVl7
	 KIYD+vHnJ3X5SwMfCS3/Ut0I36nHaJ7n8ioEHJJs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfDKSlM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 14:41:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:54248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726649AbfDKSlM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 14:41:12 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 724172083E;
        Thu, 11 Apr 2019 18:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555008071;
        bh=5zghQd09S+6L7Gy+aLpbQMq8BG3HYZakj4hTqCHon9Y=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=VoPEhmrFFeSYH32htSY8BQlz5VLG7NXQ5qQ53lAkDT4bDqjOgQNS+8TKgsc9oZ9OJ
         WRCptmoXGjZW2bJao2EjWw8jT8m/23d6GK0Xid70qKiY73Vu3MDU9ROQlRY0vAy9ae
         P6DbLMTH7e1o6SqJLLr+jczPZTTRtRyg7CzX6CCU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190319100147.4178-3-m.tretter@pengutronix.de>
References: <20190319100147.4178-1-m.tretter@pengutronix.de> <20190319100147.4178-3-m.tretter@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/4] clk: zynqmp: do not export zynqmp_clk_register_* functions
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Message-ID: <155500807072.20095.12736243320926102509@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 11:41:10 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-03-19 03:01:45)
> The zynqmp_clk_register_* functions are internal functions of the
> driver. Only clkc.c uses these functions to register these clocks.
> Therefore, there is no need to export these functions.
>=20
> The gate and pll already don't export their register_* functions.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---

Applied to clk-next

