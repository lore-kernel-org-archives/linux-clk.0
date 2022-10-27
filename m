Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF62ECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 16:17:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbiJ0QR4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 12:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236236AbiJ0QRz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 12:17:55 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B340B18499C;
        Thu, 27 Oct 2022 09:17:54 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id f8so1318755qkg.3;
        Thu, 27 Oct 2022 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNivv6DRz6IEkkxyGRhb+JocG+RcUmjQEd9pXKbOdDc=;
        b=NxS8gxZ5r2NidNCaiTXc+eL/q287MblVn2H5BsRA7or5nWiqGB6CkpEOwUw0ckzECs
         yjt3sPFNpfdMT+XrqidYEuhYGhrNNGz7B5Ez9Mm9CiJfpcEJssXc8dloV8nM93+xBrHR
         +aiqUB+ntichlicautD/OLfx/lO6ufjVKVMarUVBt3o8uR13AnIHVVSJH6nz3jcv/qmF
         tUicgzZbJew7Yno+y1GqF7887A2KZPqZJSE023H42rx2wsxA6+S6S7ACNHWdStf6TZa0
         ypb/lxBeharZN2Y2L29TT9md983qf412hShCxXQBnRVxzDhwVcJnYzhl8+mHxknZTr6Q
         WYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNivv6DRz6IEkkxyGRhb+JocG+RcUmjQEd9pXKbOdDc=;
        b=KglMzB1Rjpi/F2a3Kduj7NGiA5RRM8zAHIbEaaLGBoCylTzYpgBxc9gT1+/F+2Su8L
         q73IxeIF1sXMEwYPtZrtJL9L0FJPHmpMlWc9hBDYEFfisQfNUNBCsiZ8BKXLDAPIWYuV
         3Yrg9JBdy9tFKGmljN7OWGTYSL/7UG15uu/y5irPH/6QQkyKwQvLVTyVbSWn9KCWJqoU
         bMzgi5X0EHsxtjW4h9gYGEsS27HWROwHrF1/g599eMeOUjjfGeG6qYeyKWvAqRmjyjz0
         sSuUR2VxuEEBLYMPdo6iH9a0VTuBp7Q7NDtPyVmoPntVMZkulS5viuM/070sD0CVgOK6
         yQgQ==
X-Gm-Message-State: ACrzQf0yAIyOHh/qcirppPevU6q1WHa6k0zK8BH7/aELoDGoJj/G2J+O
        uCyaw3dFfpJkrUg4Q0uUgVk=
X-Google-Smtp-Source: AMsMyM5vHmoX2lyAii7orMewell05XbgGBaMZ0nuXVmF0ltTsUChJojDSXLe3If80wF1op6DMfBhEQ==
X-Received: by 2002:a05:620a:40cb:b0:6ee:79ce:e985 with SMTP id g11-20020a05620a40cb00b006ee79cee985mr34437793qko.219.1666887473804;
        Thu, 27 Oct 2022 09:17:53 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id y27-20020a37f61b000000b006cf19068261sm1177502qkj.116.2022.10.27.09.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 09:17:52 -0700 (PDT)
Message-ID: <5c26e62a-0e69-aad6-c72f-eb7fc28051cb@gmail.com>
Date:   Thu, 27 Oct 2022 09:17:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 3/7] firmware: raspberrypi: Provide a helper to query a
 clock max rate
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
        David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>
Cc:     linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
 <20220815-rpi-fix-4k-60-v5-3-fe9e7ac8b111@cerno.tech>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-3-fe9e7ac8b111@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/27/2022 5:52 AM, Maxime Ripard wrote:
> The firmware allows to query for its clocks the operating range of a
> given clock. We'll need this for some drivers (KMS, in particular) to
> infer the state of some configuration options, so let's create a
> function to do so.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
