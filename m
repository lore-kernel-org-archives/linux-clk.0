Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BE8C636D7
	for <linux-clk@archiver.kernel.org>; Wed, 15 Feb 2023 15:17:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjBOPR5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Feb 2023 10:17:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjBOPRz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Feb 2023 10:17:55 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4107E068
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 07:17:52 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id rp23so48991089ejb.7
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndEYZ/Bjp4bwqaU/mjVX2oSWMOkhNZXJ6KCxJAXPEeA=;
        b=QNGGvgh0zUrXwxfLWb3A2eghj1qnoEtEDPe/Sk2jwdV8D+JPoCN9bUmLNA4j/NIqOu
         9YnfdEFEq5/kBrKM/X7iM9ejx5Afjz09gPY00I2O3ZnzyPkufPkH4mbqLWk+kYfwo3TX
         2TTxsTKPysXOBVbeCd/dBs0z4ccl1wKBnb/Zmd4q1RWoUn8rozESw45cm45YwAEUE4bm
         XLHyGmBtbsZtLHPSJx3A0g0A9wPP6MycmkBfqH3sHZM5hi1ChnsFy+AHEtv4kb9W+ZFI
         ng2IEIqi1r25+AzYN57LDDseyW1LaeVJuGZ/blZSO3FZ3mpDLfckADOwnC9Eio4UjB3r
         cVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndEYZ/Bjp4bwqaU/mjVX2oSWMOkhNZXJ6KCxJAXPEeA=;
        b=UshlknEJ3cN56+S2b1dorlpzXuErb4XDMXDJdoETdYsYEL3U7jVqik1mYsWWr6umsP
         90ySiblZe7ijeSpNcsGkCkNouf1y5ls0D/tIvY3A5nK0BlxRt7OOn+q5ILj2hwwoGNYs
         WQtiTQldlrJLWvLVA1Z3j3uOu122m1GrRLiYcyY4GRvLVyuG2L4Ky/3BvDemdEQZFELV
         MCzODuH0blDEytbobx+rdJ5aEbQ3WSNalmBbW/5HyNR+yMp+DrE7CwxHsqtSUhYU8HGs
         q7xqCZcPZIdLaELWzIEJXJCrlL8zkAE3CcwFenf+pRZN8xL3/nvGxAUAOEM4pn5myDTS
         g2Cg==
X-Gm-Message-State: AO0yUKWT8JghR8p7xF27kGT7tF/1UKlktz3qgCGnC4EIu0UbdZUmCea4
        IGnD29Gz97BKePwt/OLPa4004Q==
X-Google-Smtp-Source: AK7set+dlJUmxoIzxdNx2JGoR5HPQMbv4gAQ41Hig3+QipJS5GpnPiyCRkUTBHYCjETZ4ObCuXHLcw==
X-Received: by 2002:a17:906:82d1:b0:883:be32:cd33 with SMTP id a17-20020a17090682d100b00883be32cd33mr2719943ejy.35.1676474271248;
        Wed, 15 Feb 2023 07:17:51 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ml21-20020a170906cc1500b008b14b807dbdsm493841ejb.67.2023.02.15.07.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 07:17:50 -0800 (PST)
Message-ID: <1e26211a-c8eb-5f2f-9f55-c3d3ebc76b94@linaro.org>
Date:   Wed, 15 Feb 2023 15:17:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 5/5] firmware: scm: Modify only the DLOAD bit in TCSR
 register for download mode
Content-Language: en-US
To:     POOVENDHAN SELVARAJ <quic_poovendh@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        robimarko@gmail.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230214051414.10740-1-quic_poovendh@quicinc.com>
 <20230214051414.10740-6-quic_poovendh@quicinc.com>
 <ffeff1f8-ebf6-3115-38d1-fa318549baa0@linaro.org>
 <b5135d69-3783-8147-bda5-8131cea726f7@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <b5135d69-3783-8147-bda5-8131cea726f7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 15/02/2023 10:55, POOVENDHAN SELVARAJ wrote:
> 
> On 2/14/2023 6:27 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 14/02/2023 05:14, Poovendhan Selvaraj wrote:
>>> CrashDump collection is based on the DLOAD bit of TCSR register.
>>> To retain other bits, we read the register and modify only the DLOAD 
>>> bit as
>>> the other bits have their own significance.
>>>
>>> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
>>> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
>>> Co-developed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
>>> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
>>> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>>> ---
>>>   Changes in V4:
>>>     - retain the orginal value of tcsr register when download mode
>>>       is not set
>>>
>>>   drivers/firmware/qcom_scm.c | 15 ++++++++++-----
>>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>>> index 468d4d5ab550..8a34b386ac3a 100644
>>> --- a/drivers/firmware/qcom_scm.c
>>> +++ b/drivers/firmware/qcom_scm.c
>>> @@ -407,7 +407,7 @@ int qcom_scm_set_remote_state(u32 state, u32 id)
>>>   }
>>>   EXPORT_SYMBOL(qcom_scm_set_remote_state);
>>>   -static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
>>> +static int __qcom_scm_set_dload_mode(struct device *dev, u32 val, 
>>> bool enable)
>>>   {
>>>       struct qcom_scm_desc desc = {
>>>           .svc = QCOM_SCM_SVC_BOOT,
>>> @@ -417,7 +417,8 @@ static int __qcom_scm_set_dload_mode(struct 
>>> device *dev, bool enable)
>>>           .owner = ARM_SMCCC_OWNER_SIP,
>>>       };
>>>   -    desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
>>> +    desc.args[1] = enable ? val | QCOM_SCM_BOOT_SET_DLOAD_MODE :
>>> +                val & ~(QCOM_SCM_BOOT_SET_DLOAD_MODE);
>>
>> why not read the value here before setting the DLOAD Mode instead of 
>> doing it in qcom_scm_set_download_mode()?
>> that would make the code simple and readable.
> 
> dload_addr_val is used in both if and else if cases in 
> qcom_scm_set_download_mode(), so we read in qcom_scm_set_download_mode() 
> function and pass to __qcom_scm_set_dload_mode().

that is fine as it is, I missread else part as calling 
__qcom_scm_set_dload_mode() too.

just check the ret value should be good.

--srini


> 
>    if (avail) {
> -        ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
> *+        ret = __qcom_scm_set_dload_mode(__scm->dev, dload_addr_val, 
> enable); *
>        } else if (__scm->dload_mode_addr) {
> -        ret = qcom_scm_io_writel(__scm->dload_mode_addr,
> -                enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
> +        ret = qcom_scm_io_writel(__scm->dload_mode_addr, enable ?
> + *  dload_addr_val | QCOM_SCM_BOOT_SET_DLOAD_MODE : **
> **+                dload_addr_val & ~(QCOM_SCM_BOOT_SET_DLOAD_MODE)); *
>        } else {
> 
>>
>>>         return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
>>>   }
>>> @@ -426,15 +427,19 @@ static void qcom_scm_set_download_mode(bool 
>>> enable)
>>>   {
>>>       bool avail;
>>>       int ret = 0;
>>> +    u32 dload_addr_val;
>>>         avail = __qcom_scm_is_call_available(__scm->dev,
>>>                            QCOM_SCM_SVC_BOOT,
>>>                            QCOM_SCM_BOOT_SET_DLOAD_MODE);
>>> +    ret = qcom_scm_io_readl(__scm->dload_mode_addr, &dload_addr_val);
>>> +
>> not checking ret value here before proceeding?
>>
> Okay, sure..will address in next patch series.
>>>       if (avail) {
>>> -        ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
>>> +        ret = __qcom_scm_set_dload_mode(__scm->dev, dload_addr_val, 
>>> enable);
>>>       } else if (__scm->dload_mode_addr) {
>>> -        ret = qcom_scm_io_writel(__scm->dload_mode_addr,
>>> -                enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
>>> +        ret = qcom_scm_io_writel(__scm->dload_mode_addr, enable ?
>>> +                dload_addr_val | QCOM_SCM_BOOT_SET_DLOAD_MODE :
>>> +                dload_addr_val & ~(QCOM_SCM_BOOT_SET_DLOAD_MODE));
>>>       } else {
>>>           dev_err(__scm->dev,
>>>               "No available mechanism for setting download mode\n");
> 
> Regards,
> Poovendhan S
> 
