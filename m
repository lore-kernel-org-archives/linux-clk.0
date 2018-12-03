Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E9DC04EBF
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD54B208A3
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:55:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyPCsGMV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD54B208A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbeLCRzV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 12:55:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:38406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbeLCRzU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 12:55:20 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C389120848;
        Mon,  3 Dec 2018 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543859716;
        bh=CzZaEFZGyNEwmcdZRujda2YF60qgd0s685ZUwcuvggw=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=pyPCsGMV/0Dyt7dDJoMLx0Oa2IwgPdZ5Zz7nSFz//PcK/1kNoTSjtsbCd160ycFyu
         C1SL47R8dkZjd3twaOFw1HYCqdapuMNj9VOCgIbkP+C9Eq4Yp3tTsJoWKWlAwDRvB/
         nUBocaFQJClL4YkuXoEltEo8uAWJIn1alrupIy9E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181203145055.4fvrmy3c4zyocgsx@kili.mountain>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20181203145055.4fvrmy3c4zyocgsx@kili.mountain>
Message-ID: <154385971618.88331.15503515631878065127@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: mvebu: Off by one bugs in cp110_of_clk_get()
Date:   Mon, 03 Dec 2018 09:55:16 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2018-12-03 06:50:55)
> These > comparisons should be >=3D to prevent reading beyond the end of
> of the clk_data->hws[] buffer.
> =

> The clk_data->hws[] array is allocated in cp110_syscon_common_probe()
> when we do:
>         cp110_clk_data =3D devm_kzalloc(dev, sizeof(*cp110_clk_data) +
>                                       sizeof(struct clk_hw *) * CP110_CLK=
_NUM,
>                                       GFP_KERNEL);
> As you can see, it has CP110_CLK_NUM elements which is equivalent to
> CP110_MAX_CORE_CLOCKS + CP110_MAX_GATABLE_CLOCKS.
> =

> Fixes: d3da3eaef7f4 ("clk: mvebu: new driver for Armada CP110 system cont=
roller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-fixes

