Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41399 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932293AbbLVTMM (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 22 Dec 2015 14:12:12 -0500
Subject: Re: [GIT PULL] clk/samsung updates for v4.5
To: Mike Turquette <mturquette@baylibre.com>
References: <5671A456.9030203@samsung.com>
 <20151222183816.GC6596@quark.deferred.io>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <5679A00B.2040806@samsung.com>
Date: Tue, 22 Dec 2015 20:10:03 +0100
MIME-version: 1.0
In-reply-to: <20151222183816.GC6596@quark.deferred.io>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Mike,

On 22/12/15 19:38, Mike Turquette wrote:
> Pulled.
> 
> Was it necessary to base on -rc5? That required me to update my tree
> from -rc1.
> 
> This is not difficult, but it is a bit annoying when it is not strictly
> necessary just to take one PR.

Sorry about that, originally I've put some of those patches in
a branch for 4.4 fixes PR and then reused it for this one,
forgetting to change the base to the one used in clk tree.

-- 
Regards,
Sylwester
