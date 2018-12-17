Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B58C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 18:53:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11674214D8
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 18:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545072788;
	bh=CCRdWmUTyuD8kMHY/jtiMTiBaNC5uT+21NBv2ryV2P0=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=pCoC/Z0W+xfms+KqgXs0YlYdPUmTJxqvg+pAjRvWqLF9TO9UlVXu26OyhmVxP70UP
	 pwCqxXljXhxxy6y4G/+Wy2+DF3SUOfg28KmlE1vMV39RZSLQuCkpwh4NMWjdWiDx5B
	 46JyimAHrO/HHaitvCYwKyUj2hO/WX0/E2xG0mts=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbeLQSxH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 13:53:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:45306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbeLQSxH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 13:53:07 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6974720874;
        Mon, 17 Dec 2018 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545072786;
        bh=CCRdWmUTyuD8kMHY/jtiMTiBaNC5uT+21NBv2ryV2P0=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=y2RZX4t7BaT8wzhbhK0/SBbzno9DcYQ+Yt6SrtZe37WxC9AzpKHc40FaseotMpTPi
         pDe2m7IkgeqnS56v3MbDffwKV2OjEpDx2D6gX4YTI/mHRrIDdgIC6vCPMKAkVLQPal
         eMFVoVM7pJbCp2B9a/yZ1i+QANSqW17M3CmvowaY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-5-govinds@codeaurora.org>
Subject: Re: [PATCH v3 4/7] clk: qcom: Add WCSS gcc clock control for QCS404
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-5-govinds@codeaurora.org>
Message-ID: <154507278563.19322.18324820054996663733@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Date:   Mon, 17 Dec 2018 10:53:05 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2018-12-15 02:35:54)
> @@ -2726,6 +2770,11 @@ static int gcc_qcs404_probe(struct platform_device=
 *pdev)
>                         return ret;
>         }
> =20
> +#ifdef CONFIG_QCS_WCSSCC_404
> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CBCR_CLK] =3D &gcc_wdsp=
_q6ss_ahbs_clk.clkr;
> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CBCR_CLK] =3D &gcc_wds=
p_q6ss_axim_clk.clkr;

What is going on with the tabs here? Why is it under an ifdef?

> +#endif
> +
>         return qcom_cc_really_probe(pdev, &gcc_qcs404_desc, regmap);
>  }
> =20
> --=20
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>=20
