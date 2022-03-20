Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3EAC433EF
	for <linux-clk@archiver.kernel.org>; Sun, 20 Mar 2022 13:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237391AbiCTNYm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Mar 2022 09:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245157AbiCTNYl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Mar 2022 09:24:41 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D063ED33;
        Sun, 20 Mar 2022 06:23:17 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F2562836A9;
        Sun, 20 Mar 2022 14:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1647782595;
        bh=54w8kSGD8O4Mg2N20vQfaHgu3zTtCAhOtmYc/RXD0uU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=iK843SEaMf3mLrx1X3rfsU1U8EPe0CjrhI+Ysm337C5QlovTpUfCHStd41rutJll0
         jktMjk/8f+BriX6EB1NkNW9xQVR42s3bPSzADePK/j+OyhN1g0f7tz+h4gLNhhEdII
         Jw81MJN4c7ubuv47w8q87u9tpGx6QRybi4Sa82zetvXYMNaIPESWXlZdh7YbpVg8Gk
         i8VZlJMfV/S2fm3idtQ4M4TpwYLGVkHTQ9RVP41zfCQIFH8rEiORCTXmdEK4FL5RPD
         k+SdIRih6fuHR2dag9Jaq2twMuacnHbvf+vrXd4LE1mLQKZnI08ZIXiEVzsEz04YbP
         zdaFBp+nI31sg==
Message-ID: <5f97232b-579f-bccf-c603-c263aea143b6@denx.de>
Date:   Sun, 20 Mar 2022 14:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 2/3] clk: Make __clk_hw_register_fixed_factor
 non-static
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220226040723.143705-1-marex@denx.de>
 <20220226040723.143705-2-marex@denx.de>
 <20220318210356.55D1EC340E8@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220318210356.55D1EC340E8@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/18/22 22:03, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-02-25 20:07:22)
>> Access to the full parameters of __clk_hw_register_fixed_factor()
>> is useful in case a driver is registering fixed clock with only
>> single parent, in which case the driver should set parent_name to
>> NULL and parent_index to 0, and access to this function permits it
>> to do just that.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> To: linux-clk@vger.kernel.org
>> ---
>> V2: - New patch
>> V3: - No change
> 
> This isn't exported. Given that we don't typically export an internal
> function (hence the double underscore) I'm going to change this to be a
> new function. See the attached patch.

I can confirm the change works and looks OK.

Do you want me to send a V4 or will you squash it into these patches 
yourself when applying?
