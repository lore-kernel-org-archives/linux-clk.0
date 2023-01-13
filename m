Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53068C54EBE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 08:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240123AbjAMIn7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 03:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233650AbjAMInz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 03:43:55 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A1155650
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 00:43:53 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id vm8so50655004ejc.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 00:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zB+Yx7ZN+t7edTSSom9Kj39XMeVTKD+ND0VCe3SN4Xo=;
        b=T0mlgn8SoCNdoXKYzWPoS6UZfF4bzgKg38/V/2QqDRoLC8pHUYv6ZiFwbPYy3kJjyf
         gOZ0KTVHs9NjUAqYjo+BNTiT809LbyGIQaQ2tRv9TBNw9x+NOWfWunTvDHWn/hYiMhgX
         ks/HSCZqpbrt3g/tYDo5xacZQ6Kg7EwNxgCCMBRCuvCeIiHQgoAL1mKgyBroSxKB1P3P
         lI1FulipNUMrGHzrKS7Kzotv+wldtlp4dc4iHAVOOaTOKrwpQtYW2GEF8mX1YQanjtYQ
         qHCOiL942qC1P2KpmkiocIEW7RF6lZS3RKqBF2l9C1joEWR2MoG8QlBAGvmi1BL1mqo4
         94EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zB+Yx7ZN+t7edTSSom9Kj39XMeVTKD+ND0VCe3SN4Xo=;
        b=xEBuwWtl7VmuYm50kUF9UC//16yuiP6Ag3sG01h6LVstEiP5CxiwxFaea6qdYFAEU0
         EFz9wZKLx+E99F584CXUqLh7+cxwbiJNJ4YRMwevPRR/vPFQkjDvCPe1cnbLNxbPP0G4
         1GA59nNjB+uLOeALK1OGfznpCEiQrKj9ywHcghJVY5iksj53d24W0v7tSSpddbgq83d9
         EUkkk3HB3hsK9joKMegmEhiUDIOoi8wpT0bTF7x585rMz0FTR6GqWYqcjTIkU7T9aHWv
         zsQIl9dqjukUdn0epnW57IkulIt0+cTmAhlOjWfBeVYAYVggrRue6aOXWWlAKHcWCBsW
         PgQg==
X-Gm-Message-State: AFqh2kqXXxmmFbZF7LjqSczv+PRyAhR1gmaze8iJQWuopvMXJ1QL84Bz
        jJhDEOfLZ5fZl16bHERMk4x94g==
X-Google-Smtp-Source: AMrXdXtxzKO66Ep+oG3JB08FrDupgVqkcya4/5xLrZ8ij7hNjKIxPF0yY8p0tpEqRM+R6h/+bYJM8A==
X-Received: by 2002:a17:906:5fd0:b0:862:11f6:a082 with SMTP id k16-20020a1709065fd000b0086211f6a082mr6581682ejv.17.1673599431999;
        Fri, 13 Jan 2023 00:43:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b0084d242d07ffsm7979277ejm.8.2023.01.13.00.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:43:51 -0800 (PST)
Message-ID: <04e90058-606e-9f0d-3e1c-844595b36fb1@linaro.org>
Date:   Fri, 13 Jan 2023 09:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 1/2] dt-bindings: clock: Add QDU1000 and QRU1000 GCC
 clocks
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230112204446.30236-1-quic_molvera@quicinc.com>
 <20230112204446.30236-2-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230112204446.30236-2-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/01/2023 21:44, Melody Olvera wrote:
> Add device tree bindings for global clock controller on QDU1000 and
> QRU1000 SoCs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/clock/qcom,qdu1000-gcc.yaml      |  51 +++++
>  include/dt-bindings/clock/qcom,qdu1000-gcc.h  | 175 ++++++++++++++++++
>  2 files changed, 226 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,qdu1000-gcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,qdu1000-gcc.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

