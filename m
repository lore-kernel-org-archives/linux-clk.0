Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add the clock id for CMU_CDREX (DRAM
 Express Controller)
To: Chanwoo Choi <cw00.choi@samsung.com>
References: <1472108238-24309-1-git-send-email-cw00.choi@samsung.com>
 <1472108238-24309-2-git-send-email-cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org,
 kgene@kernel.org, k.kozlowski@samsung.com, chanwoo@kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <0dfc9f01-1cda-a1e2-c1f2-6e119a7c1a84@samsung.com>
Date: Thu, 01 Sep 2016 19:28:37 +0200
MIME-version: 1.0
In-reply-to: <1472108238-24309-2-git-send-email-cw00.choi@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 08/25/2016 08:57 AM, Chanwoo Choi wrote:
> This patch adds the new clock id for CMU_CDRES (DRAM Express Controller)
> geneates the clocks for DRAM and NoC (Network on Chip) bus clock.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Applied with the commit message changed as below, thanks.

commit 9c605fbc299d31b482aefae547d126062c7a8792
Author: Chanwoo Choi <cw00.choi@samsung.com>
Date:   Thu Aug 25 15:57:16 2016 +0900

 dt-bindings: Add clock IDs for the CMU_CDREX (DRAM Express Controller)

 This patch adds missing clock IDs for CMU_CDREX (DRAM Express Controller)
 which generates clocks for DRAM and NoC (Network on Chip) busses.

 Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
 Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
