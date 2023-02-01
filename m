Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF591C636D4
	for <linux-clk@archiver.kernel.org>; Wed,  1 Feb 2023 09:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbjBAJaw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Feb 2023 04:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbjBAJat (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 04:30:49 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E97F2BEE5
        for <linux-clk@vger.kernel.org>; Wed,  1 Feb 2023 01:30:44 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d14so16655577wrr.9
        for <linux-clk@vger.kernel.org>; Wed, 01 Feb 2023 01:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LlR0RsEf83QhBEyiH1MSeAg+XqhUdFOt8lIoBlqVcs=;
        b=L6xH7cMwYYIA8vy5pNcyed5puA2tc7jLBfwK5iVNLCsIVo9Pb4YpuyngYg+8UEwsoM
         pGtF/bCUOOU5wHxCSNRB+AxTeNeygVucOYK8QqYfP5XnhgPGdDpST5+axJbQ79O/uPF9
         qy5FnQa9oJC+Fe4yvA/IvrAfajRkEIoRjA4MHywNwbsTZ//rIrCkeLOKhwoRGwfbfEQD
         pusntWuU3AgHeBBHRU3ebY2LduEgRGRnfTdW1Z+G3eo0nOwX159vHHl5kR+GSVOyn/j+
         nPLkoPJp9xTlgiybKN0eNoYXKn9efFFSS0TbgdLd/ndWbEUzEFgMEFDq05p+GEuPn5s5
         tZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LlR0RsEf83QhBEyiH1MSeAg+XqhUdFOt8lIoBlqVcs=;
        b=oz7Vk9Mg1T4gRJh2fKO+CFlo6AnEFxr1TDn/ZDJtnSeV0Y/FH3HRZCtxkYxE/lDH8R
         MLqRljxTJeMaLiPL0FcsjQ6y1vPowV0ypoMT1OwKoSSi2d/ACDrkpe+sK8HowdV3Tn6J
         ln6/miTrkIGdNKv6dOXrRJR087P5GJs5WrddTj1O0rc0eFOwi6kHdwsjUWyNdoIthm69
         CS1fchYcchCF2e/0SuC/o2kCk+3ZUuYsCoUNLMUVvlkhvaOlMEqOoZCpgtXvq4cgBRzc
         dR29cJxKJyHi56yWTZZGNdtR5DlOBI49g/99jNIifK9oLFPSrdnZiIjbKya7PPHQiMfE
         dFeQ==
X-Gm-Message-State: AO0yUKVkz14FotowTd9LqPSVrHt8X1J1Uzd4VEo0jgCybzzQLS4+W/ZY
        mqaldD9s+0Q8iE0NmS4YuMBNwA==
X-Google-Smtp-Source: AK7set+dOrsrn5l39562mA3YKWM1Y4NP7NdyFe8DO8g/arcPF70Dr64ExGSb4lK4IUTGhUbN//N04g==
X-Received: by 2002:a5d:4d01:0:b0:2b6:7876:3cd4 with SMTP id z1-20020a5d4d01000000b002b678763cd4mr1808704wrt.16.1675243843008;
        Wed, 01 Feb 2023 01:30:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t27-20020adfa2db000000b002366553eca7sm16709388wra.83.2023.02.01.01.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 01:30:42 -0800 (PST)
Message-ID: <0186a2c9-35ba-a90d-360f-0f931dda7ed0@linaro.org>
Date:   Wed, 1 Feb 2023 10:30:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 4/5] arm64: defconfig: Enable scm download mode config
 for IPQ9574 SoC.
Content-Language: en-US
To:     Poovendhan Selvaraj <quic_poovendh@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        robimarko@gmail.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230201090529.30446-1-quic_poovendh@quicinc.com>
 <20230201090529.30446-5-quic_poovendh@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201090529.30446-5-quic_poovendh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/02/2023 10:05, Poovendhan Selvaraj wrote:
> Enables scm download mode config.

Subject: drop full stop.

This patch misses explanation why it is needed and why it should be
enabled for all SoCs.

> 
> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
> ---

Best regards,
Krzysztof

