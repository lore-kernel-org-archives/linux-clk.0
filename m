Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FDCC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 21 May 2022 15:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355387AbiEUPYZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 May 2022 11:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355221AbiEUPYY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 May 2022 11:24:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE6F9346F
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 08:24:23 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u30so18797856lfm.9
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CJkhEfssZ1BBajH4a78QgJeIvXv9tPvvFZTXYZYK5WA=;
        b=stcDvw2efBjXUVD+LgS821+CqRfQqT5CIwCHlvwXIgvxDFOxyPdb0vfHChx4Iso8qT
         jQgfHwnPu5xPntjsS0qvKcywrnKieu+XGQbSAtsIzIQGJAgh+NcfhrBOqGIUI5jbhw6t
         e46V9mm19CfrjSkXJ3xUTbyOsdZK2LcAKdAYdPTZuHnmBUOXQelnqZFa+DZyZRXbAkCO
         GfCiG4dtu2B2UGBWIQYurv38N3ALT+OBwz+v+WBknIPGZEUzH057srPCmxbf+nKnf0uA
         +YLjjPAfjEnkdMt7YHBbnDwmFEafobdPnGdptRDRsK/3OaJoB1af4ZeYnhm35n5vmVU8
         FOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CJkhEfssZ1BBajH4a78QgJeIvXv9tPvvFZTXYZYK5WA=;
        b=e7F4SqQut0QgqZ5hlagSIZYEl8npNo+Tg/PT26cUdCTYK5UnfJk3knSdHsSW6zJXq1
         apZbXx7ZForWqDh0540DWYWfwjg0mwZout6UfcBE9It8X6SDG6JGNBssiVduUEtEW9gh
         tlplxspKlYPAceCRjA4M6Lvita5siPPIT2bvXnLDEK/TgivlU/mZU1f5O86ZGQYTBoA2
         NZaUsHFb9mTbxoMreUJJF6YeVETZX2HZdDdm1HBLne8T7s9res52Ta0EE6D1lbwyp7q7
         F8vTHckDn1pJx9DaRNZFOUNFKWnORn2N2qKMAOuYtbLkPjegwiqDakhZLDWeG3WxjkqK
         EUbA==
X-Gm-Message-State: AOAM531B7t+JGWnwrf/jOI8v8lofbyg4brM646AROU1CNxWAfqZyWC3E
        CziDJpkW4EeXAZe17GB98NT6UQ==
X-Google-Smtp-Source: ABdhPJyhLUZEE3ixw5JcnXmxUBJ7o134ZD/XU/hdbbznOJv0u/6InKS51qqX+SPPunJINfiLc1sSVQ==
X-Received: by 2002:a05:6512:1691:b0:46f:1e0:d0 with SMTP id bu17-20020a056512169100b0046f01e000d0mr10114108lfb.91.1653146662107;
        Sat, 21 May 2022 08:24:22 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id r18-20020a2e80d2000000b0024f3d1dae83sm753086ljg.11.2022.05.21.08.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 08:24:21 -0700 (PDT)
Message-ID: <dfb17f12-3d12-6959-5067-978809392938@linaro.org>
Date:   Sat, 21 May 2022 17:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 2/4] dt-bindings: clock: qcom,gcc-apq8064: split tsens
 to the child node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
 <20220521151437.1489111-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220521151437.1489111-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/05/2022 17:14, Dmitry Baryshkov wrote:
> Split tsens properties to the child node of the gcc. This follows the
> lead of ipq8064 (which also uses a separate node for tsens) and makes
> device tree closer to other platforms, where tsens is a completely
> separate device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
