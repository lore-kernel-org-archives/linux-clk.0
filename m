Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001B8E7C4E7
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 17:57:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbjJDR5Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 13:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233946AbjJDR5Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 13:57:24 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27748A9
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 10:57:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-505a62d24b9so128917e87.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696442238; x=1697047038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zKg7f6kpVshrRISQ4xbKZAM7kHw6RbXQvKDo5fo5gI=;
        b=VMgZPNYvioKdG5vqdYipCQ3eFg+L/N1J4h+ajNTj/xq92mNG0oR1SoM8usHjxZq907
         eNt+EFiD7brd8yvPqZAoWbbvn0e+9nb5VTbzxOP7QU9XKh99ICnX++6IrWyQCt0PBx/R
         BGjHuKNj8MBMoQkX7+NtZhXKbImXRDJW7ZA1R+/lNNh9fP4fD/4Y6rG2Uzxl0hjpwk3w
         Zun5QSsgW29HvPAfM8cVaxFlupV2v5t5lO2bAH3fAG+fO5z+5sEWtkaHRrOBJvZjIplc
         b8DI51ncUyZYntjhqrQa5h4VQEDTsKMUZy5p4Q3JbRiBeWpskuqn7OjIVJXYvQtD80LH
         ER/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696442238; x=1697047038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zKg7f6kpVshrRISQ4xbKZAM7kHw6RbXQvKDo5fo5gI=;
        b=gSD6fVDPw+3ydOMOqHNRVmUGooneVFHOrhxcYIoGLyG1rxrDBZmTr+iGWT4JxaBEj6
         H2WYoq6oLHqvCxHrX4mQG9MOOTcEDAppx6Q8AqxQd+c8K1Al1WkI0ctZBuxy4QAcyoUl
         fCwSdr0VSuqpFXdBJUjjo4G6W/XBsn8EmYMLoMZw2uqjn4yZsD9yMX1ET3qV7k+xFGZ/
         35juLsHVeFjMQpP2F0veUhMf3wxMoRctyCxXUJFgeQhIV+mYOIXDlD45WBzGcrn1V84U
         V/9xGXzD/E+9JKu96gE5vcUv5+waMTeQxeTELoxw/mor5EnVdmYfogZyk92lEt8yp0mG
         3rlQ==
X-Gm-Message-State: AOJu0YwLq141dclljttUHG3umOhec+Rkndx5UygXR9Wdk940GNzgK/da
        S/uTMFL4AWELSUOpv0EihsW8oQ==
X-Google-Smtp-Source: AGHT+IECOXMOL4C0XYUOKmTR5hKYMMj/PCobgcCBBRPWv6ENacPOxkFttgRQ8wL39jthck2CPNQxcg==
X-Received: by 2002:a05:6512:3190:b0:500:d8d6:fc5a with SMTP id i16-20020a056512319000b00500d8d6fc5amr3960473lfe.37.1696442238325;
        Wed, 04 Oct 2023 10:57:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r14-20020ac252ae000000b00505723e56acsm679513lfm.273.2023.10.04.10.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 10:57:17 -0700 (PDT)
Message-ID: <7e28c09b-f2fd-4a42-b4f3-a337ec31a073@linaro.org>
Date:   Wed, 4 Oct 2023 20:57:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <f129633e-4df7-4984-a19e-c16e6c7c8f3f@linaro.org>
 <CAA8EJprGfS5x89FOWhjPCdLzSNbEK-U1h8qVmfiLc6+4NjEiNA@mail.gmail.com>
 <e96499ff-76ec-482b-b18c-ee293259b8a7@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e96499ff-76ec-482b-b18c-ee293259b8a7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/10/2023 15:52, Bryan O'Donoghue wrote:
> On 04/10/2023 13:08, Dmitry Baryshkov wrote:
>> On Wed, 4 Oct 2023 at 12:27, Bryan O'Donoghue
>> <bryan.odonoghue@linaro.org> wrote:
>>>
>>> On 04/10/2023 01:31, Dmitry Baryshkov wrote:
>>>> clk_rcg2_shared_ops implements support for the case of the RCG which
>>>> must not be completely turned off. However its design has one major
>>>> drawback: it doesn't allow us to properly implement the is_enabled
>>>> callback, which causes different kinds of misbehaviour from the CCF.
>>>>
>>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>>>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
>>>> switched off (and shared most of the implementation with
>>>> clk_rcg2_shared_ops). The major difference is that it requires that the
>>>> parent map doesn't conain the safe (parked) clock source. Instead if 
>>>> the
>>>> CFG_REG register points to the safe source, the clock is considered to
>>>> be disabled.
>>>
>>> Why not have a new bit in .flags ?
>>>
>>> Instead of lying about the clock being off, mark the clock as "parked",
>>> or "safe parked" or whatever term we choose for it ?
>>
>> The main problem with adding flags doesn't fully scale. From the CCF
>> perspective, what should be the difference between parked and disabled
>> clocks? How should it treat the parked one?
> 
> Exactly the same as a disabled clock, except you get a "parked" instead 
> of a "disabled" when looking up its state and you don't have to
> 
> -    { .fw_name = "bi_tcxo" },
> 
> Also you can then flag for branch2 clocks the same thing - so parking 
> would be done at a higher level in the CCF.

Without this removal there is no easy way to identify if the clock is 
parked to XO or if it is reparented to that clock.


-- 
With best wishes
Dmitry

