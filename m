Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079B7C38159
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 12:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjARMTW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 07:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbjARMRF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 07:17:05 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1F353F97
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:40:14 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id b5so12467258wrn.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kM4TmYHUESokHiFW3imA6PqhaD3cG8rorNJ+MQr3euM=;
        b=h0Fl4+o6vE2/vPJbrvZttRQMtkF6bZ0VG2f6mJvUzGuUY5Vfo2lCxRx1AeTqaevaOE
         VZQiNWTh98uL+Y7Y/yvfRdblexzTpjTeDAni7U6z1mEUaowNzkPhYDc0XP+o4KFP9d+g
         shJ26R5xvZikoZEh2l35A0ruzCYdqtg9Z+wc0H2Q7Firyp48H9l0iWXH1NB2z3RMP5V+
         ZOoGHS4Tpgu17SENmG515AJ2NO8ymKFkOI9rOyLhl3crtUK3tkbd3iavCqpIPDdV9jgN
         Dn8pmIpfK2THl1M8vIuclFVjid8r3sNxxAe95+5DUrLr0t1EzBOCG+SRose7XP4/VLIh
         PZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kM4TmYHUESokHiFW3imA6PqhaD3cG8rorNJ+MQr3euM=;
        b=HLPhUhicnMpokLXhAAzUsjk1pq1xNN0KWq6nDl9AQ1ux0crRdGnKtlT1NA0dAOGp5Z
         O5/676WsuiiAI1siAVSzFfCm7/EASnxi66F6YrdzVlmP4X0iOXPK7O9FiS3+rvxURDe2
         5vN7+XmpmjO0V0NAt+CrPgoi38nInN9lRFiRRLkpAKeHUyc9jLxcMbagRSekhWC8Xna8
         FyHDETrzjDq03v22kaCxayfZlUOOGAMcm6PITJo6IrrFA6CO8qngtGIXJq9ye5mIYm2y
         lCanqeBYBZSlYwQLpWc3Y0ycxm0MLvdnX7nC/ertvR06riiRz0KnvBQbAPGbS0X2WUxb
         M3CQ==
X-Gm-Message-State: AFqh2kq1DEhr4wZzjqMUCqNg9HdyAPYc7hkldT0qoAuJ00jPCFge2FsX
        XF1E4+OuU7f6WC6QbGey7nblNQ==
X-Google-Smtp-Source: AMrXdXuBdBiAcwQWG/BeyGrwSRj2MigBb3eyc9eCrsnkqKeP4E8cQkVLTDUgmzDXiDagP+0iXvFQxw==
X-Received: by 2002:adf:f90e:0:b0:2bd:9b1e:165a with SMTP id b14-20020adff90e000000b002bd9b1e165amr5883672wrr.6.1674042013397;
        Wed, 18 Jan 2023 03:40:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600012c400b002bbb2d43f65sm28061605wrx.14.2023.01.18.03.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:40:12 -0800 (PST)
Message-ID: <ba0c861f-6349-32d8-33e8-26c7380fbee2@linaro.org>
Date:   Wed, 18 Jan 2023 12:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 1/6] dt-bindings: mailbox: qcom: add SDX55 compatible
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
 <20230117223013.1545026-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117223013.1545026-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/01/2023 23:30, Dmitry Baryshkov wrote:
> The commit 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55
> APCS") added SDX55 compatible string to one of clock-selection
> conditions, but failed to add one to the main schema's compatible list.
> Fix this omission.
> 
> Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

