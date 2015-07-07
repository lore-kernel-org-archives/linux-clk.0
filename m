Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:33553 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753472AbbGGFBX (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jul 2015 01:01:23 -0400
Received: by laar3 with SMTP id r3so180949022laa.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2015 22:01:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150622230456.GJ22132@codeaurora.org>
References: <1434785223.6159.3.camel@ingics.com>
	<20150622230456.GJ22132@codeaurora.org>
Date: Tue, 7 Jul 2015 13:01:21 +0800
Message-ID: <CAFRkauDqtytL9xq_+pjJ3WWdYnZoSk86uMJozmOe9+Mrr7QX7w@mail.gmail.com>
Subject: Re: [PATCH] clk: h8300: Fix signness bug
From: Axel Lin <axel.lin@ingics.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	uclinux-h8-devel@lists.sourceforge.jp,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

2015-06-23 7:04 GMT+08:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 06/20, Axel Lin wrote:
>> of_clk_get_parent_count() may return negative error code, so num_parents
>> needs to be int rather than unsigned int.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>
> Hmph. I don't recall being Cced on this clk driver and it looks
> to be in linux-next via h8300 architecture tree. This patch
> should probably be squashed into the patch that introduced the
> problem.
Hi Stephen,
This driver is already in Linus' tree.
So would you pick up this patch?

Thanks,
Axel
