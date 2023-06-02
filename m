Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272CAC7EE24
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jun 2023 08:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbjFBItO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jun 2023 04:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233795AbjFBIsd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jun 2023 04:48:33 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A741A7
        for <linux-clk@vger.kernel.org>; Fri,  2 Jun 2023 01:48:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b1a3fa2cd2so20886541fa.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Jun 2023 01:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685695709; x=1688287709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IoQFQr/nPSNFex22doBQPMhVul05JZ1RLUaTofGh6rc=;
        b=oIOrjmJMTtBBGOq/2Ap4Pc5fVooiIfofixNKfmoziFbJDansAXfxM2Lzl5qgL6CuK/
         E0dmtS2SyWFo0da/54uB8NmmavclqDHnNVPpj9Rd31x71CHwZltsAxjHvrfytOFajcM8
         mMqnp0hJPEwDKHxbC2P221cVgnFIttyu2aJ+s16T75ctesZk8ltNNDyzXij8lwvOM71E
         Gkj8SAju7i2h7BdQsVxZfFMAwyhVEDQaQtECkoE/3LCSd0fzXTAWY0SXE+t0pKYnLtm9
         CuXFXPJiyomBtlI5sFvW7M5ZY+MTqqkjxJqN6Fyc1oKHcTAWO6mUcX/yZjLPTUCaOTxW
         QHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685695709; x=1688287709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IoQFQr/nPSNFex22doBQPMhVul05JZ1RLUaTofGh6rc=;
        b=lUenZiIAYLDNKtw72tVvgUYt+kXXt9CLTYN633lsbNeEUCz7sfb/5GDgJolf6Ru9hz
         4YL6y+OB14vCITipLoFNGA7CpO050yzqasAR7duFQp9eVNP5PTwWmlHfLTgS1b0mBStt
         dg/I/AL6eajz4WH9/C8sHJ16PrhgvIvsaZ3cZlQkR8xc49NABxl8y5kaTeJE+2bwYpYY
         EslZ6cn880ScSNsZ3d/juYScLwZSlj3zcgwp+ztxHCJc4PqG78arb40BOTKvYeVuC7p/
         Q/RaQRg/LVgOFLQk+hBcfViQYc/LQ9QM2x5FquxQDNy8hde/tiJmjOqSgFC5L4L/wpXq
         PYew==
X-Gm-Message-State: AC+VfDwLxh7lIhJjfjP01rsZuPORH5PcMVxEg0h9OClRsFakt5VJO9wx
        m4C6bSvLdogyylReqs9miC1ypg==
X-Google-Smtp-Source: ACHHUZ4CteD5aDWXschtOOQKsN+0Vs7jmkj6ydwf/dShOQgl0gKLTUFIt0A5KbHdVwxKiVNQPMfMYw==
X-Received: by 2002:a2e:801a:0:b0:2ac:7d3b:6312 with SMTP id j26-20020a2e801a000000b002ac7d3b6312mr1323052ljg.22.1685695709498;
        Fri, 02 Jun 2023 01:48:29 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id w22-20020a2e9996000000b002ab5421959fsm142943lji.90.2023.06.02.01.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 01:48:28 -0700 (PDT)
Message-ID: <ff395fd4-1100-6276-f8c5-a3815b64ceb8@linaro.org>
Date:   Fri, 2 Jun 2023 10:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 4/4] clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230531-topic-8998_mmssclk-v1-0-2b5a8fc90991@linaro.org>
 <20230531-topic-8998_mmssclk-v1-4-2b5a8fc90991@linaro.org>
 <CAOCk7Nogy3+5rvyzPEgsyJe7xE_17MXVs-=mniJJj=ELsCqzNQ@mail.gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAOCk7Nogy3+5rvyzPEgsyJe7xE_17MXVs-=mniJJj=ELsCqzNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 1.06.2023 16:14, Jeffrey Hugo wrote:
> On Wed, May 31, 2023 at 3:01 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> The SMMU GDSC doesn't have to be ALWAYS-ON and shouldn't feature the
>> HW_CTRL flag (it's separate from hw_ctrl_addr).  In addition to that,
>> it should feature a cxc entry for bimc_smmu_axi_clk and be marked as
>> votable.
>>
>> Fix all of these issues.
>>
>> Fixes: d14b15b5931c ("clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Was this tested on a system where the bootloader has enabled the
> display and it is active during Linux boot?
No, I only have a device whose bootloader doesn't initialize display.

> 
> I seem to recall that in that scenario, Linux would boot up, see that
> the GDSC is on, not see any clients for it (still initializing), turn
> it off, and kill the display which then results in either a mess of
> errors or a bus lockup.
I see 2 possible scenarios: either the display shuts off (because
somebody hasn't described the hardware properly and Linux isn't)
aware of all dependencies, or we get bus errors because we only
shut down / initialize some hardware partially, also possibly due
to bad dependency description.

Konrad
> 
> -Jeff
