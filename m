Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E902E5429;
	Thu, 24 Sep 2026 19:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277039; cv=none; b=ENaOH2WdcycMsHDcM0WMtK6YHRjPWUsmRkMQCHtLXdy3jCPllsWJ/x1niCtugB+y+gUAj+MVEIMu5AfNypU8c6/H1lu04Z2tqXLqLSgX6CnlABCV02wTpsC3aAHkSN4L+JmGBCyiL4Snj1PAeFNM4LLYEpoqAhsbjI48J2UHn24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277039; c=relaxed/simple;
	bh=aIZPoTIJNwUn7S5TKaVC3Rqsp2/vwiYPT5Zw0bholog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyyZ97RpENJujciu/oZ//0L16NpkIBlc1hcSflBOQBzk5sklZd6qbUdtnx+rskXkRfNFAcalF/Ecux72a7f7evDRFE49dLqdpM5kvvnXCDLHWxBA8HbmPkq5CEBBN/rPmnZogblQDxLC6cJpybXQ76eD8u8nRcWQrOYQAyH8Di8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WajlDcbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WajlDcbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BBF1F000FF;
	Thu, 24 Sep 2026 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790277037;
	bh=Kd2YCVG/DT6OoKg16iQl9WZoswB9MDypzc/aqsM6ReU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WajlDcbthQEkexNwUprP2yxNO2wt9mEX3S7zwc3uLhnwaNrXHnCd/CWoHz8xtW4po
	 VZOa2opqqxC6xUvfzvrJMA4Q5Ryt7jy7Hsf7uXf0xVoYSrtXsZ8eSqpGClR9Sr1IjA
	 msWNIKTHFMOeiqS1nJogKNueQ1LESMz905bnXI+vKn0Vw0+V3MhM9ULENzgH6j5Yt/
	 dwLFeTxCjQgQtioaSmLw3vjX6YHGQgmCoHb186I/GyRcZ9Eqfe4YJ6cipMu0Bctv2T
	 2/FO18CZM77pkDVe6N1WSc0r31+Okh9qiOx1LxYHavwwCQfG9t3lsZCBY8T13IOXGF
	 s9odmWuDcxrNA==
Date: Thu, 24 Sep 2026 12:10:36 -0700
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
Message-ID: <arV1rOMRG6D9erK8@thelio>
References: <20260924083439.461769-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924083439.461769-1-peng.fan@oss.nxp.com>

On Thu, Sep 24, 2026 at 04:34:38PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> index 6d4386eeb7dae..854b9c48816f2 100644
> --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> @@ -205,14 +205,9 @@ static int atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
>  {
>  	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
>  
> -	if (enable)
> -		return regmap_set_bits(gate->common.regmap,
> -				       gate->config.reg_offset,
> -				       gate->config.enable);
> -	else
> -		return regmap_clear_bits(gate->common.regmap,
> -					 gate->config.reg_offset,
> -					 gate->config.enable);
> +	return regmap_assign_bits(gate->common.regmap,
> +				  gate->config.reg_offset,
> +				  gate->config.enable, enable);
>  }
>  
>  static int atlantis_clk_gate_enable(struct clk_hw *hw)
> -- 
> 2.50.1

Reviewed-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>

I will apply this to tenstorrent-clk-for-next.

Thanks,
Drew

