Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:51747 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729205AbeIYU0w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Sep 2018 16:26:52 -0400
Received: by mail-it1-f194.google.com with SMTP id e14-v6so15607973itf.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Sep 2018 07:19:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4341860.rETXoYQeSX@aspire.rjw.lan>
References: <CGME20180919121357eucas1p19717351c40697483d3bf467c55e46f51@eucas1p1.samsung.com>
 <20180920134228eucas1p2f69cf23d93d34884c6703a8a2c4d4cd1~WH33wZYnv3005330053eucas1p2q@eucas1p2.samsung.com>
 <CAPDyKFok_Fc=9EDOvKByyuOYhHbejXKRT9+a+nRDEJ_YAjP2Aw@mail.gmail.com> <4341860.rETXoYQeSX@aspire.rjw.lan>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 25 Sep 2018 16:18:27 +0200
Message-ID: <CAPDyKFoprL3t3G-8MrRZokzmXcyftpGhF1Vo5ct8EtOMzM__yQ@mail.gmail.com>
Subject: Re: [RFC/PATCH] clk: samsung: exynos5433: Fix NOIRQ suspend/resume support
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

[...]

>> >> However, as a simple fix, I would try to add a ->prepare() callback
>> >> and call pm_runtime_get_sync() from it and then in a new corresponding
>> >> ->complete() callback, call pm_runtime_put().
>> >>
>> >> This means that the device will stay runtime resumed until the
>> >> suspend_noirq phase. It would also means the pm_runtime_force_resume()
>> >> will resume the device at resume_noirq phase. Would that work?
>> >
>> > Yes, this will work, but it will unnecessarily wake all instances of
>> > exynos5433 cmu and their power domains during the system suspend/resume
>> > cycle, what I would like to avoid.
>>
>> I guess what you are saying is that it's not at every suspend sequence
>> that the client's needs to runtime resume the exynos5433 cmu device -
>> and in those cases when not  needed, runtime resuming it becomes a
>> waste in regards to both time and energy. Right?
>>
>> Anyway, I fully agree that this isn't very nice, but unfortunate
>> that's the best I can think of as a simple solution.
>
> Resuming in ->prepare() is a bit wasteful, because they are run sequentially,
> so the times of all of the resumes add up.  It is slightly more efficient to
> do it in ->suspend() in general.

Good point!

>
> However, in this particular case, is there any reason why the clients cannot
> resume their providers in ->suspend()?  They also might drop references to
> them on the way out, in ->resume() to balance the usage counters.

I think the problem is that the clients don't know their providers. If
they did, I rather think using device links should be the preferred
solution.

To make a client aware of its providers, for the general case, we
would need to invent some DT bindings to describe the dependencies.

Kind regards
Uffe
