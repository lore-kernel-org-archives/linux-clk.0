Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF20B388E4B;
	Tue, 29 Sep 2026 19:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711915; cv=none; b=lLd2WJCyfXX8wVCEEKYT7+asy77bYuXzuxGP1xM/Nk80F83bemMzYTpBMYacgrK/hu7LCsar3OalldhqlhtU10HHuOT7JPZNkclvCr94R2dsWlWXZU2rX8Ll+fL7hMmQjcbYVOI9WKWnqLidBAsKGXO/6ERCUjuDv4m54oqY4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711915; c=relaxed/simple;
	bh=rzIyuyw2Sv4lrUy8xSI2ZMlSAC2YqPgM0Am+3ZBgb0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmsusZa3Fbi0lljsqB58HQ2M4+meRKtoSwqbYy7QL4jC8oCpfEcVMhPlG1kRiX6JlqnneE1/OEhvXmc6E8xl4EH/DEKrJ6y0sHXRn+LEgV6DrbVva3qWXu8hjSziY6ESiVkK8SWkMOfALKvkwD4gS14HF6rKrS8xPpPl/Js0XwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MD8JS7rU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MD8JS7rU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683301F000FF;
	Tue, 29 Sep 2026 19:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711912;
	bh=FM08SSqsWSOZJWtV+yNcCq2za0yCimEnBoqDGB1eG60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MD8JS7rUltqIokKYj4s9NMk3Cw71hV8LHF0JdqABhcsGjIZOQMNizD0pmlplj4qQf
	 uezCHmwJmrp3KKwtkEdcP8mhilJQuzmWMaktNjxSxnva1Nk+07kZ2kbFPllXEfHg5T
	 ccAdRFxzUKCnrfboj8FpXsZiFbHn3BeOGSgu3uWn4qXiTcxMak+Crv+64pXOMifXUs
	 tSC0V5lUA/Jor0235C/iyi83lx/m0koI1TgVDw1cCfVFoupkR4tJsy/VMPaifxBHdB
	 YWlLq5R1VD5RLEoHobWJhABApSpeEo0BvRSE9B0RDZM8Bb+yztDCA96EONxPXRhdpH
	 uoqezxorutw6w==
Date: Tue, 29 Sep 2026 12:58:31 -0700
From: Drew Fustini <fustini@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: tenstorrent: use regmap_assign_bits() for
 conditional set/clear
Message-ID: <arwYZ3rU1fNTFTld@x1>
References: <20260924083439.461769-1-peng.fan@oss.nxp.com>
 <arV1rOMRG6D9erK8@thelio>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arV1rOMRG6D9erK8@thelio>

On Thu, Sep 24, 2026 at 12:10:36PM -0700, Drew Fustini wrote:
> On Thu, Sep 24, 2026 at 04:34:38PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> > the simpler regmap_assign_bits() call.
> > 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/clk/tenstorrent/atlantis-prcm.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> > index 6d4386eeb7dae..854b9c48816f2 100644
> > --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> > +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> > @@ -205,14 +205,9 @@ static int atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
> >  {
> >  	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
> >  
> > -	if (enable)
> > -		return regmap_set_bits(gate->common.regmap,
> > -				       gate->config.reg_offset,
> > -				       gate->config.enable);
> > -	else
> > -		return regmap_clear_bits(gate->common.regmap,
> > -					 gate->config.reg_offset,
> > -					 gate->config.enable);
> > +	return regmap_assign_bits(gate->common.regmap,
> > +				  gate->config.reg_offset,
> > +				  gate->config.enable, enable);
> >  }
> >  
> >  static int atlantis_clk_gate_enable(struct clk_hw *hw)
> > -- 
> > 2.50.1
> 
> Reviewed-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
> 
> I will apply this to tenstorrent-clk-for-next.

Applied to tenstorrent-clk-for-next:

  d5e56ca6c53b clk: tenstorrent: use regmap_assign_bits() for conditional set/clear

Thanks,
Drew
