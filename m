Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56694C6379F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 08:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbjBVIf7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 03:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjBVIfy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 03:35:54 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BBF367EE
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 00:35:36 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t15so7003151wrz.7
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 00:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqLeqFtFWR7kaexVhVYdbucppafycoMX3HxsJln5QQM=;
        b=BAU/BMflrsd71jY7Zmy3wd0a4qTln571RTTpXWhFuGHYxwkvkLbTTMkx+ioUthDrvT
         Fu/R2R5Pp98GMtOFKCvFBPbUUU13+8JyZNUWGbv7u2OxGLbGfZCxoxfjnS4JmILjl3ZH
         SPo8bug1dwrlw7YzVnW+Cw6WYZ2rlimj1jp4Y1lSMP8ME0bJg6Sl3nie235eUCJ1awg6
         +a163sCHSJcXX9DL9EgyQDZHjIS9C86HLAvSB+wGse/fnjfGNnSPHK4ulbw/KFDbUeRi
         FasbI5mTxIQPQD4INwTX7rmhT+7jpQMECP53hzp0e5j0CIHOUFeNEMKtb2lbnSATHXTV
         QtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqLeqFtFWR7kaexVhVYdbucppafycoMX3HxsJln5QQM=;
        b=THrX0SRVOuxvRpP9NhSa5k1A4eUuS1J/QiO4jcpgaV5gyDWP5A2t38V/YAywt6kPED
         KW+R7qxS52+GuuTaMN1OavWE2KmWA7bdG4Am5gvCdn3kbIXadYmUUo4Rsj9KX34Zb68N
         tiGT274/vHHaFIaQI57CVDO48o8l6I67R4A0UCsQo5qv6BPXPTtXy0ghs0XMW4/2nvsO
         nM1F5wbrslcnrr8oOjifSiliNQISHWkKExZu9FEctSIZmQ0N79Fld2oBbRY2krQSiWsm
         PUqzfACsrFnNMHA5YoCMFpiHZAkripU3RCgHxKPlrh4vZXczsy3IPTsJaR4uj2E0+ni9
         hIJw==
X-Gm-Message-State: AO0yUKVoS5susqjPT2MduQM24PX35zyP+FctJLdFOlo5RcJULbizCue2
        0iJ7wS1Q/nZVKN9DWd0YJKiJzA==
X-Google-Smtp-Source: AK7set8GLsJhTxHAyhh53R74Sa0dq3t8sxHEvLlHWZlORb30d+ZvUUNAXVBNiT7qWz/VfbI4AM9QZQ==
X-Received: by 2002:adf:fb8f:0:b0:2c5:58fb:fa92 with SMTP id a15-20020adffb8f000000b002c558fbfa92mr6272938wrr.7.1677054934954;
        Wed, 22 Feb 2023 00:35:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4c49000000b002c54536c662sm6451624wrt.34.2023.02.22.00.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:35:34 -0800 (PST)
Message-ID: <4aee9ad3-fe3b-7be3-ce71-df2365dd3482@linaro.org>
Date:   Wed, 22 Feb 2023 09:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>
References: <20230219045318.564342-1-andersson@kernel.org>
 <e62613b331da617d53515998a2c967d1.sboyd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e62613b331da617d53515998a2c967d1.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 20:50, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2023-02-18 20:53:18)
>> clk_disable_unused() is altered, to not consider clocks which comes from
>> a provider with sync_state defined. This makes it possible for
>> individual clock drivers to invoke this process once all clients has
>> been probed, avoiding the need for booting many systems with
>> clk_ignore_unused.
>> This is then enabled for SDM845 and SC8280XP clock controllers.
> 
> This needs to be reverted. I'm not going to pull this until then.
> 
>>
>> Support for QDU1000/QRU1000 Global clock controller, SA8775P Global
>> clock controller, SM8550 TCSR and display clock controller, SM6350 clock
>> controller, nd MSM8996 CBF and APCS clock controllers is introduced..
>>
> [...]
>>
>> Bjorn Andersson (5):
>>       Merge tag '1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com' into clk-for-6.3
>>       Merge branch '20230104093450.3150578-2-abel.vesa@linaro.org' into clk-for-6.3
>>       clk: qcom: Remove need for clk_ignore_unused on sc8280xp
>>       Merge branch '20230103-topic-sm8550-upstream-dispcc-v3-1-8a03d348c572@linaro.org' into clk-for-6.3
>>       Merge branch '20230112204446.30236-2-quic_molvera@quicinc.com' into HEAD
> 
> When you make merges, please describe what they're for and put that in
> the commit text. Also, reword things like 'into HEAD'.

I think these are all merges of patchsets (eg. b4 shazam --merge
<patchset_id>), thus it's the same as applying.

Best regards,
Krzysztof

