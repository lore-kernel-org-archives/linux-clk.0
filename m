Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF5EC001DF
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jul 2023 18:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbjGZSYk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjGZSYj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jul 2023 14:24:39 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8FD1FC0
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 11:24:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so1676910e87.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 11:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690395877; x=1691000677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMm+MukByH/bngQDWKuculviOTh1bUuwstlQEscD59I=;
        b=jR5ta4KXGrccAKVEC2MgSliubflD3OrhlooylN4hMy/Jhf6cWJ9W3gYKmTTwVWVxj1
         zLwshMd1VShyLFptZVe2Xxbn4JBE8PZ029Wvxwpr8CGD29GVRqA+svEZcblDGDIklDJj
         lmoap2aX5Q74drwCaWBWtBVFYqcTlwQaOS42wX0ajIzHp2TXyicgd6461jA6SAaxL6ht
         d2/J2cvgztCC0GVWyQKIybee39ZlxMlrwBUAWkUPvuAYYlqNi+pltu7K6Xzlqb8M89A6
         QJ/K+KPKqIwPNnNSwlwkS6R9GVjTrVUdBBt11gWO5In1AHvgPMH16Ux0VFSCm6bFrMAq
         vcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690395877; x=1691000677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMm+MukByH/bngQDWKuculviOTh1bUuwstlQEscD59I=;
        b=HMIswR+Af9ffpnB3KgH1ofhC2rz0lvEZZSmhdqN7U7b+Ni8mY1jaYraPVbQkDO1kw6
         C/54/HrwjI9WZN7s8MLFg9vr+b57PCLWNhX7rKaF6uyZtKyD96RJ4FElcBki6JVDEGh0
         hd6mScRgwImObiX+nu4g88m1S5Vqa2/gWbr7NmmeQLuh+UPKSlovcCrkvlxIez2LThj/
         3GgTGPXkc69DhJlKSUapr+cFcfd1cMpWIuEEr5gxhx/sbPvgrZlXPpbDZRaOCG/BlDVU
         ns9YIjMqkYfgIrtP5BYnITDb6yBMV6i8Oj+cRV6Vs4InJsV5GTUXc1+Ri/dQFpHgfVbe
         CjpQ==
X-Gm-Message-State: ABy/qLZ7rCTH47dI5FiJ70A1/8S0tEHSQV6xV09Ue/jYFEEa9qFFm3Z3
        f7bwL85cMwySwfj307OdyEYqqg==
X-Google-Smtp-Source: APBJJlEC4KK34ke9StScpXn5HQIKp4rixX7PSMR2RamZGbcI/hdvdvZ/spxTurGWaQ+Aa3lvHDKLsQ==
X-Received: by 2002:a05:6512:2038:b0:4fe:993:2220 with SMTP id s24-20020a056512203800b004fe09932220mr86936lfs.27.1690395876709;
        Wed, 26 Jul 2023 11:24:36 -0700 (PDT)
Received: from [192.168.1.101] (abxi164.neoplus.adsl.tpnet.pl. [83.9.2.164])
        by smtp.gmail.com with ESMTPSA id e28-20020ac2547c000000b004f755ceafbcsm3408784lfn.217.2023.07.26.11.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 11:24:36 -0700 (PDT)
Message-ID: <9ea4f4ed-8be0-859f-4f5d-d3bd0a727cb9@linaro.org>
Date:   Wed, 26 Jul 2023 20:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: reset: Increase max reset delay
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
References: <20230726-topic-qcom_reset-v1-0-92de6d3e4c7c@linaro.org>
 <20230726-topic-qcom_reset-v1-1-92de6d3e4c7c@linaro.org>
 <ZMFkO5aAT5I5kBac@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZMFkO5aAT5I5kBac@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26.07.2023 20:21, Stephan Gerhold wrote:
> On Wed, Jul 26, 2023 at 03:26:19PM +0200, Konrad Dybcio wrote:
>> u8 limits us to 255 microseconds of delay. Promote the delay variable to
>> u16 to hold bigger values.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> It would be clearer to change this together with an actual user that
> needs > 255us. AFAICT atm MSM8909 is the only user of this and it has
> just 15us.
Some LPASS resets ask for 500, but I'm still working on that driver.

Konrad
