Return-Path: <SRS0=Bh1D=AE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6165AC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 23 Jun 2020 02:07:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 339AE20720
	for <linux-clk@archiver.kernel.org>; Tue, 23 Jun 2020 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592878074;
	bh=we5WmCVzt48ut9pkLyJImWtFpdDQxOoWy+a1m9PkbpU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=R9bcMGFNGGZLLGQe9GA7nq3pTmJl/4+HFTqmTf+sV7DmmHHzmecDSZ4VvCY6cDjGb
	 zlhD06Ismj8qxomzOlOkbGpoCHuV4rhxKgz+YmZznpWTHncJY2rxbjyi2sNLE+nvVa
	 U0Hea7NFcMvwhk1PQZY2O4mxksCI9/USSwJqPlpo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731425AbgFWCHy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Jun 2020 22:07:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:44744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730328AbgFWCHx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Jun 2020 22:07:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58C7D20720;
        Tue, 23 Jun 2020 02:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592878073;
        bh=we5WmCVzt48ut9pkLyJImWtFpdDQxOoWy+a1m9PkbpU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mRB5XR7hh7k+R+ykD5n2k9l6ijJs8RkwtQvZJ3He5oeAsR3hCxoRU1g30Geq5luv9
         S8nfnjRcipZst25P1LUsoRTcaxcvrYloG8OFcdmDJ7JyeL0anXlYEX/zPXEmRH46iL
         QRvH9DRa05FIKroqTuF6MLNtIAWY1HKyYMT9mygs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200603111923.3545261-2-thierry.reding@gmail.com>
References: <20200603111923.3545261-1-thierry.reding@gmail.com> <20200603111923.3545261-2-thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] clk: tegra: Always program PLL_E when enabled
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        LABBE Corentin <clabbe@baylibre.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
To:     Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 22 Jun 2020 19:07:52 -0700
Message-ID: <159287807271.62212.1561231041280024616@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-06-03 04:19:23)
> From: Thierry Reding <treding@nvidia.com>
>=20
> Commit bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> added checks to avoid enabling PLLs that have already been enabled by
> the bootloader. However, the PLL_E configuration inherited from the
> bootloader isn't necessarily the one that is needed for the kernel.
>=20
> This can cause SATA to fail like this:
>=20
>     [    5.310270] phy phy-sata.6: phy poweron failed --> -110
>     [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI cont=
roller: -110
>     [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -=
110
>=20
> Fix this by always programming the PLL_E. This ensures that any mis-
> configuration by the bootloader will be overwritten by the kernel.
>=20
> Fixes: bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> Reported-by: LABBE Corentin <clabbe@baylibre.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
