Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CE2C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 21:49:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B6F620821
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 21:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549403391;
	bh=KLBLkIFMzuwNkFS4bhfBCRio/XzaveLnZwpRezFkHJ8=;
	h=Subject:From:Cc:References:To:In-Reply-To:Date:List-ID:From;
	b=aBxjrAEczWHK0w6wiQYnH6yiNtwBfad6nv7LekpNn855G5CFZS9LUQdtcoTIbq5TX
	 DHSlHqCfZMtvYdP/LjcNxGuItHri7CJxEmm0Tx4/6GC70vyhqQReZ0LaoU0fvRiIA9
	 i3N42vDp7b0FKtYYRFAx65z0V8G16LriVmIhsDHc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727623AbfBEVtu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 16:49:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:43248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbfBEVtu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Feb 2019 16:49:50 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C67F620821;
        Tue,  5 Feb 2019 21:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549403389;
        bh=KLBLkIFMzuwNkFS4bhfBCRio/XzaveLnZwpRezFkHJ8=;
        h=Subject:From:Cc:References:To:In-Reply-To:Date:From;
        b=Bgpn4qmOdWKySu1pfOn5XO3iokFJe0km97INzTcvIGnYdTKoGu53x8uLS7eA4lVKV
         vhPggeV+C5EexOKttMlSKIz7ri8PFeSfgCZRHfGqjzgdYKlxyPc3cDESKRM9WpAhMR
         lCw/uEVRik4rnaQSzvqkHr/NCWv36gUcRjJHyP+8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/8] clk: qcom: Add WCSS gcc clock control for QCS404
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154940338896.169292.16683098609094394997@swboyd.mtv.corp.google.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org> <20190202152626.1006-3-govinds@codeaurora.org>
User-Agent: alot/0.8
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org
In-Reply-To: <20190202152626.1006-3-govinds@codeaurora.org>
Date:   Tue, 05 Feb 2019 13:49:48 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2019-02-02 07:26:20)
> @@ -2726,6 +2756,11 @@ static int gcc_qcs404_probe(struct platform_device=
 *pdev)
>                         return ret;
>         }
> =20
> +       if (of_property_read_bool(pdev->dev.of_node, "qcom,wcss-unprotect=
ed")) {

This should use the protected-clocks property instead

> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AHB_CLK] =3D &gcc_wdsp_q6ss=
_ahbs_clk.clkr;
> +               gcc_qcs404_clocks[GCC_WCSS_Q6_AXIM_CLK] =3D &gcc_wdsp_q6s=
s_axim_clk.clkr;
> +       }
> +
