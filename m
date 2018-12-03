Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DF7C04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A04CB2145D
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnQowJzE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A04CB2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbeLCRze (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 12:55:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:38504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbeLCRzd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 12:55:33 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79A5C20848;
        Mon,  3 Dec 2018 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543859729;
        bh=wtq8CLkNbHMUN8s1D3bx+KzQyJf7yxSXhQVK2Hl+ksc=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=VnQowJzEW/JUitW4Z88J6H02yhL7WjbPzL3bbzfvG8cYucAnFQiBvkHZLmDHhbird
         gX3e5pd7UBTlDnNPDXDa9XV4TSl7kS3UoTObl5dsWSGC1ZwKCejAuJjswUQ+lI3y9R
         por//WTuLjuJpj6uV/8wsypgGTw3VhJIUcfdnXf4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Chao Xie <chao.xie@marvell.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181203145143.qogc62x7ftx4zv4l@kili.mountain>
Cc:     linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20181203145143.qogc62x7ftx4zv4l@kili.mountain>
Message-ID: <154385972893.88331.5957151241120598045@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: mmp: Off by one in mmp_clk_add()
Date:   Mon, 03 Dec 2018 09:55:28 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2018-12-03 06:51:43)
> The > comparison should be >=3D or we write one element beyond the end of
> the unit->clk_table[] array.
> =

> (The unit->clk_table[] array is allocated in the mmp_clk_init() function
> and it has unit->nr_clks elements).
> =

> Fixes: 4661fda10f8b ("clk: mmp: add basic support functions for DT suppor=
t")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-fixes

