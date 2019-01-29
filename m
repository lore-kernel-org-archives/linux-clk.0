Return-Path: <SRS0=lEqg=QF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50161C169C4
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 22:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 195A320870
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 22:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548801850;
	bh=sXupBd+kt8SPDHbQLKnpDGftJVp7wFIWoGb62mUl1OQ=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=Swdouo4gWSh2uTqOoRpzLVgWyIuTz5AAxmivmhd2kvg8NvuTVBUnyMfXCogEdqMRa
	 U3MmcpOR4sa8BtfZPGzUNqDh3Xo/TFuSzkKYNtBk9W63apAroge8SAUgNy5n0FYSZJ
	 G63e2pDoc3zkA+o4dkZoabLjEv7/pbthR8PdgEPQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbfA2WoJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jan 2019 17:44:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:49518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbfA2WoJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jan 2019 17:44:09 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B1962147A;
        Tue, 29 Jan 2019 22:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548801778;
        bh=sXupBd+kt8SPDHbQLKnpDGftJVp7wFIWoGb62mUl1OQ=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=r2izNZAK/P/SqZs1TG3szKHr71MIbbpJQF2hV26geVsIKEX2caS4lrbFpTfrHYv+0
         qW90V9uS/Skode1lfcipK5BTh1Xqb2x0z6IVqYvLhXNNcqF54UkHhPN5zA3MW2TnLR
         2EQlDH1baSxYzc0ACugi4bPlTsCfKRL40ehfa/RE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qcs404: Add cfg_offset for blsp1_uart3 clock
References: <20190128115359.30039-1-vkoul@kernel.org> <20190128115359.30039-2-vkoul@kernel.org>
User-Agent: alot/0.8
Cc:     Khasim Syed Mohammed <khasim.mohammed@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Anu Ramanathan <anur@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190128115359.30039-2-vkoul@kernel.org>
Message-ID: <154880177752.136743.5878273892342836134@swboyd.mtv.corp.google.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>
Date:   Tue, 29 Jan 2019 14:42:57 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Vinod Koul (2019-01-28 03:53:59)
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 64da032bb9ed..493e055299b4 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -678,6 +678,7 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src =3D {
>         .cmd_rcgr =3D 0x4014,
>         .mnd_width =3D 16,
>         .hid_width =3D 5,
> +       .cfg_off =3D 0x20,

And it's one single clk! None of the other blsp clks have this problem?

>         .parent_map =3D gcc_parent_map_0,
>         .freq_tbl =3D ftbl_blsp1_uart0_apps_clk_src,
>         .clkr.hw.init =3D &(struct clk_init_data){
