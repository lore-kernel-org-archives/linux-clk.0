Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F531DEFE3;
	Wed,  4 Sep 2024 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725462047; cv=none; b=Ru8kUeFuk9nHsx0LCAE8Z10/FQAKRu2N+9KkvnvMvw3LUV76h1p2SunDCNVEqOYOxwLPYMMGb6jE3ZHACKlbyoygDUNNxMdyjMtJu2o54vlQybSGR3KrJvTAj2FPADxg4Sdix6XKKxfYn5/BocmWXQMVrFa+8Yq5pUxQvQzqQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725462047; c=relaxed/simple;
	bh=uCWg2e4zYQIoF7w5tR8wMPbjGFXaUs+fGVW/n+kzH/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QeqnWUZlceMh90ZYjcw2CSDwjk7B4vxWo7gmIJriQg1s+s+NUWMzRAvcIzXQamfFhJBSwumF1iDcI9ZBr5jukpZhzf/MprOTAQhlTv5yzJ2d5u4kOqrUosoLusZHWP27TC/JXfWD/64rnvPfPJN3iBwikTexUxGANnMeBv1rAe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdxVIRuM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdxVIRuM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED51C4CECB;
	Wed,  4 Sep 2024 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725462046;
	bh=uCWg2e4zYQIoF7w5tR8wMPbjGFXaUs+fGVW/n+kzH/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rdxVIRuMGs5EnXW1Ylpf0/4r1TvmJXq6kxrqwToArZgo+7pEElzmhCJp1ttLyqldQ
	 I6gay62Pb53rUUoF4WHUnq2XoMUUU2+nqZ2LhmKTuqWDoitg09G9r8bTCJoI69PE1F
	 CWOWGvycglNw32/8gwnc+tjuuzNMwI6x5wIHepOOS8UDe2P5+fB8MMTr8G6JMYiZ21
	 YHsjsWrHYc1t1LYuVRKEdA8kN6XsBIxtDtXXR6A5O5EFSoBppb3wACiO21C/AEQAgL
	 E/ohuHVVIJW+DKDgaNtE0DeCLRUD2f/w2dtkjWtjn4UpThMy0WEuX5gqoUSLnLEw4q
	 qqH5dyR/kfI8A==
Date: Wed, 4 Sep 2024 10:00:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-clk@vger.kernel.org, lorenzo.bianconi83@gmail.com,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, ansuelsmth@gmail.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	Felix Fietkau <nbd@nbd.name>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: airoha: Update reg mapping
 for EN7581 SoC.
Message-ID: <172546204488.2561174.6649654649913061182.robh@kernel.org>
References: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
 <20240903-clk-en7581-syscon-v2-1-86fbe2fc15c3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903-clk-en7581-syscon-v2-1-86fbe2fc15c3@kernel.org>


On Tue, 03 Sep 2024 23:39:45 +0200, Lorenzo Bianconi wrote:
> clk-en7523 driver for EN7581 SoC is mapping all the scu memory region
> while it is configuring the chip-scu one via a syscon. Update the reg
> mapping definition for this device. This patch does not introduce any
> backward incompatibility since the dts for EN7581 SoC is not upstream
> yet.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml          | 23 ++++++++--------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

