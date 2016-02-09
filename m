Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
Date: Tue, 9 Feb 2016 12:52:42 +0530
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] devm: add helper devm_add_action_or_reset()
Message-ID: <20160209072242.GA10602@sudip-pc>
References: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
 <20160209010708.GI10791@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160209010708.GI10791@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 08, 2016 at 05:07:08PM -0800, Stephen Boyd wrote:
> On 12/23, Sudip Mukherjee wrote:
> > Add a helper function devm_add_action_or_reset() which will internally
> > call devm_add_action(). But if devm_add_action() fails then it will
> > execute the action mentioned and return the error code.
> > 
> > Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> > ---
> 
> Applied to clk-next

Thanks. Since it went through clk-tree so I guess I can use this helper
for other drivers only after 4.6 merge window closes.

regards
sudip
