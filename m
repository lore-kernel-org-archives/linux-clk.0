Return-Path: <sboyd@codeaurora.org>
Date: Tue, 25 Aug 2015 10:53:21 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michal Kubecek <mkubecek@suse.cz>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] clk: Add missing header for 'bool' definition to
 clk-conf.h
Message-ID: <20150825175321.GF19120@codeaurora.org>
References: <1439882205-10978-1-git-send-email-wens@csie.org>
 <20150824212828.GD14330@codeaurora.org>
 <CAGb2v67EhfgtbdLyFLd8xd6MMAnG4MGMvGLUTZxh=ag7XghvyA@mail.gmail.com>
 <20150825065932.GA29101@unicorn.suse.cz>
 <CAGb2v67a66VbpEs4SkDf8yCeuNxgHDtKxzpnGzxNnXvmkfZxAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAGb2v67a66VbpEs4SkDf8yCeuNxgHDtKxzpnGzxNnXvmkfZxAA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/25, Chen-Yu Tsai wrote:
> On Tue, Aug 25, 2015 at 2:59 PM, Michal Kubecek <mkubecek@suse.cz> wrote:
> >
> > How about
> >
> >    - It must fix a real bug that bothers people (not a, "This could be a
> >    problem..." type thing).
> >
> > in Documentation/stable_kernel_rules.txt?
> 
> My bad. I'll send a new version without the CC.

No need. I'll strip off the cc when applying.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
