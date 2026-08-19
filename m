Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748384483AA;
	Wed, 19 Aug 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133011; cv=none; b=iTDXjDDg9970svqHXYDAKc3YgkEpOEhxdjIr28nYKop8iUpSz2NmxdLkhlRIxRXwky+9e+sG4SAdldzFrzSfNX8uDg3cuoBK9Zhzj9J0b/wyBSyUVka8tQxySfqqV03mW8W247eIdj03VeTCX9uPpvePyJhvC5+uRdgBZdL21ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133011; c=relaxed/simple;
	bh=DpXntPZ3BoP0AVYIxtAazsteJLVEou8wjRJ/bEJj8nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jopmWng5gl7n+swOlixI7UzsHubFSwuYFqANjoRcN3Ds+AAyHijIXPxtk7uyHFDcZwk3CtxlMBSW4a2xALxgQmZT5K3+zM5sAvNwz0XFgsdoofceZaDlrJQ848Cl0qBF9oeojNVqlj5Z2NsEmn7AK6u17Db0nyhFyy4n47uo65I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZ5zdbTO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZ5zdbTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3C61F000E9;
	Wed, 19 Aug 2026 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787133010;
	bh=eYcOOqJFiHVvU01iJ1udVI3PLSzehz8NHg9BdjS24sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LZ5zdbTOaWBmguz4Bye9JuKnaQ08XYok0ywjAQmcGM30R7dfnTBT6ZvU0vKPiFSiQ
	 9E2EMpIxNN0O229kmYgCZqXfZIX3sTlFAeIojzchRK3Xsn8Kp9p9/r0M4KFTxC8csQ
	 /m6Cf2PV/2Qcfrqi07iweXD3t2ADhXn7P2swGtg1e1eLsC2ez+0hq5yOyRQ9gRq0+l
	 WopU7XJCW12ZshFuwDIcxNr+Il2yhXG8nYUkFhIZRuZxZJMVd1hqXmE+ibwYc+ztvv
	 Wgoj+p6mCDmWRgJLM+M2GQX4qeemnVPZ6CoX+YVdkw8ZM3mwBCyeok8gspQgosLgSt
	 zeaEKdbvnx2Rw==
Date: Wed, 19 Aug 2026 11:50:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, 
	lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org, 
	davidwronek@gmail.com, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Message-ID: <20260819-statuesque-shrewd-sparrow-deead1@quoll>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-2-sreeshankar0910@gmail.com>

On Tue, Aug 18, 2026 at 08:07:43AM +0000, Sreeshankar K wrote:
> Add the ID for the Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)

I will not be doing work twice. I drop all your patches from DT
Patchwork now.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof

