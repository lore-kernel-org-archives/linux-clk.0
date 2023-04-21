Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F0AC77B76
	for <linux-clk@archiver.kernel.org>; Fri, 21 Apr 2023 16:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbjDUQ2I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Apr 2023 12:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233088AbjDUQ2G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2023 12:28:06 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37ED713F89
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 09:28:01 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-506b8c6bc07so3097934a12.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 09:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682094479; x=1684686479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S51TzJEKK9WWVDYr4Tc1gJpcMzkHWh1WXqblt4YDlC0=;
        b=CETPV90ihN3b3DZOnlv9hQKr0fh4gspi1VCr9VdP4hwDkdtmZ9AgF5tdmnECAHPp+V
         RKWp1KvQD2X5o8mx+dj5hshVZywtPp011NNTJ1RVMADvlgve1fngNYOOtu8/mkGQv8S3
         UQ4bja+i7aMHCdtiERCr0Kgvko21kA8OJ2FNFCa6SRpFiBUyyaljnZWHdVDyu8sksfeI
         h/qQuwtNvzj1lVvuYVJr/87Ah+oIUnGt4mEOfV5eBH3noIbpPg+/FxLR9om20wPDR89K
         TyR4zf0P3Hb8lkQ6duOweA3p9nR6TklUsLo05M+ge6x8oJzsaY0bBFh/y2FVuvSzXZaw
         IJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682094479; x=1684686479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S51TzJEKK9WWVDYr4Tc1gJpcMzkHWh1WXqblt4YDlC0=;
        b=PhjgBUrZuE+ZQcqbAMoYwhN2v1A1LbogE83vKVC6RoEu7cXjiSWH9X38+zXyBetFu2
         97r83seOgEky3c6oDHZg4nIjDXBrXMgn1/JL5vv9Lim4o4jUAt8VgjTjNBrT673fylTs
         Gm+MZATX6QOQa0VjGBMV9rRxROgzhH4mf9RdyktiGhhMNx8vfmY3kr8+6UFAx9xkM7mC
         FIubEAAWmy/UOtn/CeCXwX0MLCwNid8lcM4wJ8nm8fbvnaSICT74OuUIx8iJi42+J9hX
         KRL4o6Gs8gaVuDuzMPfnYp7vNqQjk5OhQTIuEwQ7GqxV6OZDtmTvesqrBgik5aEgl0/Y
         voGw==
X-Gm-Message-State: AAQBX9cdAm877H66RRgJu5Vj2tmHu08j8zSpt/kTVQRbbhMfkP39ChZd
        ipDOXUSdAf+e8ZQ569Mg4DQgIg==
X-Google-Smtp-Source: AKy350YDsOgKLoK5tAIioZExs34dWYBZrpIx7o0tWafmx6898YyxY8cwVVzZn6+Qk1owXo7rwySlYg==
X-Received: by 2002:a05:6402:6c7:b0:504:9345:ffa4 with SMTP id n7-20020a05640206c700b005049345ffa4mr7172456edy.21.1682094479554;
        Fri, 21 Apr 2023 09:27:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883? ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id v1-20020aa7dbc1000000b005029c47f814sm1983225edt.49.2023.04.21.09.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:27:59 -0700 (PDT)
Message-ID: <f8aae62c-e3c5-5fca-7a56-0bc9c0efbd66@linaro.org>
Date:   Fri, 21 Apr 2023 18:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 2/8] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
 PHY
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1680693149.git.quic_varada@quicinc.com>
 <1efa9a64499767d939efadd0aef897ac4a6e54eb.1680693149.git.quic_varada@quicinc.com>
 <0a66e291-a86d-1ff9-e674-839b8cc8f1da@linaro.org>
 <ZDz9t9TkBqZ1fcfn@hovoldconsulting.com>
 <20230421095838.GA5813@varda-linux.qualcomm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421095838.GA5813@varda-linux.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/04/2023 11:58, Varadarajan Narayanan wrote:
> On Mon, Apr 17, 2023 at 10:05:11AM +0200, Johan Hovold wrote:
>> On Thu, Apr 06, 2023 at 09:41:49AM +0200, Krzysztof Kozlowski wrote:
>>> On 05/04/2023 13:41, Varadarajan Narayanan wrote:
>>>> Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
>>>>
>>>> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
>>>> ---
>>>>  Changes in v8:
>>>> 	- Update clock names for ipq9574
>>>>
>>>>  Changes in v6:
>>>> 	- Made power-domains optional
>>>>
>>>> Note: In the earlier patch sets, had used the (legacy)
>>>> specification available in qcom,msm8996-qmp-usb3-phy.yaml. Moved
>>>> to newer specification in qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>>> ---
>>>>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 43 +++++++++++++++++++---
>>>>  1 file changed, 37 insertions(+), 6 deletions(-)
>>
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: aux
>>>> +            - const: ref
>>>> +            - const: com_aux
>>>
>>> Can anyone explain me why do we name these (here and other Qualcomm
>>> bindings) based on clock name, not input? Just because different clock
>>> is fed to the block, does not necessarily mean the input should be named
>>> differently.
>>
>> I guess part of the answer is that this has just been copied from the
>> vendor dts and (almost) no one but Qualcomm has access to the
>> documentation. What would the input names be here?
>>
>> Also note that there are SoCs that enable both 'cfg_ahb' and 'com_aux'
>> (e.g. sc7180).
> 
> The clock name definitions are auto-generated based on the clock
> tree definitions provided by the h/w team. We followed the naming
> pattern done in the previous SoCs.

Are you sure? We talk about clock inputs here.

Best regards,
Krzysztof

