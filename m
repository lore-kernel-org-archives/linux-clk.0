Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9ACC432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7896960232
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhH2EgN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 00:36:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:47182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhH2EgM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 00:36:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66B0E608FE;
        Sun, 29 Aug 2021 04:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630211721;
        bh=HxSSAxoPCDe5qoyHsyXn83T7VTSLGWRJoyYDGneH5U8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KrOfM/BNRs2OSH+PDK61wC3X8bcoiZPughegBcADzdLx4cqmR+J3qKIFZWH0dS57w
         kKhpRPjtyl7COIA14mQnMbf//xl84OqFFgG+lBHoydERzQ22fNaPhZCroD9lXAPSI+
         t3UEpD0qzGdXVs0wBwWWIvCqGNbF1rowSc/I9fGPkbmMqWxauFHRi0z+sJ0oE//KcC
         H8Py8A+ciPGsflaE75aBoF0QsgeK8HZeA5synSO8LzCWHAn60c56Pi3ad6VbWEkSns
         4Y0CSAxezIFd7LcO27j27VyKemfNBbfidBsBMNYbxOxfPCGtEPZQ2icvUMLx8j/EoS
         d2wevIigMW19Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9c7f1fcb-1934-2f4a-90b7-bbb108f8c6e0@tuxengineering.com>
References: <9c7f1fcb-1934-2f4a-90b7-bbb108f8c6e0@tuxengineering.com>
Subject: Re: [PATCH] clk: clk-si5341: Fix output_clk_recalc_rate if RDIV_FORCE2 is set
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Looijmans <mike.looijmans@topic.nl>,
        Michael Turquette <mturquette@baylibre.com>
To:     Pat Carr <pat@tuxengineering.com>, linux-clk@vger.kernel.org
Date:   Sat, 28 Aug 2021 21:35:20 -0700
Message-ID: <163021172018.2676726.16468040552075005621@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Pat Carr (2021-08-19 16:04:08)
> Hello Mike Looijmans et al,
>=20
>   The attached patch fixes the output clocks in the case when R divider
> is zero, but the flag SI5341_OUT_CFG_RDIV_FORCE2 is set. The flag in
> this case should take precedence and return parent_rate / 2. Otherwise,
> the return value would incorrectly be zero affecting the downstream
> output clock rates. This table shows this failing case before the patch:
>=20
>                          enable  prepare protect                    ...
>   clock                   count    count   count   rate        accuracy
> -----------------------------------------------------------------------
> vcxo_clk                      0        0       0   124999999          0
> ref48M                        1        1       0    48000000          0
>    clock-generator            0        0       0    13200000          0
>       clock-generator.N3      0        0       0           0          0
>       clock-generator.N2      0        0       0           0          0
>       clock-generator.N1      0        0       0           0          0
>       clock-generator.N0      0        0       0   200000000          0
>          clock-generator.N3   0        0       0           0          0
>          clock-generator.N2   0        0       0           0 ?        0
>          clock-generator.N1   0        0       0           0 ?        0
>          clock-generator.N0   0        0       0           0 ?        0
>=20
>   The '?' marks show the zeroed out output clock rates in case the
> output divider should've been set to divide-by-2. After the patch, the
> output clock rates are shown below:
> <...>
>          clock-generator.N3   0        0       0           0          0
>          clock-generator.N2   0        0       0   100000000          0
>          clock-generator.N1   0        0       0   100000000          0
>          clock-generator.N0   0        0       0   100000000          0
>=20
>=20

Please read Documentation/process/submitting-patches.rst to understand
how to properly send patches for review. Thanks.
