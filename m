Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Subject: Re: [PATCH] clk: bcm: Make COMMON_CLK_IPROC into a library
To: Scott Branden <scott.branden@broadcom.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <20161123224159.9988-1-sboyd@codeaurora.org>
 <d7938d3a-39bb-193e-d792-369786cdc54d@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <ray.jui@broadcom.com>,
 Jon Mason <jonmason@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7b05e961-5a30-e690-bce0-4e8df484d42b@gmail.com>
Date: Wed, 23 Nov 2016 15:01:20 -0800
MIME-Version: 1.0
In-Reply-To: <d7938d3a-39bb-193e-d792-369786cdc54d@broadcom.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Le 23/11/2016 à 14:55, Scott Branden a écrit :
>>  config COMMON_CLK_IPROC
>> -    bool "Broadcom iProc clock support"
>> -    depends on ARCH_BCM_IPROC || ARCH_BCM_63XX || COMPILE_TEST
>> -    depends on COMMON_CLK
> I think the depends on COMMON_CLK needs to remain?

That's not necessary; the options are not visible if COMMON_CLK is not
already defined, see drivers/clk/Kconfig:

menu "Common Clock Framework"
        depends on COMMON_CLK

...
source "drivers/clk/bcm/Kconfig"

endmenu.
-- 
Florian
