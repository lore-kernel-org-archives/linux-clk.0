Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6F0C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 09:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbiEWJCs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 05:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbiEWJCm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 05:02:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7946A443EC
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 02:02:33 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u23so24427803lfc.1
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 02:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ljrd9sPBtTP1ZdWylTJaxJQwiOMaV0RsKrtAyaEmj6o=;
        b=oPo1j2LuxzDgj4/FwOQTvNFJEyd8mtHUO5SNwyed0GjfWwnSFSahZtmWm27dBxhpV7
         OUuZMM74v3Iu4c8qxX6bRAyM1pmNQZDVuMiPWUliFBtd1danjEXNTSJK9ZZjMq3JFdKl
         /xIZjkiXDq4vR7gMZ/phwo2h6T+tstPUtolYQsb8QLyZLHZmGX0DxqHxcgx5H59mSIMk
         yArrzKf+VdC/sdz/pT7rSv7nxtLugtrakwl/sBQKrA5cv8OlucO0/0/9ZZybtQCJDwjy
         8X+Xj/mkPiu956hNgl3IxgRrJB3iLz2wrzVyJt2e12uBBJNEPAXu5uNtxGRdAfeK5q73
         BnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ljrd9sPBtTP1ZdWylTJaxJQwiOMaV0RsKrtAyaEmj6o=;
        b=A5jrgAeScU51XBLxchB/zoV4h3MCd/E6S7qmhnPJHpE7BEI/sY/VkE1uNNDh/rh0pA
         IzeOy7XhyIpSwAmNtMwhd7DlQsRR1HqX3Z4jCqf1Wx7SkZ9IyoqlnEf90QGF6wsWn4Cd
         JmQtqnnCtjiVAVnYBq8OpVyHdz9dDcCA4j671d8xxL8gMJk3mjsmUtAJ27QRlYqWnfxz
         ndoDhN6HtwnP8zXwNQzOI11G5FbrkWcbOVpc+7Ot0QuzFh3Js2ISKzSzsK6VuWDaTJ45
         s5pDmY3/0Rbo436nWccS1g7LKWUyzAdUFOlFENBSp78uchMQg1XKlUkDSgO5qXB7KQ4b
         XMow==
X-Gm-Message-State: AOAM530OSdKyS4uXsDb2WQ3olAwxXoVReG/TrW7GieKdlxo+mqCHeBao
        udO5VtAk3vt0al539ZbFMwrmug==
X-Google-Smtp-Source: ABdhPJzbcDpp9WdQRGctTvhF6D+POWonEUZcsEGe0VlBk37PKo9kF6CLPhJMhMaxrrwRceOwCzgcUg==
X-Received: by 2002:a05:6512:118b:b0:46b:a9ae:3a3b with SMTP id g11-20020a056512118b00b0046ba9ae3a3bmr15876556lfr.188.1653296551721;
        Mon, 23 May 2022 02:02:31 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p26-20020a2e9a9a000000b00250a7bce0fdsm1704036lji.95.2022.05.23.02.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 02:02:31 -0700 (PDT)
Message-ID: <927d0508-d83a-9ab5-8719-721f2c769bee@linaro.org>
Date:   Mon, 23 May 2022 11:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 15/19] dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR
 compatible string
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-16-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-16-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/05/2022 17:50, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845
> global control registers (GCR).
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
