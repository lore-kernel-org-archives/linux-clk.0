Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E3CC0015E
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 18:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239029AbjHOSZk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 14:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239138AbjHOSZW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 14:25:22 -0400
Received: from out-28.mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF501BEB
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 11:25:20 -0700 (PDT)
Message-ID: <51cc24cb-13d7-7352-db25-bb5f10baa830@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1692123918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BmnrvXvdD8lgpuFR05ob4D/kjINcLJM401vTSVLXNrM=;
        b=fRteu83GGLzHE57G2311l51six8Q6p2BxtX/kymFzDXHnCHF1u6j9gAVhn25BW4pFsySlP
        y0qqD0gp3iqhCN64N/S/StnIjr3lkQpxEr2a8OdBUaO28dbKBDCT6FFJVgLocaE7ON10r8
        EVGMAAFJcp2OkdbE/CyN1dTXIJOYe6A=
Date:   Tue, 15 Aug 2023 19:25:12 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 4/9] dpll: netlink: Add DPLL framework base
 functions
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org, Jiri Pirko <jiri@nvidia.com>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
 <20230811200340.577359-5-vadim.fedorenko@linux.dev>
 <20230814202441.349586b4@kernel.org>
 <d5c30de7-df89-18dd-3ad8-a5d99c1e7108@linux.dev>
 <20230815095519.76d06274@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20230815095519.76d06274@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/08/2023 17:55, Jakub Kicinski wrote:
> On Tue, 15 Aug 2023 16:18:16 +0100 Vadim Fedorenko wrote:
>> On 15/08/2023 04:24, Jakub Kicinski wrote:
>>> On Fri, 11 Aug 2023 21:03:35 +0100 Vadim Fedorenko wrote:
>>>> +	xa_for_each(&pin->dpll_refs, i, ref) {
>>>> +		const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
>>>> +		struct dpll_device *dpll = ref->dpll;
>>>> +
>>>> +		if (!ops->frequency_set)
>>>> +			return -EOPNOTSUPP;
>>>> +		ret = ops->frequency_set(pin, dpll_pin_on_dpll_priv(dpll, pin),
>>>> +					 dpll, dpll_priv(dpll), freq, extack);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +		__dpll_pin_change_ntf(pin);
>>>> +	}
>>>
>>> only one freq is reported in get, AFAICT, so why send a notification
>>> after each ref is updated?
>>
>> The pin can be technically connected to several DPLLs and app may watch
>> for the specific DPLL messages only. We would like to inform all users
>> on any DPLL which has this pin connected to.
> 
> How does this end up looking in the notifications?
> __dpll_pin_change_ntf() only takes the pin object, from a quick read
> it seems like it will generate the same notification multiple times.

Oops... yeah, will move the notification outside of the loop.
