Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193BE305E10;
	Thu, 23 Jul 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784836735; cv=none; b=E4EVg/O0HeH0rRP0LzQJppWt/k6RWUGHcQ0jdzBSHEpcJC8llOw4GHowuUwbNVTrX3Q6+huP0dB/YzahJ/AifRYJdWoWBjAbXXi06Ucp+8TEbHCNJv+3bRrjKzfy+/2JYgqTmIOUv/r4tbo/AUnBO8JvJd4jKWF7bUHumz5AnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784836735; c=relaxed/simple;
	bh=rDb6+IiiK/Em5e9P/rPZhruibLtcxRPoYm09xiRTJ2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNXfJIxvExvtiJA3L1/2ytZAkEp9y/bJnVU/vZfyKFgUp8wZenfTVqQGk5+Dul8X7sWNRNPfZTARTegya3xEbUaQV8I9rxctRjqezOMgdOxUhwZSzmRwAg/k+M7X4ZcNbXC3nk37q+Db2suDZkOli81uBgalYr8RQxb0m0AOc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QISYYc+e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QISYYc+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA001F000E9;
	Thu, 23 Jul 2026 19:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784836731;
	bh=xFs62xloECApJSdstEM8uWeR+bB2ujvwlTWvjz2pjMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QISYYc+eGPBzqECeQWCL1U06XcqSbFDyxeyNwLwRj2OcPOV67nVjsplcl5nHhwLTb
	 1X1ej6TpQXhxIkgSi7hmrXl6iMdyYZrCLz8TBScONQqL2X9d90oMc+NBUUqoNVa7PX
	 xIvlGZTYsFK0LO79Cm58uCTHsq3ygFHyLzKQFdx86ksAN3N+L6MQtzPMmE9ADHqxFa
	 eSv8H6GrFC+Ps1vfpdZSzus1e8U8IqXCXih/RUAS7nozWWh9iPj2R3XUYH92e+HR+5
	 crZVF5/NCsUaMCa8XbezMNaDA5R8QOiy2ramzNR/fippZz1aHGYg947m6FoyzY4DiB
	 UHGR7MN2hGRgA==
Date: Thu, 23 Jul 2026 14:58:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
Cc: Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>,
	Catherine Frederick <serenity@floorchan.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add MSM8920
Message-ID: <178483673018.2697116.14527575540631420805.robh@kernel.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012415.48288-2-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723012415.48288-2-aneeshpradhan@acm.org>


On Wed, 22 Jul 2026 18:24:14 -0700, Aneesh Pradhan wrote:
> From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>
> 
> Document the "qcom,rpmcc-msm8920" compatible for the RPM clock
> controller found on MSM8920.
> 
> Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
> [aneesh: split the binding into its own patch per submitting-patches;
> rebased onto qcom/for-next oneOf compatible schema]
> Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

