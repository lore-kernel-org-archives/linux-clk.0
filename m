Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8BDC4338F
	for <linux-clk@archiver.kernel.org>; Sun, 22 Aug 2021 10:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1197761163
	for <linux-clk@archiver.kernel.org>; Sun, 22 Aug 2021 10:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbhHVKaz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Aug 2021 06:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbhHVKaz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Aug 2021 06:30:55 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F74C061575;
        Sun, 22 Aug 2021 03:30:14 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id m17so1422561plc.6;
        Sun, 22 Aug 2021 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/zDIDdUEw6RM94sFDHMxXFdKX77m4sqNmbhPQHKAtQc=;
        b=Tppl7riXZiXHhsgQ8JJur/Xj7W3JaxZL64a640FOa91gxcYHSC6S2sqThIfanI3KPa
         6CtuUksmBpQif4xDyzOBHBMFXGgHKjWU54m7VPdNbMh52oRdQhw+7ZpTWHIuBJLPL1Il
         YfKN3e7s/78OLXaKxUR8c9het5S4v69qNHnxnYjPumiLMdD2zrRuL8AjZ3v/MzVDqLLe
         x+4Gdo8qb41I/oEu65sJduB0KeqOdj1rVGz8fMCbiSxTBUCLbO2igIcRnS09VkhL4t+5
         u/K2JwSZYU+vAs5VOlPIxJ1AyY0XyuW/9VrqpavU7Kct0v6zeSIeTy0J9+NC9YoZegPj
         PfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/zDIDdUEw6RM94sFDHMxXFdKX77m4sqNmbhPQHKAtQc=;
        b=S5Ty3/vTI60iBbk71217sIO4U+lbRmvcy5EG8hTJA/9ai2fdb2kUNz+Kd2LQK1/VUr
         zHuT0rx07miQBwzfvxuoUAIY8dlqtYU1RSt4PQvLzNHydbyzbrAgfrYQ9//WDmnSxgmH
         k8IOgMvVIhvgeH/zbWOY0Q5RU2f9UUoLcWpiZUwhZn1TZjXMPsDeqCK0l76smtt7vBpg
         vjFXovD1n7Utzo7emMCaQEY1CO8IlE3lRA/1U+D28G/75r7bVz2eqBFy5hsEt7OdtWEd
         BWFzwOe+ChzXqWN/xP35Tr8BGhmJhjLb9lCNYgA4Az8S5egowbjL0UCoYRD8r0hXDo1E
         YSbA==
X-Gm-Message-State: AOAM533fG3B8uJJ3BGZBmmGZUmGHaMzEt67Vfl9T49kE42CnsT5CrElo
        oAelsfah09GNiniNgWBl4qI=
X-Google-Smtp-Source: ABdhPJw7rJAw+PwAS1nIB9KEdDmjfgd1bJ6Cf+83RL3Nb2c+vcvgsDK/MpoVJqkHpk4WcZx2UY4+gQ==
X-Received: by 2002:a17:90a:43c2:: with SMTP id r60mr6399088pjg.52.1629628214045;
        Sun, 22 Aug 2021 03:30:14 -0700 (PDT)
Received: from [192.168.1.22] (amarseille-551-1-7-65.w92-145.abo.wanadoo.fr. [92.145.152.65])
        by smtp.gmail.com with ESMTPSA id u6sm14083854pgr.3.2021.08.22.03.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 03:30:13 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: clock: brcm,iproc-clocks: fix armpll
 properties
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20210819052918.6753-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8b0c6b0c-b58b-816b-968b-97c71aced3c8@gmail.com>
Date:   Sun, 22 Aug 2021 12:30:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210819052918.6753-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 8/19/2021 7:29 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> armpll clocks (available on Cygnus and Northstar Plus) are simple clocks
> with no cells. Adjust binding props #clock-cells and clock-output-names
> to handle them.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
