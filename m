Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65667C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 21 Mar 2022 19:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347336AbiCUTpQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Mar 2022 15:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344392AbiCUTpM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 15:45:12 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB4F72E10;
        Mon, 21 Mar 2022 12:43:45 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 17E448141D;
        Mon, 21 Mar 2022 20:43:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1647891823;
        bh=D2IpHeVAxnkZMDlNfPujRJHA+Lbh55IZq2hGC3wCKQ4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DEMr1xlMHtuLMxyVCkXzx1i9I2bynmqnPzEAoWelrvtD+jzHmgYzFIvfBgB4Uq54t
         Mbkq20IloKSZsYTF5oEtD0euoPZ+dzdaS5LEOXBcEcr/sl4ThqkMAlI5Gea82euXN0
         BudO/SWhlN0fW5BT/t8rZ/GLE7tzxPDKi2GAmzQRISI8gCZu8E7P2XzOVeHfTJbvig
         Cz4w0AJARo39VaZqKoB5HreuP8PAQ11sjCBHh+Q5v5qSyU1FfbTyE06Ahp7LkDGYFw
         +GOj/zPZg2sP1IGpTZgXectXWtb/MeVBiSH4r+9pgZfzuvm767bXwSGNCZuqbydAnP
         TzIV2U3hInRSg==
Message-ID: <0ad64a7a-408a-1b11-0775-bd9bc71955e3@denx.de>
Date:   Mon, 21 Mar 2022 20:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/3] clk: Make __clk_hw_register_fixed_factor
 non-static
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220226040723.143705-1-marex@denx.de>
 <20220226040723.143705-2-marex@denx.de>
 <20220318210356.55D1EC340E8@smtp.kernel.org>
 <5f97232b-579f-bccf-c603-c263aea143b6@denx.de>
 <20220321192650.E4409C340E8@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220321192650.E4409C340E8@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/21/22 20:26, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-03-20 06:23:14)
>> On 3/18/22 22:03, Stephen Boyd wrote:
>>> Quoting Marek Vasut (2022-02-25 20:07:22)
>>>> Access to the full parameters of __clk_hw_register_fixed_factor()
>>>> is useful in case a driver is registering fixed clock with only
>>>> single parent, in which case the driver should set parent_name to
>>>> NULL and parent_index to 0, and access to this function permits it
>>>> to do just that.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>>> Cc: devicetree@vger.kernel.org
>>>> To: linux-clk@vger.kernel.org
>>>> ---
>>>> V2: - New patch
>>>> V3: - No change
>>>
>>> This isn't exported. Given that we don't typically export an internal
>>> function (hence the double underscore) I'm going to change this to be a
>>> new function. See the attached patch.
>>
>> I can confirm the change works and looks OK.
>>
>> Do you want me to send a V4 or will you squash it into these patches
>> yourself when applying?
> 
> No need I fixed it up and pushed it out.

Thank you
