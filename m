Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A312AEB64DA
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 09:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbjFXJNA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Jun 2023 05:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjFXJM7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 05:12:59 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408DA10F7
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:12:58 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so1058796a12.0
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687597976; x=1690189976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vchTo0Ol++OLJmq7HkKHErizaURF3xHVTmmMX3ficGE=;
        b=lbMMOlNVSXG7UBvaMUImfSKH7/n6r6Ndl26O12IO6VUdAMh57hAh7TKLUcTQEmzW4z
         8qiviylmAklg5Zgk6kOOVYxUQCvuwmfjxlWR6KoxtUAX+Knh/p/GPT1DhyXmednt/n/b
         XFGWInS0/evgU+4t6VgZJMb5EWyrhwzut3lhcxOnLtNPn6tWeOOijFaxiKqfCoeuO/ph
         r6uzYWtZfjHw6J3donHZpDZT2yNsyrY8auaWHd+eelL363XvSEcKaUJBRm+3FCJFZKaL
         y5nTgBhsjWwFCZ7FCLvn/39YP3rvOVIGdLD+RuJCPk9TREWL+Izhl6x7Q8gWxH2/SJ29
         a1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687597976; x=1690189976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vchTo0Ol++OLJmq7HkKHErizaURF3xHVTmmMX3ficGE=;
        b=PvAKD8ylEFKn4/d///J1+uqCqpdUaPr+XXMISJpf947DAOBATxqPNFXRxCfzf0P3Am
         FA1PLylzJl5FkvE9YAJDcM70lYA9ua64fOMCqEs0PM5W531H+qy5Kzigv6etTg5wFDIO
         39S3mcjMsTFCjJRQTxnXfhgXrxYpOSY5JvcJ+iTk1YstRxlHUjdqxtrUkiC46zi96nnx
         vjxPEjGI1eeN1Voe5lkalprZ7JzfWlT2jrcy3XHKY1c6qm9a6WH15ESFTQ86ioraGcU4
         GkvYJsQ8fuKVG7TMkX5PsTzGBVgzOquXehdTIH7IywJgK1M4iCek4L/g2VeEoCD2Hu+s
         nhcw==
X-Gm-Message-State: AC+VfDw1RWIjdCupzoJs+Ukr1X5d/eTHQ/f2kJ9f15VzwXAAYh1RQ9Mr
        uqx9YSP1kInThEiNhlUu9ukSGg==
X-Google-Smtp-Source: ACHHUZ6HroITc5YdkUcavz4MKFxBB8L412c78SNrFWbnl1gdMQWQ0zgOQinmNiUzqMWS9McYR20j2w==
X-Received: by 2002:a05:6402:35c5:b0:51b:fd09:9ec1 with SMTP id z5-20020a05640235c500b0051bfd099ec1mr2819074edc.0.1687597976653;
        Sat, 24 Jun 2023 02:12:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i4-20020a056402054400b0051a318c0120sm461301edx.28.2023.06.24.02.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:12:56 -0700 (PDT)
Message-ID: <6bbf239f-d530-2f1e-ff52-361f7c9cc951@linaro.org>
Date:   Sat, 24 Jun 2023 11:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/06/2023 02:41, Marijn Suijten wrote:
> SM6125 is identical to SM6375 except that while downstream also defines
> a throttle clock, its presence results in timeouts whereas SM6375
> requires it to not observe any timeouts.

Then it should not be allowed, so you need either "else:" block or
another "if: properties: compatible:" to disallow it. Because in current
patch it would be allowed.

Best regards,
Krzysztof

