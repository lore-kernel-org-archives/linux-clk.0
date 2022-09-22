Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09BDC6FA82
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 16:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiIVQAJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 12:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiIVQAI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 12:00:08 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C398C6AEB0
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 09:00:06 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z20so11573470ljq.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 09:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=V6c4rAkBN7foufFnqvB7xWcwVdlx3krdKAsSA3LKM2E=;
        b=EYPGtsJB9cW2i8ii2puNH0fl/Zo+U86V5lGXj2D6qdBeobw33K4NOA3XttPpBcTQxj
         BmifAf8To/Ekt7txQ0CRAsoStMlTM9qzDNX21zyAM+0RsHiy+Du3fI/AJ0fvAiAkfCmw
         2+la+sBJePp/H9saQOBkOdDYQQagqXLVHlNt1DmTlcwiMzBUooRHMOftwDb4KTQPn1EP
         dL1bH1zU6/qLtMD9bx81tSrcuoxmigJIZD0GtFir1mriQVY5T+PGXaJIhR6T8KCnV6W1
         WpxA7eL5BOC1RYZQmGS0iMY+9MlypPsXM70o7KWWjekX3ilZqy9TJShlzaUrx56Rb5V/
         QIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=V6c4rAkBN7foufFnqvB7xWcwVdlx3krdKAsSA3LKM2E=;
        b=pUIeqUIG19LvNTTIQTwSKHPwvZOBjUtPKuCFf9mi9D0FyYxVc6rhqPoRZh4+7L9Xp8
         mc8p813YjpkkhqVOs5YbtRF6T9Nu/DZO4gRmaH5zaT45QCgBC440FOxKKWB07caAqiLg
         ym/fwtIFsRj2Jc2rBhSwBFiDJhKC3ifdUXaUpjRF97eJDfhY8p/hF5w/Mj/haD1PyWCm
         JllvT/XS6wNShw34Muyh2W4UVsqZD5v/7Co0IUbslVqQbdzx2pTHb7AGKgWtvmWtIlyR
         it0A8oIqbIidCvNrLVveibBUP5ZDA1vdpzzd1GjduVzWCvNTngmR/DhosrGn+8e+7FkE
         Rd/w==
X-Gm-Message-State: ACrzQf2lS+lk5XZ4EOqdqFVj3OhrPuOAdg3+2/pObZjzX0W0Z7femV19
        eYIBY07PQ1OUqOQYfCTqtcVA3w==
X-Google-Smtp-Source: AMsMyM73gkh5v4gbhi++Eqv5Q8s+pslKnw3lQRjbKqjuIm9witwFzTyTHNJ1ckYpHAt0TqUTGvqYhg==
X-Received: by 2002:a2e:780b:0:b0:26c:1458:ddc3 with SMTP id t11-20020a2e780b000000b0026c1458ddc3mr1443600ljc.375.1663862404991;
        Thu, 22 Sep 2022 09:00:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d9-20020a196b09000000b004999c243331sm994865lfa.141.2022.09.22.09.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 09:00:04 -0700 (PDT)
Message-ID: <297f22b9-931f-669b-6539-c59fb411aa38@linaro.org>
Date:   Thu, 22 Sep 2022 18:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Content-Language: en-US
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     linuxppc-dev@lists.ozlabs.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Rob Herring <robh+dt@kernel.org>, linux-phy@lists.infradead.org
References: <20220920202356.1451033-1-sean.anderson@seco.com>
 <20220920202356.1451033-3-sean.anderson@seco.com>
 <20220921065718.lafutkkgiium5ycu@krzk-bin>
 <4e125df2-b815-c0cd-336c-97b20c2702c8@seco.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4e125df2-b815-c0cd-336c-97b20c2702c8@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/09/2022 17:23, Sean Anderson wrote:
>>
>> This check can fail if there are any dependencies. The base for a patch
>> series is generally the most recent rc1.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit.
>>
> 
> I believe this is due to the previous patch not being applied, same as last time.

Yes, please ignore bot's report.

Best regards,
Krzysztof

