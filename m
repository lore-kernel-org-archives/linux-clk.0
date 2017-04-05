Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 5 Apr 2017 14:17:55 -0400
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] arm: dts: renesas: Drop _clk suffix from clock node
 names
Message-ID: <20170405181755.GA31226@verge.net.au>
References: <1491214089-14093-1-git-send-email-geert+renesas@glider.be>
 <20170405013815.GK18246@codeaurora.org>
 <CAMuHMdWSLKjcyQP25mPCwn8EV1xzAyC=AipT8E0DbeVoEeemAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWSLKjcyQP25mPCwn8EV1xzAyC=AipT8E0DbeVoEeemAw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Stephen Boyd <sboyd@codeaurora.org>, Magnus Damm <magnus.damm@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 05, 2017 at 09:09:20AM +0200, Geert Uytterhoeven wrote:
> Hi Stephen,
> 
> On Wed, Apr 5, 2017 at 3:38 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 04/03, Geert Uytterhoeven wrote:
> >> The current practice is to not add _clk suffixes to clock node names in
> >> DT, as these names are used as the actual clock names.
> >>
> >> This patch removes the remaining offenders in the various Renesas DTSes.
> >
> > This changes the names in the clk framework too though? If you're
> > ok with that I'm ok too.
> 
> Yes, that's my main motivation doing this: it's a bit silly to have some clocks
> show up in /sys/kernel/debug/clk/clk_summary with a "_clk" suffix.
> 
> > Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> 
> Thanks!

Thanks, I have queued these up.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
