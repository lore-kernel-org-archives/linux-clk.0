Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD3AC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 18:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AC786162E
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 18:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbhI3Sle (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 14:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344125AbhI3Slc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Sep 2021 14:41:32 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E36CC06176E
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 11:39:50 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id 187so1363376pfc.10
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 11:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hwF5e6mHNe/gx6aMwLSJ0vdiPI4SNL5eW+DMO+ixlyg=;
        b=n10uXb1354hz0fgwbagMfDw5GhQNZnXFY1kzjWIbWv4bLU2yv24IA9omea33zP35NP
         n0iusSY4stmQVL+n+pTjOGclg15M+338oZ4U3wR/uxa29srSq7BjsxE2/ZC9N5FekJr7
         RBKNv9NGcb3y27KIHWCJA5c/AASiIwOgv2Mj2n0YVQCIUHQ+bOab3LYK3BPP3zwBH90D
         TFnwKao4qp1/I8jQvQn7bMHhcOAL/itFij4nqXfafzbCcXIQkeGuuhPX+pjx7dwgZrbZ
         JYqDMUI/5ua7uXY4brr0FrqJWkbZNN/Ayhl1dltpyDukZl0ApFNm2xGGQ7Ld8lFanURV
         s7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hwF5e6mHNe/gx6aMwLSJ0vdiPI4SNL5eW+DMO+ixlyg=;
        b=TfksJpVV7UDiwo0R+M07NfNaR7HOgXzrTwDUTyzLlcsVESXBbp7mAq+BnUPO9yQmtj
         e8b96gb5FkkaZvhl5EIKzJLwnt1fnJmh6uRDpFbtJu/vqz8L5NfNEFFX3dYrxhCgAoIg
         qK2ao7uggrEbUVVqLoMuWQ1TWlknjYtcQRII8fu1PRmYSh3tuhCwHvyE0eMldZjpGIuQ
         4BIyAD3RRd5UhdBT/l++X0+tkXx9CAy4J2MydIzjJcW7L3nEsjQkaXhb75HfI2EGxOYI
         9ZKfwHdszvJJPm9oK8LMqdeA6R4/Mi2Lqcui/qP7KfbuwUHevPyVeie7SOeCI5p6pPWd
         WYRw==
X-Gm-Message-State: AOAM530s8+/Wnho7x8plH2ppjlOzIweklx3WNZmQ1tW2GHAzClT6Blrs
        SbPSeyRYQunzWLueybDhU4o=
X-Google-Smtp-Source: ABdhPJwFtzy1gWz77vvbFSd6ztrFq0qA1XG2Yc7WQIuYfgJrhVWxml6j9IlyFh8mwEhTzyeoxUyUSA==
X-Received: by 2002:a63:380e:: with SMTP id f14mr6278496pga.267.1633027189508;
        Thu, 30 Sep 2021 11:39:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id p26sm3593093pfw.137.2021.09.30.11.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 11:39:48 -0700 (PDT)
Subject: Re: [PATCH 0/5] drm/vc4: hdmi: Remove CPU hangs, take 2
To:     Stephen Boyd <sboyd@kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20210922125419.4125779-1-maxime@cerno.tech>
 <20210924074044.e24kbxr7lhdtb3eg@gilmour>
 <20210928130549.wi6hvvcvqahzfkw5@gilmour>
 <163302537796.358640.5802901948949661491@swboyd.mtv.corp.google.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0a7ce069-e05e-8a4d-2d24-9bfa913d9916@gmail.com>
Date:   Thu, 30 Sep 2021 11:39:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163302537796.358640.5802901948949661491@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/30/21 11:09 AM, Stephen Boyd wrote:
> Quoting Maxime Ripard (2021-09-28 06:05:49)
>> On Fri, Sep 24, 2021 at 09:40:44AM +0200, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Wed, Sep 22, 2021 at 02:54:14PM +0200, Maxime Ripard wrote:
>>>> Hi,
>>>>
>>>> Here's another attempt at fixing the complete CPU stall while retrieving the
>>>> HDMI connector status when the connector is disabled.
>>>>
>>>> This was fixed already, but eventually got reverted by Linus due to the same
>>>> symptom happening in another situation. This was likely (but not confirmed by
>>>> the reporter) due to the kernel being booted without an HDMI display connected,
>>>> in which case the firmware won't initialise the HDMI State Machine clock.
>>>>
>>>> This is fixed by patch 3. However, further changes in the clock drivers were
>>>> needed for clk_set_min_rate to be used, which are patches 1 and 2.
>>>>
>>>> Finally, patches 4 and 5 are the original patches that were reverted. Patch 4
>>>> got a small modification to move the clk_set_min_rate() call before the HSM
>>>> clock is enabled.
>>>
>>> If we merge the clock patches and DRM patches separately we're going to
>>> break bisectability. I guess the easiest approach would be to merge the
>>> clk patches through DRM. Does that work for everyone?
>>
>> Anyone? I can ask around for reviews on DRM, but I'd really like some
>> reviews on the clock patches here..
>>
> 
> Looks ok to me to take through drm.

Same here, assuming I even have a say in this ;)
-- 
Florian
