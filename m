Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A21C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7951221873
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 18:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545156026;
	bh=Jlx4fvIO9bYrA/UcZjSTMyi+Z8qOqjdt0deYmzSL63A=;
	h=References:In-Reply-To:To:Cc:Subject:From:Date:List-ID:From;
	b=U4yZHY+G7Eh9dLHh2AiMn4L4YZagCjmAyy/wVEhLqvNK1NTFFEjT05Ye4uI8b0JUx
	 jsCwebrcsjUAAru+bH0NGwobNUsHMHmb4/8HyyUO05vm68JVUtrTXBEzBUGVedWuwl
	 d1JG5fyzzhP+4r3HSBsWQ88PDwA3RmRb0SDZPfqw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbeLRSA0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 13:00:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:57818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726611AbeLRSA0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 13:00:26 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E43821871;
        Tue, 18 Dec 2018 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545156025;
        bh=Jlx4fvIO9bYrA/UcZjSTMyi+Z8qOqjdt0deYmzSL63A=;
        h=References:In-Reply-To:To:Cc:Subject:From:Date:From;
        b=0NUtnsUUCbTTb6lTHz+h2iOuYKqW2ri8qt4e8/s0i90Hh5QoWZxgjqMKoKMKk/EZa
         BJQF1Oe+FVzTWy4/LwikHui59Phqj9f8y/px0w2/twLdGSG7Tt6cfQhN1vxd7EBC4F
         VKLysM5KliXHktls9k10n++IDtreufQUpKtdQAEM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20181218091232.23532-1-josephl@nvidia.com> <20181218091232.23532-11-josephl@nvidia.com>
Message-ID: <154515602466.238328.7202899555618997431@swboyd.mtv.corp.google.com>
In-Reply-To: <20181218091232.23532-11-josephl@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>
User-Agent: alot/0.8
Subject: Re: [PATCH V3 10/20] clk: tegra: dfll: build clk-dfll.c for Tegra124 and Tegra210
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Tue, 18 Dec 2018 10:00:24 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joseph Lo (2018-12-18 01:12:22)
> diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
> index 7ddacae5d0b1..57902ab43f4a 100644
> --- a/drivers/clk/tegra/Kconfig
> +++ b/drivers/clk/tegra/Kconfig
> @@ -5,3 +5,8 @@ config TEGRA_CLK_EMC
>  config CLK_TEGRA_BPMP
>         def_bool y
>         depends on TEGRA_BPMP
> +
> +config TEGRA_CLK_DFLL
> +       depends on (ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC)

Nitpick: Drop the parenthesis please.

> +       select PM_OPP
> +       def_bool y


