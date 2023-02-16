Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB5AC64ED6
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 10:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjBPKaX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjBPKaW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 05:30:22 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C144366B0
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:30:06 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id a10so2065682edu.9
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 02:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=trMy19lCfoNQKMYhTv+urc84CG0y8L9modeItMkODVw=;
        b=Mv8q6XBJEV3iD/szEGMfFVC45l6lbFtsFxQmNKoFSQsOLucCqN9WzaOlpGx5dyuTRh
         Rx7N0AfF1nCubrdjTYIKfn8ygSA63Bie+E49HgVYrMVAcfd9Xl94ltPW/+p1RF33MVKK
         YnTLvV+y6ogWtctt4qk4tQRscpRXtgMyp2FwhlWqtBRC0w2wEkFYBEdd0ZtiHHrf5Nc1
         3NCJQNb2SXbeqMisY+SbUN8yWn+whlhJIysz8rb7MnkdtXKzf36ry5ndLhZBNSZKVnq7
         xepfCLyzHpxvmBk6PITESzTxtOz1ITo34HUUlgpuefwN37dVY1JzXrOJi1bc0d5NEhbh
         NCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=trMy19lCfoNQKMYhTv+urc84CG0y8L9modeItMkODVw=;
        b=Qd9sbwMyHEovMV4IS4QJvPeT5AMLDSKcINoeWpbwGqyYt/tjclMH2om6RlKXwsh9Ol
         d3Ciuj7t8ed74tqXJaTxml+X9wStyHYEMA/56vNe4Rw9wt8T/MN8ddXIiuXa5af18xNL
         F2kMJgOdKbOipl2xBsjZw5Xy/1mWsb/uE1hlK6OrFc66VsDDn/CP2GZjk1z3WQ4+Bcym
         DGMB4v+FpEzhzRkzcWMaXF03su485vUMYVKdgFM0eRXet7P7JXobdITyp2U5mZCk+mcu
         Yunr9ChMUmzohkIZShN6xQ/Bodij2SuCl+dgqMD6z/y7Fjmo5p+TK700I4Vhyo74pM5N
         3c4A==
X-Gm-Message-State: AO0yUKV4xV/HVv8myAJOAfslFpFfgrtpMkZSwVTK6HOEedlnwM36I7JZ
        o5YpFvliXg3iEP3jfC+XPu8ufw==
X-Google-Smtp-Source: AK7set+e6/QJL3lGLViNLI1RrrQJkAnhpGCZU/48DSywTKjOFl3uP6B32GFpz+Yqmal9PtkGNSwEkw==
X-Received: by 2002:aa7:da88:0:b0:4aa:f910:c21c with SMTP id q8-20020aa7da88000000b004aaf910c21cmr4671262eds.3.1676543404709;
        Thu, 16 Feb 2023 02:30:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v9-20020a509549000000b004acc6cbc451sm643303eda.36.2023.02.16.02.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:30:04 -0800 (PST)
Message-ID: <a1d93b17-ccd5-fc90-1450-b0b900e00916@linaro.org>
Date:   Thu, 16 Feb 2023 11:30:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/7] dt-bindings: phy: qcom,qmp-pcie: Add ipq9574
 compatible
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, mani@kernel.org, p.zabel@pengutronix.de,
        svarbanov@mm-sol.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com
References: <20230214164135.17039-1-quic_devipriy@quicinc.com>
 <20230214164135.17039-4-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214164135.17039-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/02/2023 17:41, Devi Priya wrote:
> Add the compatible for the PCIe QMP PHYs found on IPQ9574
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

