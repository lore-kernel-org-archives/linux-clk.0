Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543BA1FE47B;
	Fri, 22 May 2026 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464724; cv=pass; b=S5GiFWY4B0yWCYDTC/02FC9Fr45d1DflSpPy39KZkTnxkRYjYrVd/Zuklq4JAHOeIOCmPRyebtK9GTPx4o1NXAYbcIyQvYzx4M6GIEEQ9+M4PX+cwy/dpjp5Tk/OfG2TGgBYPfBSfD310YFZyojmqhSVzcH4pY9QGt99+AjgsPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464724; c=relaxed/simple;
	bh=BT0LQpZc5DdB7CC6nvR4n0Dsh9l34r2HolGf6mimgXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gzq0BPN7jeJfNnHL8hQAJghofU3up/ktsyHAvfgvbAxL8m8I5yLevdY6hLbCT8xmGtmfyYh8vRknRasMT1jn7T6brJO/tdC04Y864RaP0oTF9U9dvmuiUk/tx7USYmlu9d3DiYP+5wZ796uy5CXIIPHoF+h4n5R7C1wtuMDbwpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=eCf3Oa8h; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="eCf3Oa8h"
ARC-Seal: i=1; a=rsa-sha256; t=1779464700; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MthQAsQ7VaS2cV01SOjYqaKVzYj+V8Mq47BxTV1TfQiPQi9L9NTJMHPv9NKFnWEsZLnLKQ7+0+JGuWdl4I/KvmSTsQwzWfJPEYweUNWz1yKbcZyTiMTbzHu75EAYqrLxccbboXmgRi3N2l6lkdkHglCxYgS+YRAyq9bjuoI7Zbo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779464700; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SHKeFZi+B9S1Z91e4v9pT5BCHHl/avL5yLlkuQ2GHFA=; 
	b=js1SN6rkkAObJZzpvj+4Vh/hgT13iRJHwtfbF8dtz/42bXgzmQS4fr7AqWaY2k+FUtlb7/tmiZa7vMk4pT+qi7PDrkn8MFGcKDbzy+QtoiLu94uLKl99pjwtfgPJATPFSWDLth7NotxstgJ7MuKaoCVUGt8XF2THM/6ypIqfOxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779464700;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=SHKeFZi+B9S1Z91e4v9pT5BCHHl/avL5yLlkuQ2GHFA=;
	b=eCf3Oa8hV3BblpYL5pdzwHtwwJjKC606O1P+5d7RltJGsDH5Y3vBGd4Qvd1Oce5U
	46HBNAthfonZZgvFdnyUSmQvysLn1eHAIE+guJycJdACshY7FwO5QCTaiFwYAlL/UyA
	z4j7YAoy/xBo8RXneq8Zd21YXA/+9kus9sTLJ8iE=
Received: by mx.zohomail.com with SMTPS id 1779464697907144.61503187448898;
	Fri, 22 May 2026 08:44:57 -0700 (PDT)
Date: Fri, 22 May 2026 15:44:40 +0000
From: Yao Zi <me@ziyao.cc>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: add support for siflower sf21-topcrm
Message-ID: <ahB46uuoFQxKgr7r@pie>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com>
 <agsEWo_mo5rzUAAH@pie>
 <CAJsYDVJZW2VYFaxzJRg2+CJZbvqq_iRXaf7+zYvidQn0AiviKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJsYDVJZW2VYFaxzJRg2+CJZbvqq_iRXaf7+zYvidQn0AiviKQ@mail.gmail.com>
X-ZohoMailClient: External

On Mon, May 18, 2026 at 09:34:17PM +0800, Chuanhong Guo wrote:
> Hi!
> 
> On Mon, May 18, 2026 at 8:22 PM Yao Zi <me@ziyao.cc> wrote:
> >
> > On Sun, May 17, 2026 at 10:12:58PM +0800, Chuanhong Guo wrote:

...

> >
> > [...]
> >
> > Besides field/register offsets, the only difference I could tell between
> > cmnpll_postdiv and pciepll_fout is that pciepll_fout clocks could be
> > gated.
> >
> > Would it be a good idea to describe the gating function separately as a
> > clock, and merge the common part of pciepll_fout and cmnpll_postdiv? In
> > which way you could save a lot of mostly duplicated code.
> 
> I don't think so. Since the majority of the existing code are register
> operations, and the register bit layout are completely different,
> there isn't much to share between these two PLLs.
> Writing a struct to describe both register layouts together seems
> unnecessarily complicated and harder to read.

I'm not suggesting merging the implementation of the two PLLs
themselves, but only the two types of clocks derived from them,
i.e. cmnpll_postdiv and pciepll_fout.

> BTW the CMNPLL and PCIEPLL are actually different hardware.
> The former is an integer PLL while the latter actually supports
> fractional operations. I didn't add support for the fractional part
> due to the lack of use cases and documentation. PCIE and GMAC
> clocks are fed by this PLL and require exact clock frequencies
> which can be achieved using only the integer mode.
> 
> >
> > > +     .recalc_rate = sf21_pciepll_fout_recalc_rate,
> > > +     .determine_rate = sf21_pciepll_fout_determine_rate,
> > > +     .set_rate = sf21_pciepll_fout_set_rate,
> > > +};
> > [...]
> > > +
> > > +     spin_lock_irqsave(cmn_priv->lock, flags);
> > > +     if (index)
> > > +             sf_rmw(cmn_priv, mux_reg, 0, BIT(mux_offs));
> > > +     else
> > > +             sf_rmw(cmn_priv, mux_reg, BIT(mux_offs), 0);
> > > +
> > > +     spin_unlock_irqrestore(cmn_priv->lock, flags);
> > > +     return 0;
> > > +}
> >
> > I believe besides the divider reloading part, clk_mux_ops,
> > clk_divider_ops, and clk_gate_ops have already provided the logic
> > you implemented here. So it might be a better option to composite them
> > together to implement your clocks instead of building from scratch.
> 
> The divider reloading is the exact reason I chose to not compose them
> with the function you mentioned. The reloading bit need to be set on
> both clock divider change and clock enabling, because the clock divider
> loading only happens when the clock is running. Since I already have
> to write two of the three parts you mentioned, trying to reuse
> clk_mux_ops doesn't seem to reduce the code complexity here.

You don't have to write divider/gate operations from scratch, but only
wrappers that first call clk_{divider,gate}_ops.* then trigger frequency
reloading.

> It's just trading get_parent and set_parent call with one more level
> in the clock tree for every clock and more code to wire them together
> in the probe function.
> 
> >
> > > +static const struct clk_ops sf21_clk_muxdiv_ops = {
> > > +     .enable = sf21_muxdiv_enable,
> > > +     .disable = sf21_muxdiv_disable,
> > > +     .is_enabled = sf21_muxdiv_is_enabled,
> > > +     .recalc_rate = sf21_muxdiv_recalc_rate,
> > > +     .determine_rate = sf21_muxdiv_determine_rate,
> > > +     .set_rate = sf21_muxdiv_set_rate,
> > > +     .get_parent = sf21_muxdiv_get_parent,
> > > +     .set_parent = sf21_muxdiv_set_parent,
> > > +};

Regards,
Yao Zi
