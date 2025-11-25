Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA80C33EC;
	Tue, 25 Nov 2025 03:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764041164; cv=none; b=J3A+lnDrfm4MkrAPcgg8nvWMOtOdRMul/7FHzlRaegtvp3AMQoW2b1joc5KT7DoY7FcLPUI0wNqPkp0AeQL+VJ2BVmjR5MFagDsAs+jG0rpSlsR2jQxFNf/IqqvB4GEeW7kJ5YMebgWYXdrW31KEPNKl8da+FoDiFBBc0fUl//c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764041164; c=relaxed/simple;
	bh=WZOjQURqId+CZRRksRPejtKE7iaWEe0VkQ6Rm92giGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCOg/koFBYn4peI9PpbkIO1exmUgrEQU+qblyL2Hak6LabH9Vf0+aiWLrD+gU5IUAG/FQ6ur3xWIObScO19Y1C/6W4xwmh9mxNEhId0d5MFLUMqOUcDW40/Kpv9jZOSi9vVCYOOKIsAaAuB13YuFsTD01dgCYbD/1DXx0Baxq74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BrcIIoho; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BrcIIoho"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3D49225FAE;
	Tue, 25 Nov 2025 04:26:01 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoLdeC5lYiO1; Tue, 25 Nov 2025 04:26:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1764041160; bh=WZOjQURqId+CZRRksRPejtKE7iaWEe0VkQ6Rm92giGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BrcIIohoKNNkMI5m3sBYxAL6MUaym4qL4VxXqj6mBdmYccDyW0/M3pRIibsNWATrF
	 +wpaFRbTHjpfB7GojepF6QK83pZmjDgKbuwJwRbaank+aico/a7lYUhzlGlOCx44Fw
	 WZiyMZXPYCfmszvqN29j0ht/0fnu7VceNmOkn6JsrtHFEGujDTKpbW1BvHgQxHRYaJ
	 6rXsTRmcAjLv7I7izPNvM+A4CjH8g418bf7Dylux5u/3niP7TsQbYdlXIhXGarvCGc
	 kUp3lQ63pFIU2sm1U/K1GCxHtVjV2wh/aq7tee9ZLpSUG28pOo89WHRPLXPDXQE5KV
	 ei65w2kolZX4g==
Date: Tue, 25 Nov 2025 03:25:48 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH 5/7] clk: thead: th1520-ap: Add macro to define
 multiplexers with flags
Message-ID: <aSUhvEOIFclRP3Wg@pie>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-6-ziyao@disroot.org>
 <aSTYt3mlJCC0f5TG@x1>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSTYt3mlJCC0f5TG@x1>

On Mon, Nov 24, 2025 at 02:14:15PM -0800, Drew Fustini wrote:
> On Thu, Nov 20, 2025 at 01:14:14PM +0000, Yao Zi wrote:
> > The new macro, TH_CCU_MUX_FLAGS, extends TH_CCU_MUX macro by adding two
> > parameters to specify clock flags and multiplexer flags.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/thead/clk-th1520-ap.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> > index bf8e80c39a9e..79f001a047b2 100644
> > --- a/drivers/clk/thead/clk-th1520-ap.c
> > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > @@ -101,17 +101,22 @@ struct ccu_pll {
> >  		.flags	= _flags,					\
> >  	}
> >  
> > -#define TH_CCU_MUX(_name, _parents, _shift, _width)			\
> > +#define TH_CCU_MUX_FLAGS(_name, _parents, _shift, _width, _flags,	\
> > +			 _mux_flags)					\
> >  	{								\
> >  		.mask		= GENMASK(_width - 1, 0),		\
> 
> checkpatch warns [1] about this line:
> 
> CHECK: Macro argument '_width' may be better as '(_width)' to avoid precedence issues
> 
> I noticed it in the patchwork CI results [2] but I think we can ignore
> that as this patch is not actually changing that line.

Agree. This is only a "CHECK"-level warning, and for these clock
definition macros, I don't think there's a chance that precedence
problem would happen since only literals are feed into _width.

Enclosing the parameter in parentheses also makes the code a little
messy. so I'd prefer to keep it as-is, too.

> Thanks,
> Drew

Regards,
Yao Zi

> [1] https://gist.github.com/linux-riscv-bot/a335020c99ef628bb38e0a4ea85e0c45
> [2] https://patchwork.kernel.org/project/linux-riscv/patch/20251120131416.26236-6-ziyao@disroot.org/
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
