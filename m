Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F3FC433FE
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 13:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236490AbiDHNtH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 09:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232806AbiDHNtG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 09:49:06 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390BA8BF4F
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 06:46:59 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220408134655euoutp0191678a64618ab6093606662fe8d20c0a~j79vJIGuK2698926989euoutp01V
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 13:46:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220408134655euoutp0191678a64618ab6093606662fe8d20c0a~j79vJIGuK2698926989euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1649425615;
        bh=FiUB4SS/xb/JgX1Dl+wFE9MX+oFxjKiZ7UK1zVum6vA=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=SALzeSyw9BBBaFpt5GIrDR3fNOduR+okyqqTvuFGxWd/pQYOQihNuOUsV51hEiyzs
         cLNZ0E/V5Gx0eTQcjvhmHr7tCTz0u//73oVWwSPXx0GEg9ELLCaigN6gvRueOqI6nc
         lhzs2JlcP5Y86CxALF/L5c9YUIvkJG8NHZtBdMkU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220408134655eucas1p190aed9d9bf8ea9a6251efb75337f4df4~j79uw2_Am1537915379eucas1p1n;
        Fri,  8 Apr 2022 13:46:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 60.1B.09887.FCC30526; Fri,  8
        Apr 2022 14:46:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220408134654eucas1p1d1e5669b430569512d2c07a339af3ca0~j79uR_ofx1270912709eucas1p1q;
        Fri,  8 Apr 2022 13:46:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220408134654eusmtrp1cf165dbd0f2cb94e22678574cf996d54~j79uRP4qJ2093320933eusmtrp1r;
        Fri,  8 Apr 2022 13:46:54 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-a4-62503ccfc8ea
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 59.5C.09522.ECC30526; Fri,  8
        Apr 2022 14:46:54 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220408134653eusmtip242d276284706d875a7f106102217ad4c~j79tXhL8P3025930259eusmtip2j;
        Fri,  8 Apr 2022 13:46:53 +0000 (GMT)
Message-ID: <34cc8927-3c63-a85e-1fd1-e72f66ada6de@samsung.com>
Date:   Fri, 8 Apr 2022 15:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220408122542.jymybls42w3uzxpc@houat>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTURTldabToaY4LQg3aDTWJWpkFc0YFcV1QjDKp0rUFkZoLC224NLE
        QAgiraiIJkBFlA8FWaUSROICxVAQAmIqkTUGiIiIUEUR0SrDuPB33jn3vHPuyyMxWaXQm1Rp
        4lmdRqGWE2K8qmGq1adt836lv2VYSo9cKxXQH/qfYbQjvU9IZ39zIrr9+S6669N82nrpEO3s
        qMDpp/ZQ+lXZFdE2MfP1SybOjL0+J2J6WtsI5l2GU8BYiowE09PxiGDSUy0C5rNl8X7yoHhz
        FKtWnWR1fsFHxTF17c1YXPXS0wM5yXgSavQ2IVcSqCBou28kTEhMyqhCBIOWN4gTZNQEgjsT
        Ol74jMD05Lngr8M61S3ihQIEQ6Y0xB8cCMrMSSJuSkIFQ2/V+IyDJHFqOXyq9eFpKTTlDOIc
        XkApofhBMcGNuFOhUDhBczRGeUHX4M3ZLA9qBdgvPsa46zFqTABjjk4hJxBUAJhGTQSHXWcK
        TT5sR7x5CTwYzZ01AHXeFX5Mt4n41jthPKWe4LE7vLdV/uEXQfPVdJwrAZQWfmav4+nT0DFS
        gvF4E/S0fp/tiVGrobzGj6dD4Lw1D+OdbvB6VMo3cIPMqqw/tATSUmX89Eow28r+Zda9eIll
        ILl5zpuY5yxvnrOL+X/uLYQXIS82QR8bzeoDNewpX70iVp+gifaN1MZa0MzHanbaJqpRwXuH
        rxUJSGRFQGJyD4khNkwpk0QpzhhYnfaILkHN6q1oIYnLvSSRqnsKGRWtiGePs2wcq/urCkhX
        7yTBiZpFBaEKl7O/jnn+aMy63GMsT4470/mhJleKh98Mywv6te/64oHyeXcD9gaND6ol+ZFH
        D+ezLcHhNfq3e9xGRlc5B4wZlhBhaYwyPSU5TfXYVhl44pX/wWu3L4TI+27Yq7dsaDo8rZ16
        JyrZveMYcTLR6NLPaOT2Qs8X2x33BiKWrFbfUfsnrL2yrKyhWGrvLFV6h8pV63zS3Pun48Pi
        7qYywqJEtMWmzGJcai1aVUT2cK+P4f6BJ7u7W5QLP261zutIzJmsEwdGPEwZcoT3qo3J0wsq
        jhsahiMO2PsN1vWbdqhKvr6soG4vs/VuLKQn0VBx/c4Vksygxvy8+fU5W+W4PkYRsAbT6RW/
        AZF+34bHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xe7rnbAKSDGb0aVu8nrKWyeLNoyPM
        Fh977rFazPjxj9Hi4ilXi1uf+C0O9UVb/Lu2kcVi/xUvi6vrJrI7cHl8+zqJxeP9jVZ2jzvn
        zrN5vJjwj8lj06pONo871/awefS0bWLy+LxJLoAjSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j4MXTzAU7FCsez2xiaWA8IdXFyMkhIWAicejn
        bfYuRi4OIYGljBIPZkxmhkjISJyc1sAKYQtL/LnWxQZR9J5R4v+EBewgCV4BO4m72z4wdTFy
        cLAIqEh8OqALERaUODnzCQuILSqQJHGpq50RpERYwEtixRcLkDCzgLjErSfzmUBsEQFViSu9
        e5lBxjMLvGeSmHhpBtSuM0wSq5euAzuCTcBQoustyBGcHJxAV3/feZERYpKZRNfWLihbXmL7
        2znMExiFZiG5YxaShbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYKRuO/Zz
        8w7Gea8+6h1iZOJgPMQowcGsJMJbleuTJMSbklhZlVqUH19UmpNafIjRFBgWE5mlRJPzgaki
        ryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qByfaq1q9Lt7w8xWqi
        oxaVRSocYYjJqkoujgnq23ei++Gd1cvNjJQsSq9OvH21VUXDvLTq6gPlH46VF5v4uHr9HEsN
        Ap/PyLsf6hS2ab/rpvYtQf29pYmCYYopFytYtkcse+O3pNvmwbWCA5vKtwn+tcndeOX5Hk+7
        Gs4r5z5e935TpLh8ibTM+7h/tRL8qVrNLrzWoep9GVprCi68WrXjUN9N8e/Gt2q+Swmd3xjp
        0DIhOnv59vlS/ny/c+dPyT6m6ccxs+vDzZfveX1uu28RvLXNMSUjZMuLU/9uLHmRLDKzZ+6s
        UmaJbTz1Iikblkf2vJHw/B9wfvPj0sSuux6uyhMSdTzOhxyV/bXv6+wLSizFGYmGWsxFxYkA
        pOLd/10DAAA=
X-CMS-MailID: 20220408134654eucas1p1d1e5669b430569512d2c07a339af3ca0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220408093618eucas1p27b1e9b34a7439020b052f18dcc178925
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220408093618eucas1p27b1e9b34a7439020b052f18dcc178925
References: <20220408091037.2041955-1-maxime@cerno.tech>
        <20220408091037.2041955-23-maxime@cerno.tech>
        <CGME20220408093618eucas1p27b1e9b34a7439020b052f18dcc178925@eucas1p2.samsung.com>
        <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
        <351cfb4a-7457-d4e1-8317-9ebf2a3167f8@samsung.com>
        <20220408122542.jymybls42w3uzxpc@houat>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

On 08.04.2022 14:25, Maxime Ripard wrote:
> On Fri, Apr 08, 2022 at 02:17:55PM +0200, Marek Szyprowski wrote:
>> On 08.04.2022 11:18, Jerome Brunet wrote:
>>> On Fri 08 Apr 2022 at 11:10, Maxime Ripard <maxime@cerno.tech> wrote:
>>>
>>>> A rate of 0 for a clock is considered an error, as evidenced by the
>>>> documentation of clk_get_rate() and the code of clk_get_rate() and
>>>> clk_core_get_rate_nolock().
>>>>
>>>> The main source of that error is if the clock is supposed to have a
>>>> parent but is orphan at the moment of the call. This is likely to be
>>>> transient and solved later in the life of the system as more clocks are
>>>> registered.
>>>>
>>>> The corollary is thus that if a clock is not an orphan, has a parent that
>>>> has a rate (so is not an orphan itself either) but returns a rate of 0,
>>>> something is wrong in the driver. Let's return an error in such a case.
>>>>
>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>> ---
>>>>    drivers/clk/clk.c | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>>>> index 8bbb6adeeead..e8c55678da85 100644
>>>> --- a/drivers/clk/clk.c
>>>> +++ b/drivers/clk/clk.c
>>>> @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *core)
>>>>    		rate = 0;
>>>>    	core->rate = core->req_rate = rate;
>>>>    
>>>> +	/*
>>>> +	 * If we're not an orphan clock and our parent has a rate, then
>>>> +	 * if our rate is 0, something is badly broken in recalc_rate.
>>>> +	 */
>>>> +	if (!core->orphan && (parent && parent->rate) && !core->rate) {
>>>> +		ret = -EINVAL;
>>>> +		pr_warn("%s: recalc_rate returned a null rate\n", core->name);
>>>> +		goto out;
>>>> +	}
>>>> +
>>> As hinted in the cover letter, I don't really agree with that.
>>>
>>> There are situations where we can't compute the rate. Getting invalid
>>> value in the register is one reason.
>>>
>>> You mentioned the PLLs of the Amlogic SoCs (it is not limited to g12 - all
>>> SoCs would be affected):
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/clk-pll.c#n82
>>> Yes, PLL that have not been previously used (by the ROMCode or the
>>> bootloader) tend to have the value of the divider set to 0 which in
>>> invalid as it would result in a division by zero.
>>>
>>> I don't think this is a bug. It is just what the HW is, an unlocked,
>>> uninitialized PLL. There is no problem here and the PLL can remain like
>>> that until it is needed.
>>>
>>> IMO, whenever possible we should not put default values in the clocks
>>> which is why I chose to leave it like that.
>>>
>>> The PLL being unlocked, it has no rate. It is not set to have any rate.
>>> IMO a returning a rate of 0 is valid here.
>> I agree that it should be possible to register so called unconfigured
>> clock, which doesn't have any rate set yet. It might be used later by
>> some drivers, which will do the whole initialization (set rate and or
>> parents).
> I think we should differentiate between the clock being fine from the
> CCF point of view, and from the device point of view. I'm arguing about
> the former, but the latter should definitely be up to other drivers to
> set it up so that their hardware work.
>
> But in both cases, we should return something valid under the CCF
> semantics.
>
>> I also wonder why the above patch triggers warning on the Amlogic
>> Socs, while on Exynos I still have some unused clocks with 0 rate
>> registered properly.
> Most likely the clocks that return a rate of 0 are orphans (ie, their
> parent isn't registered yet).
Right.
> We can't expect all the parents to be registered before their children,
> so this is fine, and that patch doesn't break it.
>
> Did you test this series for exynos and meson then? Could you give your
> tested-by if you did? :)

Yes, I've tested the whole set. All my Exynos based test boards work 
fine. All my Meson based boards fails to boot due to this patch, thus my 
comment. Feel free to add to all but the last patch:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

