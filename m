Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FC5C47256
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:55:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC1942078E
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 04:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588654555;
	bh=OZB+5isnyy69m59BrCmuj7ms/vJuDmzLuMDFPKnl9qA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=vxogHz6BfBQ+c1uPmrgLjZVkEAcXtesmFDmtCxVJOt48scdKa9HLN44qHD+HGBIBi
	 qmODKHEvLCMsSE9n2wr2o0lfC4qoDXocAMpygBgu3/udlCF2nD4w6RCllp3lO5inql
	 DNyBbBzzzAEn9fYn1pM7K3xVDngu0n+R4igzJgUM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgEEEzz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 00:55:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:46376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbgEEEzz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 00:55:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F1E2206B9;
        Tue,  5 May 2020 04:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588654554;
        bh=OZB+5isnyy69m59BrCmuj7ms/vJuDmzLuMDFPKnl9qA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dQolMy+wBS73ZC6AuNO6c0NUs6EYQvxPuVXPUDD8HKyG5LmIfqyDsXb4tK18bH1q+
         lO4lS+vhPUVQ0/tg4/kHNtehxP62Fu8jccpA9Uosww5wVQFZmS9zIjxL+yQRyaAgJ2
         LOq9kmbr5jJRA7/D0RVVv4uB6q98y239nM9g5hEM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584279836-29825-13-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com> <1584279836-29825-13-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V6 12/12] clk: imx: scu: unregister clocks if add provider failed
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 04 May 2020 21:55:53 -0700
Message-ID: <158865455360.11125.17297772155388824388@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-03-15 06:43:56)
> Unregister clocks if add provider failed
>=20
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
>=20
> ---

Why isn't this squashed in to where it's needed?

> ChangeLog:
> v6: new patch
> ---
>  drivers/clk/imx/clk-imx8qxp.c | 11 +++++++++--
>  drivers/clk/imx/clk-scu.c     | 13 +++++++++++++
>  drivers/clk/imx/clk-scu.h     |  2 ++
>  3 files changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index 2ec3e0c4749d..e615214495c0 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -138,10 +138,17 @@ static int imx8qxp_clk_probe(struct platform_device=
 *pdev)
>                                 i, PTR_ERR(clks[i]));
>         }
> =20
> -       if (clk_cells =3D=3D 2)
> +       if (clk_cells =3D=3D 2) {
>                 ret =3D of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_s=
rc_get, imx_scu_clks);
> -       else
> +               if (ret)
> +                       imx_clk_scu_unregister();
> +       } else {
> +               /*
> +                * NOTE: we did not unregister clocks for the legacy way =
cause
> +                * it will be removed later.

I got confused what 'it' was. I think it's the legacy way entirely.
Maybe say "legacy binding code path doesn't unregister here because..."

> +                */
>                 ret =3D of_clk_add_hw_provider(ccm_node, of_clk_hw_onecel=
l_get, clk_data);
> +       }
> =20
>         return ret;
>  }
