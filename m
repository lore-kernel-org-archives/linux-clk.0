Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24D43B71CF;
	Mon,  3 Aug 2026 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791949; cv=none; b=R2OpyHpZ9hQ2DU+UcmsSIDmqcNOFUHoRr5pLX0A8H52t9koSQad3U75pR64wL5m6xB7Nyg/R5UsM4tt2WE/F+jzngGIyjV11CrlY4DLiY3ArMn7NVhV+z73Mh9DRRKTYum4BufgFOfTJa9wsMn9Sw2+fxRt/mOlVyeJee7qeiEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791949; c=relaxed/simple;
	bh=qqkZ25K/BKU77OtJ7eUJxOV2dUIFhktcy7Ou7p4DYCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GILsj+ikAUNWIkgb1JN40vhYidefyyzYnIkXNd9aqJqXPTkpsZMSixyw00nRTHFgz02+h+QMbYqRo+1R3KASOsYvbWTvR4kyY1Ym6gNZQ2BZYiJdjjBYSShBApdPNPsK8yo/qnzs3sKnBWE5YVGe9zgTdxyG3CRtqEWuDVM+OwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDu90lKN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDu90lKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F8D1F000E9;
	Mon,  3 Aug 2026 21:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785791944;
	bh=rrnPiI7CeTg2z0kVo6X/CNgVPmUUpInO1/6eY6sI1Ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nDu90lKNIF0Q+sWF74n8GDw5Pwm9Q0pTxwsc60ZL2y/igGKgzScbmt1s1fiJpSbaR
	 wUeauhf+NWUxHJI0qHvMRxV8pqMxVcijyQHvY1FWSzu/9+i9ClflPb825ayzqUYWR0
	 JOtIwRTQQV9BcrL8ep+cBr+16JoLRC46SlqhwS77GeYqxkN5kn3eZEQvzvjhS/1iRA
	 YLo/2CtY5q7+Lt4yRlvPsVX7VRP5emensLh0UM+7T/4RY0WhzACRPzx8lCgEyFpmFz
	 HA+dwEd5Kpx2q532pYAKY/JzuINQSZUdYy7vCgLDulcdTOAGxQje0IsUQ8j4iUv+VO
	 I08Iwx4nG70BA==
Date: Mon, 3 Aug 2026 16:19:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, m-chawdhry@ti.com,
	devicetree@vger.kernel.org, daniel.baluta@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	David Lechner <david@lechnology.com>, goledhruva@gmail.com,
	simona.toaca@nxp.com, Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: ti,da850-pll: Convert to DT schema
Message-ID: <178579194306.574649.3125519666367203425.robh@kernel.org>
References: <20260723-ti-pll-v2-1-cdc5e559a77d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-ti-pll-v2-1-cdc5e559a77d@gmail.com>


On Thu, 23 Jul 2026 22:11:38 +0530, Bhargav Joshi wrote:
> Convert TI da850-pll binding from legacy text to dt schema.
> No functional change is introduced during conversion.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v2:
> - Moved 'items' list for clocks and clock-names to the top-level
>   properties block.
> - Dropped redundant maxItems: 2 to fix dt_binding_check warnings.
> - Simplified allOf block to only restrict maxItems for pll1.
> - updated maintainers list
> - Link to v1: https://lore.kernel.org/r/20260717-ti-pll-v1-1-f6f9ba8c9b5e@gmail.com
> ---
>  .../devicetree/bindings/clock/ti/davinci/pll.txt   |  96 ------------
>  .../bindings/clock/ti/davinci/ti,da850-pll.yaml    | 164 +++++++++++++++++++++
>  2 files changed, 164 insertions(+), 96 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

