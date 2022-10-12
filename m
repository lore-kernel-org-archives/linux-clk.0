Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E60CC4332F
	for <linux-clk@archiver.kernel.org>; Wed, 12 Oct 2022 20:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiJLUQA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Oct 2022 16:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiJLUP7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2022 16:15:59 -0400
Received: from novek.ru (unknown [213.148.174.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F7738472;
        Wed, 12 Oct 2022 13:15:57 -0700 (PDT)
Received: from [192.168.0.18] (unknown [37.228.234.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by novek.ru (Postfix) with ESMTPSA id 4DFAD504E89;
        Wed, 12 Oct 2022 23:11:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 novek.ru 4DFAD504E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novek.ru; s=mail;
        t=1665605517; bh=Q8XExt+JG4DuTaK4NlsBXX2YXbzBn/XJwDdhp/0zNoI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=bqcUCbVokfcn7DNO8Fo7UQvZe7wYKQIejR1VBwOkqWpybp5HRO4zYE0V7qecxNPz9
         OGEyi42+UAWjrXEbUbbcE4XV20sYS7O2NBNp9S8eeUkJjTrkuFaCRYyEnEC+vEdjli
         lo1UqdYgqROqSOdJO/Ja2XQjsvAB3KsNZLjhjxsE=
Message-ID: <e076fa5c-93ec-9bdb-f490-46503d96a10f@novek.ru>
Date:   Wed, 12 Oct 2022 21:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v3 1/6] dpll: Add DPLL framework base functions
Content-Language: en-US
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Vadim Fedorenko <vadfed@fb.com>
References: <20221010011804.23716-1-vfedorenko@novek.ru>
 <20221010011804.23716-2-vfedorenko@novek.ru> <Y0abOsYjGapUTJHv@nanopsycho>
From:   Vadim Fedorenko <vfedorenko@novek.ru>
In-Reply-To: <Y0abOsYjGapUTJHv@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12.10.2022 11:47, Jiri Pirko wrote:
> Mon, Oct 10, 2022 at 03:17:59AM CEST, vfedorenko@novek.ru wrote:
>> From: Vadim Fedorenko <vadfed@fb.com>
>>
>> DPLL framework is used to represent and configure DPLL devices
>> in systems. Each device that has DPLL and can configure sources
>> and outputs can use this framework.
>>
>> Signed-off-by: Vadim Fedorenko <vadfed@fb.com>
>> Co-developed-by: Jakub Kicinski <kuba@kernel.org>
>> Co-developed-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> 
> 
> [...]
> 
> 
>> +struct dpll_device *dpll_device_alloc(struct dpll_device_ops *ops, const char *name,
>> +				      int sources_count, int outputs_count, void *priv)
> 
> Having constant array of "pins" would not work for SyncE. For example in
> mlxsw driver, netdevs can appear and disappear within the device
> lifetime (for example port splits, linecard provision). We need to
> register/unregister pins dynamically.
> 
Yes, I agree, and we are working to implement pin object with dynamic 
attach/detach or reg/unreg functions.
