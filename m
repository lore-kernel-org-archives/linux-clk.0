Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E057738E8DA;
	Wed, 22 Jul 2026 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733867; cv=none; b=IwiGc1np3UDLmQsgBQVMrMUDFzFWt2k3Ch5JLa5+S9Hzn/O3Z0fTAokKdwc307L0T5WwKLha64S/ENNEwoMdnyUJ1Y9s4u+wDqbJvK2CRFyTtgpH3jxU0jRqEYKz6a6cERGE+FtVyogxaJW8PEOBapK9hoCfjWnRwKA+c25s7nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733867; c=relaxed/simple;
	bh=i6OzKWUt/CfLy6aCC2pWpcXILO/HblHnAylZ9gBd+AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6HEa+4w2ZYJ3mm19V/BfHXnLQKsPo8XGsFw7q/P/c99N6LUKDcTu2Lxisp0sdu7Uck8SEi18NF1+X3DHUDxDbbs4KgGDXUbRVZ6QUhaoTu9aR3ixcqay+iAnImIf6dGZ3UyJ/v5gog/0Ee5Fe6HycnmE7V4Oa2rrZXNuYJqeU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NznqlKVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NznqlKVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C211F000E9;
	Wed, 22 Jul 2026 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784733845;
	bh=EPjciZgu6lIAEUFV6/Ka2KEfnA2GxcOi/d9Jo5kmH/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NznqlKVcbnI5yXI0tPxRHoYPbEq02xDWAarChyV/EZhc6njhQN0757P+csA/GPdx2
	 28frovJhXFnC/3oesqAe62Pzt+CXMWzfLxpDjczPQBWmklAqwrOAH43de87I02MGf5
	 +fykRtDCiwcunahouDbYgHsYrNmoldyOfPNhkPBcOyP2Nog7R35uG9Q0nAaB0w6aag
	 tScpfVlUSm2iaOFZarMpMF8eCYcCAuReUGvht5am6Ah+qkaUCtEnnc3GVj+TmnBtKw
	 W+xY3MWg8trvuEQaW/+7/snNl+E4ra800Lug/mw/GOFLzCjLsJGXXKbxEnLetZn9y3
	 hLU5RRDwZoSMg==
Date: Wed, 22 Jul 2026 10:24:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: clocking-wizard: Add
 static-config mode support
Message-ID: <178473384283.951931.3125163724375199734.robh@kernel.org>
References: <20260709111403.1579159-1-shubhrajyoti.datta@amd.com>
 <20260709111403.1579159-2-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709111403.1579159-2-shubhrajyoti.datta@amd.com>


On Thu, 09 Jul 2026 16:43:56 +0530, Shubhrajyoti Datta wrote:
> Static-config MMCM/PLL ratios are fixed at IP build time, so the kernel
> cannot read per-output multiply/divide from registers and needs DT pairs
> to register fixed-factor clocks. Also add the tuples by pair in example.
> 
> In static-config mode the IP exposes only fixed-factor clock outputs and
> has no runtime-programmable registers, so reg is not required.
> Make reg optional for static-config
> 
> In static-config mode the AXI bus interface is unused, so s_axi_aclk
> is not required. Allow clocks/clock-names to have only one entry
> (clk_in1) when xlnx,static-config is present and enforce two entries
> otherwise. Update the static-config example accordingly.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> Merged the similar patches
> Allow check for current dt even if it is unused.
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml  | 53 +++++++++++++++++--
>  1 file changed, 48 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

