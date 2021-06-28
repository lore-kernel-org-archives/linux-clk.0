Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B2EC49EA6
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:47:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F5956197F
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:47:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhF1Btd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:49:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:43794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231735AbhF1Btd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 21:49:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4163561A1D;
        Mon, 28 Jun 2021 01:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624844828;
        bh=Z4+RC7bUNgvDBHdXHzmmcrKvAjJn1x19hgsGdOUgNI8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rkeiv1lAoVZwXmP7B6v9RHq0Az/KTTL4u9/eAkB4pM3gg1tU+KOX3nX7/lYGTB66j
         WvQpjpTpWOrKYBdImup4JovDu7Z2eMZnJDI07U12o5MNHGg1yTSYpo28bo3A0ib3Gi
         gM4QCUPyxwm3d93d+wupJeaFXUR5X4BNNMOR9cltz2NwB0jkaGTAPtbvcl5S3HstFr
         8gED/mrnVsNjxEoo+Vfdh9iN9gymlBhpZ1WhJLtIyp6Ydfl6+CsRPemHuQazCJ9/uM
         yqHMxEBgirv5FuL57zNwUbMjnnXmJ9vjHH27Zd1Qmkb3VMN5JKYeZNYFNbm8Y4+vpr
         PeAfpx7FvM8jg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e675820a46cd9930d8d576c6cae61d41c1a8416f.1623354574.git.cristian.ciocaltea@gmail.com>
References: <cover.1623354574.git.cristian.ciocaltea@gmail.com> <e675820a46cd9930d8d576c6cae61d41c1a8416f.1623354574.git.cristian.ciocaltea@gmail.com>
Subject: Re: [PATCH v3 3/6] clk: actions: Fix bisp_factor_table based clocks on Owl S500 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Edgar Bernardi Righi <edgar.righi@lsitec.org.br>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Sun, 27 Jun 2021 18:47:07 -0700
Message-ID: <162484482710.3259633.13588609804522862763@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Cristian Ciocaltea (2021-06-10 13:05:23)
> The following clocks of the Actions Semi Owl S500 SoC have been defined
> to use a shared clock factor table 'bisp_factor_table[]': DE[1-2], VCE,
> VDE, BISP, SENSOR[0-1]
>=20
> There are several issues involved in this approach:
>=20
> * 'bisp_factor_table[]' describes the configuration of a regular 8-rates
>   divider, so its usage is redundant. Additionally, judging by the BISP
>   clock context, it is incomplete since it maps only 8 out of 12
>   possible entries.
>=20
> * The clocks mentioned above are not identical in terms of the available
>   rates, therefore cannot rely on the same factor table. Specifically,
>   BISP and SENSOR* are standard 12-rate dividers so their configuration
>   should rely on a proper clock div table, while VCE and VDE require a
>   factor table that is a actually a subset of the one needed for DE[1-2]
>   clocks.
>=20
> Let's fix this by implementing the following:
>=20
> * Add new factor tables 'de_factor_table' and 'hde_factor_table' to
>   properly handle DE[1-2], VCE and VDE clocks.
>=20
> * Add a common div table 'std12rate_div_table' for BISP and SENSOR[0-1]
>   clocks converted to OWL_COMP_DIV.
>=20
> * Drop the now unused 'bisp_factor_table[]'.
>=20
> Additionally, drop the CLK_IGNORE_UNUSED flag for SENSOR[0-1] since
> there is no reason to always keep ON those clocks.
>=20
> Fixes: ed6b4795ece4 ("clk: actions: Add clock driver for S500 SoC")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Applied to clk-next
