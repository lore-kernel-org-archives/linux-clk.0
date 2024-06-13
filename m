Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E914883C;
	Thu, 13 Jun 2024 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718292327; cv=none; b=bk7IFO2rOWJE6sc47AA/MVRKcgwA1NjTZToCPW4u+h8nBQ8L6k1tVgn7vv7O/bo0dDEdoAOqv2Fvtl1tJZqQ3bwES5kldVyUzC8hbiL0uZI7gGT3TTzOOIPnFFd4QqKjmTSkEGeokgILflWUHP8eudlbQ4v/OUwSRYoaPO6OTxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718292327; c=relaxed/simple;
	bh=OscKOB1D2z89VBMYTbZ/NN8eZsJLYaTLw8oUFI3CsBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P//kZ2D7tIbP5oMRHzSz+023KyaLoGcYBaDOjrwScR2DQAlP/vz09lqvX9mXaLtDJVTkxTqQ/AHDPHjN7d9xabeOYpDPvlOIo4livOevhg32pI0wJeg6TI3s0OIW7ep1XACWXxt83n8MZc4LxxCSH4FnuapMI8oNbaKSvUu6UzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/I+gODM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/I+gODM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC6EC2BBFC;
	Thu, 13 Jun 2024 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718292326;
	bh=OscKOB1D2z89VBMYTbZ/NN8eZsJLYaTLw8oUFI3CsBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/I+gODMGAiXoYMvKob2wXxkdu7eXBVdWLc5p8P0OWOICvwN8Hj1hVuTKJOCdIuu9
	 fxudY/+pj2p1D8kU2k/FoXIbh3EwGbmC5ioKNjaxQcCpgnj3mNDW/hJKd8SU4XmoTS
	 J3i3i/WsjkgEjrMW7Ij8Y/WWVbcsFuXJNMsaSn/7YTYBqHxaPvaUVY/ZD2zFvj49bi
	 bFIeQeJ/o7uARZR3Utj/1BXzO+riou0FrJ3tzd7hu02vhhSYUp2F3j57bGIR8hih7I
	 RCW+PJsRQqRw9nuv6KTLfTkQtpxxcF3cz0J8ZhbadjExcYv/i0qbuT2TFKQgYejIZW
	 JcwlUxf/2FXYA==
Date: Thu, 13 Jun 2024 09:25:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: robh+dt@kernel.org, angelogioacchino.delregno@collabora.com,
	conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
	nbd@nbd.name, will@kernel.org, dd@embedd.com, sboyd@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, john@phrozen.org,
	catalin.marinas@arm.com, upstream@airoha.com,
	p.zabel@pengutronix.de, linux-clk@vger.kernel.org,
	lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: airoha: Add reset support to
 EN7581 clock binding
Message-ID: <171829232234.1865530.2561529986125641181.robh@kernel.org>
References: <cover.1718282056.git.lorenzo@kernel.org>
 <ac557b6f4029cb3428d4c0ed1582d0c602481fb6.1718282056.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac557b6f4029cb3428d4c0ed1582d0c602481fb6.1718282056.git.lorenzo@kernel.org>


On Thu, 13 Jun 2024 14:47:03 +0200, Lorenzo Bianconi wrote:
> Introduce reset capability to EN7581 device-tree clock binding
> documentation.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 25 ++++++-
>  .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
>  2 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

