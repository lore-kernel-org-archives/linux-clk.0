Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:36714 "EHLO
	mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752606AbcC3QAT (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 30 Mar 2016 12:00:19 -0400
MIME-Version: 1.0
In-Reply-To: <1438089585-30103-1-git-send-email-aisheng.dong@freescale.com>
References: <1438089585-30103-1-git-send-email-aisheng.dong@freescale.com>
Date: Wed, 30 Mar 2016 13:00:06 -0300
Message-ID: <CAOMZO5D=veSYdWbjksCk-qik3OnJ2i5Wkv8MrCZnTANibeDqLA@mail.gmail.com>
Subject: Re: [PATCH V3 0/5] clk: support clocks which requires parent clock on
 during operation
From: Fabio Estevam <festevam@gmail.com>
To: Dong Aisheng <aisheng.dong@freescale.com>
Cc: linux-clk@vger.kernel.org,
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

Hi Dong,

On Tue, Jul 28, 2015 at 10:19 AM, Dong Aisheng
<aisheng.dong@freescale.com> wrote:
> This patch series adds support in clock framework for clocks which operations
> requires its parent clock is on.
>
> Such clock type is initially met on Freescale i.MX7D platform that all clocks
> operations, including enable/disable, rate change and re-parent, requires its
> parent clock on. No sure if any other SoC has the similar clock type.
>
> Current clock core can not support such type of clock well.
>
> This patch introduce a new flag CLK_SET_PARENT_ON to handle this special case
> in clock core that enable its parent clock firstly for each operation and disable
> it later after operation complete.
>
> The most special case is for set_parent() operation which requires both parent,
> old one and new one, to be enabled at the same time during the operation.
>
> The patch series is based on for-next branch of Michael's git:
> git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git

Do you plan to resend this series?
