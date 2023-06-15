Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B233C001DF
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 17:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjFORh3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 13:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238426AbjFORh1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 13:37:27 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE261FDD
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 10:37:25 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so2890953e87.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Jun 2023 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686850643; x=1689442643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sS/MT18TbbX2jMpeAwwA0bIb+s3HEO/Echw+aOl6/GU=;
        b=B8mvzhf5WuhVLMVRcYuGUdxnA8Ti5Zs8skswNJ4NaD7+LQGIONc31ByGCSjGiQ9hfE
         wgjCbIIyb/KExyzgjkkVdiv3XZ3DzGRyTuDIPAGSYJRO7kSgxRzgfdzIx4eMg+FsrBnC
         pGnT4R4qlqPJ/PYbgHsbquU+PZz7f3te2xiNOlwOzR8mzkbbUaIUkrqdhDl1LsLv+0UC
         MUlx/7H83JDlPDytp20YRpeFRUs98jRdAK96EU+5HkT5bbodsPT+WbnPK+amgdY/F4JQ
         AtXT/AsqvkiI9f6KyxEOQJXmzmJFVjGL1JHIiAsTbK8QZPf06/zNcaTRL/jLOwIHhveO
         sNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686850643; x=1689442643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sS/MT18TbbX2jMpeAwwA0bIb+s3HEO/Echw+aOl6/GU=;
        b=ayl7/KkzPWy9zB2nXovfQvdPUvGKwqVhYjRnwqaEh+iPz0UhDwy0cKtvJR2urzaxF5
         wLrhOqkcLcuJVG7DoE/HkoSsLdRRipDIZfVGoafRdLu69SYrmp+IwDMmky2FUn6izRF3
         GRJTI0jDbGGN6+jysTOit9Jjis/Wx4dUDgkPXHU2eOXFeRKDoE5N+IedRiCx+g1xGPsa
         LxP8+UwpZh/zZ81AF9nqw0ILrJ3THR3yV9Y0R3/vx0f2PGiXUzSF6DMSPRIGWdo3mSOi
         yz7KTxdwYPLdMCozvP48pP0pASOSB0NJtWxEk0nqI5zKvfukHeW3wCOJLOgEUaS2DW2C
         VeIQ==
X-Gm-Message-State: AC+VfDxw7OUf1xA7AQUyAbUO7nHPbFHqZtdHCyatDVRpCXh/G0784E4Z
        GXzIkzY0XYjk/18elAESwDd4lg==
X-Google-Smtp-Source: ACHHUZ4mhfg3B13M94QZSA5qHf8c5YQMAaQuggxJYcxAikF/BlUuKxfN4HG+SuiCSv61fgVkxwkFnQ==
X-Received: by 2002:ac2:5b1b:0:b0:4f7:69ca:4e71 with SMTP id v27-20020ac25b1b000000b004f769ca4e71mr3957509lfn.34.1686850643464;
        Thu, 15 Jun 2023 10:37:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id c26-20020ac244ba000000b004ec8b638115sm2640405lfm.193.2023.06.15.10.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 10:37:23 -0700 (PDT)
Message-ID: <278f3baa-a760-18cf-1a43-2814793af987@linaro.org>
Date:   Thu, 15 Jun 2023 19:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v6 00/22] Restructure RPM SMD ICC
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230526-topic-smd_icc-v6-0-263283111e66@linaro.org>
 <0764b5fda92acb995ffbd05c4b3d2b2f.sboyd@kernel.org>
 <8568eead-90f6-ce15-d483-4d72dbab6294@linaro.org>
 <f526046568e6bbc8dc567109e6911f65.sboyd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <f526046568e6bbc8dc567109e6911f65.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15.06.2023 19:35, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2023-06-15 00:52:07)
>> On 15.06.2023 02:49, Stephen Boyd wrote:
>>> Quoting Konrad Dybcio (2023-06-14 11:04:19)
>>>> This series reshuffles things around, moving the management of SMD RPM
>>>> bus clocks to the interconnect framework where they belong. This helps
>>>> us solve a couple of issues:
>>>>
>>>> 1. We can work towards unused clk cleanup of RPMCC without worrying
>>>>    about it killing some NoC bus, resulting in the SoC dying.
>>>>    Deasserting actually unused RPM clocks (among other things) will
>>>>    let us achieve "true SoC-wide power collapse states", also known as
>>>>    VDD_LOW and VDD_MIN.
>>>>
>>>> 2. We no longer have to keep tons of quirky bus clock ifs in the icc
>>>>    driver. You either have a RPM clock and call "rpm set rate" or you
>>>>    have a single non-RPM clock (like AHB_CLK_SRC) or you don't have any.
>>>>
>>>> 3. There's less overhead - instead of going through layers and layers of
>>>>    the CCF, ratesetting comes down to calling max() and sending a single
>>>>    RPM message. ICC is very very dynamic so that's a big plus.
>>>>
>>>> The clocks still need to be vaguely described in the clk-smd-rpm driver,
>>>> as it gives them an initial kickoff, before actually telling RPM to
>>>> enable DVFS scaling.  After RPM receives that command, all clocks that
>>>> have not been assigned a rate are considered unused and are shut down
>>>> in hardware, leading to the same issue as described in point 1.
>>>
>>> Why can't we move the enable of DVFS scaling call to the interconnect
>>> driver as well? We want the clk driver to not reference the interconnect
>>> resources at all.
>> That would result in no rpmcc ratesetting on platforms without a functional
>> interconnect driver. The DVFS call concerns both bus and !bus clocks.
>>
> 
> That's the intent. Probe the interconnect driver to get bus clk rate
> setting.
> 
> What are the !bus clocks managed by RPM?
Depending on the platform, that includes IPA, GPU, OCMEM, RF.. everything
that's not been separated out in patch 18.

Konrad
