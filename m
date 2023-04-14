Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898C2C77B70
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 06:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjDNGBU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 02:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDNGBT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 02:01:19 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EC41BC5
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 23:01:18 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso14302508wmr.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 23:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681452077; x=1684044077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pcps2D7JlJPdPv1VwPi748k1WIBbF5yNYWRYD0imiqk=;
        b=Xrqf/p/NtoFxruNYlLbL980kEMousH1w4Ua+i8AH92hCwTfyVhS6hE/4GNn5w+pmum
         5dtEl1UNxYFs1fEFDZbW1MXEh4kpjOwLXiJ/OGxlTh8vnpmpSJ+hwlVp1fWaRr5CBgvG
         8qo3dmhIoGByX9oEBIknd0qINr4Z2uxHqQAdk0nadOhBFt3UZU1UCL2CycM0R2U9apnR
         W+thsuHVp1W76RrRt3J5rK6LMOUraDpMeYW1DjWsBSQWFCARvD8PL25SBaw203wziyTU
         2pUN0AliRfnYpJkR1/+tov9OfHzMh86JgPbTIUJTdOmqHgXePM8oqw6rmgDaaww9w1Vs
         zOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681452077; x=1684044077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcps2D7JlJPdPv1VwPi748k1WIBbF5yNYWRYD0imiqk=;
        b=QSLlaGmvGa6M5oSelgwMQGVeidrAmDD9UTLN6ZKd0ouadwa2IBKKZn0lRnQjvJ6wLJ
         NujhJ22ncoQ3g7e+kr1lLgm2MP1kuCSUH8bUNRFzbh+snxziENIdYgu/DxKWrV1zMPzG
         2RLCG3CCXwqb01t+MW18t835e58PPfKnr83GwpbAo6J3JooNYcmagILhZSoFwYzZ7OTB
         8NFrHG0qx9ztkSvQcM10ZyvOwPqklejpCDWhvSIorVrV6yjfZz/BpN4Uk1Eo9iMTTHXw
         KJ9dLASJxVzKcrJxs11aPdqKE6N2q7vk5ZGlWjn4Qh62J6hAsN+uNXVx6uXizCPdtVOH
         LHeA==
X-Gm-Message-State: AAQBX9f8kKIQr7/Z/6tM9QajTj83+Sp+TRfYkM0mg8qyTg4Lz+ScSVpL
        p+55CmGtLkwPJv967Rc7hOM=
X-Google-Smtp-Source: AKy350YgvWabmbkq3CVPlcO+Q/1wMZR8lkXpKgDXRWs8xXriHYMr4/z4QggDfQvijjV3flcLaRh+MQ==
X-Received: by 2002:a1c:7211:0:b0:3dc:55d9:ec8 with SMTP id n17-20020a1c7211000000b003dc55d90ec8mr3230097wmc.41.1681452076762;
        Thu, 13 Apr 2023 23:01:16 -0700 (PDT)
Received: from ?IPV6:2a01:c22:726d:9700:c4e1:4951:1243:5788? (dynamic-2a01-0c22-726d-9700-c4e1-4951-1243-5788.c22.pool.telefonica.de. [2a01:c22:726d:9700:c4e1:4951:1243:5788])
        by smtp.googlemail.com with ESMTPSA id y1-20020a1c4b01000000b003ef5f77901dsm3430795wma.45.2023.04.13.23.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 23:01:16 -0700 (PDT)
Message-ID: <3935914a-bf12-1040-10d2-c7a94465b37f@gmail.com>
Date:   Fri, 14 Apr 2023 08:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] clk: change clk_hw_create_clk() to avoid being unable to
 remove module
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <4eb4755b-7a06-6cd9-7c9d-6d088d05ab19@gmail.com>
 <f336e108d8651f1e317fae39dc058966.sboyd@kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <f336e108d8651f1e317fae39dc058966.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14.04.2023 00:29, Stephen Boyd wrote:
> Quoting Heiner Kallweit (2023-04-13 14:39:28)
>> With clk_hw_create_clk() we have the problem that module unloading
>> is impossible if consumer and provider module owner are the same and
>> refcount is incremented. See also following comment in __clk_register().
> 
> Do you never call clk_put() on the clk that you get from
> clk_hw_create_clk()?

In my case clk_put() is called from a devm release hook. Same issue
we'd have if clk_put would be called from the drivers remove callback.
clk_put would be unreachable because the incremented module refcount
prevents module removal.

