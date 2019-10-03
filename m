Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB90CC10F14
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 18:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0B7320865
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 18:00:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjGNAQ1E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbfJCSAF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 14:00:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36587 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbfJCSAF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 14:00:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so3783498ljj.3;
        Thu, 03 Oct 2019 11:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=foBAlSvpvTkpQ7VEhjeGmdMB+F2z1Pq+N5FSEjakBEQ=;
        b=BjGNAQ1EvFbyh/Jpc8YYg2RIPXqZ4R9I8ANorOgy/RUlzr/T5SxOOyoXXLNem1wBig
         fqHvzGvwp26dRnxaSN5veub68aRdR46XhNn9lRdL7Ji0VLsUqKO86lLrF2JURYOI7cag
         UqF1lU6KVSt/GJN4HGlCRXmpLKttX9XKNc0h38yFpDQvPlmTmKe5l8ur6A9aMvGFr3kz
         9BlK+sVtaNimjLLJyR6cW+3zmiZuU5KQMP19mSACqTBAK+mqz/GSX2pgb2QpXhgmOLFU
         6oJ7RMHXIVfnnz6jSlQP6ZRKyZHOuQ0/Afdh8O0lwMsOh3yRQnVP0Kv5bzRFZOVhRTs9
         gDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=foBAlSvpvTkpQ7VEhjeGmdMB+F2z1Pq+N5FSEjakBEQ=;
        b=mo9LdyDu5/8nszdA8zSLCCJc2oVp6+gyRL0g3z2gIYymulYkmERN25xN7KW3B5qsaB
         7SocndGUJ/5NhhlJG9SmbDU+MlwD9309bqCKA7V/+E0o8nwiGfENzmKwg/xViqy8NpEA
         j+mcRTWy/6nYPT3baTMBNApvVMAqsAQlQ+/xN3bIMS0pmJwrGR9GGQ5Wqa0btLvewz11
         i2YUa7j3LsQsKLVg3L5t+/FVKmalwn33WvDE8JpaqHtkjKH5tB3TvuNWrGCjq04R7LXw
         qSS/GKlKpK5iDRN1zpFng9r+KtWCIZ1Cgy5hd5/hCZo7Z9HqJz0pSpc6JgvIlcYCatoE
         A/wQ==
X-Gm-Message-State: APjAAAWJUmiiD3iKpnlwvvLU8VLqqOC9c8mF5XLTmey2he3u+IS/a7cm
        KvNksfTVy9JRLF1ULhreTKY1CiLD
X-Google-Smtp-Source: APXvYqzB/243LptNJmm7Ip7/LjxJnXggnO3AD2EBIARhaJ4sHQq87w/zqJnJG8wSIFdxHAk8F2VcqQ==
X-Received: by 2002:a2e:8603:: with SMTP id a3mr6867293lji.98.1570125602905;
        Thu, 03 Oct 2019 11:00:02 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.231])
        by smtp.googlemail.com with ESMTPSA id k7sm660392lja.19.2019.10.03.11.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 11:00:01 -0700 (PDT)
Subject: Re: [PATCH 2/4] ARM: tegra: Enable PLLP bypass during Tegra124 LP1
To:     Stephen Warren <swarren@wwwdotorg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
 <20191001211346.104400-2-swarren@wwwdotorg.org>
 <437f030b-9e20-43e5-42ce-f98430d2149b@gmail.com>
 <485c9828-120a-8e62-bf85-c5d8407d3513@wwwdotorg.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <89e0a7bd-e8e4-5c64-b9d0-a30794ed657e@gmail.com>
Date:   Thu, 3 Oct 2019 21:00:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <485c9828-120a-8e62-bf85-c5d8407d3513@wwwdotorg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

03.10.2019 19:34, Stephen Warren пишет:
> On 10/3/19 5:27 AM, Dmitry Osipenko wrote:
>> 02.10.2019 00:13, Stephen Warren пишет:
>>> From: Stephen Warren <swarren@nvidia.com>
>>>
>>> For a little over a year, U-Boot has configured the flow controller to
>>> perform automatic RAM re-repair on off->on power transitions of the CPU
>>> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
>>> re-repair relies on certain clocks, which the kernel must enable and
>>> leave running. PLLP is one of those clocks. This clock is shut down
>>> during LP1 in order to save power. Enable bypass (which I believe routes
>>> osc_div_clk, essentially the crystal clock, to the PLL output) so that
>>> this clock signal toggles even though the PLL is not active. This is
>>> required so that LP1 power mode (system suspend) operates correctly.
>>>
>>> The bypass configuration must then be undone when resuming from LP1, so
>>> that all peripheral clocks run at the expected rate. Without this, many
>>> peripherals won't work correctly; for example, the UART baud rate would
>>> be incorrect.
>>>
>>> NVIDIA's downstream kernel code only does this if not compiled for
>>> Tegra30, so the added code is made conditional upon the chip ID. NVIDIA's
>>> downstream code makes this change conditional upon the active CPU
>>> cluster. The upstream kernel currently doesn't support cluster switching,
>>> so this patch doesn't test the active CPU cluster ID.
>>>
>>> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>>>
>>> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>>> ---
>>>   arch/arm/mach-tegra/sleep-tegra30.S | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
>>> index b408fa56eb89..6922dd8d3e2d 100644
>>> --- a/arch/arm/mach-tegra/sleep-tegra30.S
>>> +++ b/arch/arm/mach-tegra/sleep-tegra30.S
>>> @@ -370,6 +370,14 @@ _pll_m_c_x_done:
>>>       pll_locked r1, r0, CLK_RESET_PLLC_BASE
>>>       pll_locked r1, r0, CLK_RESET_PLLX_BASE
>>>   +    tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
>>> +    cmp    r1, #TEGRA30
>>> +    beq    1f
>>
>> What about T114, or does it need enabled PLLP as well?
> 
> I'm nowhere near as familiar with T114 as T124, so I can't be 100% sure. However, a very
> quick look at the CAR section in the T114 TRM does show the same gate/mux structure around
> a reshift and fuse clock, so I assume the requirement is identical there.

Indeed, T114 TRM suggests that it has the same requirement.

> Also, NVIDIA's downstream kernel has a compile-time ifdef around the code I've added here.
> It's not compiled for T30 specifically, and is compiled for anything else, which I believe
> means both T114 and T124.
> 
> In patch 1 in this series, I only enabled the fuse clock for T124, since I don't have a
> T114 system to test any more. However, the revised patch 1 that Thierry and I are
> discussing would enable the fuse clock on all SoCs, and hence make the code work
> identically on T114 as it does on T124.

Thanks for the clarification.
