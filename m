Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB343C43219
	for <linux-clk@archiver.kernel.org>; Sat, 19 Nov 2022 21:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbiKSV5H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Nov 2022 16:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbiKSV5G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Nov 2022 16:57:06 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0F313DCE
        for <linux-clk@vger.kernel.org>; Sat, 19 Nov 2022 13:57:05 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id i10so20859016ejg.6
        for <linux-clk@vger.kernel.org>; Sat, 19 Nov 2022 13:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCHWnQkSs4Di/+CXVPDPn8BsM5Kr0cTS9QYcmB5PgoA=;
        b=SgeYC/KWjX8dd+w3D1VJagy/+AaJ7DVLowkRzrjrd11LlVpvDyvv95oLffCro5wQru
         97MIzf7jq9oR2WjAlPz0L1MA3w9gWlQz6TEFh/HXo7/l05DrILkt2WrwLTsrAfSpfMpS
         KCdl0EKkiCmXzaeKK5EU99NWwS26ESsLB0bFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCHWnQkSs4Di/+CXVPDPn8BsM5Kr0cTS9QYcmB5PgoA=;
        b=sIY9hNkE5k1cFioJfLWM14ZI/WT2icCA4+VY/M/Ris7+If5rldpm5GLMPEdbwbDIV3
         caumpH3sV9f2KH+ffN5EV6MgEqu9zS6lQ0PT83CkT3gnySlnLqUCuQ6fs3N2m8uO2LSC
         SGmeYzz+4Ch/h2uUipndkEA/fMJUZ8vLJAixgewi1TwdytYiiutxm9Uk2KIMW/BHmAAZ
         MONVjnwMrKHcRwhW11KfgXzvxH2jeajcJgBdDHEjYz/3JyleSr+uZoHc9O9NGZet2g6G
         0J12OmOYlxYC+h2a9QA7j0WAGW/YrqjSTcVuhJez7uBePWH29MWid+Qr8ZBqvGyGi4Al
         ZePQ==
X-Gm-Message-State: ANoB5pkFjFGW6jRGumQdFJ8vB0JaCwOiwdAtFEbTvGMwpEoHaz19Zg4o
        sUVmrkN9hOZvcLKiGErU6S3CYQ==
X-Google-Smtp-Source: AA0mqf4Z0do8zSYV/hSHogE+vrYfVXt350sBuNMnNmBTmQfcCr5tb7VgXLTwL+mKkrXN7bVWS2MUSg==
X-Received: by 2002:a17:906:fa19:b0:78d:9002:fe3b with SMTP id lo25-20020a170906fa1900b0078d9002fe3bmr6946055ejb.769.1668895024021;
        Sat, 19 Nov 2022 13:57:04 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.65])
        by smtp.gmail.com with ESMTPSA id b15-20020a170906660f00b007815ca7ae57sm3304087ejp.212.2022.11.19.13.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 13:57:03 -0800 (PST)
Message-ID: <09611b2d-096e-058b-5349-627684e3a13c@rasmusvillemoes.dk>
Date:   Sat, 19 Nov 2022 22:57:02 +0100
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
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <CAOMZO5BPtEU6VCZXRk5FTHXDad6cegF=+oHTTA0wgjBuoh9-rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/11/2022 22.38, Fabio Estevam wrote:
> On Wed, Sep 28, 2022 at 9:41 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>
>> We have an imx8mp-based board with an external gpio-triggered
>> watchdog. Currently, we don't get to handle that in time before it
>> resets the board.
>>
>> The probe of the watchdog device gets deferred because the SOC's GPIO
>> controller is not yet ready, and the probe of that in turn gets deferred
>> because its clock provider (namely, this driver) is not yet
>> ready. Altogether, the watchdog does not get handled until the late
>> initcall deferred_probe_initcall has made sure all leftover devices
>> have been probed, and that's way too late.
>>
>> Aside from being necessary for our board, this also reduces total boot
>> time because fewer device probes get deferred.
>>
>> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>> ---
>> It would probably be reasonable to do the same to the other imx8m* clk
>> drivers, but I don't have any such hardware to test on.
> 
> Agreed.
> 
>> +static void __exit imx8mp_clk_exit(void)
>> +{
>> +       platform_driver_unregister(&imx8mp_clk_driver);
>> +}
>> +module_exit(imx8mp_clk_exit);
> 
> Isn't module_exit() unnecessary here, since we pass suppress_bind_attrs = true?

Sorry, I don't follow. Before this patch, the driver also implicitly had
a module_exit() doing exactly this platform_driver_unregister(), it was
just hidden inside the module_platform_driver() macro. And I think
that's necessary if one wants to test that the module can be loaded and
unloaded (I don't think it's ever useful or even possible to have it be
a module on an actual imx8mp board).

For a modular build, this patch changes nothing since all foo_initcall
levels are translated to module_initcall for those. And when the driver
is built-in, the __exit code, both before and after this patch, is
discarded in the final image.

Rasmus

