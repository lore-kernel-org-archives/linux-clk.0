Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB13E331ECD;
	Fri,  3 Jul 2026 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783059344; cv=none; b=HGxrL2lLK5ukF0611QYnqyrw1vkwtxkGRa0L/LHV7vkxz8eximEd707kcCyhUs2uRxcGr3sLWj5K1Unrw/LO4GzcEEu9QegkZSy3GdJfbBfJW17EhqxDU/Ywip3kVqgRO6d1gbc1LiqzpTnwgfKTiOyZUL/hyZeiHXuGtYh51BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783059344; c=relaxed/simple;
	bh=pY5hqi0+reTptXuZwHs9IeB9paJDLSD5xGycgtC3hLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOu8X0ZHudAUEo52fz1ITShEALUrhSjLLHWnfVKS+QgjEWfNdma+gaRCPR6Yt0EolVqVU7yo1gsjT3JL2Q7T/BjYA15fssZqczCLOwO/pWWcTNiqPX/gBM1Y8gEvHC6fN6fLF0UXmbIHzlFGUZCSZLF9rCcTBE8sllxiUAgmqfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTAcMmNt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTAcMmNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6310A1F000E9;
	Fri,  3 Jul 2026 06:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783059343;
	bh=ivDUJNOEvDfNkuRKqBghFP4Jc4tBNoouNPss6oOibWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VTAcMmNtx1bJ77NW6v9C22knTL0q6dRUfj5oR95c9gY1Kmi6GShLBxD+NxavhyODy
	 scU6ULZk/5aCbr3w8pQcUsWh5+UZpi1Tz3Gyr4pTw9v9SUMlNofCU5w9LUlwljHaHK
	 ApBOPr5N/VAnoAyNMa6UikBeAYrbggxcyPsAulXSlybWFclwJwZkNCKbR6e6YZ7eoT
	 4AeAz6K1ui4Xtd1x08QLg8jL3ASq1jgzXsiwMgv5JBS0tuTKRgQlEZSocqy1kcimQg
	 MnS41xMTHKvM5UVJLIyyYY7UDmQqn2PgA0Ot22Q0JxU3HgaT57l1RML/aSaR9G8uVb
	 zZKiVrtyXDacA==
Date: Fri, 3 Jul 2026 08:15:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/19] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 missing power-domains property
Message-ID: <20260703-positive-arcane-limpet-c5422a@quoll>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-3-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-3-cc13826d4d5a@oss.qualcomm.com>

On Fri, Jul 03, 2026 at 12:01:25AM +0530, Imran Shaik wrote:
> Add the missing power-domains property to associate DISPCC with RPMPD_CX.
> This is to ensure the genpd performance state votes on the GDSC to get
> propagated to the CX rail and to avoid the rail under-voltage conditions.
> This change breaks ABI, as the power-domains property is maked as required.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

