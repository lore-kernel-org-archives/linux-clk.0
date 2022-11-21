Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3677BC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 09:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbiKUJoa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 04:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbiKUJo2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 04:44:28 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBABB63D7
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 01:44:26 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id d6so17968311lfs.10
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 01:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9hqrMS9B+nvH/yEhygH31S4BoEMDHz7FeZlY6dMGmQ=;
        b=VUSTo/HzQH5ydBMBXPZPqSolTwbWJC6N28ctQs+ZlNU3Pqu6zay8zMB7aPaywL9Nwr
         atrgGKkrZlriMzthYQl8OwGjifv+dH8cHrjt8iCKoqCWUqzWWFlykSbjodgnlN0N3OAA
         z5nMs6xBIB/MiV3BSOd0ZDJE5YKklp+o43j/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9hqrMS9B+nvH/yEhygH31S4BoEMDHz7FeZlY6dMGmQ=;
        b=A7szzHsgGnxZ3YcLVcdQw1wKf26uAE/RSc/zHdx3NX8diWaoLUxH/iHw6F7nGKbEuY
         sGt7wsayAJT43CQGnQ1YMKMjWhUE2R1IBSr5mAx0gDsiPOju9Lh9SoITdziQ8fV8OcMv
         LmcqMAuByYdeMhb+vPE5KG+Uxt8X+9vZd78uAiqY2EcRIPaYdwr8xhrdYT+Ceg+5lMbg
         gMSAZNvTtnFaSMQPwlRqkcsPDXazRcn4c3+ibE6oOPRxFFQkwojErmomGOaK73Gfc9ZO
         LwheXiIySckdyw2VBfdZFJ54K3p+q/jz4bYlIWHrObuWtjJpDtYfbqGTw9XBA74gTaXe
         LG8A==
X-Gm-Message-State: ANoB5plnNalRKKg5vBwpdwCPK2gT98W1sWPhJDHc/ekWHCJYD6DqpRza
        blrWDVkO/3lVovYjQ6xzavCGcQ==
X-Google-Smtp-Source: AA0mqf5eG/YVXKD4OF1GjHxnjooe0zcDcbGGAKkf6ZqAp6gR4SpZxH6weCfEGxvO+NCFeZyyW6naEA==
X-Received: by 2002:ac2:46f0:0:b0:4b4:c0c:89a3 with SMTP id q16-20020ac246f0000000b004b40c0c89a3mr5361997lfo.129.1669023865281;
        Mon, 21 Nov 2022 01:44:25 -0800 (PST)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id v1-20020a05651203a100b004a2386b8cf5sm1949893lfp.215.2022.11.21.01.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:44:24 -0800 (PST)
Message-ID: <8cce4dae-c653-515b-1a5d-024986afbabf@rasmusvillemoes.dk>
Date:   Mon, 21 Nov 2022 10:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] clk: imx8mp: register driver at arch_initcall time
Content-Language: en-US, da
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
 <CAOMZO5BPtEU6VCZXRk5FTHXDad6cegF=+oHTTA0wgjBuoh9-rQ@mail.gmail.com>
 <09611b2d-096e-058b-5349-627684e3a13c@rasmusvillemoes.dk>
 <CAOMZO5AXSSkHpeuHNRQ6qkFoe2uiFLVxndz1u7_y7s9cLD9ppw@mail.gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <CAOMZO5AXSSkHpeuHNRQ6qkFoe2uiFLVxndz1u7_y7s9cLD9ppw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/11/2022 23.02, Fabio Estevam wrote:
> On Sat, Nov 19, 2022 at 6:57 PM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
> 
>> Sorry, I don't follow. Before this patch, the driver also implicitly had
>> a module_exit() doing exactly this platform_driver_unregister(), it was
>> just hidden inside the module_platform_driver() macro. And I think
>> that's necessary if one wants to test that the module can be loaded and
>> unloaded (I don't think it's ever useful or even possible to have it be
>> a module on an actual imx8mp board).
> 
> You cannot load/unload it due to .suppress_bind_attrs = true, being passed.

That doesn't seem to be true. To test, I just built the imx8mq clk
driver as a module, and I could certainly both load and unload that on
my imx8mp platform. Sure, no "bind" attribute shows up in the
/sys/bus/platform/drivers/imx8mq-ccm/ directory, which is exactly what
one expects, but the module can be loaded just fine. And since it can be
loaded, it should also have a proper __exit call for deregistering the
driver on unload.

Rasmus

