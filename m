Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38129 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894AbcAUAUt (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2016 19:20:49 -0500
Subject: Re: [PATCH v3 1/4] clk: s2mps11: merge two for loops in one
To: Andi Shyti <andi.shyti@samsung.com>,
	linux-samsung-soc@vger.kernel.org
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
 <1453284864-8082-2-git-send-email-andi.shyti@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Andi Shyti <andi@etezian.org>,
	Yadwinder Singh Brar <yadi.brar01@gmail.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <56A02460.2000402@samsung.com>
Date: Thu, 21 Jan 2016 09:20:48 +0900
MIME-version: 1.0
In-reply-to: <1453284864-8082-2-git-send-email-andi.shyti@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 20.01.2016 19:14, Andi Shyti wrote:
> the driver already loops once, there is no reason to loop again

I pointed this at v2:
s/the/The/

Apart from that:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

