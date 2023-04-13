Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4933C77B61
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 19:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjDMT1g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 15:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjDMT1f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 15:27:35 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CDD5B9A
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 12:27:34 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o6-20020a05600c4fc600b003ef6e6754c5so6880710wmq.5
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 12:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681414053; x=1684006053;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcMh6APG+ogvPI2t49xqZgWanwCihHvKp78VS7f/hSM=;
        b=Yxmp7+168zOr92zA+oQK1zTGsV6bw8e8enk88M2iA1XTibmE46VxWYJgHvdM65baui
         4+2m9fu5JwBx1YaNeTCgkmKRYGhWR7pPYJhmSbrUBbLA5veft2+PMEjNvPFOIgPGmGRb
         iQ8TU0355SfymkZb+QQz03FdoEosqDWlpPsYNIm+8SjelP1sV5T4JN4yHmgZAJZrdkmJ
         /+6O49s01ZHbEGMhdT5yhTtma/GKLJTdTXMsDBkKqzRKeyZLWniEDJgTx9eNKOYplurc
         L9Sq+ODGSCmxxy2i7zdRSQsr+at5DBgPiDo+yB0+3mRg1Ho+W9e9JG1Rq9DUP/xaE5LO
         rq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681414053; x=1684006053;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcMh6APG+ogvPI2t49xqZgWanwCihHvKp78VS7f/hSM=;
        b=CbklocI72JZh4RSFyYr79XM3W57YPbvM3YWOfMNr6MNTMmjRZfMiRpQr6nmN7LumgJ
         9Sh3pZ86Km3mk7uOx1W+5yDj+v5GZjIvArcCiC9brjk/KNVMhzMjHhdXOpuR/tQoIJRf
         C65nLbxjK7zvu0ColH3UL/vRlT2JN8QjeewZwW7qLb/cGr3nW0N190jGjyE3RIGGDuRh
         nmz1IQ+JcNyp1xT4+OSQcblD7xt/iM5cwuDqY8R+eKAcvLi4phLBBB5UKthAWZkCnDE2
         V5i2kMpVTuT6Bfrni0sdw3qwnbCj6SjtPvysBR0IhA0z/+8cIXDEtsbidP05TriLFmSt
         xrpw==
X-Gm-Message-State: AAQBX9cR9fOaEHNZ3EM+NY2NaA5RTEj+3z16DisR5s9SDKyr6Fu7FPZL
        8QCGVBjPZMMbKp54g8U38R30FNHHJik=
X-Google-Smtp-Source: AKy350Y2WBLthXSbeM3ahrW2avGURmcwgjEiT/t4xi0P6yg5omCYN1fz4APWRSwlwjv/TmewJbrldw==
X-Received: by 2002:a05:600c:229a:b0:3ef:76dc:4b92 with SMTP id 26-20020a05600c229a00b003ef76dc4b92mr2580729wmf.28.1681414053111;
        Thu, 13 Apr 2023 12:27:33 -0700 (PDT)
Received: from ?IPV6:2a01:c22:738e:4400:f580:be04:1a64:fc5e? (dynamic-2a01-0c22-738e-4400-f580-be04-1a64-fc5e.c22.pool.telefonica.de. [2a01:c22:738e:4400:f580:be04:1a64:fc5e])
        by smtp.googlemail.com with ESMTPSA id iw11-20020a05600c54cb00b003f0a96b21d3sm2167798wmb.7.2023.04.13.12.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 12:27:32 -0700 (PDT)
Message-ID: <170e812b-01ad-2a5f-51fe-3d63f988ad68@gmail.com>
Date:   Thu, 13 Apr 2023 21:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org
References: <af85927b-0da3-3495-2ed4-64bda91cd239@gmail.com>
 <7b16c4d703dc00efd6e1b4062b5fd6d7.sboyd@kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] clk: mux: let clk_mux_val_to_index return U8_MAX in the
 error case
In-Reply-To: <7b16c4d703dc00efd6e1b4062b5fd6d7.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13.04.2023 21:10, Stephen Boyd wrote:
> Quoting Heiner Kallweit (2023-04-11 23:19:04)
>> Currently this function may return a negative errno, but almost no
>> user checks for the error case. Only imx_clk_gpr_mux_get_parent()
>> does, but mentions in a comment that they'd prefer a dummy value.
>> Other users cast the negative errno to u8 instead, what may result
>> in unwanted results.
>> Let's deal with this by returning u8 and U8_MAX in the error case.
>> Then clk_core_get_parent_by_index() can detect that the index is
>> out of range.
> 
> Is this causing problems for you?

I'm not directly impacted. I came across this when working on a driver
with the following scenario:

I have a clock muxer where I want to exclude one of the mux parents
by using clk_mux.table. If by chance the boot loader used this mux
parent, then clk_mux_val_to_index() would return an errno.
Also within clk core the return value isn't checked in
clk_mux_get_parent().

