Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781C6C77B70
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 06:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjDQG1y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 02:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjDQG1w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 02:27:52 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7345C358E
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 23:27:50 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a5so4716805ejb.6
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 23:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681712869; x=1684304869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZhVlgtCkjykFI3362iDf9ok4Q5/L8endAPoD1oRjnA=;
        b=M/BBDRVpq3Qz72h/QrsYFZirctpqQXzcx+UgExn33c7UpLcFYy35fbnujNlg9pkU/5
         6pEDbn8Y181Ip/HsSf7GzIv4IQhozyoy09kqc/5W7ZO5cnenowtlNX0nbyPdQu/ntJjd
         Jov/jpScYqmJeaxx15U1pxxrYRDPaGg6j2C21eJZVadFB4CWGOHcojR0sH6wOroqxYwa
         QTi9zN1gRhGzUBuX8lBi8ZucfXIiKrM0FZQkIczMyJi2Q5VS9lHYuQf++1q5fALpw2ig
         mzRtmUzIsZFFqzSafVlAN03QRrb0YUFUQqygCMETq7sO25321HM9g4RolIpoOyrRczyC
         rqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681712869; x=1684304869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZhVlgtCkjykFI3362iDf9ok4Q5/L8endAPoD1oRjnA=;
        b=DDAEOZ7HuTVusUMs68XLI/zXeKV57YDOq+47vEcpjdZrhM7z/mFQIEjGtBOncWFntH
         Wtc7vEjwscFxNRH1AkZ1hmkIcKchwxpDuJ6mnQq2V4LA8bWQlmGm+BGXpptQvfByqVDl
         y5eFJxUsmvhJ2BawhgaI1RGe/bD32bP7tblbQuA+DTNroDV9zUinsQ4IEfISqf8PCgg1
         EkbPfNA1vwcuVwAklx2UC1Vi+FnhdQkEHIj6QIclvuu/e6nrblPIgdtEwXbnMeH7S5Du
         Gz1+8BLRHqZt+LGq60ieqrg1WPEO02LHuF19OwWQzuuSNq2rKGTEAAcikxPrB7tDe3NK
         Mzlw==
X-Gm-Message-State: AAQBX9eve2559vf1I0ExHsW7Znli45JWrHPXcm9Vonx83am9P18CPxGw
        XGWIb7LEIo7CjtPOssFmXT7LOQ==
X-Google-Smtp-Source: AKy350aPF7fJyzUSSHBpxDjT4g8JZpxv5eabpBr8r+cEIjDDIZKYZt6rMjGs/0wqSq7MNs1NhofUsw==
X-Received: by 2002:a17:906:53d1:b0:932:20a5:5b with SMTP id p17-20020a17090653d100b0093220a5005bmr5762356ejo.23.1681712868963;
        Sun, 16 Apr 2023 23:27:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b0ac:4d3b:966c:b33d? ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
        by smtp.gmail.com with ESMTPSA id o26-20020a1709061d5a00b0094e44899367sm6057778ejh.101.2023.04.16.23.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 23:27:48 -0700 (PDT)
Message-ID: <81ed4e15-19ea-34d9-3e05-d1195b2cdd57@linaro.org>
Date:   Mon, 17 Apr 2023 08:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/4] clk: Add basic register clock controller
Content-Language: en-US
To:     David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230416194624.1258860-1-mmyangfl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416194624.1258860-1-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 21:46, David Yang wrote:
> These clocks were provided in `include/linux/clk-provider.h`, but lacks DT
> bindings. Add DT bindings for them.
> 
> v2: split clock controller and its clocks

I gave you several comments on v1 and this vague changelog entry
suggests you ignored all of it.

Implement feedback and respond to each one that you ack it or disagree
with it.


Best regards,
Krzysztof

