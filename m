Return-Path: <keguang.zhang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160406142652.GC27292@vkoul-mobl.iind.intel.com>
References: <1459946095-7637-1-git-send-email-keguang.zhang@gmail.com>
 <1459946095-7637-4-git-send-email-keguang.zhang@gmail.com> <20160406142652.GC27292@vkoul-mobl.iind.intel.com>
From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 8 Apr 2016 19:43:58 +0800
Message-ID: <CAJhJPsVj5EKLK8tAt4RG9ug73oV0hiJGe59nBKAHoM0tbVzcdw@mail.gmail.com>
Subject: Re: [PATCH V1 3/7] dmaengine: Loongson1: add Loongson1 dmaengine driver
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, dmaengine@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
	Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Viresh Kumar <viresh.kumar@linaro.org>, Dan Williams <dan.j.williams@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Content-Type: multipart/alternative; boundary=001a1145b3ce131c16052ff7b7c1
List-ID: <linux-clk.vger.kernel.org>

--001a1145b3ce131c16052ff7b7c1
Content-Type: text/plain; charset=UTF-8

2016-04-06 22:26 GMT+08:00 Vinod Koul <vinod.koul@intel.com>:

> On Wed, Apr 06, 2016 at 08:34:51PM +0800, Keguang Zhang wrote:
> > @@ -527,6 +527,15 @@ config ZX_DMA
> >       help
> >         Support the DMA engine for ZTE ZX296702 platform devices.
> >
> > +config DMA_LOONGSON1
>
> The kconfig and makefile is sorted alphabetically, pls arrage these entries
> accordingly
>

will do.


>
> > +
> > +             /*memorize the physical address of descriptor */
>
> bad comment style
>

will fix.


>


> > +     /*allocate DMA descriptors */
>
> here and other places too :(
>

will fix.


>
> > +static enum dma_status ls1x_dma_tx_status(struct dma_chan *chan,
> > +                                       dma_cookie_t cookie,
> > +                                       struct dma_tx_state *txstate)
> > +{
> > +     struct ls1x_dma_chan *dma_chan = to_ls1x_dma_chan(chan);
> > +     struct ls1x_dma_desc *dma_desc = dma_chan->dma_desc;
> > +     struct virt_dma_desc *vdesc;
> > +     enum dma_status status;
> > +     unsigned int residue = 0;
> > +     unsigned long flags;
> > +
> > +     status = dma_cookie_status(chan, cookie, txstate);
> > +     if ((status == DMA_COMPLETE) || !txstate)
> > +             return status;
> > +
> > +     spin_lock_irqsave(&dma_chan->vchan.lock, flags);
> > +
> > +     vdesc = vchan_find_desc(&dma_chan->vchan, cookie);
> > +     if (vdesc)
> > +             /* not yet processed */
> > +             residue = ls1x_dma_desc_residue(to_ls1x_dma_desc(vdesc),
> 0);
>
> If your usage queries reside repeatedly, then it might make sense to store
> the size which is residue here
>

Querying residues is not the usual case.
It almost returns with DMA_COMPLETE.


>
> --
> ~Vinod
>



-- 
Best regards,

Kelvin Cheung

--001a1145b3ce131c16052ff7b7c1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2016-04-06 22:26 GMT+08:00 Vinod Koul <span dir=3D"ltr">&lt;<a href=3D"=
mailto:vinod.koul@intel.com" target=3D"_blank">vinod.koul@intel.com</a>&gt;=
</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"">On Wed, Apr 06, 2016 at 08:34:51PM +0800, Keguang Zhang wrote:<br>
&gt; @@ -527,6 +527,15 @@ config ZX_DMA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support the DMA engine for ZTE ZX2967=
02 platform devices.<br>
&gt;<br>
&gt; +config DMA_LOONGSON1<br>
<br>
</span>The kconfig and makefile is sorted alphabetically, pls arrage these =
entries<br>
accordingly<br></blockquote><div>=C2=A0</div><div>will do.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*memorize the physic=
al address of descriptor */<br>
<br>
</span>bad comment style<br></blockquote><div>=C2=A0</div><div>will fix.<br=
>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D""></span>=C2=A0</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><span class=3D"">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*allocate DMA descriptors */<br>
<br>
</span>here and other places too :(<br></blockquote><div><br>will fix.<br>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D""><br>
&gt; +static enum dma_status ls1x_dma_tx_status(struct dma_chan *chan,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_c=
ookie_t cookie,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t dma_tx_state *txstate)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ls1x_dma_chan *dma_chan =3D to_ls1x_dma_ch=
an(chan);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ls1x_dma_desc *dma_desc =3D dma_chan-&gt;d=
ma_desc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct virt_dma_desc *vdesc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum dma_status status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int residue =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D dma_cookie_status(chan, cookie, txstat=
e);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((status =3D=3D DMA_COMPLETE) || !txstate)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;dma_chan-&gt;vchan.lock, f=
lags);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vdesc =3D vchan_find_desc(&amp;dma_chan-&gt;vchan=
, cookie);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (vdesc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* not yet processed =
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0residue =3D ls1x_dma_=
desc_residue(to_ls1x_dma_desc(vdesc), 0);<br>
<br>
</span>If your usage queries reside repeatedly, then it might make sense to=
 store<br>
the size which is residue here<br></blockquote><div><br></div><div>Querying=
 residues is not the usual case.<br></div><div>It almost returns with <span=
 class=3D"">DMA_COMPLETE.</span></div><div>=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<span class=3D""><font color=3D"#888888"><br>
--<br>
~Vinod<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div>Best regards,<br><br>Kelvin Cheung<br></div></div></div></div=
></div></div></div>
</div></div>

--001a1145b3ce131c16052ff7b7c1--
