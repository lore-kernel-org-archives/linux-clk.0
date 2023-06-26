Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D77EB64DA
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 09:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjFZJlr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 05:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjFZJlp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 05:41:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E24CF
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 02:41:43 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so4112685e87.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687772501; x=1690364501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=19bT2Ez/4QvTgxknmIPFBTrHf6pxmJEHTkf/9uC/xL8=;
        b=yxSw15WdZQVN8PNNGw4tN8SV99vD1IzWVIDaV+OmSwHh9ksBGU5lGCZtHTLv7n/g/8
         H9SPHpqRGkhlTjlUZ7bKs8YXJ4bM9clccA2bHRBZs6v1tNt+cX5IGOFQMre/EZhdcBhI
         Q+Ujvfz2WxBbnSMDJ/JmkbR0fbbu9HNTbGFuucGMEGY+fbWxAun2/KNZW79RCDXwCit6
         yVsFfwTSc7sRKQ6804vYSzLfWErTg3m5GseeBwVqVDjkwOq+Y+/S6VX4qUaUxOkJEDFD
         gT2BIpS3l3rCEB14LJDV/Qo/3b8e4eqCWNdRe6m/xbz3s/AgkiP9LTABisSYtWbTh9sW
         HvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687772501; x=1690364501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19bT2Ez/4QvTgxknmIPFBTrHf6pxmJEHTkf/9uC/xL8=;
        b=YS517L7dx9gZIr25mO71nusf28sVTl9ICNTIFEzZ96J+P4aWzJH7t7sF08sMEVdzF5
         87lZENfbToBvz0OpIl2Jzs7g79dLAmihNHZbUtyg7ujBfUsps5Pcay2P4F4fvIs6tHu2
         KBF+gNsYXugSCX0y//TgjkRJR0xKLdADNoDWWrVU3/6xN16GZLvJ6ir3sV8Evp8EyTNp
         P9GZbqIOTzExommsxwIVsZowBQZ7V0A6Evbm+0/jj4AC7uHBUloG4tzN3l1LkS8F6dQU
         iiyQN593S4/0lNFa7Zcnbr0iVhh6J/DZpxVstC+DWxaJTs9bJQAT+QmZXSIZ26jhu2/y
         dvMw==
X-Gm-Message-State: AC+VfDzud6QfAI4+YKZsod54XWJ+2XffpWPabBcMnro4xzDR7ha9HYP4
        Hy/YkQ3M93CWZ5rJrTBRaAwcYQ==
X-Google-Smtp-Source: ACHHUZ6QLpQ4x4dukEHxUmQX0UkdSkfQoSrgj9rfvM5FrrS3fIGQXAJ5KLDri7abT3n81xpiDDOWtQ==
X-Received: by 2002:a19:ca58:0:b0:4f8:b349:6938 with SMTP id h24-20020a19ca58000000b004f8b3496938mr9703822lfj.65.1687772501651;
        Mon, 26 Jun 2023 02:41:41 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id f16-20020ac251b0000000b004efae490c51sm1013345lfk.240.2023.06.26.02.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 02:41:41 -0700 (PDT)
Message-ID: <701916b3-388e-8216-f7ae-1837d5895d87@linaro.org>
Date:   Mon, 26 Jun 2023 11:41:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/15] drm/msm: Add SM6125 MDSS/DPU hardware and enable
 Sony Xperia 10 II panel
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <035ffdd2-27e3-99bc-f8a4-41e66685db09@linaro.org>
 <i5xxzhfhlwzoxlnezzgg42hzwzwfcgxv5gopqhb6vd3udz252b@wpznuvoleeta>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <i5xxzhfhlwzoxlnezzgg42hzwzwfcgxv5gopqhb6vd3udz252b@wpznuvoleeta>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25.06.2023 21:18, Marijn Suijten wrote:
> On 2023-06-24 03:42:46, Konrad Dybcio wrote:
>> On 24.06.2023 02:40, Marijn Suijten wrote:
>>> Bring up the SM6125 DPU now that all preliminary series (such as INTF
>>> TE) have been merged (for me to test the hardware properly)
>> We should not repeat the same mistake in the future.. Finding a
>> balance between releasing early and releasing what we can declare
>> working and tested code is hard, but we waaaaaaaay overstayed on
>> this one..
> 
> I don't understand what you mean by "mistake" at all.  Yes the DPU
> catalog portion of this series sat in my local branch for a very long
> time.  Yes it had to be rebased on top of conflicts many many times.
> 
> However, that time has also been used to fix and extend DPU where
> necessary, instead of submitting a half-broken or half-incomplete
> catalog entry...
> 
> Re "we overstayed": you could have asked to clean up and send my patch,
> so I don't take this as a mistake on my part as you are completely aware
> of my time schedule ;)
I didn't mean to pick on you. I just wanted to emphasize that a more
upstream-forward approach would have saved us quite some time on the
rebasing and cleaning-up front.



> 
>> Konrad
>> , and most
> 
> Also here, don't forget to re-quote my message if you break half-way in
> the line.
Ugh. All the time I've been doing this I thought thunderfox was smart
enough to do it for me. Apparently not and you're the 1st one to point
that out.

Konrad
> 
>>> other conflicting work (barring ongoing catalog *improvements*) has made
>>> its way in as well or is still being discussed.
>>
>>>
>>> The second part of the series complements that by immediately utilizing
>>> this hardware in DT, and even enabling the MDSS/DSI nodes complete with
>>> a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).
>>>
>>> The last patch ("sm6125-seine: Configure MDSS, DSI and panel") depends
>>> on (an impending v2 of) my Sony panel collection series [1].
>>>
>>> [1]: https://lore.kernel.org/linux-arm-msm/20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org/
>>>
>>> ---
>>> Marijn Suijten (15):
>>>       arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
>>>       dt-bindings: clock: qcom,dispcc-sm6125: Remove unused GCC_DISP_AHB_CLK
>>>       dt-bindings: clock: qcom,dispcc-sm6125: Require GCC PLL0 DIV clock
>>>       dt-bindings: clock: qcom,dispcc-sm6125: Allow power-domains property
>>>       dt-bindings: display/msm: dsi-controller-main: Document SM6125
>>>       dt-bindings: display/msm: sc7180-dpu: Describe SM6125
>>>       dt-bindings: display/msm: Add SM6125 MDSS
>>>       drm/msm/dpu: Add SM6125 support
>>>       drm/msm/mdss: Add SM6125 support
>>>       dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
>>>       drm/msm/dsi: Add 14nm phy configuration for SM6125
>>>       arm64: dts: qcom: sm6125: Switch fixed xo_board clock to RPM XO clock
>>>       arm64: dts: qcom: sm6125: Add dispcc node
>>>       arm64: dts: qcom: sm6125: Add display hardware nodes
>>>       arm64: dts: qcom: sm6125-seine: Configure MDSS, DSI and panel
>>>
>>>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |  17 +-
>>>  .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
>>>  .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
>>>  .../bindings/display/msm/qcom,sc7180-dpu.yaml      |   1 +
>>>  .../bindings/display/msm/qcom,sm6125-mdss.yaml     | 206 +++++++++++++++++
>>>  .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  59 +++++
>>>  arch/arm64/boot/dts/qcom/sm6125.dtsi               | 244 +++++++++++++++++++--
>>>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 173 +++++++++++++++
>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  15 ++
>>>  drivers/gpu/drm/msm/msm_mdss.c                     |   8 +
>>>  15 files changed, 712 insertions(+), 25 deletions(-)
>>> ---
>>> base-commit: 8d2be868b42c08290509c60515865f4de24ea704
>>> change-id: 20230624-sm6125-dpu-aedc9637ee7b
>>>
>>> Best regards,
