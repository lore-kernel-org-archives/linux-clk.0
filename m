Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40943 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756308AbcEFRcs (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 6 May 2016 13:32:48 -0400
Date: Fri, 6 May 2016 10:32:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: clk-lpc18xx-creg - scheduling while atomic
Message-ID: <20160506173246.GT3492@codeaurora.org>
References: <CAGhQ9VxsyWq=GK5RnCzspV3=6NbDNH6pJhf3uZqdNPCsP9VzmQ@mail.gmail.com>
 <572B62AC.1020205@mleia.com>
 <CAGhQ9VyBcyRZSRowzpiAWnUBywiu_fDMEYWOXYEykDgLWnU0mA@mail.gmail.com>
 <20160506171748.GS3492@codeaurora.org>
 <CAGhQ9VzWdpj-jdTEXxSEckpN_iZLPQU0_v8jcXh18YLXBkpkDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAGhQ9VzWdpj-jdTEXxSEckpN_iZLPQU0_v8jcXh18YLXBkpkDA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/06, Joachim Eastwood wrote:
> 
> Thanks for spotting the bug in lpc18xx-creg. Are you going to apply it directly?

Yes I'll fix it up today, thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
