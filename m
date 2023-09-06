Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359FCEB8FB5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Sep 2023 08:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbjIFIGY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Sep 2023 04:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjIFIGX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Sep 2023 04:06:23 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095B2CF2
        for <linux-clk@vger.kernel.org>; Wed,  6 Sep 2023 01:06:19 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99bf1f632b8so519473166b.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Sep 2023 01:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693987577; x=1694592377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6rX866dZWeyzbwrDmGLylNXIPdDEierfj+vUzSrXHo=;
        b=OpMftCNYvMQ+JX4HPuHRdIFb38miZd91DdOI3N/Ld6RtW2c/lv4p5MMNFcpzE7JccN
         qWQIu/LtmocXSUYM/4rBYjhULtYLL8yw/674zROjMM6y2cZ/JXIaEn3I5OqK0h0t34qI
         OMuyuH43IRou5PHTNrf64n5rF02DVYOoiW9Dhv12NECcj1NCOF1LZqX0/oL6IMjOIOHx
         juVjHVa/JGjVHf/goJjB/Vg6SogQO6caoZ5RZuWz4tkdxb/CGyZyibtVM+qjYkIbLQSu
         1c5seF0GQQP6KKhi1z4xZgp1j8V2RQijBYfq+hFlB3xH1csRBQzlhOrpug6POQnJx6VB
         lvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987577; x=1694592377;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6rX866dZWeyzbwrDmGLylNXIPdDEierfj+vUzSrXHo=;
        b=ipnaSPsTSkEx32VW8hbhdnUDq42Waa4hZdGEe0LPRvGK5THOelzm7dK0aiKMglULC1
         6dsW2+SNvFDDkfPxyyG4wuyHb1ayWZr7Nkxb8bX6muwZeYBiO0rgU/3I/sBsT8xrTwjq
         ewJPm0G8jYrBOogdv83ZW220U4v6fp5VA6Z+pAD/MryXQl95upuP5uOx7SAgDG3oa5DQ
         tGRMP4KismYmAL+9qF4sv6S1/9CABDjBU4SLysJKbzzhO6AhYGLqRsVYfikjLKO6sPrd
         25mLh4ZWPsV4EUAsDYTJ6mVTyHmr5HxbBrNS2HpfpoPDxHDaVG81GizBy/tTbDV8GIsd
         /wjQ==
X-Gm-Message-State: AOJu0Ywn9lwKMTG4NK1NzL07M2FI3Uboyk63SLa3YVnAZf3DlZOS4bLW
        fzZxe8pQrg91GwjHdubtqFv9EQ==
X-Google-Smtp-Source: AGHT+IGAd+DD8OLZo0kvehoHFC2Eczx87NK8Bkhpv9Weu6nYexYG43coH+qot4a4ptKUU/3kIRogPA==
X-Received: by 2002:a17:906:cc4e:b0:9a2:292d:ea63 with SMTP id mm14-20020a170906cc4e00b009a2292dea63mr1488410ejb.37.1693987577410;
        Wed, 06 Sep 2023 01:06:17 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709062dc500b009a2235ed496sm8871288eji.141.2023.09.06.01.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 01:06:16 -0700 (PDT)
Message-ID: <9df52150-f18b-cebd-11a8-a1c9dece09f0@linaro.org>
Date:   Wed, 6 Sep 2023 10:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH RESEND 5/7] dt-bindings: mailbox: qcom: add one more clock
 provider for IPQ mailbox
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230904-gpll_cleanup-v1-0-de2c448f1188@quicinc.com>
 <20230904-gpll_cleanup-v1-5-de2c448f1188@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904-gpll_cleanup-v1-5-de2c448f1188@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/09/2023 06:56, Kathiravan Thirumoorthy wrote:
> Mailbox controller present in the IPQ SoCs takes the GPLL0 clock also as
> an input. Document the same.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

