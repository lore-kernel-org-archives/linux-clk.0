Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CA3C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 19 Nov 2022 20:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbiKSUqC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Nov 2022 15:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234476AbiKSUqA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Nov 2022 15:46:00 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050CF1A831
        for <linux-clk@vger.kernel.org>; Sat, 19 Nov 2022 12:45:59 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id n21so20628105ejb.9
        for <linux-clk@vger.kernel.org>; Sat, 19 Nov 2022 12:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQ/WZFLVVDxittaiC79H/LzvEV3RqoAAIkd3OTcJKH0=;
        b=K27ut1PNT2YlrreADla7CHlY/8c/PPCvFQttfd0LQY8Lzt6EFOrWspfzBum7JBRnd9
         hOUb8nJzE2N2+p3Mi/dmz/QAS4sDKZm7fp56CZdr8webWj+V8udHxlRdbT+/Ek0LNVfm
         TiTa4ZmtAF67zJCMbZmpDS8P3HmNxwB6uvp14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ/WZFLVVDxittaiC79H/LzvEV3RqoAAIkd3OTcJKH0=;
        b=Gj2QLtE33F7iIwx5SVpojhy5Wab+oV4OjrEdKMPwfBF1WiB/VN/5BMtCZ7om6SSHAq
         xufzcHq5rzhrIsi+2aUXddwmz9xN6daNg3zrIc5COxhQfE0k5RCma3//lqSxCK8LUjz0
         eX9bNugG6DkmUqPEkFQCsSZ78uDR/llTHKPHJ5HpArx7VUDe5v+Q6kxlxhOE5lfa/AQ5
         xtXvmnlNcGOI23u4m4vCitN12IHIq2F6mOj5BiS30m2+50bYTsofwAzIsllkdKWqYq3z
         R98x7ruhPwiXAd/uvd/cfyvyHAhkguJGYhB46ySA2tMHB05x0jfnDBQ9ZLHdIaWCU4fK
         lo6A==
X-Gm-Message-State: ANoB5pkgNJ8RhFImmmF104D6X+x2x1NTe0uNiuHdQ5kQt9y/KeDyBTnI
        RFVhWNE5WYP8BfAtkTPJeRRvBw==
X-Google-Smtp-Source: AA0mqf5VgWgcm8Pi02RV6zJXPKtv7uTC4zNVEyX3Kh5VS6nCAIeWiQ65kbBq8iGZ7QytXY2HVdFlAQ==
X-Received: by 2002:a17:907:8d03:b0:7ae:1d34:4da5 with SMTP id tc3-20020a1709078d0300b007ae1d344da5mr6729017ejc.340.1668890757551;
        Sat, 19 Nov 2022 12:45:57 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.65])
        by smtp.gmail.com with ESMTPSA id k26-20020a17090632da00b007ae4717bef1sm3269163ejk.15.2022.11.19.12.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Nov 2022 12:45:56 -0800 (PST)
Message-ID: <b83f5433-52eb-f23c-566e-5195ec32db5a@rasmusvillemoes.dk>
Date:   Sat, 19 Nov 2022 21:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] clk: imx8mp: register driver at arch_initcall time
Content-Language: en-US, da
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
 <08df1f08-1eea-0ee5-8e7b-6c427aa11d02@rasmusvillemoes.dk>
In-Reply-To: <08df1f08-1eea-0ee5-8e7b-6c427aa11d02@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/11/2022 14.54, Rasmus Villemoes wrote:
> On 28/09/2022 14.41, Rasmus Villemoes wrote:
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
> 
> Please advise on what I need to do in order to make progress here.

Ping.

