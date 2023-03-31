Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C54C76196
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 09:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbjCaJag (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 05:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbjCaJaX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 05:30:23 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244321EA22
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 02:29:51 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 20so22413849lju.0
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680254964;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xyrQEWBcGQCcQKMuIMGnsKsvjpO5SyMCKXO50u/A5dE=;
        b=tKXbS1L9XTVfMWeRoYRRKqXRi97Op1WJixOALHsNXtvCESO9rv2JDp+JY18uDKO1gK
         U46MJWSv6IxwnepmJysSNdWPY57JfYEGrHAFhnPB/w+U+UTkCT5tgfdOoYTd92U7NyfO
         3AcHj7ZbCV8nGMF5tsQd19JdtlyFYjJWPIUYurYXrBe90CX1/Z19vTKuGyqSHqb9Yq4b
         cTMQXikZ8FtrqLso/VFzRfwtjVH0fTzLNf3swDHKOIX1XMg+DzQg9EgcUrnpH0RW9uDp
         Bv3djpOP5u1GkYs9nTYnVduvmNSQUyq28slonnC29KJ0l7rsfn9jtNRV3E1sF3mTPieU
         QUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680254964;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyrQEWBcGQCcQKMuIMGnsKsvjpO5SyMCKXO50u/A5dE=;
        b=ZkEfxZDLIvczeOPXn2wTFSxQphnbmJguuIVDQyOFF5HDUR1dR+VcXSvNUlazUhdNCI
         daxMTZM/i4bNO0scvvIkIy4pfTm+LLS5Lkg8m1s6HBluXUg5FO3Ynsvh/4lQHxstGvOU
         PxW7k4Fo3S7XZ2NeeTNUiymGg5P18KivgIEtX7bYW84TQghmgoBrtDW638y+YoO7I2YV
         ShD+HJWp+x+2AOxxkmkUfUSLCJMrxY4RokOQUzpe1332peKrbBdbiTyWEd2OsaqIIOzk
         eT85rP3zaiT4HrbjWfTxt1+8h1ei0eE8P+WB2cKdcWN4qkXhC+E1FUkxFufE78Xmn8fG
         RPQQ==
X-Gm-Message-State: AAQBX9ceDNDqEY0HRvLi1J+uOkXTySY7qpj7ItGdkjGRgVETJkdfnUzg
        8A8rz9l3vCzVyS8i44Td6rpncQ==
X-Google-Smtp-Source: AKy350ZDwEg4Xan2DyhIEy8uX4nlR8olcULIN/U+W69y/RV9ibzr1WBEDgNNRTI5ZWPq4sD3dAFpqg==
X-Received: by 2002:a2e:2c0a:0:b0:2a6:72:f321 with SMTP id s10-20020a2e2c0a000000b002a60072f321mr4116961ljs.51.1680254963989;
        Fri, 31 Mar 2023 02:29:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u24-20020a2ea178000000b002a61bd34f63sm282052ljl.84.2023.03.31.02.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:29:23 -0700 (PDT)
Message-ID: <83ecc1fa-2e45-b47b-557e-4345c185eb35@linaro.org>
Date:   Fri, 31 Mar 2023 11:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: qcom,sc7280-lpasscc: Remove
 qdsp6ss register region
Content-Language: en-US
To:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>, swboyd@chromium.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
        quic_plai@quicinc.com, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
        quic_visr@quicinc.com
References: <20230327163249.1081824-1-quic_mohs@quicinc.com>
 <20230327163249.1081824-3-quic_mohs@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327163249.1081824-3-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/03/2023 18:32, Mohammad Rafi Shaik wrote:
> The qdsp6ss memory region 0x3000000 is being shared by ADSP remoteproc
> device and lpasscc clock device, hence causing memory conflict and 
> as the qdsp6ss clocks are being enabled in remoteproc driver,
> remove the qdsp6ss register from lpasscc.
> 
> Changing the base address of lpasscc based on the first register memory.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

What this patch is not saying is that several clocks are going to
disappear as well. It clearly should cause some impact on users of the
binding and driver however commit msg lacks explanation here.

Best regards,
Krzysztof

