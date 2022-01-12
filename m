Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF287C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jan 2022 20:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbiALU3i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jan 2022 15:29:38 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:48792 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbiALU3i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jan 2022 15:29:38 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AED0661721
        for <linux-clk@vger.kernel.org>; Wed, 12 Jan 2022 20:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034D9C36AE5;
        Wed, 12 Jan 2022 20:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642019377;
        bh=MgUd3EYLnW0KjTcDkuqg/Pl+jyjGh6I0FIMsqOvro9s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ie6lRZFWFIr0yrkC3/o2ZdMok9f+yT6PFi4funImCHWOZBjRcyI+RQBOGyRAqXN5c
         zUc0KXeODKHFaZSYUFhKr4WfsOW9yKxFdt4+vwRJ6XTJv6Hvsfay3ABF6nEatrUFW+
         CBqeOoI3ngZKofa3AE/ZYczD8Hhx5At2KwfAEAIaMSslhrfjleBfEAtVv1nYWgsNLW
         oihJcf4cxMcSnP0pqEEmmCpQNl/Dhha29ZGga+QzNJ9of/7Ba6/2ag2IvMcW8aPZD0
         m5f9Jx2XzqfEKsPjqCNEmHcRSLXTCxoHEOMUPGSpoJOc5xncnGsCxMB6LzVf9141oY
         Xvqwe9iX1Z5PQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220112141229.700708-1-m.tretter@pengutronix.de>
References: <20220112141229.700708-1-m.tretter@pengutronix.de>
Subject: Re: [PATCH] clk: zynqmp: warn always when a clock op fails
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com,
        rajan.vaja@xilinx.com, kernel@pengutronix.de,
        m.tretter@pengutronix.de
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Wed, 12 Jan 2022 12:29:35 -0800
User-Agent: alot/0.9.1
Message-Id: <20220112202937.034D9C36AE5@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2022-01-12 06:12:29)
> The warning that a clock operation failed is only printed once. However,
> the function is called for various different clocks. The limit hides
> warnings if different clock are affected by the failures.
>=20
> Print the warning every time when a clock operation fails.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/clk/zynqmp/clk-gate-zynqmp.c | 12 +++++------
>  drivers/clk/zynqmp/clk-mux-zynqmp.c  |  8 +++----
>  drivers/clk/zynqmp/divider.c         | 12 +++++------
>  drivers/clk/zynqmp/pll.c             | 32 ++++++++++++++--------------
>  4 files changed, 32 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqmp/cl=
k-gate-zynqmp.c
> index 565ed67a0430..0d9a39110f29 100644
> --- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
> +++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
> @@ -41,8 +41,8 @@ static int zynqmp_clk_gate_enable(struct clk_hw *hw)
>         ret =3D zynqmp_pm_clock_enable(clk_id);
> =20
>         if (ret)
> -               pr_warn_once("%s() clock enabled failed for %s, ret =3D %=
d\n",
> -                            __func__, clk_name, ret);
> +               pr_warn("%s() clock enable failed for %s (id %d), ret =3D=
 %d\n",
> +                       __func__, clk_name, clk_id, ret);

Can we just remove these prints entirely? The driver that calls
clk_enable() should be checking the return value and taking proper
action. What is the user going to do with these messages?
