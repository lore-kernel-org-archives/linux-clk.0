Return-Path: <olof@lixom.net>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXJU6buEFuAKp_zrEdeY1jzcEkWRVgODmwystbPjHzPoQ@mail.gmail.com>
References: <1478532904-5604-1-git-send-email-geert+renesas@glider.be>
 <20161117230701.GR25626@codeaurora.org> <CAMuHMdU9TRVWyCFf=auH2qZdW0hDYJW-E2ukruNY8dkn9yarxA@mail.gmail.com>
 <20161118095938.GC22664@verge.net.au> <CAMuHMdW4eSdXqheeDUjT98i+EHd4Nr1Dp0y0nEqThEZ+pwe6DA@mail.gmail.com>
 <CAMuHMdXJU6buEFuAKp_zrEdeY1jzcEkWRVgODmwystbPjHzPoQ@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 18 Nov 2016 09:49:19 -0800
Message-ID: <CAOesGMjwcWMgdwkih8Q1_yX0npDeRbqqXRPCN5-4SnZYf8KfcA@mail.gmail.com>
Subject: Re: [git pull] clk: renesas: Updates for v4.10 (take two)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Nov 18, 2016 at 2:44 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Nov 18, 2016 at 11:12 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Fri, Nov 18, 2016 at 10:59 AM, Simon Horman <horms@verge.net.au> wrote:
>>> On Fri, Nov 18, 2016 at 10:55:00AM +0100, Geert Uytterhoeven wrote:
>>>> On Fri, Nov 18, 2016 at 12:07 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>>>> > On 11/07, Geert Uytterhoeven wrote:
>>>> >> The following changes since commit dbdcc4f996df280eb2758095b4774ea62da8a2a7:
>>>> >>
>>>> >>   clk: renesas: r8a7796: Add DU and LVDS clocks (2016-11-02 20:40:08 +0100)
>>>> >>
>>>> >> are available in the git repository at:
>>>> >>
>>>> >>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.10-tag2
>>>> >>
>>>> >> for you to fetch changes up to 1936be95e013802291201c1ed193e04fd1ed3d13:
>>>> >
>>>> > Ok. Pulled into clk-next. I'm a little wary here as I haven't
>>>> > seen any indication from arm-soc maintainers (not Simon) that
>>>> > they'll take this cross tree merge. I guess we'll see how it
>>>> > goes.
>>>>
>>>> Thanks for pulling!
>>>>
>>>> Simon: while it's too late in the v4.10 cycle to queue additional cleanups in
>>>> the platform code on top of this, can you please still pull
>>>>
>>>>         git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
>>>> rcar-rst
>>>>
>>>> to resolve the (trivial) merge conflicts between the conversion to the RST
>>>> driver in that branch, and the addition of PRR and RZ/G support in your tree?
>>>> This will prevent arm-soc and/or Linus from having to deal with these
>>>> conflicts.
>>>>
>>>> For reference, I've pushed the conflict resolution to branch
>>>
>>> Pull where? I've already sent pull-requests to the ARM SoC maintainers
>>
>> What do you mean with "where"?
>>
>>> so I fear this may be too late.
>>
>> I know you've already sent pull requests.
>> Without a conflict resolution, the arm-soc maintainers and/or Linus will
>> face the conflicts, depending on merge order.
>
> Upon second thought, any merge conflicts will show up only when Linus
> will merge clk and/or arm-soc branches.
>
> As the arm-soc maintainers send multiple pull requests, it's difficult
> to predict
> which merge conflicts will happen when, and providing conflict resolutions
> to arm-soc won't help much.
>
> After some private discussion with Simon, we think the best solution is to
> notify Linus in advance. All but one merge conflicts are of the "add both
> sides" type.
>
> I'll do so next week, before the merge window opens.

A few trivial merge conflicts are not a big deal, and you probably
don't need to notify in advance (we always check for them when we
prepare our pull requests).

However, conflicts like these are an indication that your development
or patch management flow isn't working quite right. You shouldn't step
on your own toes like this. Try to avoid it in the future by
coordinating better.


-Olof
