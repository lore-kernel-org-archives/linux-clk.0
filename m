Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5885DEB64D7
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 13:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjFZNg3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 09:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjFZNg2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 09:36:28 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5601A2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 06:36:27 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fa8cd4a1f2so12613295e9.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687786586; x=1690378586;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zdAAUjMq1y7wfLWcQNAaxgJmEQr9gQBVn17s0TNFY3s=;
        b=MJvJ+BDDMP5m14GpFy+9WfqZ2oABvFrcpJ3CqyRiZ2jg8XirfxfqsNMA77Y8qdTPpU
         q8So4CfTI5n9kWDxNzU8aaQbpnWvv9Tw7lq0OFa5TuiCTZQl79AppxFtJVA5Kb4pnQVD
         bRXsCzOnXd5ll2dcGFcEwknyDF9bKLWLSy1RwMXzXY0VlVTxsXdupVDy2qcCCdbZIVYN
         qHV/AjkW2uB+/1ngrvSgOqRegouuR0rMxb9OS+Koav95WQVaAbFWqZGEZmNi5l+wGsmu
         Bh+chTDMuL/revbimYTm6krQxnbDYYlMjJ2Gw6sjmzJtOETnBLDNzs7QHsiIFugTegVE
         MDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786586; x=1690378586;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdAAUjMq1y7wfLWcQNAaxgJmEQr9gQBVn17s0TNFY3s=;
        b=lQb3xk2FH6BUcRM1oqf8bxinE+aFBR1H4WKoPqMli/+y8zanVQJ7hLy4oaMae31RAe
         K8EyRZszoWegc8MipKzCCEfVRRUK5zg7NUOUbZcQ5GeWDRwQsAqFZsG6mVNRE3x+3Bbr
         TrW+8gM28+R+RSPO0Iq3lOcvf9HxcAN5CTODXMCuQ+Jaa0aKf0QSL6WKp/RBQiII11YH
         yliO2oKw7IEHAr0DI6sqvKWnmgTiRbXBkJ2rA3kdaWV+iNOSNUx7VQSTUOS+kJ9OFwfS
         +f3b5o6KRM7ed9ccXGEYDgyi9GhIiaxfbqhoNDWsLawTCSD1wlkhY2dCM+4B0gx7UoqC
         mEVA==
X-Gm-Message-State: AC+VfDzgcb8ZUlKIt7N5CfWjQW6Gwvhvrw/Mhx9uO8qbt6aOQjPkGkh1
        wfbFfFDT7coPQlqapIxEUJ6UjA==
X-Google-Smtp-Source: ACHHUZ4KDlrxPN0DkcnPjN3hKw3cGBfyGCmIkYwPJYPv7vqp0WhYABootPEQ9XYW8moz8aTWe9XAaw==
X-Received: by 2002:a05:600c:2119:b0:3fb:407e:9b31 with SMTP id u25-20020a05600c211900b003fb407e9b31mr687651wml.37.1687786585412;
        Mon, 26 Jun 2023 06:36:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25a:b26e:71f3:870c? ([2a01:e0a:982:cbb0:b25a:b26e:71f3:870c])
        by smtp.gmail.com with ESMTPSA id f23-20020a1c6a17000000b003eddc6aa5fasm10574507wmc.39.2023.06.26.06.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 06:36:25 -0700 (PDT)
Message-ID: <41e6d93a-8899-e792-0859-d26360ef5dab@linaro.org>
Date:   Mon, 26 Jun 2023 15:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 6/6] arm64: dts: meson: a1: add eMMC controller and its
 pins
Content-Language: en-US
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        khilman@baylibre.com, conor+dt@kernel.org, kernel@sberdevices.ru,
        sdfw_system_team@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jan Dakinevich <yvdakinevich@sberdevices.ru>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-7-ddrokosov@sberdevices.ru>
 <CAFBinCC_g6FhzR=PNDsYwT4OZb4uAXAWYGKSe7vSX7_pWM8pNA@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCC_g6FhzR=PNDsYwT4OZb4uAXAWYGKSe7vSX7_pWM8pNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 25/06/2023 23:11, Martin Blumenstingl wrote:
> On Wed, Jun 7, 2023 at 10:16 PM Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>>
>> From: Jan Dakinevich <yvdakinevich@sberdevices.ru>
>>
>> The definition is inspired by a similar one for AXG SoC family.
>> 'sdio_pins' and 'sdio_clk_gate_pins' pinctrls are supposed to be used as
>> "default" and "clk-gate" in board-specific device trees.
> Let's wait for Neil's response on the other patch for the question
> about pin mux settings
> 
>> 'meson-gx' driver during initialization sets clock to safe low-frequency
>> value (400kHz). However, both source clocks ("clkin0" and "clkin1") are
>> high-frequency by default, and using of eMMC's internal divider is not
>> enough to achieve so low values. To provide low-frequency source,
>> reparent "sd_emmc_sel2" clock using 'assigned-clocks' property.
> Even if the pinctrl part should be postponed then I think it's worth
> adding &sd_emmc

Yeah it's weird to add HW definition and to not enable them,
so please enable them in the board if you add them in the DTSI.

Neil
