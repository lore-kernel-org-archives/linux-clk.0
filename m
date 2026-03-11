Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7A329B8E8;
	Wed, 11 Mar 2026 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773247782; cv=none; b=jax3ajd3moC81bRswMOvBwtermolgPgwv9EsRERuA+hR71K22pkE7ZFXx4rRx3CC/siIsRxU9QNbh96JCgKkosaaDgVqvpGR0RZ6jA7FTxSUBEU6uL/lm8uWNASv94CQFPVG1h2tO5rIXBXpWEhiKWyzrJNDpnfDiXPDutEd9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773247782; c=relaxed/simple;
	bh=L+Z41iBxmL9bDC/+5byJSVTm53cIJcCLHJ3pqm2b1eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCYkSN0IMSNuutqpwkk/hfWPI+MUXAz5+YvKjrqmZD+TuCILgYRqegdEXXwR7dHROUG/ij4YrvDokijlSLB/00251fmH1x4osn6w1UoWvuFQ7+qVdWGsgv5fMdLTSibgfdrEQNKRehDqoE7Uw/uCNmET5tEHZ8Yvd3ZM/+BT190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1RCvb2L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1RCvb2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC654C4CEF7;
	Wed, 11 Mar 2026 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773247781;
	bh=L+Z41iBxmL9bDC/+5byJSVTm53cIJcCLHJ3pqm2b1eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1RCvb2LYs0w+E5E5Q4zBFx7t7yM1DIZAJhNB26Yfi+T/Q3HT6JelU8TvPCRehsFv
	 OgaLkbjx5UScyRGWqMi6bo3sIQ4sfTapSx3g7AbOBfhGFX/sq/Elw+j2ep2OaA5JuH
	 HhKfaA4VmKfGdl9OD+mQFw8JzaqgongxtYtCKtHQccr2wYZoLRynbi8+7upGKWTOza
	 LGh0U/Yh6sqtPKFb3GxzhZTpzqPSQUGn+m05neR5aE4Sa+u/+w8paPWfKZpOxhJmi3
	 0Xr71Q1xES6voJK47Ktb8nDjfLffEppYjHPrj4WX7XgpmbPpoiOhy0Z3OJBZ5/Ym6H
	 /lYqKQlMIH3ew==
Date: Wed, 11 Mar 2026 11:49:40 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: versal-clk: Reorder if/then
 conditions for Versal NET
Message-ID: <20260311164940.GB4041143-robh@kernel.org>
References: <cover.1772725183.git.michal.simek@amd.com>
 <7241fe512ff677f7aa5b7212ae4056fba01f1f59.1772725183.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7241fe512ff677f7aa5b7212ae4056fba01f1f59.1772725183.git.michal.simek@amd.com>

On Thu, Mar 05, 2026 at 04:39:49PM +0100, Michal Simek wrote:
> The Versal NET clock controller compatible is specified as:
>   compatible = "xlnx,versal-net-clk", "xlnx,versal-clk";
> 
> with xlnx,versal-clk listed as fallback. The original binding had
> two separate if/then blocks - one matching xlnx,versal-clk (2 clocks)
> and another matching xlnx,versal-net-clk (3 clocks). Since both
> compatible strings are present, both conditions matched simultaneously
> and JSON Schema applied the more restrictive 2-clock constraint,
> causing false "too long" validation errors for Versal NET.
> 
> Restructure the allOf conditions to check for xlnx,versal-net-clk
> first. If matched, allow 3 clocks (ref, pl_alt_ref, alt_ref).
> Otherwise fall back to the xlnx,versal-clk case with 2 clocks
> (ref, pl_alt_ref).
> 
> Add a dedicated example for the Versal NET 3-clock configuration
> and split all examples into separate blocks so each compatible
> variant is validated independently by dt_binding_check.

Really, the problem is xlnx,zynqmp-clk should be moved to its own 
schema. The only thing common is #clock-cells==1, but that would be true 
for hundreds of bindings. If you do that, then the clock-names can be 
defined at the top-level which is preferred anyway, and the only thing 
needed in if/then schemas is 'maxItems: 2' and 'minItems: 3'.

Rob
