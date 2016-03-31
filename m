Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qg0-f67.google.com ([209.85.192.67]:33778 "EHLO
	mail-qg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753060AbcCaNvi (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 31 Mar 2016 09:51:38 -0400
MIME-Version: 1.0
In-Reply-To: <CAOMZO5D=veSYdWbjksCk-qik3OnJ2i5Wkv8MrCZnTANibeDqLA@mail.gmail.com>
References: <1438089585-30103-1-git-send-email-aisheng.dong@freescale.com>
	<CAOMZO5D=veSYdWbjksCk-qik3OnJ2i5Wkv8MrCZnTANibeDqLA@mail.gmail.com>
Date: Thu, 31 Mar 2016 21:51:37 +0800
Message-ID: <CAA+hA=Rfu58OXOFqxFK0CTwBXWPwzjM2n_52rdPbZL83YmpYRQ@mail.gmail.com>
Subject: Re: [PATCH V3 0/5] clk: support clocks which requires parent clock on
 during operation
From: Dong Aisheng <dongas86@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Dong Aisheng <aisheng.dong@freescale.com>,
	linux-clk@vger.kernel.org,
	"Ranjani.Vaidyanathan@freescale.com"
	<Ranjani.Vaidyanathan@freescale.com>,
	Li Frank-B20596 <b20596@freescale.com>,
	Mike Turquette <mturquette@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Jason Liu <r64343@freescale.com>,
	Anson Huang <b20788@freescale.com>,
	Dong Aisheng <b29396@freescale.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Fabio,

On Thu, Mar 31, 2016 at 12:00 AM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Dong,
>
> On Tue, Jul 28, 2015 at 10:19 AM, Dong Aisheng
> <aisheng.dong@freescale.com> wrote:
>> This patch series adds support in clock framework for clocks which operations
>> requires its parent clock is on.
>>
>> Such clock type is initially met on Freescale i.MX7D platform that all clocks
>> operations, including enable/disable, rate change and re-parent, requires its
>> parent clock on. No sure if any other SoC has the similar clock type.
>>
>> Current clock core can not support such type of clock well.
>>
>> This patch introduce a new flag CLK_SET_PARENT_ON to handle this special case
>> in clock core that enable its parent clock firstly for each operation and disable
>> it later after operation complete.
>>
>> The most special case is for set_parent() operation which requires both parent,
>> old one and new one, to be enabled at the same time during the operation.
>>
>> The patch series is based on for-next branch of Michael's git:
>> git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
>
> Do you plan to resend this series?

It is in my TODO list.
I'm currently busy with some other items.
Will be able to do it in a few days.

Regards
Dong Aisheng

> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
