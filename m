Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36363 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbeGPMZm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Jul 2018 08:25:42 -0400
MIME-Version: 1.0
References: <20180619145339.08322293.drivshin@awxrd.com> <1b9995a0-0a44-2896-4492-0d16e3fa2b53@ti.com>
 <b37ee1e6-1b06-b82f-9948-ac66a06544ca@baylibre.com> <20180620115321.5496761a.drivshin@awxrd.com>
 <20180712183836.62e88588.drivshin@awxrd.com>
In-Reply-To: <20180712183836.62e88588.drivshin@awxrd.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 16 Jul 2018 06:58:23 -0500
Message-ID: <CAHCN7xLv_RqrPyxesOYe+O2Mo5rPLwf6iE9bHbZ1sMfZNOppJQ@mail.gmail.com>
Subject: Re: dmtimer fclk regression in 4.16?
To: drivshin@awxrd.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        j-keerthy@ti.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 12, 2018 at 5:39 PM David Rivshin <drivshin@awxrd.com> wrote:
>
> On Wed, 20 Jun 2018 11:53:21 -0400
> David Rivshin <drivshin@awxrd.com> wrote:
>
> > On Wed, 20 Jun 2018 09:11:19 +0200
> > Neil Armstrong <narmstrong@baylibre.com> wrote:
> >
> > > Hi,
> > >
> > > On 20/06/2018 08:30, Tero Kristo wrote:
> > > > On 19/06/18 21:53, David Rivshin wrote:
> > > >> I think I've run across a regression in 4.16 that resulted from th=
e TI clock
> > > >> infrastructure changes. A bisect pointed to [1] as the first break=
ing commit.
> > > >>
> > > >> Our use-case is a pwm-dmtimer-omap using timer7, with timer7_fck p=
arented
> > > >> by clkdiv32k_ick (aka timer_32k_ck aka l4_per_cm:clk:0138:0). Star=
ting with
> > > >> 4.16 that parenting fails in omap_dm_timer_set_source(), called fr=
om
> > > >> pwm_omap_dmtimer_probe, at this check:
> > > >>     if (clk_hw_get_num_parents(__clk_get_hw(timer->fclk)) < 2)
> > > >>         return 0;
> > > >> because timer->fclk is "l4_per_cm:clk:0068:0", whose only possible=
 parent
> > > >> is "timer7_fck".
> > > >>
> > > >> It seemed to me that timer->fclk should instead be "timer7_fck" (w=
hich has
> > > >> the desired set of possible parents). I tried following the lead s=
et in [2]
> > > >> and added "clocks" and "clock-names" properties on timer7. However=
, that
> > > >> resulted in omap_dm_timer_of_set_source(), called by omap_dm_timer=
_prepare(),
> > > >> failing when it tries to parent "timer7_fck" to itself.
> > > >>
> > > >> The following change in omap_dm_timer_prepare() does seem to work:
> > > >> -        timer->fclk =3D clk_get(&timer->pdev->dev, "fck");
> > > >> +        timer->fclk =3D clk_get_parent(clk_get(&timer->pdev->dev,=
 "fck"));
> > > >
> > > > It seems omap_dm_timer_of_set_source() is actually completely broke=
n and isn't doing anything useful. Neil, what was this function supposed to=
 be doing, seeing you invented the initial patch for that (commit 31a7448f4=
fa8a528040e3df593e9781f55218183)?
> > >
> > > The original change was supposed to set the timer source clock by usi=
ng the clock defined in the DT, but
> > > it was made to work when the code was in arch/arm and the fck was not=
 found from DT.
> > >
> > >
> > > The omap_dm_timer_of_set_source() should be changed to get a specifie=
d clock name like "src":
> > > parent =3D clk_get(&timer->pdev->dev, "src");
> > > if (IS_ERR(parent))
> > >     return -ENODEV;
> > >
> > > And the fck clock should be added to all timer nodes.
> > >
> > > For example ed839c3664cb308144fe70a3a95813ab59a03dfb or 521f9e5e3f871=
cdac3ecd2a583d14d0472278053 only adds fck to timer1/2, the 7 timers should =
have the fck clock.
> > >
> > > @David: chan you test the omap_dm_timer_of_set_source() change and in=
 DT update the timer7 node with :
> > > clocks =3D <&timer7_fck>, <&clkdiv32k_ck>;
> > > clock-names =3D "fck", "src";
> >
> > That didn't work as-is because clkdiv32k_ck isn't a direct parent of
> > timer7_fck anymore. However, if I change it to
> >       <&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0>
> > then all seems well.
> >
> > Since pwm-dmtimer-omap sets the source clock explicitly anyways
> > (based on the DT), using any of the parents of timer7_fck as
> > the timer7 "src" clock works in my case.
> >
> > Also, if I leave off the "src" clock entirely, then omap_dm_timer_prepa=
re()
> > defaults it to using that same clock:
> >       rc =3D omap_dm_timer_of_set_source(timer);
> >       if (rc =3D=3D -ENODEV)
> >               return omap_dm_timer_set_source(timer, OMAP_TIMER_SRC_32_=
KHZ);
> > and that also works for me.
> >
> > Thanks,
> > David Rivshin
> >
>
> Hi Neil,
>
> Are you planning on submitting a patch with this fix? Or would you prefer
> I spun one up? One concern I have is that while I use an am335x and feel
> fairly confident on those DT changes, I'm not so confident about what
> changes would be needed for other SoC's devicetrees.

I use the dmtimer to run a PWM on the backlight of a device I have on
both an OMAP35xx and OMAP36/37.  If someone wants to CC me on the
patch, I can test it my boards.

adam
>
>
> > >
> > > Thanks,
> > > Neil
> > >
> > > >
> > > > -Tero
> > > >
> > > >> but I'm very uncertain whether that's the right path.
> > > >> Should omap_dm_timer know that the clock returned is actually a ch=
ild of the
> > > >> clock it's interested in? Or should clk_get(<timerN>,"fck") be ret=
urning the
> > > >> timerN_fck in the first place? Or is the problem something else en=
tirely?
> > > >>
> > > >> As I'm not sure how these pieces are all intended to fit together,=
 any
> > > >> pointers would be appreciated.
> > > >>
> > > >> Thanks,
> > > >> David Rivshin
> > > >>
> > > >> [1] df54bfc5502a ("clk: ti: am33xx: add clkctrl clock data")
> > > >> https://www.spinics.net/lists/linux-omap/msg139798.html
> > > >> [2] 521f9e5e3f87 ("ARM: dts: am33xx: add fck under timers1/2")
> > > >> https://www.spinics.net/lists/linux-omap/msg140605.html
> > > >>
> > > >
> > > > --
> > > > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-t=
unnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> > >
> >
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
