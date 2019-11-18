Return-Path: <SRS0=lcQO=ZK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FADDC432C0
	for <linux-clk@archiver.kernel.org>; Mon, 18 Nov 2019 10:18:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1486E20730
	for <linux-clk@archiver.kernel.org>; Mon, 18 Nov 2019 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574072305;
	bh=kKOMigJg/s6w5TnRT2XmC14ecX+48iqWRHWFRAU2aSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=TwSJgXymlwCmYoU6JyruNSdd0DmSleSTRdnk8MbZoz9cF5NR/CE7BEN2Pb4RTWlEp
	 H7eUPDYEk0vXExnQcEJFPVKNq/ML+MS2AlC13TBU67T8CcNd9aqxU0oEHdP19+rsgm
	 wFg2L83d7ZLBJh6wXmJJ5bJTXPTd7Oenpis02SOU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfKRKSY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Nov 2019 05:18:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbfKRKSY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Nov 2019 05:18:24 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 598B220727;
        Mon, 18 Nov 2019 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574072303;
        bh=kKOMigJg/s6w5TnRT2XmC14ecX+48iqWRHWFRAU2aSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sIDKgm9hhuZtzd+Vv1GQpYXd/CMqag0FgT1WIybFKRnx3I7X+vqNp6JyIzXESvYbW
         aeJWsH/clVRt9o1kQtDsq5rDzjnCAenvqkmTB7+n+sS7i4m0vA/aRsw/S66u5782Da
         s1hSjyIHpn0Zlwomi4OzVdM61tQLDngwxcm6UMHA=
Date:   Mon, 18 Nov 2019 11:18:21 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Tian Yunhao <t123yh@outlook.com>
Cc:     Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH, v2] clk: sunxi-ng: v3s: Fix incorrect number of hw_clks.
Message-ID: <20191118101821.GD4345@gilmour.lan>
References: <MN2PR08MB579006CB67AC63A93C8B0D5E89760@MN2PR08MB5790.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OsjXUGRLsfCucSoX"
Content-Disposition: inline
In-Reply-To: <MN2PR08MB579006CB67AC63A93C8B0D5E89760@MN2PR08MB5790.namprd08.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--OsjXUGRLsfCucSoX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Nov 13, 2019 at 09:23:59AM +0000, Tian Yunhao wrote:
> The hws field of sun8i_v3s_hw_clks has only 74
> members. However, the number specified by CLK_NUMBER
> is 77 (= CLK_I2S0 + 1). This leads to runtime segmentation
> fault that is not always reproducible.
>
> This patch corrects this behavior by separating clock
> numbers for V3 and V3S.
>
> Signed-off-by: Yunhao Tian <t123yh@outlook.com>

Even though they are similar, the Signed-off-by doesn't match the
authorship.

> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 4 ++--
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.h | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> index 5c779eec454b..72a87dd0c0d8 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> @@ -618,7 +618,7 @@ static struct clk_hw_onecell_data sun8i_v3s_hw_clks = {
>  		[CLK_MBUS]		= &mbus_clk.common.hw,
>  		[CLK_MIPI_CSI]		= &mipi_csi_clk.common.hw,
>  	},
> -	.num	= CLK_NUMBER,
> +	.num	= CLK_NUMBER_V3S,
>  };
>
>  static struct clk_hw_onecell_data sun8i_v3_hw_clks = {
> @@ -700,7 +700,7 @@ static struct clk_hw_onecell_data sun8i_v3_hw_clks = {
>  		[CLK_MBUS]		= &mbus_clk.common.hw,
>  		[CLK_MIPI_CSI]		= &mipi_csi_clk.common.hw,
>  	},
> -	.num	= CLK_NUMBER,
> +	.num	= CLK_NUMBER_V3,

There's not much point in having a defined CLK_NUMBER here, just use
the value you've defined it to (so CLK_I2S0 + 1  and CLK_PLL_DDR1 + 1)

Maxime

--OsjXUGRLsfCucSoX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdJv7QAKCRDj7w1vZxhR
xVauAP0a9Re23tvnPYMA7Ub1qIg6UIRCLhMLGd36GhgtgPhUiwEAiFCX1AxrLVL2
8JoMUkjm4pyZkQ/hVE+edtx46zPZ/Ag=
=A6na
-----END PGP SIGNATURE-----

--OsjXUGRLsfCucSoX--
