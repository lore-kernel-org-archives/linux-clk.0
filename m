Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2F9C77B7A
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 08:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241461AbjFMIiD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 04:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241473AbjFMIhs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 04:37:48 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0582CD
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 01:37:34 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so7448640a12.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 01:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686645453; x=1689237453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eieFDOWGVlPEoV+uu02UIa/Flz5UfVj5E0AU8iFp47Q=;
        b=Dib4/U5h901JbAgTHrHwuRc/BP64q/6tXhACQawjYuM0GJ+r7DRohI2n5/ghXOCQez
         SUYhlc27QWItVo+B54UX8JxiV/yD64tVrGPdr/MoDjOThUDupsIHWIcKXJWcKloDtPrd
         w2ccx9w0Vj/A6lM9D33GPkD683D4Gb/k0UIIMAmpkdddAsrNw49AvW5S5XvsadI/bjeU
         EYJFU+q9vkoc2wHSBbx2CBFbrHscNcZoY8G+1vnqVxTYPCC5bCwGn0g0qoA/2vCmywwp
         1HrjLTx8yiaPEnBOR+VtEPbMwOoiGR+exjyJp3NTFigxRD1DeekED/E6ECFRVolcG7ja
         l3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686645453; x=1689237453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eieFDOWGVlPEoV+uu02UIa/Flz5UfVj5E0AU8iFp47Q=;
        b=K7HheUUptZzeF4K4mNWEzHjnqyKJELKbzPcWx+lOqxf2gvkkdjefRVanixLI1Y/S4u
         h/lvVgYxvle9PaIZoIfVe2MK+NHHX0GYSgCvOauxm5ICs2lx8aG1caWsgLuuJCa7rLOZ
         JKtakQcvqSskqqAgs8MEtDfgKrb7i3J/s3zgrtQMJ1kkxB7dgsTJc3U9bqyex79eO+tH
         j2vlzu2mrV8j3wfu4fnBcRvveinNoRhORwxoCljL5RIlQ46WImFdU7Cb+fMjVBnHWV1t
         PC7NijtuKWumHNy++Nc6sXUJJVR0fedz56Fsyv0IJu9UWfRrdU7keZ3Vrci+yjQMHQ3m
         gVIA==
X-Gm-Message-State: AC+VfDwnC9ZEJzjUBuj3TKlYML2tnn/phG1YyXCH/NedD2siqmVUGvta
        F+RmSrqUEInXkSNNgy+4UspcHA==
X-Google-Smtp-Source: ACHHUZ6R/7AEBNtcMlokSBYRLlWvEbeqRO5/L5a6JXMT0ObKEPPU5MFom5uiOFEtB2qwpbj2npnOcg==
X-Received: by 2002:aa7:cd10:0:b0:514:9e81:9068 with SMTP id b16-20020aa7cd10000000b005149e819068mr6407877edw.13.1686645453527;
        Tue, 13 Jun 2023 01:37:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m8-20020a056402050800b005149cb5ee2dsm6105361edv.82.2023.06.13.01.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 01:37:33 -0700 (PDT)
Message-ID: <feebd8cd-7713-f086-356b-cc2657a9708e@linaro.org>
Date:   Tue, 13 Jun 2023 10:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V4 0/4] Add camera clock controller support for SM8550
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230609115058.9059-1-quic_jkona@quicinc.com>
 <09ccfa54-5ada-8dff-03a2-b2ffb07a58c1@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <09ccfa54-5ada-8dff-03a2-b2ffb07a58c1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/06/2023 04:25, Bryan O'Donoghue wrote:
> On 09/06/2023 12:50, Jagadeesh Kona wrote:
>> Add bindings, driver and devicetree node for camera clock controller on
>> SM8550.
> 
> This is very confusing.
> 
> Your cover letter doesn't detail any changes and your individual patches 
> all say "no changes since v3", "no changes since v2"
> 
> If this is a RESEND then mark it as a RESEND.

That's indeed odd. Three versions without changes...

Best regards,
Krzysztof

