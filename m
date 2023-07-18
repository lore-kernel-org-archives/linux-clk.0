Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A2DC0015E
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jul 2023 13:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbjGRN2R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jul 2023 09:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbjGRN2G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jul 2023 09:28:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F38115
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 06:28:04 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso9515765e87.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 06:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689686883; x=1692278883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/cPoQz/+AJmmXvopS13cNP0md/5wRUpdbCUDGjAItOE=;
        b=u3KTX1uPpSlenGPojDWpwjBRENVe3ebfrHEAtV978LLahCTBOKNzIKch/wSrqgZm2T
         7sqo+IyAxRFrDVCVql28g8LtpQ3anmUyZlRqk7peYyXw/diQPlk8v5F39WDaZWMPx8dT
         3GF+OMfY9h3SxQzNB5kvxka1l0m7jSDxn3yLiw6LDjYMbq2kpMHDB9RyPmhcrKPTqYA8
         a1Z//rc5Rh2e4tQueLy/n3IkgHb7qjFZTTI9W5U9qcHIlUWF5G1xpVabqGCMeYdLF2qn
         ccyxh1jkVjOUinSn1/DwWrwPNoCbd56Bmdy5b7Wfjamb5eBmbsX4ATz7rXl87eI9pfqv
         Da2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689686883; x=1692278883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cPoQz/+AJmmXvopS13cNP0md/5wRUpdbCUDGjAItOE=;
        b=XfHXed1pL1dcWtZiOWHGWbKkE98QfVNHD07UDr6busJLIzqvVIiHM/FE/03wqjMARB
         Z/inF35aqYXSpddSm961a9Rdk5R4fURgfNB3QMLfL4OCoMaWurJq8+y1CXrhf727DWPi
         CG3Rd/wjK9X8OxMUzhcysw4P7Ebiw1O3tmvCPCuq5VSjE90Rq4ibkB2cxTap+5Od03eN
         s/T8A7pmdgZATK1u8jmkeUeev9Qvlt74iEZKPG81EEjtHFgiypiN75a4RFb3USJiIOw7
         0nCIbc2icAy0gmxeC8MlUFugRyi9W06eeHkKGa4dRrPoTeyZj8A5/Dxfou4bT5pM/GJJ
         KMyA==
X-Gm-Message-State: ABy/qLYkoDtJrvV+5LJTZDdho6Hic0uGpLls3hYR0jri0T3JVX3vO3ny
        nVQ9ILB7qFD+7t9VN7Dzoor5NR12TPGIJM1OTBQDDQ==
X-Google-Smtp-Source: APBJJlF6gSmhVuaH+cb0HdVej13Y4Y62gQ8P/A53TezUTkEdLrmPvAQdfqGB3qC2Ju1kkhVCEIJuvg==
X-Received: by 2002:a05:6512:546:b0:4fa:abe7:7c80 with SMTP id h6-20020a056512054600b004faabe77c80mr8843097lfl.39.1689686882751;
        Tue, 18 Jul 2023 06:28:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id 22-20020ac24856000000b004fbb3e91a3fsm438316lfy.114.2023.07.18.06.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 06:28:02 -0700 (PDT)
Message-ID: <febaa3cd-f8c3-c35e-2f1d-403c80c132b8@linaro.org>
Date:   Tue, 18 Jul 2023 15:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/15] clk: qcom: gpucc-sm6115: Add runtime PM
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
 <20230717-topic-branch_aon_cleanup-v1-7-27784d27a4f4@linaro.org>
 <ZLaSpFFBzP_Yz5yY@hovoldconsulting.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZLaSpFFBzP_Yz5yY@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18.07.2023 15:24, Johan Hovold wrote:
> On Mon, Jul 17, 2023 at 05:19:14PM +0200, Konrad Dybcio wrote:
>> The GPU_CC block on SM6115 is powered by the VDD_CX rail. We need to
>> ensure that it's enabled to prevent unwanted power collapse.
> 
> This bit is not correct, the power domain would not have been disabled
> until you enable runtime PM as part of this very patch.
Right, this was a bit of a thought-jump. The part that ensures there's
any vote at all is actually the DT commit adding a reference to the
genpd.

Konrad
