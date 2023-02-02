Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142CFC61DA4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 15:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbjBBPQt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 10:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjBBPQq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 10:16:46 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE9E92C0B
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 07:16:44 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ml19so7034043ejb.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 07:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zD84VEFRzA59hsw0tKWfWwMdLIT0/a/+q7byCEgsbro=;
        b=IMIUFGidYMeJej6oq94xPl74Wcf3pVaqArds5hGhIzbPUuF5dHMF9yNZYDmIOk3v6p
         2ACOat8NrDDe45iu7fQvD3MB7dtxQ+P/Cag1we22A8GTZNwP0K0jkdezNpiTvwBgjfqV
         Rc0rhlIqGTrhsUmudjHXSYJygcXDXMb11OUikN96dkYI/lcvaWiLgujWvQtd+oJD028B
         bF2p/Wx6CbRzqPlViY4Qi/25j5sOSAo7/6bC1bl/rEqygNlbJq5xinXF+i4Gio+/DvH8
         vJOcPm2LkXl88woWJxPQiPwV3tIItKDiAg0eWeDnb9ys2pCe8zjfbS5zXRropFM1mpFk
         lEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zD84VEFRzA59hsw0tKWfWwMdLIT0/a/+q7byCEgsbro=;
        b=NBM4yTxQ/s6pbIfi0WLjgRedel4836D3EtX5VPK++4a4HMuRZu4vHp3I+B/3pgtq4X
         EpLyKs+sAfet2DcHaJ5/U/2koof38tpP21E9I5D/jXkji+pkHwEE7NoUxmI99rNv8RZh
         +0JR3WV6ixM7OZOY2rVSMGtk2gLIDlC2ddMzaktoII0/APSGEVsOhsrdYquKJnlFvqB0
         zFHMSkKUDnz1YCGpaqv/q3FJw5/alYP5F89/VOqKARjw6P7nMTlYYFpUZ4w70o7iegk2
         c6tSN6qJno0B1a+4WDlIzihnoBI7A5Zn5XUViswvozdb2hzxcO0TeQGwFiqfpxOT3sM4
         KQaA==
X-Gm-Message-State: AO0yUKXFTAn3g2x6WroNPQFLEgY0avjL9sSgxlp8ssOYbHLl4uHPW+8Z
        A0Fo5moSp4P3B5E6ByfzHYrDBoHWjLvumMzU
X-Google-Smtp-Source: AK7set9OLG5Fl/HxkXD3qR5wWeHKevH2Mgcbc8T5JAFPGupVN5Uy75fuy7rPSjLpC8lnqsI6ByX96Q==
X-Received: by 2002:a17:906:5dcc:b0:884:930:b014 with SMTP id p12-20020a1709065dcc00b008840930b014mr6436385ejv.6.1675351003380;
        Thu, 02 Feb 2023 07:16:43 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id k2-20020a170906970200b008775b8a5a5fsm11590784ejx.198.2023.02.02.07.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 07:16:43 -0800 (PST)
Message-ID: <2433c2c7-664d-0d1f-12ae-374cbd093dc0@linaro.org>
Date:   Thu, 2 Feb 2023 16:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 5/6] mailbox: qcom-apcs-ipc: add IPQ5332 APSS clock
 support
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230202145208.2328032-1-quic_kathirav@quicinc.com>
 <20230202145208.2328032-6-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230202145208.2328032-6-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2.02.2023 15:52, Kathiravan T wrote:
> IPQ5332 has the APSS clock controller utilizing the same register space
> as the APCS, so provide access to the APSS utilizing a child device like
> other IPQ chipsets.
> 
> Like IPQ6018, the same controller and driver is used, so utilize IPQ6018
> match data for IPQ5332.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 0e9f9cba8668..9d1f1b8671fc 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -141,6 +141,7 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
>  
>  /* .data is the offset of the ipc register within the global block */
>  static const struct of_device_id qcom_apcs_ipc_of_match[] = {
> +	{ .compatible = "qcom,ipq5332-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
