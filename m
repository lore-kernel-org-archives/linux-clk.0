Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7324C04EBF
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:55:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 769A0208A3
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dvo/uJGW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 769A0208A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbeLCRzj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 12:55:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:38560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbeLCRzi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 12:55:38 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 770FC20848;
        Mon,  3 Dec 2018 17:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543859734;
        bh=m1tHKWbwBs4XgefeULYe0KKf9hd0ARd4UXYq2/AmHLU=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=Dvo/uJGWozRWPNJtlf6ZhVqbq13l3//GhuF8Ter5DYs/4ChSgAlsN2+MtQUlVqBnh
         /TruquSQfyWNwyrRnZkTQ84to9Y2SlzwoRboqV9JypYEoOwtaodm2bT/dADofG7MDW
         3ouIGhgux75sY/6PJkOi5E/XYkZ73kbd6zquNL6U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181203145200.o6gnv5fhuubfgg4u@kili.mountain>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Tejas Patel <tejasp@xilinx.com>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20181203145200.o6gnv5fhuubfgg4u@kili.mountain>
Message-ID: <154385973379.88331.800153887588886721@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: zynqmp: Off by one in zynqmp_is_valid_clock()
Date:   Mon, 03 Dec 2018 09:55:33 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2018-12-03 06:52:01)
> The > comparison should be >=3D to prevent reading beyond the end of the
> clock[] array.
> =

> (The clock[] array is allocated in zynqmp_clk_setup() and has
> clock_max_idx elements.)
> =

> Fixes: 3fde0e16d016 ("drivers: clk: Add ZynqMP clock driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-fixes

