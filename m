Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH v4 0/3] clk: Add support for IDT 5P49V5935
To: Stephen Boyd <sboyd@codeaurora.org>,
 Alexey Firago <alexey_firago@mentor.com>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
 <20170407194013.GD7065@codeaurora.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, geert@linux-m68k.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a0f2f6db-cbcb-084b-0533-216acd1b2d48@gmail.com>
Date: Fri, 7 Apr 2017 21:55:02 +0200
MIME-Version: 1.0
In-Reply-To: <20170407194013.GD7065@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 04/07/2017 09:40 PM, Stephen Boyd wrote:
> On 04/07, Alexey Firago wrote:
>> This series adds support for IDT VersaClock 5P49V5935 programmable clock
>> generator to the existing clk-versaclock5 driver. Driver is also updated to
>> simplify addition of support for more VersaClock 5 models. 
>>
>> Patches were verified on Avnet UltraZed-EG board with IO Carrier Card.
>>
>> Changes in V2:
>> - Introduce vc5_chip_info structure describing chip features
>> - Set vc5_chip_info for the supported chips using clk_vc5_of_match[].data
>> - Add 5P49V5935 support using vc5_chip_info approach
>> - Fix idx comparison in vc5_of_clk_get ('>' to '>=')
>>
>> Changes in V3:
>> - Change type of clk_fod_cnt and clk_out_cnt to unsigned int
>> - Add missed 'const' to vc5_chip_info instance declaration
>> - Use of_device_get_match_data() to initialize vc5_chip_info on probe 
>>
>> Changes in V4:
>> - Add 'const' to vc5_chip_info.flags
> 
> Could any Reviewed-by tags get carried over? I'll wait for Marek
> to resend them I guess.
> 
I'll review the patches ASAP

-- 
Best regards,
Marek Vasut
