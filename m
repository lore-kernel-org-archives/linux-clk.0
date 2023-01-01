Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFEAC4332F
	for <linux-clk@archiver.kernel.org>; Sun,  1 Jan 2023 15:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbjAAPiY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 Jan 2023 10:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjAAPiX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 Jan 2023 10:38:23 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7B8E7A
        for <linux-clk@vger.kernel.org>; Sun,  1 Jan 2023 07:38:22 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bf43so38400766lfb.6
        for <linux-clk@vger.kernel.org>; Sun, 01 Jan 2023 07:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMqST9j0lwVvsQWx+mDeXRBW/SiOgmTTyqqP9lmSk7U=;
        b=pZKhZBLEhFFc5vgM1fgiFoU6ezRw+eK+rVcRo1QzaDwWKL0ioYBGCjCrMt8+vlyS7V
         s3LC31QI5TmbjvVoQQuaC8UEbnmE9H0KIbpnbdPelNBE9H+rGq/xEgdy3RlRy5ZqqL5S
         ZBHbf3Z3YRHgdG5OAGpKzPLzyb626IMKw7+Nr4inE768c0ZW5NZeeFlZf1JFy9dpHiU8
         5kDk/VMDEIv8li+qbE7g7IarPexmyuyyJn9m85XLjKUvCeKeZVb3F4DCIwqecQuztjtu
         Ij6E4TrzcPu0H8Dd1D8W3CtTcwIlDKuR9pFsCm9Mp8DZez8u126uB72Pbw5Ecf40RgUO
         Am9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMqST9j0lwVvsQWx+mDeXRBW/SiOgmTTyqqP9lmSk7U=;
        b=rXeZxB4ZT4x3+fw48qtNOWMhZlsl4SDumhTi/4fyrR0PpCIVSfppQ2ZioO0oeNZmVT
         lzCzVnTj0h/LoG3OkC7jgoSD7ba7ZrUnLjOT7x8OctlWXamK68DatMduvdktGeAB4nJq
         EtgUKiclo4/S1s2l2d+92IvjSBLkoMWRFX6X/3Tiw0e2D1f/qMl+92aPylMNO8m1Td6/
         OjRIgpjrwF1ljEqZsB091sOLbzk8JXu2LWSJq2QMO+hMoV8IX2kuLPr6vIuF56PexIZO
         c7k/29mXXJTOKiX9Svkax5WLuLPR9BuxSYJpaQCYHQpPwReJ/tCPCX8UXO5ZKGLnMXdv
         S/yQ==
X-Gm-Message-State: AFqh2kp4jLP5AeIf36g7Ze2UzBSgLG3ajO4SHthe8fysiFNNtufkXgaa
        Ht7WABNzBMQWH/sqnAZD98vjrA==
X-Google-Smtp-Source: AMrXdXtfraPY0eklfVNzCRIbs0fWP2xLJx2ap9oHeP94jddPD1H7IFXA6HRBMFlJkTZFcSOwM/R0+w==
X-Received: by 2002:a05:6512:2102:b0:4ca:f9bd:3390 with SMTP id q2-20020a056512210200b004caf9bd3390mr7955515lfr.31.1672587500363;
        Sun, 01 Jan 2023 07:38:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j13-20020ac2454d000000b004c7d0ed9619sm4220436lfm.123.2023.01.01.07.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 07:38:19 -0800 (PST)
Message-ID: <1a0c8664-73d1-a963-2215-b3967e1475d3@linaro.org>
Date:   Sun, 1 Jan 2023 16:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: Add D1 CAN bus gates and
 resets
Content-Language: en-US
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sunxi@lists.linux.dev,
        Andre Przywara <andre.przywara@arm.com>
References: <20221231231429.18357-1-samuel@sholland.org>
 <20221231231429.18357-6-samuel@sholland.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231231429.18357-6-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/01/2023 00:14, Samuel Holland wrote:
> The D1 CCU contains gates and resets for two CAN buses. While the CAN
> bus controllers are only documented for the T113 SoC, the CCU is the
> same across all SoC variants.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

