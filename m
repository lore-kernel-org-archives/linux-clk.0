Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B495C6FD18
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 21:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbjDRVDS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Apr 2023 17:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbjDRVDN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 17:03:13 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2ABD975A
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 14:03:11 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id u3so24595278ejj.12
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 14:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681851790; x=1684443790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pfsKq2jegZCI9tTQYaPt4WSkjuv1Pe13pcaASvWJHc=;
        b=NCzxU1IpCrLpLhecquYk8z4rUpQ9i81ywY6szWoufutWRIGpTuT6h9p5oQExZEpqR0
         VEp88N9IFTPIt36210W247Q6AagnwKT+Jjb22T5ecIZI2OaCnbeVUs+RvHmDyIP8ouLu
         Xvwo1dHzsgx/daizdIKXz6hiJQ5McWcF1Eqc69P1rzL/D1fF3y9EggTG723MeBq5SBUO
         dOsaKhzUuoRdXGBe8eeXGAm4sF9QPutLYlVEq/MUP+TmmGWPYOGbnCN7IRGjBYSm9fBL
         eTOdQMtjOebG2WoUqaLSclLr7mmp4Qv4YZkeaLcvgnPxkG3NU7W6yXG833rb1GMJZEd9
         OOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681851790; x=1684443790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pfsKq2jegZCI9tTQYaPt4WSkjuv1Pe13pcaASvWJHc=;
        b=dx5RFwILlQxzGU/al6KGm+65X0Efey2uzIL+f2+dfklmsFFXyKJjymfQKzeIXo83Z7
         jwo3RPf2p9po57s0a1DSOecAt/sJUT2OkgdpClPu2gZJhBKM+rNGt+RPCCrIW1d6IEDL
         6YtII5di8Wxp2KMCgEIDJ/JiklhiX4Jx+LhKF5FP26prtkbEY+hxWhqDLEG63EY8Jjz5
         +doYOMOeQTqfB46yWKdujRaAChuprvxC/Il3+RfphqSJaNGjm4SIq+05t9J+kAYClwFc
         OnmkallG2cBzIbrQ5n9HzwuZO/EpRiBtApfoxBzJ4GXEGOXEbE2TsVyC+CjAn+HnNtdF
         MU9w==
X-Gm-Message-State: AAQBX9eGvjgc2J8M1jrfsihpjwpWKfcD+FjJbraaqN+W+IxJfnClOLsG
        exUV2PkNbU2rhEof/o1BpfvWpKjeZ6U=
X-Google-Smtp-Source: AKy350ZNLFfx5rPjSX1sEPxCvfOPPrh3g0qRUT9mi5mkoWid9o2stQMw6GkHjy6E/OVVmFjF0ckvwg==
X-Received: by 2002:a17:907:20c1:b0:94e:80b2:51e3 with SMTP id qq1-20020a17090720c100b0094e80b251e3mr133167ejb.27.1681851789877;
        Tue, 18 Apr 2023 14:03:09 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6e8d:7900:5904:9190:13c1:f560? (dynamic-2a01-0c22-6e8d-7900-5904-9190-13c1-f560.c22.pool.telefonica.de. [2a01:c22:6e8d:7900:5904:9190:13c1:f560])
        by smtp.googlemail.com with ESMTPSA id a7-20020aa7d747000000b00504a7deefd6sm7508638eds.7.2023.04.18.14.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 14:03:09 -0700 (PDT)
Message-ID: <963d9e46-936e-bb38-aa92-38b8c36a3aaa@gmail.com>
Date:   Tue, 18 Apr 2023 23:03:08 +0200
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
 <3935914a-bf12-1040-10d2-c7a94465b37f@gmail.com>
 <efc9ee0c7c790566d242a2561ac55a55.sboyd@kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <efc9ee0c7c790566d242a2561ac55a55.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18.04.2023 02:43, Stephen Boyd wrote:
> Quoting Heiner Kallweit (2023-04-13 23:01:13)
>> On 14.04.2023 00:29, Stephen Boyd wrote:
>>> Quoting Heiner Kallweit (2023-04-13 14:39:28)
>>>> With clk_hw_create_clk() we have the problem that module unloading
>>>> is impossible if consumer and provider module owner are the same and
>>>> refcount is incremented. See also following comment in __clk_register().
>>>
>>> Do you never call clk_put() on the clk that you get from
>>> clk_hw_create_clk()?
>>
>> In my case clk_put() is called from a devm release hook. Same issue
>> we'd have if clk_put would be called from the drivers remove callback.
>> clk_put would be unreachable because the incremented module refcount
>> prevents module removal.
>>
> 
> Ok. You could unbind the device in sysfs though, right?

I *think* this should be possible, right.
