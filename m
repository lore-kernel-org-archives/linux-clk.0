Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D908C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 22:47:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F8356044F
	for <linux-clk@archiver.kernel.org>; Wed, 27 Oct 2021 22:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhJ0Wtd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Oct 2021 18:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbhJ0Wtc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Oct 2021 18:49:32 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D8BC061570
        for <linux-clk@vger.kernel.org>; Wed, 27 Oct 2021 15:47:06 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id d13so6665126wrf.11
        for <linux-clk@vger.kernel.org>; Wed, 27 Oct 2021 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VQnn7OcW2IdIJ2raJUtB2bY5I0Gtr+4lb3jHhpzihJg=;
        b=Or/IyJTzWjxmhzaRGArtjqauKK3Dpff3YtFffUKDrD+EhEruwSNn4ZGYEGH0O9Hadg
         VBoI9F5VZFduD1eMvK/G3kmjjX+Rfpw8gY6zeYVyw4XqrzHQHjkWV4WamyVzRSILCsFd
         ilAHHOsZMMGaEA0C8kRwZTxnWyiTAzPD6L949mi5R0adHc4uRH3VRocx0lTdgCSLS2iB
         FBh73xS1aLEuZZ7ZVT8+SExRHfr5QITbYSMMK3HBMjxulYb3cYxUbR9UQmCR06/gLhsZ
         YeQ5CY78/hyxb3pzjjDeOvMdsljOhA48OvQhz41s/GSAvta6wwIEQpQozx+nkR2obB+Q
         lY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VQnn7OcW2IdIJ2raJUtB2bY5I0Gtr+4lb3jHhpzihJg=;
        b=3dQXZiOSHdnje41zEyxzv/PcULF0Tfzw9nOF22LDB0sADpKLzLPAUgDpfTDW9hygrK
         pw0d6LeHQoN6EyF9n7LJDi948qJNN8J3tKD5jYYOGr+KFCRrqgztRzn1TusEH4lR4Q+2
         WzkieUMiIKzcOVtPHbD53Gv3gOgNuVoGypQebTWR/ZuYoU3vzzRs5WTL75EkV0YvZq2D
         r2qGtnYyf0+iODASHTCbLGXqKpr/L+ySqsB8IgNGtpVyvS9Bo8J6cSZIpQc3140+LTay
         PzWlc9QUvc2AbDg7S5pwx3OpvMp0VbK+ROmWd+XFyhcNXQtGMDifFGVfQ60MfA08taxZ
         Ujww==
X-Gm-Message-State: AOAM532sfpEDEP5+wcCGQH+GDoyorRn/U7I7pGt3VGa4HMvcA2U39J3N
        UhJ1UQZ/We2w8+jTRl0rzw==
X-Google-Smtp-Source: ABdhPJxD1Xtnd1Z+10bLntjfx1s68V4WtSV2PPMoMx31+ySm/liRJvYAX+DHXSWFosHDj4J8JLXtlw==
X-Received: by 2002:a05:6000:18ce:: with SMTP id w14mr682370wrq.230.1635374825027;
        Wed, 27 Oct 2021 15:47:05 -0700 (PDT)
Received: from [192.168.200.20] (ip5b435a69.dynamic.kabel-deutschland.de. [91.67.90.105])
        by smtp.gmail.com with ESMTPSA id n11sm1066974wrs.14.2021.10.27.15.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 15:47:04 -0700 (PDT)
Subject: Re: [PATCH clk-fixes v1 1/2] clk: composite: Also consider
 .determine_rate for rate + mux composites
To:     Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com
References: <20211016105022.303413-1-martin.blumenstingl@googlemail.com>
 <20211016105022.303413-2-martin.blumenstingl@googlemail.com>
 <163458726377.1767887.8064107515338216758@swboyd.mtv.corp.google.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <463e771a-71cd-8457-ed4d-a505a39009cc@gmail.com>
Date:   Thu, 28 Oct 2021 00:47:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163458726377.1767887.8064107515338216758@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Am 18.10.21 um 22:01 schrieb Stephen Boyd:
> Quoting Martin Blumenstingl (2021-10-16 03:50:21)
>> Commit 69a00fb3d69706 ("clk: divider: Implement and wire up
>> .determine_rate by default") switches clk_divider_ops to implement
>> .determine_rate by default. This breaks composite clocks with multiple
>> parents because clk-composite.c does not use the special handling for
>> mux + divider combinations anymore (that was restricted to rate clocks
>> which only implement .round_rate, but not .determine_rate).
>>
>> Alex reports:
>>   This breaks lot of clocks for Rockchip which intensively uses
>>   composites,  i.e. those clocks will always stay at the initial parent,
>>   which in some cases  is the XTAL clock and I strongly guess it is the
>>   same for other platforms,  which use composite clocks having more than
>>   one parent (e.g. mediatek, ti ...)
>>
>>   Example (RK3399)
>>   clk_sdio is set (initialized) with XTAL (24 MHz) as parent in u-boot.
>>   It will always stay at this parent, even if the mmc driver sets a rate
>>   of  200 MHz (fails, as the nature of things), which should switch it
>>   to   any of its possible parent PLLs defined in
>>   mux_pll_src_cpll_gpll_npll_ppll_upll_24m_p (see clk-rk3399.c)  - which
>>   never happens.
>>
>> Restore the original behavior by changing the priority of the conditions
>> inside clk-composite.c. Now the special rate + mux case (with rate_ops
>> having a .round_rate - which is still the case for the default
>> clk_divider_ops) is preferred over rate_ops which have .determine_rate
>> defined (and not further considering the mux).
>>
>> Fixes: 69a00fb3d69706 ("clk: divider: Implement and wire up .determine_rate by default")
>> Reported-by: Alex Bee <knaerzche@gmail.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
> 
> Applied to clk-fixes

any chance this can make it in 5.15?

Regards,
Alex
> 
