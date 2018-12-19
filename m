Return-Path: <SRS0=x0k0=O4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092E1C43387
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 06:24:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6CC9217D6
	for <linux-clk@archiver.kernel.org>; Wed, 19 Dec 2018 06:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="aHDlkJni"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbeLSGYP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Dec 2018 01:24:15 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17275 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbeLSGYP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Dec 2018 01:24:15 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c19e4050000>; Tue, 18 Dec 2018 22:24:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Dec 2018 22:24:14 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Dec 2018 22:24:14 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 19 Dec
 2018 06:24:12 +0000
Subject: Re: [PATCH V3 11/20] cpufreq: tegra124: do not handle the CPU rail
To:     "Rafael J. Wysocki" <rafael@kernel.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-12-josephl@nvidia.com>
 <CAJZ5v0h0n2AXERvXFX_dQWMUw_89ap_LgB6dUK0ThJgZ+unkkQ@mail.gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <312ac6e6-0480-b638-a26b-311013929c2c@nvidia.com>
Date:   Wed, 19 Dec 2018 14:24:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0h0n2AXERvXFX_dQWMUw_89ap_LgB6dUK0ThJgZ+unkkQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1545200645; bh=BiTYUVA34jkJLRtNX4un/pBfxSssEgZGF8EyExGhoVw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=aHDlkJnieDuIkwJ9qagH6NB5QiCP30YcepD36J7sBHXeB8PUVGt4TNX0egTi3GxSn
         qZHweyBYit350zwNJjllL+iTVwhUlOTA9KrMEooLkzY7he+2hH8QwTXxH7vM8hnrAw
         PY+c5Bte52UfV9uKy+Khd/lxYhKwSAcdYLPL8sQw9mzfDp3DgpNPqykN7fsGNFaJJa
         +kCt+CPwYTFTK4vXnFwnhPiHCohFjO33kuoNyvswm0RNbG/UKbAwBTyJ9biOOQKPEc
         IM8bYAmtGo+StZ0uPkMvwxd9XWYbcJ7fuwHXyPzqr8LAqoEJz8+X1HjiYn6L49Hd7o
         Ai/48n/rk5A8g==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/18/18 5:37 PM, Rafael J. Wysocki wrote:
> On Tue, Dec 18, 2018 at 10:13 AM Joseph Lo <josephl@nvidia.com> wrote:
>>
>> The Tegra124 cpufreq driver has no information to handle the Vdd-CPU
>> rail. So this driver shouldn't handle for the CPU clock switching from
>> DFLL to other PLL clocks. It was designed to work on DFLL clock only,
>> which handle the frequency/voltage scaling in the background.
>>
>> This patch removes the driver dependency of the CPU rail, as well as not
>> allow it to be built as a module and remove the removal function. So it
>> can keep working on DFLL clock.
>>
>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: linux-pm@vger.kernel.org
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> I'm assuming that this entire series will go in via arm-soc, so I
> won't be picking up the cpufreq patches from it.
> 
> Please let me know if that is not what you want.
> 
> Thanks,
> Rafael
> 

Hi Rafael,

Thanks, will check with Thierry.

Joseph
