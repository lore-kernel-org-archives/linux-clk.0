Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:51431 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754660AbcCCKer (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 3 Mar 2016 05:34:47 -0500
Date: Thu, 3 Mar 2016 12:34:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 21/41] clk: x86: Remove CLK_IS_ROOT
Message-ID: <20160303103442.GO1794@lahna.fi.intel.com>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-22-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456858826-28541-22-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 01, 2016 at 11:00:06AM -0800, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
