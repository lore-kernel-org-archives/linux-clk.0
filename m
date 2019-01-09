Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5456CC43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D9C8214C6
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547059116;
	bh=zAHkjSyi+jTx0DIie4pkuFbukekEgTKpSWVM0YuaOak=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=h2df4fJLIa62w9riHzmzHQJSAvJMFtQx2wmlB2p2BQB2uPRMlnR1+Bn7zF1vlgMB1
	 ZYJVLUaiTWZx3qQjsMxGuklz9ovN0ZDk/vHgOP2PqRQIR3ZJyWXpNfR2hHp9A+gKy/
	 wyxRDSFlqm7UZVxqgL5IrKOVrfQVIAQEC6ocMMtU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbfAISif (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 13:38:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:42604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbfAISif (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 13:38:35 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 00F5920657;
        Wed,  9 Jan 2019 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547059115;
        bh=zAHkjSyi+jTx0DIie4pkuFbukekEgTKpSWVM0YuaOak=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=e8SsE1qNCHJvSHwA2tc38zbYfveTMH4a3ZufmnI2f55+h4z7E2F8CPlBs+ebW49bN
         obg10Rll0Qcxct8Pt5AT89Mr0+pAZbU3h4vyat9jPromqSdtW//awLnKeSOlhIwjYB
         e6UpQqe326xBYoG/9GQsbacom7qelor/eQh87UgE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: zynqmp: Fix memory allocation in zynqmp_clk_setup
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20181224055058.GA23947@embeddedor.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <20181224055058.GA23947@embeddedor.com>
Message-ID: <154705911409.15366.7750153096311644237@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 10:38:34 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Gustavo A. R. Silva (2018-12-23 21:50:58)
> Fix memory allocation and use struct_size() in kzalloc().
>=20
> Fixes: 3fde0e16d016 ("drivers: clk: Add ZynqMP clock driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Applied to clk-fixes

And I added some words to commit text.
