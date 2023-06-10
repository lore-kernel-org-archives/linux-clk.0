Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA14EC7EE43
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jun 2023 16:38:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjFJQin (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Jun 2023 12:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjFJQil (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Jun 2023 12:38:41 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580DA3ABE
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:38:35 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5169f614977so5011878a12.3
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415114; x=1689007114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rhc3iF+usUd5wOBnYjpPDlfxa1WSJJmnHm98HNU6RTY=;
        b=fHEs3sERTr6Xez1QnoOuzgrVvX4M9X6TQ5x4jAdXZnPOqKkXOa8HDgZn/cxR4yiMb5
         jwxQi+2NKeUNzuwg6P402naW1+a+5KDaGo6LzsZjYPbaB9a738WHZqA93pcj37eAKlnu
         i6Jip0Vi4tRZaeKlIQfyE3+wEhHoSZZ46tQlqKfAY3/VfUn6HZ9QqonvWxDlUf7dvmXr
         zl8+f1LkyrjU6BT1yVm8JlaSTScrq1p9lPg772tqcHzr5AePPKoRnNnZL+sC62WE12L5
         3CqTvRWUxNFqNWEXPL1Ez4GgpbN1+piZT5F++LQXQrMoTWkwDTMTjIlGynSZS5oJmKxP
         pDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415114; x=1689007114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rhc3iF+usUd5wOBnYjpPDlfxa1WSJJmnHm98HNU6RTY=;
        b=c8gQ+gfSMxaKw5gJpomsEvlmWXwhADPFMIIJk0EVrMdSPwc2r62KqYigU6s0ujWsIE
         B6r3G+hZ9oYFdHRIMFUf3RE7MRYQcfLg1A35nnHawWaTRcD1s/BD7Ei5mM/Nar1zEEg0
         zO29hE5KPSiE1d69OBkuf1y+tc+q/P6jV3hRdnNdSv65F1WVIrHiduzTErnPKLVHGnZO
         atQUr/Ry8KFgG/QLqkyeVHb/0NbtFPw/iC8GjaoVPgTnGaZiikzh6GKrskCIwLPuAF8r
         S/hRG2qi9CTkiKiBwCPLAUTy01aePAoWTXO1OSAgnIWEHVXRfdwxtjM1M59uKeO//G1a
         gcHA==
X-Gm-Message-State: AC+VfDwHEq/+09FZOQvSWSNdWupE3u+xTaU7FG0EBGqXq99wEM3FHUdS
        mQTG86iL1egbpkyoqoAADypqZA==
X-Google-Smtp-Source: ACHHUZ5gTfEI7pySkAXDXusef/ipLbEnqL24VzPb5W+NDWa+tYVbBTmg/5fllxj+WpHy9SpuldmMhg==
X-Received: by 2002:a17:907:5c6:b0:96f:7af5:9e9e with SMTP id wg6-20020a17090705c600b0096f7af59e9emr6043603ejb.53.1686415113897;
        Sat, 10 Jun 2023 09:38:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w12-20020a17090633cc00b00965f31ff894sm2715788eja.137.2023.06.10.09.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:38:33 -0700 (PDT)
Message-ID: <f1bb396c-5317-99f6-9a9a-4f16b49996d8@linaro.org>
Date:   Sat, 10 Jun 2023 18:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 09/18] dt-bindings: clk: g12a-aoclkc: expose all clock ids
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-9-9676afa6b22c@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-9-9676afa6b22c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2023 12:56, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 
> It was decided to move every g12a-aoclkc ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

