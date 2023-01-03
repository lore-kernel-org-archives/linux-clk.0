Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBC2C3DA7D
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 16:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbjACQAd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 11:00:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233348AbjACQAc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 11:00:32 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20486120B1
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 08:00:31 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p36so46206844lfa.12
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 08:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fsEzWFiMVhRqX2IFEPw8asDdcQK9y3UraFOcKRzBzCg=;
        b=BPV6b+Qwim5BalbzVnJ6nZUkbCljHaizqzeos+hbzBV2gcgFWYcp7JnVFN+jt86Pug
         tP77izEL1ADvjJyz7zPTKK9sSnTzyuVVwUgEvrgiAbjXehtBlruJcjru2fEAmBnpa77P
         vS1DFxQMcAPJGP1S/JIedx/eC+F1XFgjso66soIDLSSi5B5qMWUsOmp3/IyiZOS3dtvP
         MsDT+DDteytECWc7QWND/4LfXSvLjAPi1Fcqu0dBVbwd3p974WXo3kjY6L6vf8D23gib
         6RC9yKNnU9iq/q24e+OctmKXMdvpYbMbdKeV+z9fU1jvPDKk2slUov/q6BsHR2sIfEcw
         O/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsEzWFiMVhRqX2IFEPw8asDdcQK9y3UraFOcKRzBzCg=;
        b=UP1gWDOilzvHJYbcA+MXGRxBWTntSgS6//sg5LNijNwdCSJqDjydySt3kokYu1MgL8
         eno9M/t2xpx/8OuumEgn7/6ujxIDMyhQr1oupUCxcGfu6hq3fFvUBu2cRraSOAZFCO2e
         dQ4y/KU4rk6NYc0xABDsmK/OIk3QJKDv2MGPsvXANEoZgtSLWfmaUX079DT2ahqG42nV
         Mfx1nKaSU9EGnFrNB8zHHhDghRxstLUVsPvcMOFxlKOSHdgsT3aAR8V49TMznQQ/zZny
         tqwHCUua9SehcQ/++xkM06Xp3JWospIZ5KcxmsooGx/70U35iN6ucIFeQucW7RNRU7ev
         DPvw==
X-Gm-Message-State: AFqh2koRUeVoI1I0S8Em9vPUA84wgjJfKe9NkXLRQuJDb3Hi0v9hUUIz
        DPHMDAQOjrB8uAiIJfcamJ56Cg==
X-Google-Smtp-Source: AMrXdXucfa+6dsTdEF05zpniX4JCgXxQZApYR5KwR6nyG+e03FSeQg0Sm8IsDKLktspatDf/o4lBSA==
X-Received: by 2002:a05:6512:2624:b0:4b5:8e1e:867b with SMTP id bt36-20020a056512262400b004b58e1e867bmr12760289lfb.59.1672761629251;
        Tue, 03 Jan 2023 08:00:29 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p14-20020ac24ece000000b004cb40db03desm242737lfr.55.2023.01.03.08.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 08:00:28 -0800 (PST)
Message-ID: <e2493080-f7fd-50de-173f-2e46fa846e23@linaro.org>
Date:   Tue, 3 Jan 2023 18:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 15/21] clk: qcom: gpucc-msm8998: switch to parent_hws
Content-Language: en-GB
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
 <20230103145515.1164020-16-dmitry.baryshkov@linaro.org>
 <CAOCk7Nr4smGnQS-yh1hGKFFXzeUUt86JSdiuoSun7vJ11z9SWQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAOCk7Nr4smGnQS-yh1hGKFFXzeUUt86JSdiuoSun7vJ11z9SWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/01/2023 17:08, Jeffrey Hugo wrote:
> On Tue, Jan 3, 2023 at 7:56 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Change several entries of parent_data to use parent_hws instead, which
>> results in slightly more ovbious code.
> 
> obvious -> obvious
> 
> Also, you are changing one of two parent_data structs in this file.
> That's not "several".  It's really not clear why you are touching one,
> but not the other.  Can you be more specific about what is going on in
> this particular file?

The other struct has .hw and .fw_data entries so it can not be switched 
to just clk_hw enumeration.

I agree, that one is not 'several' (yeah, I was just using template for 
commit messages), I can change that for v2.

-- 
With best wishes
Dmitry

