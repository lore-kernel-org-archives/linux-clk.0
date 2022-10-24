Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC28C38A2D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 15:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbiJXPiB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 11:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiJXPht (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 11:37:49 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E132495F2
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 07:25:47 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id y69so12890314ede.5
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNRDUP9ouWlmlPu6POZXr/UqktEd3BwTrOrVcJ1HXpQ=;
        b=Zre2CJjpDPgZ3ML+5uYe3oKtSH6m3xLiU4J6QrCHDDpo5kZY8xjs2ItrKKTfLcDYht
         TVO4nENelYErdKgDYpqW6aR729OTlE/NHjfrcLDV8Crl51KvdX2Wyl3dH2Jegc8K29VM
         lRVPQ90tlZl8N0YSyJgTFvwLm3nRrtNjasWxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNRDUP9ouWlmlPu6POZXr/UqktEd3BwTrOrVcJ1HXpQ=;
        b=Tg3oSgqb5xMD4MD7X1NdVgk0Sgj6q513UhW6kalSQgFKxY6AzZfIFI9nVEXmo37WHJ
         aOI7U5Tg4ZCkxSvZ/D4XMFgAkSkUrtRbaWIDDi2+ZQlCKbJGaapuBatNjWWMv0hCD6JG
         xZOP369gaBykEDHmtWRrBp1ZPZPh+YE1VBpDjxbqIf0jLUY+XhDZDp3MsXN/EySb4Cij
         RAxwpxWwS7Xxxohq8XrLbJR2pmb5bgRQs0f5+y7uVbc6vNfd5ZSR4gQgTbJ/dxyo8xH0
         TTIx93NsSFxPeal2Av7LWoxCOLEhcdXg1SQ+XQBOuYskwestIC7gxYVOOhy5OlvROkoz
         O/sA==
X-Gm-Message-State: ACrzQf0mrWU/x+A6TJeMVRYdyn3Ur7t+JBQSnWtvD1ZlGuXLZHhzuCTL
        y58xIujXy/3jd/B14ySY4UZU3YN2jRyymECZpOw=
X-Google-Smtp-Source: AMsMyM6GLxv6YpStCWiwlAyLglFzeiLykSKUvCjuukVmFp1jXb2lI1FAJdRQEzwFTD2k7tzPsely6w==
X-Received: by 2002:a2e:b11a:0:b0:26e:4c9:f7f7 with SMTP id p26-20020a2eb11a000000b0026e04c9f7f7mr11624761ljl.522.1666619290405;
        Mon, 24 Oct 2022 06:48:10 -0700 (PDT)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id o20-20020a2e7314000000b0025ebaef9570sm4954322ljc.40.2022.10.24.06.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:48:09 -0700 (PDT)
Message-ID: <814496ae-4007-9a4e-0466-a0386aec6316@rasmusvillemoes.dk>
Date:   Mon, 24 Oct 2022 15:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: imx8mp: register driver at arch_initcall time
Content-Language: en-US
To:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 14.41, Rasmus Villemoes wrote:
> We have an imx8mp-based board with an external gpio-triggered
> watchdog. Currently, we don't get to handle that in time before it
> resets the board.
> 
> The probe of the watchdog device gets deferred because the SOC's GPIO
> controller is not yet ready, and the probe of that in turn gets deferred
> because its clock provider (namely, this driver) is not yet
> ready. Altogether, the watchdog does not get handled until the late
> initcall deferred_probe_initcall has made sure all leftover devices
> have been probed, and that's way too late.
> 
> Aside from being necessary for our board, this also reduces total boot
> time because fewer device probes get deferred.

ping

Rasmus
