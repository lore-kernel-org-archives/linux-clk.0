Return-Path: <mkubecek@suse.cz>
Date: Tue, 25 Aug 2015 08:59:32 +0200
From: Michal Kubecek <mkubecek@suse.cz>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] clk: Add missing header for 'bool' definition to
 clk-conf.h
Message-ID: <20150825065932.GA29101@unicorn.suse.cz>
References: <1439882205-10978-1-git-send-email-wens@csie.org>
 <20150824212828.GD14330@codeaurora.org>
 <CAGb2v67EhfgtbdLyFLd8xd6MMAnG4MGMvGLUTZxh=ag7XghvyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAGb2v67EhfgtbdLyFLd8xd6MMAnG4MGMvGLUTZxh=ag7XghvyA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 25, 2015 at 10:55:28AM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 25, 2015 at 5:28 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 08/18, Chen-Yu Tsai wrote:
> >> of_clk_set_defaults uses the type 'bool', but clk-conf.h does not
> >> include its definition.
> >>
> >> This results in a compile error when only clk-conf.h is used.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> Cc: stable@vger.kernel.org
> >
> > Why is stable Cc-ed? Is there some sort of compilation failure on
> > stable kernels?
> 
> There isn't for now. Though I don't see why we shouldn't fix this for
> stable kernels as well. It's possible other people or third-party
> vendors working with stable/LTS kernels (Android?) may run into it.

How about 

   - It must fix a real bug that bothers people (not a, "This could be a
   problem..." type thing).

in Documentation/stable_kernel_rules.txt?

Michal Kubecek
