Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB99C636CC
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 18:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjAaSMq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 13:12:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjAaSMo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 13:12:44 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5352A2DE55
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 10:12:43 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso6259709wms.5
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 10:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xbXSQ6OEtMqbrzCaCH+4CFKzV8kb7O6knKTEHEwxtg=;
        b=pTdC4hTapnxGjFfDnLIGWrTWsC6CVb06DC60foFPyJHxkCKuhMiM6BCbcwZNFm8UFO
         wWANXR1cIOGxUiio5fiEXaMha8KKX1fkIWQCDKaMnBfVOkKvmg546TfIPMFFrk1hYiaL
         IN4cqgpvnm03+0fGH+4vf6dCZrgL6o9JRUgHYM+0mp4mwcNksjgVfO+jhP+qWZRS08/K
         v78o32sLc3MN/0KrnaXdkLeA+g1ESbm+L9Wmx9hqNoxamFs1/1HOxCf9MRmJ8zrYHJo4
         Sxc5d6orqhEsEQF2fXSB1TMd+BCTnUGTbkmtYzAhBUmzDxAqO7pqraoKp+1BkGGNVA5v
         1mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xbXSQ6OEtMqbrzCaCH+4CFKzV8kb7O6knKTEHEwxtg=;
        b=VZyuzzBACe3zecSQaO4VSXTkOjtPTdu1wT3/G0tI9Me0GuA8Um7jK1GNJELh/o7ZpL
         2bCvogFdQMz2pzxqptV5hzxlZyVg5mHFkTk40CRlwDys0ZF9+O8YnLHmgyGM8K5Gl9GM
         VS61VstWOQ7apxQfUEADsi+1toNBdBcaaDiovkSKw8NM8C5FyftWgdJE1LZH5mmZ1AKI
         Cz1xFHuOMDe5mI62haqknOXFetH39ZM03XtaYLikFelLC2Nnz8DRXnBX4vqvD404CwcM
         gW6B9Cndb7G+of3vf7PVIIq5Z/n1OzoEe43G6krHg9aaumy4qfKMTAxBcXwPgcCV1IDF
         mj4w==
X-Gm-Message-State: AO0yUKXVvQB2yTVbuWof6ftqQNWOlMahpVz6gC8hV66VZWWO4+nFGCRE
        xEKgWcfCx+kfz55czecJtqML1A==
X-Google-Smtp-Source: AK7set9KJluXNhz3WBawAdWPggaQHQLGOM3f1IrglogXOBQ91b8jUJxQJ31dYOyzOhsHMoM+hTNSOQ==
X-Received: by 2002:a05:600c:1c9c:b0:3de:d9f:3025 with SMTP id k28-20020a05600c1c9c00b003de0d9f3025mr1059012wms.0.1675188761932;
        Tue, 31 Jan 2023 10:12:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c358900b003dc1f466a25sm20886882wmq.25.2023.01.31.10.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 10:12:41 -0800 (PST)
Message-ID: <e7b26499-baed-d2a2-0113-04b9de375404@linaro.org>
Date:   Tue, 31 Jan 2023 19:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 3/7] dt-bindings: pinctrl: qcom: Add support for
 IPQ9574
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230130125528.11509-1-quic_devipriy@quicinc.com>
 <20230130125528.11509-4-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130125528.11509-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/01/2023 13:55, devi priya wrote:
> Add new binding document for pinctrl on IPQ9574
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

