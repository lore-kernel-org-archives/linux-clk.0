Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6290CC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:30:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F08061216
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhIOBbg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:31:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:60724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229548AbhIOBbf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 21:31:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B65161166;
        Wed, 15 Sep 2021 01:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631669417;
        bh=LkGWfO9TM3hmZrbs0mR4qnqCRRt2tPV/Mn90T2rkA/s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fNeuIjiaFW7WC95Jgokcl7SDV02Azv2kTwQWaFM5pSvRbq7xZSnO+SNh7RK8xFq90
         O9C/rN5BSJfsrzNd21JekyShIf85ktQQK5+9lAY/GeB6Y2e1JJN6Z5svIJ3pcSllLY
         Yl6rR9tJvJC+wNA4HIcTxtrRC//AS/KIGdocESLc9CA76+e+pGbyws1bFhYqJATQmo
         wX+9MZi7sOyFiVV3SE1iJQcOWuPcVmDpwJ9HrvzcTnprzBIDeO+B5yzGPx7M8yl/JG
         1bOSy6/DYmAcBrnZjdtU6QTGN3Brlu0HEUwHwA2x6DZWPbr3mM0IjQyFrsnK1Dzp8N
         iqlCF562jXkFg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914143201.1062947-1-dinguyen@kernel.org>
References: <20210914143201.1062947-1-dinguyen@kernel.org>
Subject: Re: [PATCH] clk: socfpga: agilex: remove unused s2f_usr0_clk define
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, kernel test robot <lkp@intel.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Tue, 14 Sep 2021 18:30:15 -0700
Message-ID: <163166941570.763609.2177760843201537150@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2021-09-14 07:32:01)
> Remove unused s2f_usr0_clk define.
>=20
> Fixes: 80c6b7a0894f ("clk: socfpga: agilex: add clock driver for the
> Agilex platform")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>

And dropped now. It is still used?

> ---
>  drivers/clk/socfpga/clk-agilex.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-a=
gilex.c
> index b4d300fbbc66..bf8cd928c228 100644
> --- a/drivers/clk/socfpga/clk-agilex.c
> +++ b/drivers/clk/socfpga/clk-agilex.c
> @@ -165,13 +165,6 @@ static const struct clk_parent_data mpu_mux[] =3D {
>           .name =3D "boot_clk", },
>  };
> =20
> -static const struct clk_parent_data s2f_usr0_mux[] =3D {

This is s2f_usr0_mux, not s2f_usr0_clk.

> -       { .fw_name =3D "f2s-free-clk",
