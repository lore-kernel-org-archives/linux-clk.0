Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D33C10F14
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:26:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C456A215EA
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570134388;
	bh=jFnbR5AMDd9ph3gWWRIGQf/AuwZ+qx+EEfIXSSgKEvE=;
	h=In-Reply-To:References:From:To:Cc:Subject:Date:List-ID:From;
	b=K9iFvUeNEy708GeMvt2UzlCCg1qMjNwi8b8W1eZrxFBrvm8ryHQnUE5frZIzOg3qp
	 XFAd6Vmr5EX1olvr5kmYkAAq0TTMNzkIRvbFGF4EUZcARhl7mejATgH4fELp4mdPAv
	 3QjYWmJz9sujrb3gvBidjrqT5YdAhAtVTCHuaTnk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729711AbfJCU02 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 16:26:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729557AbfJCU02 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Oct 2019 16:26:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2ABB20862;
        Thu,  3 Oct 2019 20:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570134387;
        bh=jFnbR5AMDd9ph3gWWRIGQf/AuwZ+qx+EEfIXSSgKEvE=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=VVK3HtIfxAnUqKczTjdKvK7SEdDp9rpAOnzBiCCqWdMQg/B+th7HzaDNExPinXFSj
         eFa2iUZXAXdxsLGZPULQw4XPD/lpHP8Alvc+6LasxLI0CK9llGRLCwO2+DiGRRladw
         S54vgwpqtDNHa/ta84AZuWFR2ahw45thPtmtPDeQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191003201837.86824-1-swarren@wwwdotorg.org>
References: <20191003201837.86824-1-swarren@wwwdotorg.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH V2 1/4] clk: tegra: mark fuse clock as critical
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 13:26:26 -0700
Message-Id: <20191003202627.A2ABB20862@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Warren (2019-10-03 13:18:34)
> diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk=
-tegra-periph.c
> index 1ed85f120a1b..76dd91eebd13 100644
> --- a/drivers/clk/tegra/clk-tegra-periph.c
> +++ b/drivers/clk/tegra/clk-tegra-periph.c
> @@ -785,7 +785,7 @@ static struct tegra_periph_init_data gate_clks[] =3D {
>         GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
>         GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
>         GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_=
RESET, tegra_clk_kbc, 0),
> -       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
> +       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, CL=
K_IS_CRITICAL),

Please comment in the code why it's critical so we don't have to dig
through commit history to figure this out.

>         GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fus=
e_burn, 0),
>         GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse, =
0),
>         GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbif,=
 0),
