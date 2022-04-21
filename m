Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC37C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 21 Apr 2022 11:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388464AbiDULkj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Apr 2022 07:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383040AbiDULkj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 07:40:39 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8BB2BB37
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 04:37:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y32so8182026lfa.6
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RsyMZ+3bz7iZqyG5PUvCw9htX6TYzgOo4J4yh71zpuI=;
        b=gWpk+C7Y8yNeYTzGrteWODT0Ty2/cOa1ye8rnWxX4nOhjdnewnRTUZGfVSel4vVzqv
         pfYaIcB0TRT8aqF3BGout/T/WgXUlORDXq8z/7s293Oo7Yc++V+MykeR26utUSXcZo2h
         ZwhIvnZ1LDuwEt6+gpwhWAsx3PbMp2YTi1QwmkteTFukC4xX4c9/amqr/8U0CvxEAaeC
         9g1uySEn6uDleNGwI6zm7y4v+nEA5VrUlmkNW5LB2kRtboaAhOuUGWuqdSeSPPpPoAWv
         2UtTaqDGzRHqJGOXVRMu4UbOG1JYsk1JUXqFStKhosXJ5zmtLO0dLFgMOACCk5m0eI5O
         nEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RsyMZ+3bz7iZqyG5PUvCw9htX6TYzgOo4J4yh71zpuI=;
        b=OO7NTQckvBDfpN+R8h+TmWglwbeErfUcWR2XIRB4QOYokahlACDh01327MaolrCx5u
         3FDUmaNhVjUFIhhMdpsT+g6Z750YZP4kIHVMx7AVz7ZrF5mToRdohHPL7vKyQKAmEfaL
         aXQKHC7+Kap2JIzWExbywxPD0WoazKe4gUeuKX3B4gQd/1T1Axru2JItckknZX+Ymo2f
         3KaDrxVi6o4kfdhJIWaRF00sW6d72uHkJGfpXJY6/gKy2drr9HNicquS74X4hjw4A6Oq
         NjlwV5DIfIYj+qf9E//lhw7/EunZbgnm/L+LvpLhv8frha0B7u9z012HSPntrB60CzVC
         tn0w==
X-Gm-Message-State: AOAM530Qdk3mE5Prwi11vakAkBmP0J5PJk2n1Q0M8tBbU/4BT3vAGD02
        IoT9uT5QFmLER7qrBe5YxCzgAQ==
X-Google-Smtp-Source: ABdhPJwoyEHiKGX2LHWti1yU+tp0BLmD36xMlD41AnkPLxpFfYI0J8MsaCAhBWjLpF7+Wu5WGVLvug==
X-Received: by 2002:ac2:410b:0:b0:448:58a8:3e8a with SMTP id b11-20020ac2410b000000b0044858a83e8amr17874063lfi.258.1650541067634;
        Thu, 21 Apr 2022 04:37:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n17-20020a2e8791000000b0024db2d87102sm1518618lji.64.2022.04.21.04.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 04:37:47 -0700 (PDT)
Message-ID: <4642b8dd-a638-79c6-c0c6-d72eca41d900@linaro.org>
Date:   Thu, 21 Apr 2022 14:37:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 0/6] PCI: qcom: rework pipe_clk/pipe_clk_src handling
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20220413233144.275926-1-dmitry.baryshkov@linaro.org>
 <YmEx5JPcDucjDiho@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YmEx5JPcDucjDiho@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/04/2022 13:28, Johan Hovold wrote:
> On Thu, Apr 14, 2022 at 02:31:38AM +0300, Dmitry Baryshkov wrote:
>> PCIe pipe clk (and some other clocks) must be parked to the "safe"
>> source (bi_tcxo) when corresponding GDSC is turned off and on again.
>> Currently this is handcoded in the PCIe driver by reparenting the
>> gcc_pipe_N_clk_src clock.
>>
>> Instead of doing it manually, follow the approach used by
>> clk_rcg2_shared_ops and implement this parking in the enable() and
>> disable() clock operations for respective pipe clocks.
> 
> Please take a look at the alternative approach of moving the pipe clock
> muxing into the PHY driver:
> 
> 	https://lore.kernel.org/all/20220421102041.17345-1-johan+linaro@kernel.org/
> 
> The implementation is more straight forward and I believe it is also
> more conceptually sound as it ties the muxing to when the PHY is powered
> on so that the GCC pipe clock always has a valid source.

I still have a slight preference for the automated variant:
  - Your code is manually doing exactly the same thing. Remuxing the 
clocks in connection to the GCC_PIPE_n_CLOCK enabling/disabling
  - DTS compatibility is preserved


-- 
With best wishes
Dmitry
