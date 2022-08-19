Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24688C32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 12:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349032AbiHSMoN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 08:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349020AbiHSMoK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 08:44:10 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB11C3A488
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 05:44:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id s1so3180465lfp.6
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 05:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=g02EyWp//JevB4+ewRf2FLk7rDtVnLg9C24+9DDwDsk=;
        b=rIo+YCssu+kNCpWs8BCPAd1oGVY4ELsQzrJaEyhbySFiXqmkf8DDlBOuDQtqeQqS7k
         Ic8ZNFpfe4Hh1JXjQVStebzjSHmfDDMQQvdmHx9FNi8QthT9FrT86G5FSPuwphtC/Ahf
         QppHUEN88mhRiplbmBROTdwmJ0WCO+uPFw0ip7X9t/5FXYwF7pUitk8gwAl347vP2CUV
         tlFmIMfxjdG7AfPcSh6sXNG3n0XpauP/cH0wOj62WCheu81YIqzg3lKW7YQhW8kKNcdB
         iVrBvrIRzXMGH39fgkEm6Uw73n+z3PxZkNfjcdObiMRL05wjwiZNixHuOlC9VYxxut6b
         L5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=g02EyWp//JevB4+ewRf2FLk7rDtVnLg9C24+9DDwDsk=;
        b=v3KGmcnFQbFwgMx/KWIS439iVJs5foawQHCxTXnqjJBl+V239QJJLMf5oIXHxoKQwH
         zE2dVHboOGh81j/a+nGa9GCjG1o6b+Q7FiB0QHXrQ+YrNNPhRoiEfjHoTJgWhgg8BFlQ
         MNH61N7AfJouhpdDor1NyzdzZOUEJogIcImJ6o6XDxnr0qGOOUPpI1iHw42cBkOBzE2i
         mW8D+oggIKIQLXpqrD7QbYHPSgizw1/QQZ38HP2Caiw+I25n861rcLeBmgVQH1zgYrt4
         kXyDUzZoctT1cA6mfkNM8+YtIU5hN9w8l8oS09UjbV1tf8t2mMmPcxiQ3fXnaiS57P7Z
         +E7Q==
X-Gm-Message-State: ACgBeo2gU9DdA4N/IJcYX7lwR4dZ+aZZcCc4cj7Y8IJSNCsJTbE1FsRB
        6Gi53gFqicszE93Mw9EFNzkmGA==
X-Google-Smtp-Source: AA6agR6/aN0g7sO+3gapHkOZtIhZD+1HpWLEQsCU8k7RAZm5tla+hTcZT/sDeja2yTy5Alm/c0EiEg==
X-Received: by 2002:ac2:5f77:0:b0:48b:3886:5d55 with SMTP id c23-20020ac25f77000000b0048b38865d55mr2255774lfc.668.1660913047156;
        Fri, 19 Aug 2022 05:44:07 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id e30-20020a05651c039e00b0025e42b981f9sm594463ljp.44.2022.08.19.05.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:44:06 -0700 (PDT)
Message-ID: <9b377685-0471-9ca2-c6a6-1b7f1ce9ec86@linaro.org>
Date:   Fri, 19 Aug 2022 15:44:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/6] dt-bindings: clk: rename mpfs-clkcfg binding
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-2-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819122259.183600-2-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/08/2022 15:22, Conor Dooley wrote:
> The filename for a binding is supposed to match the first compatible,
> but the mpfs-clkcfg file did not follow this policy. Rename it to match
> so that when other mpfs clock bindings are added things make more sense.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
