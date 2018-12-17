Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905F8C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F594206A2
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545075295;
	bh=8q71VrlrFxiLv05x0S/KA/wO9UUxLh9zLSEtkIrKRwo=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=Z27J+MNaYi4xs8K1YgzagFqPkVDnSZgbt1JoC0nAvr6XNS60teONYplvWDUZHFJb4
	 JKsUfbIy1kg3BKilORaOHmoeh4XxiuS0O9gOBqsnCC8SHzpB0/aJJKCAToTnFXKIFr
	 Pnb/6V//XrsGzJH73I71IGTitRr5RQwQJlfOKrUc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388250AbeLQTey (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 14:34:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:45638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727175AbeLQTey (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 14:34:54 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EDE6206A2;
        Mon, 17 Dec 2018 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545075293;
        bh=8q71VrlrFxiLv05x0S/KA/wO9UUxLh9zLSEtkIrKRwo=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=wnnHV0DgvtTlK7BRMh9m3P1+jUqnvHXU0/OWbCdrT6O5hq4MyR7nyvFFaeQp6jNRz
         VJ7Dpzm3J1lcRx72pISW/utFtEkQUi4fV/9x4dq52mNCUQ0SgWAYV//SG3mojcEPdU
         owfbCftPUqEqhwn+EM5XdP5HAOpuQskyrU22rqIg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-4-govinds@codeaurora.org>
Subject: Re: [PATCH v3 3/7] dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-4-govinds@codeaurora.org>
Message-ID: <154507529252.19322.2985382543561079731@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Date:   Mon, 17 Dec 2018 11:34:52 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2018-12-15 02:35:53)
> Add device tree bindings for WiFi QDSP gcc clock controls found in
> QCS404 soc.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-qcs404.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bin=
dings/clock/qcom,gcc-qcs404.h
> index 00ab0d77b38a..8f800adda225 100644
> --- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
> +++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> @@ -146,6 +146,8 @@
>  #define GCC_MDP_TBU_CLK                                        138
>  #define GCC_QDSS_DAP_CLK                               139
>  #define GCC_DCC_XO_CLK                                 140
> +#define GCC_WCSS_Q6_AHB_CBCR_CLK                       141
> +#define GCC_WCSS_Q6_AXIM_CBCR_CLK                      142

Does the register really call it FOO_CBCR_CLK? I'd prefer we drop the
CBCR part unless you really want it to keep it.

> =20
>  #define GCC_GENI_IR_BCR                                        0
>  #define GCC_USB_HS_BCR                                 1
