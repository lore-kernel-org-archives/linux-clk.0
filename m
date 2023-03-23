Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB4BC6FD1C
	for <linux-clk@archiver.kernel.org>; Thu, 23 Mar 2023 18:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjCWSAY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Mar 2023 14:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCWSAX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Mar 2023 14:00:23 -0400
Received: from out-12.mta1.migadu.com (out-12.mta1.migadu.com [IPv6:2001:41d0:203:375::c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C484EC7A
        for <linux-clk@vger.kernel.org>; Thu, 23 Mar 2023 11:00:22 -0700 (PDT)
Message-ID: <74312436-9219-b810-a4e6-41dc7dba1b01@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1679594420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q2w/GvpgKsDWKHZy/ga0YBGnoNgmGp9Is1eChRY5q6A=;
        b=LPWQbfV2gr5mqJ4PhEildk1NnllTGVMSsLLZgy61A3Vwru2pM6/feN2tRn++xFrmFqfnfK
        e4ImqcYXkbS4hYanoIQWvVeiSmZF0pspRo4TUaxAhToogG9i1UgP1x+n7ewNd2NOxBFx00
        Q2yz9tjAG4EFlQjSJKMLCzw5jl8Jutg=
Date:   Thu, 23 Mar 2023 18:00:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH RFC v6 0/6] Create common DPLL/clock configuration API
Content-Language: en-US
To:     Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20230312022807.278528-1-vadfed@meta.com>
 <ZBw2HlGePj7J5GCX@nanopsycho>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ZBw2HlGePj7J5GCX@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/03/2023 11:21, Jiri Pirko wrote:
> Sun, Mar 12, 2023 at 03:28:01AM CET, vadfed@meta.com wrote:
>> Implement common API for clock/DPLL configuration and status reporting.
>> The API utilises netlink interface as transport for commands and event
>> notifications. This API aim to extend current pin configuration and
>> make it flexible and easy to cover special configurations.
>>
>> v5 -> v6:
>> * rework pin part to better fit shared pins use cases
>> * add YAML spec to easy generate user-space apps
>> * simple implementation in ptp_ocp is back again
> 
> 
> Vadim, Arkadiusz.
> 
> I have couple of patches on top of this one and mlx5 implementation.
> I would like to send it to you until Sunday. Could you include those to
> the next rfc?
> 
> I will not review this version more now. Lets do the changes, I will
> continue with the review on the next version of rfc.
> 
> Thanks!

Hi Jiri!

I'm going to spend Friday and weekend polishing the series to address as 
much comments as I can and publish v7 next week. You can send your 
patches prepared on top of github version, that would be the best way to 
have them ready for the next round.

Thanks,
Vadim
