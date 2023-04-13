Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7257DC77B6E
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 20:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjDMUrP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 16:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDMUrO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 16:47:14 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D709900B
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 13:47:11 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id xd13so6648897ejb.4
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 13:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681418830; x=1684010830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVw/tsM1iXFfESqNN3Sn7A7SK/TbCvCojRisiCY/Y2I=;
        b=NJe6kmv1OCnHA7PjwEfbQB/b9cMySwUC8V+mNQt/hV05RnXDTCNlLDTYTXI+c8vns+
         zuTS+9TVpQZbfyPIeiORwjc0yUVVJywp50ujXdDhIdqveyd10APmo39AGp+pZVuc/Aqk
         QvEXMmA6RtRHZhVkT7NbxqVpimI8RDmuDIuLrE9FHyZnHORWgCZJGWniwjyq4MkmSap5
         e7a6RUikC8UcsL+9IQX92nz/MA41s8vJigbH7QFzujNFpJksBgzt0ea+rUcz+E4tfU3R
         EiKHiPiFnNH9qPoXZ5MBohxuQ8HVL9vtzegkcFrY2C/h1aA4whdX9PaLwaEI7YDEVEq0
         gbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681418830; x=1684010830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVw/tsM1iXFfESqNN3Sn7A7SK/TbCvCojRisiCY/Y2I=;
        b=RF+BetKa8x4bBUAth6FGl7glBes2sSMpPebgOrbjb9Rto6HDW+PaOM/y30xecBo9PE
         t5yJa+eZG4d68gMUpW0u9SdrZ6brSQJcEt6yWkUp/VBd5mWoCB1x8zhsAlyWpBSRvJ1f
         jFS8XCo8mfsVbDudgYC0w8tI10tbnI1wO2/avoB6zJBvTzOSk8jzxGFJhJ1Ehgvv4eSX
         pinuIDDVd8U6FoMie9ngKG6SxQIKCwUrf4sTHgUua/5tOEXJpaxfpnkTjmZ787QioFIO
         Q8W0jfFrlJNSq0an7tvgUrp7qPVc0UFK9xeZMmL4S+6WQLq7T+EBXcnLwA5Yt4yryttC
         7YEg==
X-Gm-Message-State: AAQBX9dbREl4diDt2pdY4jyI5GrElLC13b09Ve7AjJRXXwc8qAfDXdFG
        h+/GSneZPbykZkf4T66C8KQ=
X-Google-Smtp-Source: AKy350ZD65l3yLXhdJsWsuPMHuVdFezMfRLpkAHQozDYI6HC175gjxDJIdz2NFbftF6/6PY9jXuklw==
X-Received: by 2002:a17:907:6c11:b0:94e:afa6:5f4f with SMTP id rl17-20020a1709076c1100b0094eafa65f4fmr2802328ejc.44.1681418829460;
        Thu, 13 Apr 2023 13:47:09 -0700 (PDT)
Received: from ?IPV6:2a01:c22:738e:4400:f580:be04:1a64:fc5e? (dynamic-2a01-0c22-738e-4400-f580-be04-1a64-fc5e.c22.pool.telefonica.de. [2a01:c22:738e:4400:f580:be04:1a64:fc5e])
        by smtp.googlemail.com with ESMTPSA id vv5-20020a170907a68500b008cecb8f374asm1458672ejc.0.2023.04.13.13.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 13:47:09 -0700 (PDT)
Message-ID: <fd10103f-8599-8569-289e-3edbc829ca7f@gmail.com>
Date:   Thu, 13 Apr 2023 22:47:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] clk: mux: let clk_mux_val_to_index return U8_MAX in the
 error case
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org
References: <af85927b-0da3-3495-2ed4-64bda91cd239@gmail.com>
 <7b16c4d703dc00efd6e1b4062b5fd6d7.sboyd@kernel.org>
 <170e812b-01ad-2a5f-51fe-3d63f988ad68@gmail.com>
 <2203d5cc9350486e234198d8fff01641.sboyd@kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <2203d5cc9350486e234198d8fff01641.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13.04.2023 22:30, Stephen Boyd wrote:
> Quoting Heiner Kallweit (2023-04-13 12:27:27)
>> On 13.04.2023 21:10, Stephen Boyd wrote:
>>> Quoting Heiner Kallweit (2023-04-11 23:19:04)
>>>> Currently this function may return a negative errno, but almost no
>>>> user checks for the error case. Only imx_clk_gpr_mux_get_parent()
>>>> does, but mentions in a comment that they'd prefer a dummy value.
>>>> Other users cast the negative errno to u8 instead, what may result
>>>> in unwanted results.
>>>> Let's deal with this by returning u8 and U8_MAX in the error case.
>>>> Then clk_core_get_parent_by_index() can detect that the index is
>>>> out of range.
>>>
>>> Is this causing problems for you?
>>
>> I'm not directly impacted. I came across this when working on a driver
>> with the following scenario:
>>
>> I have a clock muxer where I want to exclude one of the mux parents
>> by using clk_mux.table. If by chance the boot loader used this mux
>> parent, then clk_mux_val_to_index() would return an errno.
>> Also within clk core the return value isn't checked in
>> clk_mux_get_parent().
>>
> 
> Ok. I'd rather go with a total rewrite of the get_parent clk_op[1] and fix
> this at the same time.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-parent-rewrite

This would be even better. Thanks.
