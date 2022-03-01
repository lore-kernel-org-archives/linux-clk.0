Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFAEC4332F
	for <linux-clk@archiver.kernel.org>; Tue,  1 Mar 2022 09:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbiCAJcM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Mar 2022 04:32:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233795AbiCAJcL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2022 04:32:11 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29A98A32B
        for <linux-clk@vger.kernel.org>; Tue,  1 Mar 2022 01:31:20 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b11so25796107lfb.12
        for <linux-clk@vger.kernel.org>; Tue, 01 Mar 2022 01:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4DkiXvyHRpc71ZtlhKH8TRiv9o2sQVKgD3uidZZLhpo=;
        b=PqojRuog8bpPx1w8h2FUMqeI33TtNlDkm43wERwklRhbcemRpzrNXd9lWMTblARktv
         llSXaYS0lLwLed/6Zcx+MML78pBvC41fSSSUpRmFw0Yl6WPz51p0MadGe+Rspz0qQOB0
         bf6StiJs46tCPq91fFCZPzJLCe0l+wHsZf0ZxTQGbkFO2p1XFAaePmGzaucSem6NzRg7
         tFv+DByVil4rwbKhO7+r013BG3+CBx2k5UTGX43waEsoCfeyULZ1aNRnzyjBcjh7/p5B
         OyW3OSPDR9JnxIKcQpFs9XHC1XTs83BydJrN54rXrFRL6Gtbw6rxFimu8dsM/uAV8KgI
         Djlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4DkiXvyHRpc71ZtlhKH8TRiv9o2sQVKgD3uidZZLhpo=;
        b=ZtDbJa4Mz2miwgE8IPD8zQVBwNHwfT01oQ30XSydUYt68CCMaaN8SkOdYAyfgU5edF
         FwsJnDDd1H/iqOcvrIhBYIAXz7trpS7eRXAHsQCJAwfs3qObRz+TDZ7UcTSA4yaQhUpq
         kP9roPi0bnmhRQVNX9148pm8gaYLAi6K0Ej57cZUCpWubVZ8EtSGic1k3fGD785i+tqH
         Vy/YMgMzXxKgN8D6fmQew/SgqjR6P+2JvFhpAXr0kF8qAFvf7L5lZnAXY1Nati8BzM1i
         R2emKTtWqj3hvPTyQCdS1K18Z6NZMo4pu6yNMtSBgWWc6fJZMQ1/wXJ34ByLiDocR6YX
         8BpQ==
X-Gm-Message-State: AOAM533gXUC4lTXYmn03dvIoJ+jjluz4wJUMLpLjGsiRVsoaT+M4El72
        CZGuvLbdBD5j76CCNZC/1hG0Rw==
X-Google-Smtp-Source: ABdhPJwC+bx8EBgnt8xSuATXADXOjT3DoFMyoeaFshu3u2tR2Xg/U9zWY949nc+346eQfU9fcnVq/w==
X-Received: by 2002:a19:f807:0:b0:444:65e:d555 with SMTP id a7-20020a19f807000000b00444065ed555mr14928055lff.443.1646127078945;
        Tue, 01 Mar 2022 01:31:18 -0800 (PST)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id w19-20020a2e9593000000b00246189182dcsm1869337ljh.57.2022.03.01.01.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 01:31:18 -0800 (PST)
Subject: Re: [PATCH 1/8] dt-bindings: clock: add QCOM SM8450 camera clock
 bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
 <20220228120258.997027-2-vladimir.zapolskiy@linaro.org>
 <1646062016.591692.1049706.nullmailer@robh.at.kernel.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <3efb7fe7-d6a5-7f34-7b96-01d5666694a9@linaro.org>
Date:   Tue, 1 Mar 2022 11:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1646062016.591692.1049706.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/28/22 5:26 PM, Rob Herring wrote:
> On Mon, 28 Feb 2022 14:02:57 +0200, Vladimir Zapolskiy wrote:
>> The change adds device tree bindings for camera clock controller
>> found on SM8450 SoC.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../bindings/clock/qcom,camcc-sm8450.yaml     |  87 ++++++++++
>>   include/dt-bindings/clock/qcom,camcc-sm8450.h | 159 ++++++++++++++++++
>>   2 files changed, 246 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8450.h
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.example.dts:28.34-35 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1398: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1598821
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Apparently

     #include <dt-bindings/power/qcom-rpmpd.h>

in the example is missing, thank you for the report.

--
Best wishes,
Vladimir
