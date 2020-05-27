Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4B1C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 01:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D29520DD4
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 01:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590541289;
	bh=JrTsD2iMGSvX30rQ6pUzDT7ruFhGoJkwwO5nT3DHnLA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=TBuPUDROuu6pZghLgV0kLtNyP+HBk9l1udwO2b+kdLYTG9/KZyZo6DOOd5Q8hFV2P
	 c/gfUf2NFuOMnSvfPd4szFpe6C6y8A1x1bj1nADmoorbPMSUcTvUj4ulZBM4RqqJdj
	 4kZazAR2xQSm5AqCXJiDtdF2vXqjaGIHos1ELTh4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgE0BB2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 May 2020 21:01:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:33090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbgE0BB2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 21:01:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E70632089D;
        Wed, 27 May 2020 01:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590541288;
        bh=JrTsD2iMGSvX30rQ6pUzDT7ruFhGoJkwwO5nT3DHnLA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Xh1Jo2Y4Mbkg3kJQBo5E2lYeVqbAgpqo9Onjsn1QU4qm6YWCUir0yIBPaQbBHS1MY
         0Z5oVez97RqsKUe6ruh4K4RAS5rkdpTJuSDwUE1QDfRCKzlpT00QCXvgK9sZn1ls+v
         g6p8BD9BUImzfnTkpzysszKJ4AL1VH6T9j6iDh5Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1583185843-20707-4-git-send-email-jolly.shah@xilinx.com>
References: <1583185843-20707-1-git-send-email-jolly.shah@xilinx.com> <1583185843-20707-4-git-send-email-jolly.shah@xilinx.com>
Subject: Re: [PATCH v2 3/4] drivers: clk: zynqmp: Fix invalid clock name queries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>,
        Tejas Patel <tejas.patel@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
To:     Jolly Shah <jolly.shah@xilinx.com>, arm@kernel.org,
        linux-clk@vger.kernel.org, michal.simek@xilinx.com,
        mturquette@baylibre.com, olof@lixom.net
Date:   Tue, 26 May 2020 18:01:27 -0700
Message-ID: <159054128731.88029.11937261949939343886@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jolly Shah (2020-03-02 13:50:42)
> From: Rajan Vaja <rajan.vaja@xilinx.com>
>=20
> The clock driver makes EEMI call to get the name of invalid clk
> when executing versal_get_clock_info() function. This results in
> error messages.
> Added check for validating clock before saving clock attribute and
> calling zynqmp_pm_clock_get_name() in versal_get_clock_info() function.
>=20
> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> Signed-off-by: Tejas Patel <tejas.patel@xilinx.com>
> Signed-off-by: Jolly Shah <jolly.shah@xilinx.com>
> ---

Applied to clk-next
