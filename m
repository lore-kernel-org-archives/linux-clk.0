Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355A7E9272D
	for <linux-clk@archiver.kernel.org>; Thu,  5 Oct 2023 19:26:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjJET0z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Oct 2023 15:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbjJET0s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Oct 2023 15:26:48 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51F7E7
        for <linux-clk@vger.kernel.org>; Thu,  5 Oct 2023 12:26:46 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c60128d3f6so34745ad.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Oct 2023 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696534006; x=1697138806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5wvhBkE/Y4VMn6AJO1ol9tVQweOIpEQMTvvNcvIVBY=;
        b=VpeP3XpYRBUhP2PNH3VDcpNwDG136vJMY9EmmZBr4hf42CA688xxwZvUl6ZgW/WTj9
         OXimihdzx67TX2naullczltfyL9pSdm7MRpTsJC9H16mUgd3hYhhKV0scjNWASmVnvzJ
         EX0b/bZSNDz8pG8ajQsPLoCNC+XGs/+Fa4/yoZ9iPMjh5NS/+jppr+qvMAZ/blfcsf0R
         4YgBcFe5gF6g29WJyUSdAUpf8cKx0NwAcvU4RdpDyWcXdrxPQm49k1dza1nLfV+oi8uM
         UYZ3p9vD8QyJUVHJnL4GKBmIWREVxty2TuMxNQI0JRE74GtOk2W9IbQkzeBfAjC6GRYu
         qgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696534006; x=1697138806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5wvhBkE/Y4VMn6AJO1ol9tVQweOIpEQMTvvNcvIVBY=;
        b=I7IUHDOlswJEDdsQ+myEZUMlHh9DKSKfuq1BrI9OBr0ZJwbY+8sdpr6+OuWLKuokwp
         FvEQVEzDwv7oEGMi7qHpjAVlEvxebXVuzsWR8KHttTpXaM0p3l/G+rcosvpJg8Iaw8lS
         uDxVq5lm75NNhDkUDVHNDRHVnVBhHiLZn8y85X0G3shbAnC6b3rO86PgOx1zxVgZQbv7
         CMdXPNvU9z7pJ/UwQAZlm3x+pUV/KkGpASj1QM0Km+SDYZ3sYLP6YAIxNtWZS0lndvL4
         OUVMvvgF2qMlIpuCzVb5IMTCglDY3ziS4ZhJhUKuTisKSa3GfkOkY6ltm6sVmHPeiSR/
         HLmQ==
X-Gm-Message-State: AOJu0YynMyxzusqcz+bF0t2K3HDCnhuZ0774RHkAFEMygy7lC/Ekw66K
        f7wMWYc6JlTaBMmDoYr+3nFT5A==
X-Google-Smtp-Source: AGHT+IEvlW5ijXe/2pcrast4aYhuAkaqOVIKwMflwNG+XXHh2gpdTvxD9kb2uTNW+B8NtUSf9Nq2Xw==
X-Received: by 2002:a17:902:f54b:b0:1c5:6691:4931 with SMTP id h11-20020a170902f54b00b001c566914931mr179417plf.12.1696534005954;
        Thu, 05 Oct 2023 12:26:45 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id i11-20020a17090332cb00b001bfd92ec592sm2097592plr.292.2023.10.05.12.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 12:26:45 -0700 (PDT)
Date:   Thu, 5 Oct 2023 12:26:42 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        gregkh@linuxfoundation.org, kernel-team@android.com
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Message-ID: <ZR8N8rxnYOgPXHJK@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
 <ZR75cIvnQS2cqTT3@google.com>
 <db02684f-c32b-4e09-8752-8d07dcb518c3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db02684f-c32b-4e09-8752-8d07dcb518c3@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/05/2023, Krzysztof Kozlowski wrote:
> On 05/10/2023 19:59, William McVicker wrote:
> > On 10/05/2023, Peter Griffin wrote:
> >> Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> >> (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> >> phones. It features:
> >> * 4xA55 little cluster
> >> * 2xA76 Mid cluster
> >> * 2xX1 Big cluster
> >>
> >> This commit adds the basic device tree for gs101 (SoC) and oriole
> >> (pixel 6). Further platform support will be added over time.
> >>
> >> It has been tested with a minimal busybox initramfs and boots to
> >> a shell.
> >>
> 
> William,
> 
> Please do not Cc non-existing mailboxes. You added Cc kernel-team and we
> all got awesome bounces now:
> 
> "We're writing to let you know that the group you tried to contact
> (kernel-team) may not exist, or you may not have permission to post
> messages to the group. A few more details on why you weren't able to post:"
> 
> Best regards,
> Krzysztof
> 

Sorry, I mistyped the email. Should have been kernel-team@android.com.

Regards,
Will
