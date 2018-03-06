Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61902 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753792AbeCFQFq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Mar 2018 11:05:46 -0500
Subject: Re: [PATCH 1/6] soc: samsung: pm_domains: Add blacklisting clock
 handling
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <ff4b8d50-8a08-442c-b289-9c22f01892ff@samsung.com>
Date: Tue, 06 Mar 2018 17:05:38 +0100
MIME-version: 1.0
In-reply-to: <CAJKOXPftSvug8J_zMO0mmGWpFLHgpb4no4q2t=tW6Qva0fd0qg@mail.gmail.com>
Content-type: text/plain; charset="utf-8"
References: <CGME20180221101533eucas1p234b1801844ce8fac633377d129323422@eucas1p2.samsung.com>
        <20180221101527.25554-1-m.szyprowski@samsung.com>
        <20180221101527.25554-2-m.szyprowski@samsung.com>
        <CAJKOXPftSvug8J_zMO0mmGWpFLHgpb4no4q2t=tW6Qva0fd0qg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 02/22/2018 11:54 AM, Krzysztof Kozlowski wrote:
> On Wed, Feb 21, 2018 at 11:15 AM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Handling of clock reparenting will be move to clock controller driver, so
>> add possibility to blacklist clock handling on systems, where the clock
>> controller already does all needed operations. This is needed to avoid
>> potential deadlock on clock reparenting during power domain on/off
>> procedure.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/soc/samsung/pm_domains.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Feel free to take it through samsung-clk tree. Just in case of
> possible conflicts - could you put it on separate branch please?

OK, it's applied on a separate branch now, please let me know when
you need a signed tag.

-- 
Thanks,
Sylwester
