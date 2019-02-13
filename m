Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94C6C282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:42:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E2BC2175B
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550079778;
	bh=8/a6GqEt6IT+kCPU/DD4c6vSzGl+dSgpHTaX8RXnqr4=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=W721vk6WD9SG7m9kY2KYtOUtEfdlfHu+iAwkR2rGOef6ypu/mVU7Rs13AVLchVbiV
	 hfWRnv4FOOEKKIVsV1mWo/GhC1hfcdUMlRSeg13vthdJ7yOPMY5gqEJO9sQw55OyIt
	 oH0gXakf5ussd543+rc308abnAOSBnV3D2w7QLuE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731577AbfBMRm6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 12:42:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:37294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730494AbfBMRm6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Feb 2019 12:42:58 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A34D20700;
        Wed, 13 Feb 2019 17:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550079777;
        bh=8/a6GqEt6IT+kCPU/DD4c6vSzGl+dSgpHTaX8RXnqr4=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=oxJpZinKS2N45QtSrCM9rsIGt2314DzJ/uiBNjioVEzC7Ndm2NZxLbyQiaZHOAxIY
         3SNsKq49ZQXqcjZUe4HcmiE085f2ytnPehwdBtc5ZpD/uO6yjMRJfVYSV+n9wRb+u3
         ZEDxworNAcBcZ/x170y1BbLh1LjykvNTmDKeYpdo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <1550073243-11242-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: alot/0.8
Subject: Re: [PATCH V3 2/2] clk: imx: scu: add cpu frequency scaling support
Message-ID: <155007977634.115909.4465011219844819801@swboyd.mtv.corp.google.com>
References: <1550073243-11242-1-git-send-email-Anson.Huang@nxp.com> <1550073243-11242-2-git-send-email-Anson.Huang@nxp.com>
Cc:     dl-linux-imx <linux-imx@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 13 Feb 2019 09:42:56 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Anson Huang (2019-02-13 07:59:32)
> @@ -145,6 +161,39 @@ static long clk_scu_round_rate(struct clk_hw *hw, un=
signed long rate,
>         return rate;
>  }
> =20
> +static bool clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long ra=
te)
> +{
> +       struct clk_scu *clk =3D to_clk_scu(hw);
> +       struct arm_smccc_res res;
> +       unsigned int cluster_id;
> +       int i;
> +
> +       /* CPU frequency scaling can ONLY be done by ARM-Trusted-Firmware=
 */
> +       if (clk->clk_type =3D=3D IMX_SC_PM_CLK_CPU) {
> +               for (i =3D 0; i < ARRAY_SIZE(imx_sc_cpufreq_data); i++) {
> +                       if (!strcmp(clk_hw_get_name(hw),
> +                               imx_sc_cpufreq_data[i].clk_name)) {
> +                               cluster_id =3D imx_sc_cpufreq_data[i].clu=
ster_id;
> +                               break;
> +                       }
> +               }

Is there some reason why these clks can't be determined once at boot
time? It would be a good idea to avoid doing any sort of string
comparison here, instead just calling the right arm_smccc_smc with the
right arguments based on code that registers those types of clks.

