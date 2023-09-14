Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2B5EDE985
	for <linux-clk@archiver.kernel.org>; Thu, 14 Sep 2023 06:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbjINGPs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Sep 2023 02:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjINGPs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Sep 2023 02:15:48 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E960BF7
        for <linux-clk@vger.kernel.org>; Wed, 13 Sep 2023 23:15:43 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a64619d8fbso78481966b.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Sep 2023 23:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694672142; x=1695276942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGvyPuDXfJumH13lGGqN64P86dyDCoQjPGvMDx/fHQU=;
        b=DLQQgPDEAaObTKNLdTw7Z/9rGBt/jvdZqSnKERdo+TGuRJ4qECLiOJ6UQaMsOSUhyc
         ZvYCcv9Rv80J6hSAo7dE0li52dgQaMTkavf4spd7QjByTl1wHnjCSVkRO6DVQkkAxWaH
         VPwg+hiEPLk9wMCe73wNwJ2zeRzOQQM6DgHAmPjL+EyK8K9uMwTlxXxfnMxIeu+nqH6B
         2krsrZQKoC0rgrrZswHzWXIRMSBNuFd0OX0GhnNl319akWcvKhKc5wzZloMRlYNgbMj9
         AqTAM7ZeQVgmgTRwuTGw7nDxcvRfkHWmdQMAanKBf5Bt9G0KaZZpiMcSSKz1lY5EyRsP
         n3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694672142; x=1695276942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dGvyPuDXfJumH13lGGqN64P86dyDCoQjPGvMDx/fHQU=;
        b=v5dj4xd4HeHytyJbm9DmldpWLpmGwV/Jtwb11EJqtgpANBLsBTXkxCwhxV95oIwRDd
         7N3HFkh7Ba+AsPk/tSLeRTB4il1TcL0KEvlVgh25hb4ekYNqe1fOsX6y84y0ToHlcQuD
         bSR4uMxWRV2NREixqC2QpNpB5pCHAfcm9QLvuQr/xYt0mT6Z5ejYW1CTFiDABpxXuUjB
         WHzKaaHs4o2enH7vyUKXUlHZ0gdIWbYpkrr/KCnme5+NjZV9Jnrxs5I1SJguh8YYhCkW
         KcfKVGSfx59gehJUV+LdRncBcwYsKjjB2nAsACpwp4FlQ+32VG81kr7KfdU6WkdSjCXd
         Ru8Q==
X-Gm-Message-State: AOJu0YzExB+AktEru5Lm7Dq4fuxqXY0aUehU1lOqc2dsEjTziNkEVw9q
        j7PaQVyKqk6+yGRqUWcBKhVfFw==
X-Google-Smtp-Source: AGHT+IG1noJ5RA1ZmYbaJkfluW31QIPR0bzM86PlU4mJbJH0FwvIkxbeMJN40Jg1iBviRz4KoWnPTw==
X-Received: by 2002:a17:907:b10:b0:9ad:ada4:bad4 with SMTP id h16-20020a1709070b1000b009adada4bad4mr1786445ejl.11.1694672142335;
        Wed, 13 Sep 2023 23:15:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id uz3-20020a170907118300b0099cc36c4681sm507215ejb.157.2023.09.13.23.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 23:15:41 -0700 (PDT)
Message-ID: <357805c5-bedb-8972-bcf1-fabaaaf90ad9@linaro.org>
Date:   Thu, 14 Sep 2023 08:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 4/4] clk: qcom: add clock controller driver for
 qca8386/qca8084
Content-Language: en-US
To:     Luo Jie <quic_luoj@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230914054639.13075-1-quic_luoj@quicinc.com>
 <20230914054639.13075-5-quic_luoj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230914054639.13075-5-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/09/2023 07:46, Luo Jie wrote:
> The clock controller driver of qca8386/qca8084 is registered
> as the MDIO device, the hardware register is accessed by MDIO bus
> that is normally used to access general PHY device, which is
> different from the current existed qcom clock controller drivers
> using ioremap to access hardware clock registers.
> 
> MDIO bus is common utilized by both qca8386/qca8084 and other
> PHY devices, so the mutex lock mdio_bus->mdio_lock should be
> used instead of using the mutex lock of remap.
> 
> To access the hardware clock registers of qca8386/qca8084, there
> is special MDIO frame sequence(three MDIO read/write operations)
> need to be sent to device.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig       |    9 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/nsscc-qca8k.c | 2178 ++++++++++++++++++++++++++++++++
>  3 files changed, 2188 insertions(+)
>  create mode 100644 drivers/clk/qcom/nsscc-qca8k.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 865db5202e4c..c95ada6a1385 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -203,6 +203,15 @@ config IPQ_GCC_9574
>  	  i2c, USB, SD/eMMC, etc. Select this for the root clock
>  	  of ipq9574.
>  
> +config IPQ_NSSCC_QCA8K
> +	tristate "QCA8K(QCA8386 or QCA8084) NSS Clock Controller"
> +	depends on MDIO_BUS || COMPILE_TEST

This is SoC is for both ARM and ARM64 worlds?

> +	help
> +	  Support for NSS(Network SubSystem) clock controller on
> +	  qca8386/qca8084 chip.
> +	  Say Y or M if you want to use network features of switch or
> +	  PHY device. Select this for the root clock of qca8k.
> +


Best regards,
Krzysztof

