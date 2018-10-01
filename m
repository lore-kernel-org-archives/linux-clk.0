Return-Path: <SRS0=O2Xu=MN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF714C43143
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 13:31:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97C0F2084C
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 13:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="G+WajSdT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97C0F2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbeJAUJN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Oct 2018 16:09:13 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:36711 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729298AbeJAUJN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Oct 2018 16:09:13 -0400
Received: by mail-it1-f195.google.com with SMTP id c85-v6so11383465itd.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Oct 2018 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=+EDSqDmUbJNlKZhSe2UdyHuUsFuBQjDyjQuCZhx+axI=;
        b=G+WajSdTKUIuJneuTsvcAcDf3HjfuZ49lYdqjwqStynDuv3nkYxlETVUp/SoKBj8Ej
         9RGmjVYtVHH4IlhenJb9zzzX7Mf1TPn7RwXngL23V6XxwH7JR2egrBKanEkffPuSTwPV
         8r7eU5gIIKHpadllxs0tZ/9uVJxtTIrsWfgb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=+EDSqDmUbJNlKZhSe2UdyHuUsFuBQjDyjQuCZhx+axI=;
        b=PlZCz19RZtYDIoFAJOqtOgYj1VHuC+qOjyrf1woJJRkvb7H71REASkUetOEvbWZy0t
         AvYKhEjtox8DgHIJ7tT80IdU9Srr/IJL7CfcUmP8C6fsb8M+vaVY7tUr4iSEAQnIIIrx
         gpIavQYJMVQ4jQD/1HonrqI7adTxHC4NTOF7ZewbiQHV14098Mc54esTH7Z3UsIYh3yj
         /sZAIhO6XY7OsnPk+390qZxlGQBWOW2ChaQfyWVaHyxtDo2vcwfhXwpDZXs6a+1aHBcP
         DXHgxivicoN9gkwaJZmd2M5WMzT7d813Tx9OjmVhR689nlcZWNy/zD71QAXLXWfthP1O
         lGFA==
X-Gm-Message-State: ABuFfogWyNiaYpSqTVZfwbRMAH7kTdpM0rxY4+E0A1OongbLdJLjeMum
        nqKrUla1XSJE5p/T1n8JCgW6YsYQoTdgM0Ez3azaMA==
X-Google-Smtp-Source: ACcGV62pup05ZPkmA2Baa7o1QQAREJn8m9LN4FRDCYycwfRQvpQNL9k+rxajzHOornqagWElWu7vTpWi8nVOuPTvdkY=
X-Received: by 2002:a24:7383:: with SMTP id y125-v6mr9549039itb.146.1538400681720;
 Mon, 01 Oct 2018 06:31:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:3941:0:0:0:0:0 with HTTP; Mon, 1 Oct 2018 06:30:41 -0700 (PDT)
In-Reply-To: <20181001123406eucas1p2c94cf1d1e4674d45c95a9ba9853a965b~ZfCUbgmeC1880918809eucas1p2N@eucas1p2.samsung.com>
References: <CGME20180919121357eucas1p19717351c40697483d3bf467c55e46f51@eucas1p1.samsung.com>
 <20180919121342.18288-1-m.szyprowski@samsung.com> <CAPDyKFpcs8VgPcBF4fta=tLPUatxbhvSN3TLrxm1qqDN=OS29Q@mail.gmail.com>
 <20180920134228eucas1p2f69cf23d93d34884c6703a8a2c4d4cd1~WH33wZYnv3005330053eucas1p2q@eucas1p2.samsung.com>
 <CAPDyKFok_Fc=9EDOvKByyuOYhHbejXKRT9+a+nRDEJ_YAjP2Aw@mail.gmail.com> <20181001123406eucas1p2c94cf1d1e4674d45c95a9ba9853a965b~ZfCUbgmeC1880918809eucas1p2N@eucas1p2.samsung.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 1 Oct 2018 15:30:41 +0200
Message-ID: <CAPDyKFrXdDK6gyhGwZ0U0M_DXLsoBzBgksLtF+VcqxJAsD4dZA@mail.gmail.com>
Subject: Re: [RFC/PATCH] clk: samsung: exynos5433: Fix NOIRQ suspend/resume support
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1 October 2018 at 14:34, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Hi Rafael and Ulf,
>
> I understand your position on using runtime PM during system
> suspend/resume, but
> I would like add a few more words on why I need it.
>
> On 2018-09-20 19:29, Ulf Hansson wrote:
>> [...]
>>>>> The unconditional calls to pm_runtime_enable and pm_runtime_enable
>>>>> in device_suspend_late and device_resume_early core functions were a bit
>>>>> surprising for me, because they make NOIRQ phase a special case from
>>>>> the perspective of runtime PM handling. Using LATE system sleep phase
>>>>> to call pm_runtime_enable/disable looks like a workaround for me, but right
>>>>> now I have no other idea how to ensure proper behavior of the Exynos5433
>>>>> CMU driver.
>>>>>
>>>>> The most strange thing is that I didn't observe this initially after
>>>>> switching to NOIRQ phase. The CMU device (FSYS_CMU) which is not under
>>>>> any power domain behaved correctly and was properly available for DWMMC
>>>>> device, which needs to enable clocks in its noirq_resume callback.
>>>>>
>>>>> However, in case of AUD_CMU and its clients (for example serial_3 device,
>>>>> which is a part of audio-subsytem), the pm_runtime_get_sync() called from
>>>>> clk_prepare() failed, because AUD_CMU device had still disabled runtime PM
>>>>> support. The only difference between FSYS_CMU and AUD_CMU, is the fact
>>>>> that AUD_CMU is under AUD power domain, while FSYS_CMU device has no power
>>>>> domain assigned (for completely other reasons FSYS power domains is not yet
>>>>> instantiated in exynos5433.dtsi).
>>>>>
>>>>> Ulf/Rafael: could You comment a bit on this issue? How it should be solved
>>>>> properly?
>>>> In general, this sounds like the classical problem of
>>>> suspending/resuming devices in a correct order. The long term solution
>>>> is to use device links to address this problem.
>>> Device links won't help in this case. This is not a problem of correct
>>> order of suspending/resuming devices. exynos5433 cmu device is already
>>> suspended after its client's and resumed before them. The problem here
>>> is using runtime PM in exynos5433 CMU driver during NOIRQ suspend/resume
>>> stage.
>>>
>> I see.
>>
>> However, I am guessing that one of the reason to why the client's are
>> also using the noirq phase is because of getting a the correct order.
>> The point is, the different level of PM callbacks (prepare, suspend,
>> suspend_late, suspend_noirq etc) aren't really the right solution to
>> get a correct order, even if that is what works for most cases.
>
> Nope, in both cases clients (dw-mmc-exynos and samsung serial/uart driver)
> use NOIRQ resume stage, because they want to play with interrupts (avoid
> interrupt storm) on resume. The only way to avoid NOIRQ phase in them is
> to manually mask their irqs on suspend and unmask after fixing interrupts
> related registers, but using NOIRQ was preferred solution.

I see.

>
> The main problem is that both clients needs to enable clocks to access
> their registers in NOIRQ resume, thus their clock provider has to be able
> to runtime resume as well. clk_prepare() will call pm_runtime_get_sync()
> on clock provider device, but first someone has to call pm_runtime_enable()
> on it, otherwise pm_runtimge_get_sync() fails.

In principle the sequence you are describing doesn't sound like a very
unique case, so yes, I fully agree that it's problematic.

So far, the solution to this problem has been to resume devices
unconditionally, instead of using runtime PM for example. In this
case, resuming would need to be done even as early as in the noirq
phase.

Allowing runtime PM to stay enabled, instead of disabling it from PM
core in the device suspend late phase, could be an option. However, in
such case in needs to be done on case by case basis, like an opt-in
solution, otherwise it may cause problems. Rafael, what do you think,
is this doable?

>
>> In principle, if all devices dependencies were hooked up correctly
>> with device links, we would in principle only need one level of
>> suspend/resume callbacks.
>>
>>>> However, as a simple fix, I would try to add a ->prepare() callback
>>>> and call pm_runtime_get_sync() from it and then in a new corresponding
>>>> ->complete() callback, call pm_runtime_put().
>>>>
>>>> This means that the device will stay runtime resumed until the
>>>> suspend_noirq phase. It would also means the pm_runtime_force_resume()
>>>> will resume the device at resume_noirq phase. Would that work?
>>> Yes, this will work, but it will unnecessarily wake all instances of
>>> exynos5433 cmu and their power domains during the system suspend/resume
>>> cycle, what I would like to avoid.
>> I guess what you are saying is that it's not at every suspend sequence
>> that the client's needs to runtime resume the exynos5433 cmu device -
>> and in those cases when not  needed, runtime resuming it becomes a
>> waste in regards to both time and energy. Right?
>
> Exactly. The other problem is that clock provider has to ensure that
> calling pm_runtime_get_sync() on its device during NOIRQ phase will
> not fail to let clients to properly prepare+enable their clocks.

Okay, thanks for confirming.

>
>> Anyway, I fully agree that this isn't very nice, but unfortunate
>> that's the best I can think of as a simple solution.
>
>> [...]
>>

Kind regards
Uffe
