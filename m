Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAD1C25B47
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 08:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbjJYIDr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 04:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjJYIDq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 04:03:46 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1931FC1
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:03:44 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so8402616a12.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1698221022; x=1698825822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIO339/qu08wZ2r0nZAHdrWAaLG7qQMU/yUxr7tkE5M=;
        b=e0ZzUaMxxfxqOktqAu3669tUiw9sla/v26rSS+MpGDGOwQrjn0LZYFPBPKmDYK4oE/
         bTxSy8koVi9lDuXFAOWfraVyMhZTk3mHuec/HchHBIr13Yj2n3TZTgrNqhtPSxvJb7tW
         YwylHsr5mC0pKyTRGPA82zGs1VdN8unpTLHPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698221022; x=1698825822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIO339/qu08wZ2r0nZAHdrWAaLG7qQMU/yUxr7tkE5M=;
        b=mO73suVuJVnCI5Zn+dqMWpAtcZfhkSiyYjUcb1VE8SOd/KXbwduJxW4ZgHTcCBBtZC
         2ktjWUNj5H6vKct6d6Ed++NI5hYgX4Pyd4JwbfBElPFHoGCixYBF8+uz2k9aXCbxLYwL
         AinRkHtG8bTYtpBzkNIyDNwErOBf7yuk3baga6WwERhlpbGPT615aWDM95VnbgPDwX0o
         xfvOZZMCU5/RM8sjVYH9RhY6JtasJw9Gh28jvAeKnO7gUks+nu+9C4fP5XukO2FGnf9S
         FjUFlkH1C04e+LHG0FSCY4pPeWtLHVnG18fw97QbJC+/nIESbyWPPango6K91rvmBLTW
         C3Ug==
X-Gm-Message-State: AOJu0YzsKe5EdG4/FSmQ8290E8XuBZAfFGcaPnPdVS7xDvXOsz9DbQ9w
        6eAle+cyxLR4u73qmJgFhX0UMA==
X-Google-Smtp-Source: AGHT+IGuL+4DT/CjBVDWBBExYrUbj81RoDDX4Wg5tN94RVTHsypVW6kCiRvm3vYugyFNcwMHyzsOGA==
X-Received: by 2002:a50:d098:0:b0:540:164c:2be1 with SMTP id v24-20020a50d098000000b00540164c2be1mr7734823edd.0.1698221022310;
        Wed, 25 Oct 2023 01:03:42 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id cw3-20020a056402228300b0053eb69ca1bcsm9021465edb.92.2023.10.25.01.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:03:42 -0700 (PDT)
Message-ID: <7ba90240-33ba-4e08-af38-3ec2d40c3837@rasmusvillemoes.dk>
Date:   Wed, 25 Oct 2023 10:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] math.h: add DIV_ROUND_UP_NO_OVERFLOW
Content-Language: en-US, da
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vasily Gorbik <gor@linux.ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>, kernel@collabora.com
References: <20231024161931.78567-1-sebastian.reichel@collabora.com>
 <20231024161931.78567-2-sebastian.reichel@collabora.com>
 <CAHk-=whYDbZ29fx_xeSxtYSjtF8WJkaLjzyB8RN5_Rk9Sh-YyQ@mail.gmail.com>
 <CAHk-=wjO5ivM6k7iMiThO9JfxH0dhLe=mcC4TQwReU0nBCnWpg@mail.gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <CAHk-=wjO5ivM6k7iMiThO9JfxH0dhLe=mcC4TQwReU0nBCnWpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/10/2023 00.53, Linus Torvalds wrote:

> I'm hoping that somebody will go "Linus, you're just being
> *completely* silly, it's much easier to do XYZ".

I don't have better suggestions, but a few notes:

Both the existing and new implementation are simply wrong for negative
n, because / doesn't do floor(), it does round-towards-0 (I do believe
that's a bug in the C standard, but not much one can do about that). So
both the old and new say that dru(-5, 5) == 0, dru(-7, 5) == 0, dru(-10,
5) == -1. They are correct for dru(-9, 5) == -1 and other "1 mod d" cases.

But the new implementation disagrees with the old for -d+1 < n < 0: The
old implementation correctly says dru(-3, 5) == 0, but the new gives 1 (!).

Preventing signed types from being used is probably too difficult. But
it would be nice if we could at least catch a negative _value_ and do
something sensible. Can we make the build fail for a negative,
compile-time constant, n? I have no idea what to do for run-time
negative values - we already don't do the math right, but starting to
return a positive number for some negative n's really doesn't seem right.

Aside: I don't think uapi/ stuff can include non-uapi/ stuff.

Aside2: do_div(n-1, d); probably doesn't compile :)

Rasmus

