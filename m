Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6561CC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 12 Mar 2022 10:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbiCLK2E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Mar 2022 05:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbiCLK2E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2022 05:28:04 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754FA1E694B;
        Sat, 12 Mar 2022 02:26:59 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D581A83A70;
        Sat, 12 Mar 2022 11:26:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1647080818;
        bh=Db+l2H6kiQ2NtL4dh9rRKzJIRIoaxpn061CiZrgF53w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=BEnlu8u6Fggy9NWxnv32kypwaHU/H79R1UEM7LolTgDOsXrCDJlz7WsqvdXTLtIDc
         aFCBfw/kjHwEHCW9kVYsLw66kE3oTxRg1A67vXs/xY/u3REhE7/f4k+lJOXlYBuH4X
         SgVeyCYuodV3s9qZidKhhRALjOOQ4mZ9SNdUi5BeQJLEZdtIuPLobhjzAHjE9Hw9rS
         +5nkN5UreEYIqSx5d1enyYdael0sgVYhAKqjjh2axN425M8/kHlXI8lo+q6FiwsHiH
         PyUiaBXA1Jr2QMoAhXNsmMdEEUvTR+dDli417U16+PipmyzI6u+fLAwNY82Zu0KzRf
         v0xI3449zNbFA==
Message-ID: <37eb2704-6262-18a8-6182-dcf9e7207ffe@denx.de>
Date:   Sat, 12 Mar 2022 11:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 3/3] clk: rs9: Add Renesas 9-series PCIe clock
 generator driver
Content-Language: en-US
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
References: <20220226040723.143705-1-marex@denx.de>
 <20220226040723.143705-3-marex@denx.de>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220226040723.143705-3-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/26/22 05:07, Marek Vasut wrote:
> Add driver for Renesas 9-series PCIe clock generators. This driver
> is designed to support 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ series I2C
> PCIe clock generators, currently the only tested and supported chip
> is 9FGV0241.
> 
> The driver is capable of configuring per-chip spread spectrum mode
> and output amplitude, as well as per-output slew rate.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-clk@vger.kernel.org
> ---
> V2: - Drop unused includes
>      - Use REGCACHE_FLAT for smaller reg file
>      - Move of_node_put() in rs9_get_output_config() a bit higher up
>      - Drop forward declaration of clk_rs9_of_match
>      - Use device_get_match_data() instead of of_device_get_match_data()
>        and check for its return value, verify it is non-NULL
>      - Use newly available __clk_hw_register_fixed_factor() with
>        parent_data index=0 and drop of_clk_get_parent_name() altogether
> V3: - Rename renesas,out-amplitude to renesas,out-amplitude-microvolt

Are there any news on this series ?
