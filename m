Return-Path: <SRS0=Q/QO=DB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6C0C4346E
	for <linux-clk@archiver.kernel.org>; Thu, 24 Sep 2020 06:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7887E208E4
	for <linux-clk@archiver.kernel.org>; Thu, 24 Sep 2020 06:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600928210;
	bh=RkWUf/g+/ncpRiNuk50QQRF/sO/JoANOvDAyyxWxHR4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=h6gNyMjDVqEvpiIVCIqVtMWWGgY+PbLyghTwS9PqPswe0hwI9+/kLtodJbrZnIMFe
	 vAg018pA/TKUaNsumZzikLuFvQYtCy9nO2svmjcmDeKD3+MzpGtowntIr+5b5r3Nmi
	 TL5bL64tdwJgwV6Z8DLoPWBhVOjd9rKIE4XAaHWY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgIXGQr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Sep 2020 02:16:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbgIXGQr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Sep 2020 02:16:47 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2B2E20702;
        Thu, 24 Sep 2020 06:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600928206;
        bh=RkWUf/g+/ncpRiNuk50QQRF/sO/JoANOvDAyyxWxHR4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0LqjUFupIva7qKiEdnspqC7W81HOkD529hyP6WTEt7Tsd4PV2MJzG1VW/TK7IBIAw
         lB3faCEdgNWv/MXRkL7ffGtgnjGoamWt0SPGYT9w4QD+iyzAlDmdIjL1jD5wpXyVG/
         rRN3VNTz01lFN0I6cmblIMv+aAum4TrEB5gUOYzQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2f429321-49c1-98b9-63e6-fd9c885af59c@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca> <20200911153412.21672-8-jonathan@marek.ca> <160080125949.310579.17354323673790889544@swboyd.mtv.corp.google.com> <2f429321-49c1-98b9-63e6-fd9c885af59c@marek.ca>
Subject: Re: [PATCH v3 7/7] clk: qcom: Add display clock controller driver for SM8250
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Wed, 23 Sep 2020 23:16:45 -0700
Message-ID: <160092820545.310579.6383587246524246608@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jonathan Marek (2020-09-23 09:10:04)
> On 9/22/20 3:00 PM, Stephen Boyd wrote:
> > Quoting Jonathan Marek (2020-09-11 08:34:07)
> >> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispc=
c-sm8250.c
> >> new file mode 100644
> >> index 000000000000..7c0f384a3a42
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> >> @@ -0,0 +1,1100 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> >> + */
> >> +
> > [...]
> >> +
> >> +static const struct clk_parent_data disp_cc_parent_data_6[] =3D {
> >> +       { .fw_name =3D "bi_tcxo" },
> >> +       { .fw_name =3D "dsi0_phy_pll_out_dsiclk" },
> >> +       { .fw_name =3D "dsi1_phy_pll_out_dsiclk" },
> >=20
> > Can we remove clk postfix on these clk names?
> >=20
>=20
> This is consistent with the names used in both sdm845 and sc7180=20
> drivers. If this should change then those should be changed too?

If DT isn't using it already then it sounds OK to change the other
SoCs. Otherwise fix it just for this one.
