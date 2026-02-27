Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597C421899
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203503; cv=none; b=IpUphe8eZwIZADuIMVwswaWQRuZgqpDetpolEv+PnGs+IPGjb52K+TqVHIaOCSra8TIdYhduq+20ZKav4zvrayfL6+XhfV8QZer/1xaxAkTMRk9l60RVnz7WwuyysKaz4B0LH7kbQWFnzD3OtdJ+JScbk64dgApcHskoeTdIyYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203503; c=relaxed/simple;
	bh=eQ7qXAOyj81yfe/+OeMnHJ4AQMCfEecRpWABhPohsPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijdZGNPRy0hFOYz3v4UUY0L3/Oz0ZZcBcjLKKfuqi5z2kxRmQgZPPWQ2tYUE/oXN+veiMLnXJ4iVVTY1alzPF2e45WNyjkvq/7LsvOTBUJ+fvikeLdq6UOrWYQqm1zXeCRNX8PqYJKzwynNf7+kR4qZ49ss0L6yf30ldYMaHj6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WX6dpmLj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PD4paHCN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WX6dpmLj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PD4paHCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772203500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
	b=WX6dpmLjkzmLG9nIcv5mxUuo6vl9SsXARh2gICDf0xyBiPiJx1+6vpS0GHdoTdMOHtwU6h
	uHQiClfrYJYjKoY9HAWl3nOOkmuCBL9WDUrsYQEH1tYXTUiM0Ff7huRc+fyKwcASUMMugJ
	WE5+lwQnn5xJ4J08AD6VzpGIVzgHArs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-KW7B-skjOJqlBLlMMIzceA-1; Fri, 27 Feb 2026 09:44:59 -0500
X-MC-Unique: KW7B-skjOJqlBLlMMIzceA-1
X-Mimecast-MFC-AGG-ID: KW7B-skjOJqlBLlMMIzceA_1772203498
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899b6a1a557so220425946d6.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 06:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772203498; x=1772808298; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
        b=PD4paHCNvd1hV6pS3NF7m3px/10FhxVbT7XbblzkJjCbr/Y9Yw+yaz8/QjiakrOAAe
         Z+X2uXLz0thxfqfNqGdHAECffK1d8poOKqf5lQ7nDx1t60DwoikUJRramfqE8oIPtq96
         RQIftN+VdTHcXTcISCMHd2gDfyqE/mYx/KqaHSeTsf4PXbWzKiHPyaQ2bgpbBfeb+InB
         FfdsTFUgE7BrXouk8pGqX9mmrw0hF10Fwkbzt/til2MWJVy08+zptahFDvNUxSfEVQhn
         dAlbCXAi52HCa4djzPGtyd1wX10XEtL43YgGFqt5blfcOxe0TOR2ygqfsWP6E6ZzyMR5
         NoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772203498; x=1772808298;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjpP6CrvDx4JRD336SFvsZfBjEjd+fqZc06LPodyXOg=;
        b=O7osFtk3hnUgBm7vkVezgWQiZeykTi14gfZppJkOV9MbsdQmVPV3fyVvu76OrNNxd9
         4dcPJiCYux6I2JnrybogY2VmzrZLkaExIWFW6NKnZqxqAVYE7TFSWeYwcW11wyuk0ps4
         fLa4m8KbnCawTVkA/2cYbl0G3m/EYSc++l9qbrYQ9pWeuJaORzpDId6jDLC4RG9c4tqT
         6pGIvoiWwFqLBlveRpJqtmsZtO+T1sI2c9qGYSWnhvpHRPjTIpP+gNtkvCTXNcXRYSjL
         H1H2PcHbrYTOOJF8mzH8c68M4omhj3gfRpgZPRx+//IyhYkEEjv4YXKnoFwo3EeMG5xz
         hoHA==
X-Forwarded-Encrypted: i=1; AJvYcCXixg/qEYV9szjOqx67Z2FK4jDO1sjmgG9pgOn6KWq76t61RnytsijhHM1hbjlT0FAZwwwlhW1MZoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWSrCVqiBH8r59+h1bAVv/CZQMTniFJbrkKMuFH1MiYwEBLg7z
	tMDUPWU3CSzIno9o+I8XhPJwzCu4b2KotOSySN6NKEnsDNZoycoXt78xVfWBVuWS9/M1rk4DanP
	a8yOfqYoRKWgwLKsmh0xHKTX07bPhFz2Ci4ZHK/ub3LypXcrOAsp0B609LRx5xw==
X-Gm-Gg: ATEYQzz0vJaG3wSEGriV2oa1rrIDLtYESDef6AhlZTuHhxsEU4DTpsmVCd58aAUS+dX
	ouZrWVsVSHBVRkTHLuckmquqgudzNilguwMELiGTtwEB5tF8o+UV2iPrIUEuYzAZlpqBZOpMKeb
	9pptSIpKgPSk/XPP5w6dFFcEvy9Iej1iDb50tdRzN6uBcOGJ7AYHF/0CipycmATOYaB5ujNOokA
	YmMe0fpi2N3FjKsjJrvDRNP8cdSuRIu2VyFJHzd0Ox3+I2WFrTCMPvrMu1oOxy7Xxr/DKDmrcw6
	lHU0iabrrAh/vtWfRyMll28a/aGrLLYPghIolHcwm8nLlDYAi00gu9dIykAoswk1D1Rj3pmmbBJ
	SN/zCrmf+OR07KjM9kJWIMRUgjumvgFKkrEcL/kAqzzZVPbUIVp32LkLb
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187656d6.12.1772203498547;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
X-Received: by 2002:a05:6214:2481:b0:88a:2360:7f15 with SMTP id 6a1803df08f44-899d1d86467mr45187146d6.12.1772203498037;
        Fri, 27 Feb 2026 06:44:58 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c73a3130sm45123526d6.49.2026.02.27.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:44:57 -0800 (PST)
Date: Fri, 27 Feb 2026 09:44:55 -0500
From: Brian Masney <bmasney@redhat.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
Message-ID: <aaGt5-ZWoXQ9Hz74@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
 <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113465A96D1EEBB43C82C12A98673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Feb 27, 2026 at 12:00:55PM +0000, Biju Das wrote:
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On Behalf Of Brian Masney
> > Sent: 26 February 2026 18:17
> > Subject: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
> > 
> > There are some clocks where the rounding is managed by the hardware, and the determine_rate() clk ops
> > is just a noop that simply returns 0. Add a new flag for these type of clocks, and update the clk core
> > so that the
> > determine_rate() clk op is not required when this flag is set.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
[snip]
> >  drivers/clk/clk.c            | 24 +++++++++++++++++++++---
> >  include/linux/clk-provider.h |  2 ++
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..0a522a0817411c7f7c6e9cffd6f024e672a331a8 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1557,6 +1557,20 @@ static int __init clk_disable_unused(void)  }
> > late_initcall_sync(clk_disable_unused);
> > 
> > +/**
> > + * clk_is_rounding_fw_managed - Check to see if clk rounding is handled
> > +by the
> > + * firmware.
> > + * @core: the clk to check
> > + *
> > + * Clks that have this flag enabled do not need to have a
> > +determine_rate() op
> > + * set, and will always return success for any rounding operation since
> > +the
> > + * firmware will deal with the rounding.
> > + */
> > +static inline bool clk_is_rounding_fw_managed(struct clk_core *core) {
> > +	return core->flags & CLK_ROUNDING_FW_MANAGED; }
> > +
> >  static int clk_core_determine_round_nolock(struct clk_core *core,
> >  					   struct clk_rate_request *req)
> >  {
> > @@ -1589,6 +1603,8 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
> >  		req->rate = core->rate;
> >  	} else if (core->ops->determine_rate) {
> >  		return core->ops->determine_rate(core->hw, req);
> > +	} else if (clk_is_rounding_fw_managed(core)) {
> > +		return 0;
> >  	} else {
> >  		return -EINVAL;
> >  	}
> > @@ -1673,7 +1689,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> > 
> >  static bool clk_core_can_round(struct clk_core * const core)  {
> > -	return core->ops->determine_rate;
> > +	return core->ops->determine_rate || clk_is_rounding_fw_managed(core);
> >  }
> > 
> >  static int clk_core_round_rate_nolock(struct clk_core *core, @@ -3528,6 +3544,7 @@ static const
> > struct {
> >  	ENTRY(CLK_IS_CRITICAL),
> >  	ENTRY(CLK_OPS_PARENT_ENABLE),
> >  	ENTRY(CLK_DUTY_CYCLE_PARENT),
> > +	ENTRY(CLK_ROUNDING_FW_MANAGED),
> >  #undef ENTRY
> >  };
> > 
> > @@ -3906,7 +3923,7 @@ static int __clk_core_init(struct clk_core *core)
> > 
> >  	/* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
> >  	if (core->ops->set_rate && !core->ops->determine_rate &&
> > -	      core->ops->recalc_rate) {
> > +	      core->ops->recalc_rate && !clk_is_rounding_fw_managed(core)) {
> >  		pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
> >  		       __func__, core->name);
> >  		ret = -EINVAL;
> > @@ -3920,7 +3937,8 @@ static int __clk_core_init(struct clk_core *core)
> >  		goto out;
> >  	}
> > 
> > -	if (core->ops->set_parent && !core->ops->determine_rate) {
> > +	if (core->ops->set_parent && !core->ops->determine_rate &&
> > +	    !clk_is_rounding_fw_managed(core)) {
> 
> >  		pr_err("%s: %s must implement .set_parent & .determine_rate\n",
> >  			__func__, core->name);
> >  		ret = -EINVAL;
> 
> 
> After applying patch#11, I get a message as you removed .determine_rate, Also it breaks display.
> 
> [    0.096414] __clk_core_init: .pll5_foutpostdiv must implement .round_rate or .determine_rate in addition to .recalc_rate

Thanks for testing. This happens because rzg2l_cpg_pll_clk_register()
doesn't have the new flag set. I'll fix this, and go through all of the
others again just to make sure I don't miss any others.

Brian

