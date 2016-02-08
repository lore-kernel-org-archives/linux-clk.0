Return-Path: <gregkh@linuxfoundation.org>
Date: Mon, 8 Feb 2016 15:14:00 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] devm: add helper devm_add_action_or_reset()
Message-ID: <20160208231400.GA19380@kroah.com>
References: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
 <20160208223546.GA10791@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160208223546.GA10791@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 08, 2016 at 02:35:46PM -0800, Stephen Boyd wrote:
> On 12/23, Sudip Mukherjee wrote:
> > Add a helper function devm_add_action_or_reset() which will internally
> > call devm_add_action(). But if devm_add_action() fails then it will
> > execute the action mentioned and return the error code.
> > 
> > Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> > ---
> 
> Greg, can I get your ack here to take this through clk-tree?

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
