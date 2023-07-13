Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D93C001B0
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jul 2023 12:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbjGMMsZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jul 2023 08:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234827AbjGMMsS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 08:48:18 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BC026BC
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 05:47:54 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3143b72c5ffso851167f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 05:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689252459; x=1691844459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+Z95kHJar6LgJuF8EaQ4xrWI5fsRo898PQkWtblwYA=;
        b=ZWtafz1E6fk6SAsYpf4lGZD1+nSgipZ/1yHk8BiiBeCPmDYFNw/BHXw8sle+l2vVmS
         HiRfDaiEutO8CKyd/tWcIbzDH68IKAq0P+wq6L3O+yCRnGWEZXF20jAOZurQ/poTKzrb
         g2OnlU1tMldBasNoMoKBcVuVSBCTsyKGMaByUKioVd4KMVuWxyelDtQjMhVnKsq5Iagw
         6P15f+uhPUS8d9HS9De43ANQUipGV+9v29ZgjBforFnnWFgsbssKQyogmv4hd+73mvAv
         lE4BynPqwqichj7yZRCL2JXaPbqySmT8UZO4u9PrfLAkj4WOjTJ+83c7+Pw5b6vArAq9
         /iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689252459; x=1691844459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+Z95kHJar6LgJuF8EaQ4xrWI5fsRo898PQkWtblwYA=;
        b=kR6kj+b+Mo1nU3rxIEp+0bQ2II8JnIuOFNik8Bg6vxyHuCa61SggzbOi2nLnSnAkzV
         F8c2zUbeS7d/oq9tW12Cp2KU907l8DMb8JmqnFvEPghoeRMQkNo0k/I+zvwclTUhh0L5
         1Hei3yHJS3He13s3tbQORL7qS7qOVKazjKVR4FSL/0Qra8hb/RrJsbIH9E8N1KGTfacT
         MyGZElfswX7s1Z10wlP6ZAEQZXpEL4MaXjMXFX3TLSQPW2MXOCROXkhNcdQzns2tB1dc
         l7r9h1E3TnXdfxgq1jcVoCiT/8hPMNU47a7K/i+ApIw5bJyRXi9xRKQik371AGykipoF
         PaJg==
X-Gm-Message-State: ABy/qLYDcdD3ii2shSjDbBui66EmOzF/xSh3NjP8dlalGeha3EKQm5GF
        hFwiFwSmFYZm4oURaa0ePKGlEg==
X-Google-Smtp-Source: APBJJlFbNLe7S8IsK2vPmgsjbKmKD9UvXXP3v3+dBxQYsKg50wEXZp6DtXoc8BrOfzOVUcWK2M8cHA==
X-Received: by 2002:a05:6000:18f:b0:315:a1d5:a3d5 with SMTP id p15-20020a056000018f00b00315a1d5a3d5mr1544161wrx.22.1689252459616;
        Thu, 13 Jul 2023 05:47:39 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id m15-20020adfdc4f000000b003142ea7a661sm7905018wrj.21.2023.07.13.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 05:47:39 -0700 (PDT)
Message-ID: <cb852190-2128-ee92-ff64-a47bd262154a@linaro.org>
Date:   Thu, 13 Jul 2023 14:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 04/15] dt-bindings: timer: oxsemi,rps-timer: remove
 obsolete bindings
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-oxnas@groups.io,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-4-fb6ab3dea87c@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-4-fb6ab3dea87c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/06/2023 18:58, Neil Armstrong wrote:
> Due to lack of maintenance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 timer bindings.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

