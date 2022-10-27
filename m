Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153EBFA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 21:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbiJ0VRg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 17:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235754AbiJ0VRg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 17:17:36 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3EF84D175
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 14:17:34 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id e15so2625906qvo.4
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 14:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRQvysuBe8TVoFcKONkt4fixl1asw9dfB/TrCbR9sxc=;
        b=bmVXDFVqmevFW5WHnaEPNxLTUbJ1P+V3qgDRcO9JjTohZRUV00BP5mW+LDVHOr0wB9
         7yINXsD8erBAoAG1O1d11MzGGGpClCxeqaQkKdtNjzmbvkWRjRqZpe3vgCtuXR+aTXDl
         jtsGus9Gxa9YBH0kQlMfZKXXSVV4MvUE+OHU+N+oHWDEYbLluSmCaOgBpfMo7ofxIOa2
         tYOJUh+qIOBv6N6TlwvXtr4TsAMQhmv/QdKmN1TU+CnTu507baEZeTtbD3zmS0kC5SMR
         wa84PDUsJuDcom9wt6KlvpU9s+se0zfrVoC5OWDt6ZgCvH5zHnTF6EAsGhq/6fEUvXlE
         wS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KRQvysuBe8TVoFcKONkt4fixl1asw9dfB/TrCbR9sxc=;
        b=A4Bo3jt5xMFuxFcX2MaWYBCcrxEGtTGer/EQxIpX6miGmJx+jzJr5hrrZyJqqe5Zm9
         k5teya9ckn6ZiD799VpWnrLQNG0bZ45saqWXJd2ovqF+wrW99t44XgkBeecQexwMzdWG
         EPNuTRgFEp5VUr2McaHTfMj/WO808TjN3w3p2cP13KjA61DNcOwIL1x4r7ZoTtlKZScY
         VALn1dYxgwOst2AYTYY6mRrhDZ3f456ynWoUvGRLbkxCODFRbpClNd0eJUbefXA1OcC4
         K93dqaoMc+IwrurnHkUfezaoHaT/J0J5cnUNBULNEcl5/haDDS2Omm3ZaB9uQLeaSFPI
         AsMA==
X-Gm-Message-State: ACrzQf3g0oVbqObeI73sbiU2DfiS4nn+JepI4FObVJoSUsWbsZdtavyD
        Auh0aJWoUHKTniVs8wNETxbA3g==
X-Google-Smtp-Source: AMsMyM7hJKOzQC9qNXa48kxL0ciHQuYvZw7WE8Vk4IoYHkwS3XZ7H2hkK6EYE52qhBoGYA5yN67yzQ==
X-Received: by 2002:a05:6214:763:b0:4bb:92b0:3872 with SMTP id f3-20020a056214076300b004bb92b03872mr10648010qvz.42.1666905454093;
        Thu, 27 Oct 2022 14:17:34 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bj25-20020a05620a191900b006bb87c4833asm1670479qkb.109.2022.10.27.14.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 14:17:33 -0700 (PDT)
Message-ID: <d9e243cf-d90a-1f49-3f80-f792c29348e0@linaro.org>
Date:   Thu, 27 Oct 2022 17:17:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/6] dt-bindings: clock: imx93: drop TPM1/3 LPIT1/2 entry
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, abelvesa@kernel.org,
        abel.vesa@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
References: <20221027101159.942843-1-peng.fan@oss.nxp.com>
 <20221027101159.942843-4-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027101159.942843-4-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/10/2022 06:11, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per updated Reference Mannual, the TPM[1,3] LPIT[1,2] root clock entries
> are reserved. So drop them.

Reserved as firmware does not allow OS to use them? You are now
affecting the ABI, so "drop them" should be nicely explained.

Best regards,
Krzysztof

