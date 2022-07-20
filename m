Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC3FC43334
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jul 2022 11:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237865AbiGTLgH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jul 2022 07:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232696AbiGTLgH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jul 2022 07:36:07 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4977226571
        for <linux-clk@vger.kernel.org>; Wed, 20 Jul 2022 04:36:06 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id k19so2676095lji.10
        for <linux-clk@vger.kernel.org>; Wed, 20 Jul 2022 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8JR2ECyYxmN35RFd5SrCTVxKOdG45EzqZkpsA8QsVdE=;
        b=xOMP2RrsE8ugvnKBFVqwI+ss0ReF6fDz4gcrCWiTIx7XEY9+csz1EByJ+j94LWPvvx
         HXimRsFrQy/FMChogZUZqa8ZpqzweLOX+xWGqVUqV+uQQj1EtuA8Xg6TgHIboRbSaDej
         MEIrd7rknL9TDtEqPpr14bYK3aVHBzVyER1fs17xxgMTEn1TaVFP47m+zzXyKM31HVul
         Swu32R2tcj9gfdABNU938Dd+G1DOj/9Wg8GSZzKqxUI7KSLDvmu7hMhGp4K2ZBxFAuk+
         8hxZ/sZP7uw5yPUR+AJZ4J4N0PphvAzi2sZ+hAH0ldIny8q+dcQnr51elKi950oSORAw
         NqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8JR2ECyYxmN35RFd5SrCTVxKOdG45EzqZkpsA8QsVdE=;
        b=WiO5tONq8ZXpeVo4haHSFIPq4JXGrB41pORw5ctgXQCVH/PYoOcgrAhs5j9wenx0Aq
         B5uUDSS8UJUEpbkB/vUZrbWeN3VIJTfbIyCLKvgX7CWs8ESu/gCpOjaf4CaxyoXdjo2l
         hAvwiN9oQbeecRxF5zlbkOIBIhyBqEmZKmCVEVwQOdiHC8lwJWVH0hrtK5Zq3QREfdiD
         ffV0dbDFtCgYqb7gm5QyNpmSrThFtHL0fs+jC66jkYip6Nln6rQhJcf5vMYdOcXeVlHi
         sv5i+tDy44tb6H65wEZTej4vvCTtzs8jYKoRR4IvYyI0Z9mrMKEg9h9M3WRkeNFpf/hO
         1gmQ==
X-Gm-Message-State: AJIora/EmYaxIEmCnXT0R3OBHIjSmL1Dw4OVdinVmUyXUjTjzlL0UH2h
        qAu/N+AQfZfL3rbNRhLoGd1X8A==
X-Google-Smtp-Source: AGRyM1sMbbgJGNG0adjKaDJMPd779FeF8nkPx0z1CN5xoI7Fnf9noacPqxr6kq0Lq4jd0WH/jiqjZw==
X-Received: by 2002:a2e:8182:0:b0:25d:72ad:43a5 with SMTP id e2-20020a2e8182000000b0025d72ad43a5mr15957341ljg.180.1658316964713;
        Wed, 20 Jul 2022 04:36:04 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s16-20020ac25c50000000b00489da2806d0sm3739346lfp.131.2022.07.20.04.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 04:36:04 -0700 (PDT)
Message-ID: <b605fc88-a0f7-b914-0d4d-49c8415e1016@linaro.org>
Date:   Wed, 20 Jul 2022 13:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: clock: Fix typo in comment
Content-Language: en-US
To:     Slark Xiao <slark_xiao@163.com>, david@lechnology.com,
        nsekhar@ti.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220720113139.17982-1-slark_xiao@163.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720113139.17982-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/07/2022 13:31, Slark Xiao wrote:
> Fix typo in the comment
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---

Thanks for the patch, but it's additional effort to handle trivial typo
fixes one by one. Do it for entire subsystem... or help converting TXT
to DT schema.

Best regards,
Krzysztof
