Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696261A724C;
	Tue, 18 Aug 2026 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787087871; cv=none; b=Szx+7Ocpaiig+kDSwhld18Hc+UwMU9QPRwKqKGlojCMhNE5tzoDMW4gymkxFlDQqojXilLYj2OejTSbzZEnlX9kUAsYFAGMGBfVV4VC8LHwfARkddJLlquxcf850CGff/Qp19T+qnHAPkRCoVopyy9SE/D2EN9NLPVvU/SrZnH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787087871; c=relaxed/simple;
	bh=tlaJXcAWu+YvXDC7AuDPXCUFRic9GKTTPjN07e60tas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtqbPSgzfOtBgKD/zrZQLnbDGZJt9t8/UZfQYG1HLNGUyqjNSqAsS0777yFHYrBR9DjCkGrrClq/fCeIw4RtYQhR7wRRpG3r2zXOnehsjRaJhWy8+0mqoqHZcrUmqCaf1kYR4TFBMtMRhg6OQqI3GZCzd3V4ya/U9wC+QLJox0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlV+gYnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlV+gYnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F381F000E9;
	Tue, 18 Aug 2026 21:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787087870;
	bh=+xFZ/+CnJpx0Mz4gtUQgTIxXsejerkxZSdKVsRDlxf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KlV+gYnIIlPS7sACV0xwKgm5ZtlNrtCNStqCxTYQJHO78mTlIPcvTGF9+yRosxvda
	 5/943Tzwp910B++jMLoHVdkyXSc2J8kP1dIy5s2sXV62H5Lp/ibBEooqJe0ZRMLT8S
	 TYeuE8NjvsrGyvA1tOxbf/P3S6tN3PadRwmo6oFuHk8MhZL12asw7WykHEYM3gsjW1
	 fXRnHeacGWIKygqXaEctRA6tOfjB0o4B9WKWLc2F2zaCTVLZInJ2xQnrPU/aJkGRe8
	 A20FqjDXwN1aQyyc07PzHV6e0zHurbpyl4tli2vWK9x4YBEdjplWXSvBdH3KV4Rnvv
	 vXjerA++h2oUA==
Date: Tue, 18 Aug 2026 16:17:49 -0500
From: Rob Herring <robh@kernel.org>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, konradybcio@kernel.org,
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com,
	lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
	davidwronek@gmail.com, robimarko@gmail.com, linux@gurudas.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC
 bindings for SM7250
Message-ID: <20260818211749.GA687014-robh@kernel.org>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-6-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-6-sreeshankar0910@gmail.com>

On Tue, Aug 18, 2026 at 08:07:47AM +0000, Sreeshankar K wrote:
> Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>

Missing tags.
