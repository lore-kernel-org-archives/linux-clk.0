Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBC2CCA47C
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jul 2022 14:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbiGDOGb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jul 2022 10:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233294AbiGDOGa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jul 2022 10:06:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C5EDF8C
        for <linux-clk@vger.kernel.org>; Mon,  4 Jul 2022 07:06:29 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f39so16008727lfv.3
        for <linux-clk@vger.kernel.org>; Mon, 04 Jul 2022 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mH0yxf4bTO4oPaEiMtqGSQ6H2I4aOYiJptIGj59+bEI=;
        b=VH+YB8Xb0wtm9/FvzelBVX3e1RzSIHKaE0pzjtJvFh0d975VUUyIRd6opECzlc5ddv
         U45blUucGBmRF0zISycId8WiJeB8dD3zgL/uDuHpe4MeHJJV7YQN2lfVc4ilqZeF6qkS
         5iIoghEN3yPBwuKdF4F0aXa3TXao7eLwdIoinHzKuJTrpHRuKbTc+1R/CD0xa085rmF7
         7EzS7Bs1UhPGoxkISp+EpNVVa9j0ThU1eZbAYeJhylcskxPKrw8jFSGdsXgMacmEUG0K
         MM/I5/6X2KQPpKzTlBZ2d+Fx4V5yEQUVn+wI9SqtXPSmW/zHRl/tCHO3yLCI7EfXk2aj
         sJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mH0yxf4bTO4oPaEiMtqGSQ6H2I4aOYiJptIGj59+bEI=;
        b=yVoyyaxOEqP8CnFybkPwVETz4gd7KMGCmYC1E7KV4HXTXpzO04kW5rTlYxGg3OXGGs
         GIa+2BSLkZuiAYsOykoMUF1WVnxPJZaSGtHiDAGva9vuE2hboVD1nSg4L4eux/eOikPJ
         Uu1ziqcHYc1uDnu0rX8FxFSmaTUYs9WeWPMbG3j1rSPV5BJ2rbQLqU3G/1uraSN1fLwq
         coW/GsgJR9BNsRT3oLmHfSqeFa84a4Y+5UXvFGmKkv+xlFJndb4F6PFw9n0UTJJPCvpl
         x2UE9OzgxPXwnTaSkQIzX/kvrDyebKQIlhUyAeKTVFsVxzUHqcJQXW5qLWQzaFra5Kwo
         Jr/g==
X-Gm-Message-State: AJIora/qbCfjhUtGRM/IqK1RQJcyHZqplUTrN1pwksXiTcdkUOZ3cvyQ
        u9cKjSSOVCHKSgcJISymtbgUJA==
X-Google-Smtp-Source: AGRyM1ufFaheGuK6pRwKUMNgzrKsIlfuTuiCOT9EW1N1qTshy2iz7cnZCHV6FzYxjS3hjuL8nYmGxg==
X-Received: by 2002:a05:6512:c24:b0:47f:7351:379b with SMTP id z36-20020a0565120c2400b0047f7351379bmr20178011lfu.328.1656943587920;
        Mon, 04 Jul 2022 07:06:27 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id n10-20020a2e82ca000000b0025c068f123dsm2025789ljh.30.2022.07.04.07.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 07:06:27 -0700 (PDT)
Message-ID: <ca1d2e8b-1942-727a-2549-9b02a616626e@linaro.org>
Date:   Mon, 4 Jul 2022 16:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/6] dt-bindings: clock: qcom,rpmcc: Add MSM8909
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>
References: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
 <20220704133000.2768380-6-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220704133000.2768380-6-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/07/2022 15:29, Stephan Gerhold wrote:
> Document the "qcom,rpmcc-msm8909" compatible for the clocks available
> via the RPM on the MSM8909 SoC.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
