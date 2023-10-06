Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390BDE9413B
	for <linux-clk@archiver.kernel.org>; Fri,  6 Oct 2023 23:46:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233864AbjJFXqE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Oct 2023 19:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjJFXqA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Oct 2023 19:46:00 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B34BE
        for <linux-clk@vger.kernel.org>; Fri,  6 Oct 2023 16:45:59 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c16bc71e4cso31390311fa.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Oct 2023 16:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696635958; x=1697240758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvelsamPvTxHOBaQ+6PwUaQ1Qg42PthwNqUIdGwRmec=;
        b=yafTray5yDq6S2ktDnDvRPELPpPUNCqZyrG/hmxPCx/OUzDZy2d9mCfi6piGpQVj5p
         eBe2DtmLGLhQZ7+DP1/nck3i3BvTHtSOYn6E2nCFOqhDnPxnlKqodZ/NsNb3R4yRGM7g
         EFJyXnHOnRNpPyjNdD2rrLQrPMA2qiZnZUMcrksseVABdFqMoR8omoERaNhRFnLEFF1p
         H0hn1GnTz/0R8V60zFeZCPjUFXEcGyfpZOHzySmu9v2w6u/zBO90D60OboIW/+XI6/ot
         y8WHI0Sxw6w+0aHqjFEfUhhWucW2xamx29Y36CTYyLTi40cQFe0ZuxJIQeCmBQu4yX4W
         36/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696635958; x=1697240758;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rvelsamPvTxHOBaQ+6PwUaQ1Qg42PthwNqUIdGwRmec=;
        b=bOaML9dtYmHdCDlYgRGLBH08UIWiPORZOytudttRzizREPTU3vHtobGLEpOgaIQPxQ
         313+rfx8OwBYBRqcn8eUqMsfvMUa7woHVjplJOSu2RMEBdltRFObCvdebcwpvdb8N6jT
         G42kiFcCEIZsyyFKLl9bkJS9dOMRtP0bAefYkKz5ReA8Y4B8JqKAN0zM/erKns+P0TOn
         rv4uORiwX13wj0Oe/8XMPTP9Wul4trqqEs6gzft5Mm5/y+vMP6VmWeZ9ApfKZHjcYV4F
         AG1J+UtPoh7GdKki2RC3yEwDa+FgEb8sOTwHpktbt3nVDD+kjJqZGlLScTJ7HiyC2UqF
         7iMA==
X-Gm-Message-State: AOJu0YxvOkwZ0c6jogz7ll+5rZSJDiGTZAJdALm8L2+r7mH9FehEfXN7
        Ry8BT/y70KqILLMcp9Lo88+lbA==
X-Google-Smtp-Source: AGHT+IEOCKgJL1qXywn2BuU9lbIJOiEjNMxQKYK7ZaGD8BuwIfJdzhbeeoXSG95n92rY5lguCXZOAw==
X-Received: by 2002:a2e:9f08:0:b0:2c0:300a:82ed with SMTP id u8-20020a2e9f08000000b002c0300a82edmr7787668ljk.7.1696635957713;
        Fri, 06 Oct 2023 16:45:57 -0700 (PDT)
Received: from [192.168.200.173] (178235177147.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.147])
        by smtp.gmail.com with ESMTPSA id l16-20020a2ea310000000b002b6ce8b0dd6sm976572lje.75.2023.10.06.16.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 16:45:57 -0700 (PDT)
Message-ID: <55293371-9d7c-404b-a969-81248bf55e24@linaro.org>
Date:   Sat, 7 Oct 2023 01:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <e96499ff-76ec-482b-b18c-ee293259b8a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4.10.2023 14:52, Bryan O'Donoghue wrote:
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
>>>> parent map doesn't conain the safe (parked) clock source. Instead if the
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
> Exactly the same as a disabled clock, except you get a "parked" instead of a "disabled" when looking up its state and you don't have to
The thing is that currently there's only the notion of "enabled"
or "not enabled".. Introducing a third state here would be the
jump from boolean to quantum logic!

I think that abstracting this information away from Linux is not
an issue.. These clocks "can't be any more off", or the SoC will
explode badly and Linux will be unusable..

Think of it like CPUs with a hypervisor, you shut them down, but
the physical number crunchers on the host CPU may not actually
get cut off from their power source, but there's no reason for
the VM to know that. That's probably what happens on our little
virtualized snapdragons anyway..

Konrad
