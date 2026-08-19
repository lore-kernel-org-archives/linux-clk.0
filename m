Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76133A3821;
	Wed, 19 Aug 2026 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132967; cv=none; b=j7hqn80S/cNc19YL9Rcl2/VCtbY6NhO1E0ZvmlGKBsD6ixUpO9jWtLmbY5ImbKYFxA1JhgIL9U1z1Rse+NoTAEJIJH0Fwm4kNOZMaJGZxLuPOayaBovsJ/4WHDs+IwDd6veHIS78uqqE2b7CL7bAXoW7A+lb4OD9t1SwKQxQbzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132967; c=relaxed/simple;
	bh=SU+m4Zt7zk0G4EhRtG/0DE82hEVIQEVfeBuLOUt3dM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjBuvjfWHAACzOMz6kytdA/gmdsWfQk0el2bcOxOs9FHK9mReOmOuo7h5dL5kMOb1/+k+gV3YakDZuAr+qiWBL6VAY3S4L4+0rILk1jIW1NZrsH6/JnMmMQaBW6fNPrHeC59O2JxKK4aPnKhbmF4hCzq3utjSxEbzqVaoArtnbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RepzUc4O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RepzUc4O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259D81F000E9;
	Wed, 19 Aug 2026 09:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132966;
	bh=2Jtg0RhLevYmj46SQzVj4qpZFeAOA0vuI0qSYGzUo3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RepzUc4OoslIwML/oze07cBx2MFNwTITrBP3ghWUNUSP2MO9ofMVt7xEA9ufJ5fla
	 KgXjxcHovNFuDPRBa1/5UL0+imv9MmsTd+E8smVQOH3Wcf3O03blcha4/fMHzgH+bV
	 ewIRDM9U8ohs9EBqya6gHXQFncbcxRJ9TMokTsKPPCqI4FmrbjhdcbNKjfBSO3c2xB
	 E/TSZGp6qV2/j1hxigcLkRtzhXE5aPzPAnXchN8o0RQKOIMKpYPjT6nni3b0mRP0hT
	 dP10qcLAshzAn+Jg8lo1a/520lntD4Vhb8BaP3+UumMLFu4G18awE6DGE6m0ghG/X5
	 0WjhIQC3yFM1A==
Date: Wed, 19 Aug 2026 11:49:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, 
	lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org, 
	davidwronek@gmail.com, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC
 bindings for SM7250
Message-ID: <20260819-frisky-important-wapiti-fc50a2@quoll>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-6-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-6-sreeshankar0910@gmail.com>

On Tue, Aug 18, 2026 at 08:07:47AM +0000, Sreeshankar K wrote:
> Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Best regards,
Krzysztof

