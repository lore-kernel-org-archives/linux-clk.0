Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx6-14.smtp.antispamcloud.com ([95.211.2.226]:33882 "EHLO
	mx6-14.smtp.antispamcloud.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752343AbbJEICs convert rfc822-to-8bit
	(ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Mon, 5 Oct 2015 04:02:48 -0400
Subject: Re: [PATCH v3] Add driver for the si514 clock generator chip
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1442487891-20477-1-git-send-email-mike.looijmans@topic.nl>
 <1443770129-7757-1-git-send-email-mike.looijmans@topic.nl>
 <20151002191804.GS12338@codeaurora.org>
CC: <linux-clk@vger.kernel.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <56121372.6040109@topic.nl>
Date: Mon, 5 Oct 2015 08:06:42 +0200
MIME-Version: 1.0
In-Reply-To: <20151002191804.GS12338@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

﻿On 02-10-15 21:18, Stephen Boyd wrote:
> On 10/02, Mike Looijmans wrote:
>> This patch adds the driver and devicetree documentation for the
>> Silicon Labs SI514 clock generator chip. This is an I2C controlled
>> oscillator capable of generating clock signals ranging from 100kHz
>> to 250MHz.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>
> Applied to clk-next. We can handle any stuff about assigned rates
> in a follow up patch.
>
> Also, I squashed in this for some cleanup.
>
> diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
> index 779aebcd884b..6af7dce54241 100644
> --- a/drivers/clk/clk-si514.c
> +++ b/drivers/clk/clk-si514.c
> @@ -16,7 +16,6 @@
>    * GNU General Public License for more details.
>    */
>
> -#include <linux/clk.h>

Interesting - I only added this include because of your comment:
"I'd expect some sort of linux/clk.h include here if we're using
clk APIs."

Could you elaborate on that, I'm confused now...

Mike.


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail





