Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0342FC7EE24
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 13:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbjEINCe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 09:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235316AbjEINC1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 09:02:27 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E75859DD
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 06:02:23 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc0117683so10627860a12.1
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683637342; x=1686229342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpIAP3t6RkkpB/dslfsju5UGZqS1fqIKK8wFrjmFBkM=;
        b=JX02OLLm84X5xmwMza4onDrd6Av1y+XmO6r6t7pnPyEMDyc+Jfi4aLpNO0ef1lhc/Y
         B9ZJtoP77oI7P7sp+S8/ByxAQALfuO/Dt4EdGID8tZGL/40EUuAGlVbrSAvhfK5QLGQZ
         90xe/qZZXqfcWVLBATxW3hzQ1p0YQu2e/OFPqKVTap7hdxdJ2GnvF00Att0PnmbA4Une
         kvNOFdeaHfc/snrF+QDVkvDO4BSVPliZZCaMl33ji2kiZftDFEYkfrvE5MKE4+5T31Ua
         2yIDfY8D4pNIHGK1d4eVRdzRjzBfdCQ6nVykKLcPer5LQwlQ+fLy4a7z9U7VSJft1TC9
         DhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683637342; x=1686229342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpIAP3t6RkkpB/dslfsju5UGZqS1fqIKK8wFrjmFBkM=;
        b=jGrdP+9qal30wPjDU3iWi3jv7EwV0jgL85ee/Js/g3LF1lf9AvBWBcuYnrXZ9c3a84
         JdwML2DJK2+oxH5/39KOx6oo64EnDsBxDcQMot5OM718A5C0hSylJtELWEnlh7kQ7rWH
         iYsGGjuVGB12SRD6L4vkPfvhGx6L72XEcR13hUMj8/Io+eO5X4T++XXMJkNsG/ZLI5iP
         LYaV/Q61byclwpPNC+zEZWDBKne9hfh4mIulnRtG1fENPMKwb5yD0fE1t0Vs61wt06Js
         px4REtdbj0LGbgJEeibPTlF036LgnUVci/d1JYmrfsL63OjV98jVG9mC/0tzKdHJILww
         4zyg==
X-Gm-Message-State: AC+VfDyA2V/WJ2U2NHlq/Mi/ZFvvS6zR1YivLKGOr57nnJt37THMnGN3
        tCfWXVHIctQycNgPD7zg6bXVQg==
X-Google-Smtp-Source: ACHHUZ70kubx3YLwOp6oEMBYLKUV3iI/XGmMuK2+SaTWFJkqJqP+xeDGaeUe/FM0QwqZbUO6Mp365A==
X-Received: by 2002:a17:907:9718:b0:966:c09:1c57 with SMTP id jg24-20020a170907971800b009660c091c57mr11019088ejc.65.1683637341701;
        Tue, 09 May 2023 06:02:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id ot3-20020a170906ccc300b0096654eda57csm1308744ejb.75.2023.05.09.06.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 06:02:08 -0700 (PDT)
Message-ID: <c1833e5b-9397-8a87-07c5-1b8bd84bd457@linaro.org>
Date:   Tue, 9 May 2023 15:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/11] dt-bindings: remoteproc: qcom: Add support for
 multipd model
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, mathieu.poirier@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_gurus@quicinc.com,
        loic.poulain@linaro.org, quic_eberman@quicinc.com,
        robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <1678164097-13247-1-git-send-email-quic_mmanikan@quicinc.com>
 <1678164097-13247-2-git-send-email-quic_mmanikan@quicinc.com>
 <38a5a268-7d8a-6e61-4272-8e9155df0034@linaro.org>
 <790496d7-98dc-c92e-dedc-1c89395a1ad8@quicinc.com>
 <e63a3e34-1f73-3661-8655-e34e1e955804@linaro.org>
 <b8b30b77-31df-15c3-3914-1198f90299e6@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b8b30b77-31df-15c3-3914-1198f90299e6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/05/2023 12:34, Manikanta Mylavarapu wrote:
>>> Sure, will add.
>>>>> +    description:
>>>>> +      Qualcomm G-Link subnode which represents communication edge, channels
>>>>> +      and devices related to the Modem.
>>>>> +
>>>>> +patternProperties:
>>>>> +  "^remoteproc_pd1|remoteproc_pd2|remoteproc_pd3":
>>>>
>>>> No, underscores are not allowed. Also, what is pd?
>>>>
>>> Sure, will remove underscores.
>>
>> Shouldn't this be just pd-1?
>>
>>
> I think 'pd-1' not enough. Because child's i.e userpd's also considered
> as remote processor's, so name should be like "remoteproc-pd1".

"pd-1" is not enough for what? Why the node name has to be more specific?


Best regards,
Krzysztof

