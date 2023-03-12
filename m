Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF23C6FA99
	for <linux-clk@archiver.kernel.org>; Sun, 12 Mar 2023 16:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjCLQYQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Mar 2023 12:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjCLQX5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Mar 2023 12:23:57 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FAF2470A
        for <linux-clk@vger.kernel.org>; Sun, 12 Mar 2023 09:23:32 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id cy23so39415881edb.12
        for <linux-clk@vger.kernel.org>; Sun, 12 Mar 2023 09:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678638176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xZrChxZkc6JrPh0xGVIIzxchyzDK5KbwG2kHyM3LRc=;
        b=ZUz15jVisj5kNtfOH06lkDcSBNDfdT/lXA3aHmV2d9hVxP4hpGbWRZY80T8hKeuYTD
         6T2mXF+W668+h5NOvc2BjXtMjGwP4Tkr4opimWqMwVUHsQk3EtNJytvTFra7ZlubBAxa
         2FUGNDqPfb/moKaebAGIe4WPqkoeDPLwhhgCP6hqvpYtyTDlf4ksjy6U6erxbFY6HWkH
         mWorRKDMUnDRe12oCoYmapaWaYEo3W/8ykacUjkQgJMA1dpQFIzPp5lE2Q0PJVmyXsJ0
         bs0dJVlW2s8fhcVTf7uppd8qamV2TN1FAi+UdFgPfverbv/krFdy94liEf3leBTLaynq
         0dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678638176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xZrChxZkc6JrPh0xGVIIzxchyzDK5KbwG2kHyM3LRc=;
        b=JdM0dHYemZf0BvY4OiVyM9DQHW5AhcZYUfAGw2zIqt+HjPGI2suxphUfg5ifN2U85G
         vYIvg7cfDjSq+yhvENWz6RAttfRqRbLmOsDMMq6341EF6yoWJFGKnaaS78NsMbjL3c1A
         UUgDJLIEV8EM7s2ux7mR/pqfTW+yNOqT29SiLsN3jO0V0hH0FxVynkcahjqPc1tqt/M1
         afX+w0kKva7CeHgeZHEUqtsP0Lw2ojf878ZsbQzP3TADQgINmy2xdiCjlaMyIsdDOEpG
         OTZAhq3Iz7uxg6BrIs/WFqL9W/SBpPAyggSqxVgvD4nEB8PwPvdUEsIkyg6lgoDOERl/
         lhTQ==
X-Gm-Message-State: AO0yUKV74QCHyZm+jP0+NNHsEeTcls3LsLc4SYe7mWozb/OSoaTk8woy
        07j0JErElPPgmGjm0Kl4gaoI3Q==
X-Google-Smtp-Source: AK7set/A+que5qx2g6k/Nv3GDCYZJPcex1mjy+LxdlaNFrRsLCAOGWDOJ+k50aSzL3tfDGryksGYTg==
X-Received: by 2002:a17:906:2756:b0:878:79e6:4672 with SMTP id a22-20020a170906275600b0087879e64672mr27703036ejd.42.1678638176627;
        Sun, 12 Mar 2023 09:22:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id ks14-20020a170906f84e00b008ec43ae626csm2359153ejb.167.2023.03.12.09.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 09:22:56 -0700 (PDT)
Message-ID: <1f39c602-20ea-94a0-caee-54ae3dd10bfc@linaro.org>
Date:   Sun, 12 Mar 2023 17:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 14/30] clk: s2mps11: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
 <20230312161512.2715500-15-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312161512.2715500-15-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/03/2023 17:14, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

FWIW:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

