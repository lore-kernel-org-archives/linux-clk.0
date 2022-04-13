Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C624C43217
	for <linux-clk@archiver.kernel.org>; Wed, 13 Apr 2022 17:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237533AbiDMSA6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Apr 2022 14:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237582AbiDMSAz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Apr 2022 14:00:55 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377C26E4FA
        for <linux-clk@vger.kernel.org>; Wed, 13 Apr 2022 10:58:20 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h11so3174733ljb.2
        for <linux-clk@vger.kernel.org>; Wed, 13 Apr 2022 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dTR+7S76RuA6oTQbni5CCIGtj8BqCBtbBfvTNy8k/fs=;
        b=jWkGCfmiAWXOQuM5EdLNd5c6wyS+rG663Y6QLR+L50867SApKx26kPk+vBmgoVaAon
         yKwE3dXNVujfagbT24ao/lzz4GyplTnhIbwBB50dIdZNTESPyb5wEgMQXpj0xD+kV7xT
         FSkcGpAlYmj7Zf01S3POTLZO8jgqDa/FkZczxb2HTYV6oOHViDU269XvSQ0jnQHeGY2o
         0dNiUZ9U0S19IHJApmRJrlp+RoYSfwQAe/LpZgjPNopDUUx3xbfgrv/Vw2HEicTsQz1H
         5bUen6xGjqbwHWuf2JmiLDUeNAWXjwKbeMO66P7//c88trJ33kKASx52j2Y7uS0XzjFE
         JPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dTR+7S76RuA6oTQbni5CCIGtj8BqCBtbBfvTNy8k/fs=;
        b=p6ppxdD9cCwXC4JQxy5AK5LvSq/VQEuUcH62gOiJgo9NgfFRXffwAUIKz+IMlPWExe
         WYCC6YXqiy4wQp0E82x6eWAdjBDQ+pMr0o9CGDyrSL4W8PtynAtt2oJV5RoE0fWKI7bf
         o8FCBFlmCBNXxXUiv5T9OPSyLGUFYJOhUDioLNMuIXOyFfGXX2IBvSi/sao5MKAXXlRn
         TYEIAnF7sJRxt5DAa/UcXJo6CXMcLLGVH0RvJxrzEwH3BQ2RYkCmR/cEQIRrXJkdV0HV
         MJR/oHFZJuSvQ5nQMbXQHLNX3Ip/cnazHS1RQZUqQPnOL4JoecqK7Vg4vs1tIYr+Uhb/
         zw/w==
X-Gm-Message-State: AOAM532CcNRR2aFxkfxU04OL+bqBWuJbTGgo0cQjT1JnieKoelelu30W
        AERd+gd1CSl35b2kJl+FLeavMw==
X-Google-Smtp-Source: ABdhPJz4IQ/ceAohT8qpZgZgvEFG2TDcuQeYdbfAAaujgyAbnpLpWsXe6JsDVTI7X52l4pnHKDgncA==
X-Received: by 2002:a2e:8099:0:b0:249:822e:1256 with SMTP id i25-20020a2e8099000000b00249822e1256mr27323864ljg.267.1649872698463;
        Wed, 13 Apr 2022 10:58:18 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7-20020a05651c050700b0024c7ebff04bsm484582ljp.79.2022.04.13.10.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 10:58:18 -0700 (PDT)
Message-ID: <d63a8b9e-3c33-31d7-69a6-65052f024e74@linaro.org>
Date:   Wed, 13 Apr 2022 20:58:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 0/5] PCI: qcom: rework pipe_clk/pipe_clk_src handling
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
 <YlaV2/AQJaQhytR8@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YlaV2/AQJaQhytR8@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/04/2022 12:20, Johan Hovold wrote:
> [ Dropping tdas@codeaurora.org, which bounces. ]
> 
> On Tue, Apr 12, 2022 at 10:38:34PM +0300, Dmitry Baryshkov wrote:
>> PCIe pipe clk (and some other clocks) must be parked to the "safe"
>> source (bi_tcxo) when corresponding GDSC is turned off and on again.
>> Currently this is handcoded in the PCIe driver by reparenting the
>> gcc_pipe_N_clk_src clock.
>>
>> Instead of doing it manually, follow the approach used by
>> clk_rcg2_shared_ops and implement this parking in the enable() and
>> disable() clock operations for respective pipe clocks.
>>
>> PCIe part depends on [1].
> 
> Looks like you forgot to add the link to the prerequisite patch:
> 
> 	[1] https://lore.kernel.org/all/20220401133351.10113-1-johan+linaro@kernel.org/

yes, thank you for the correction

> 
>> Changes since v1:
>>   - Rebased on top of [1].
>>   - Removed erroneous Fixes tag from the patch 4.
>>
>> Changes since RFC:
>>   - Rework clk-regmap-mux fields. Specify safe parent as P_* value rather
>>     than specifying the register value directly
>>   - Expand commit message to the first patch to specially mention that
>>     it is required only on newer generations of Qualcomm chipsets.
> 
> Johan


-- 
With best wishes
Dmitry
