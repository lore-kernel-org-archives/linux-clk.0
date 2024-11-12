Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D44206951;
	Tue, 12 Nov 2024 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429673; cv=none; b=QSZnDDV2WL4/vs8C56tqmpsr8ViiaBfLOXD/lXmD2dtklHm1ipIcdaad4OqeRYk1JvTnaP/7D+cBGSxLEhqcfAGwW13NmH2TKrvjDncfO9+6nmGxhjot6DGCKF0lXZ+ItvxnRIGnNBD3PrMjjsOmOoK1sPz9iy2REvmzAMm0dq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429673; c=relaxed/simple;
	bh=L5ldS4qQz4W5QvNCrfffGW9Naq9k4ElQOSZrO4XMMwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYYKhNzDLv+KSKXB7/iobeJqmd1akCmLi/ZqY3O8+8WaHdKBeZhs0gY4h2c7XljFvkRPTEQFaHcm9qHFenB1hjFTSKp9+TLPNS1aCLoyARCMJhy6ekdBpQkxbT35nSM6WJixEgO0LxpEYIlw7ChVKi0Cvi94QgkZcTAx23yxZp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Is/MmXS6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Is/MmXS6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930D6C4CECD;
	Tue, 12 Nov 2024 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731429672;
	bh=L5ldS4qQz4W5QvNCrfffGW9Naq9k4ElQOSZrO4XMMwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Is/MmXS6AkEPeM1VuJ4CdWet5pUVJmJg/wIcnK1ZJJC6TKrqpbv1ps5xesKx7vmC+
	 OO4F9hY8mM5n9Jy+/DemwoNL4YoSmIOpVEXEF0Eg8SE+zjz+ndV/FAvNBNq00bugwh
	 QuAqsvC1248JLaB2b/RuM1Wri1fkHcW9eYkD/CBdduagI936+3zmP/krklHu0Z/65a
	 JpLdObB59VTLdcNfx+CP8JDeJ1oOKS/m6KZ53ndVBfBHMYzaDLmu2DKSjbrKHJLkEb
	 mMtu+3yqFdTpmvny1nNkMv1pjMTFG+ddqcJ2UY8Qi8s7nYfXYw8D01Ym0YSbqnfDXW
	 0U+SclGKC5cNw==
Date: Tue, 12 Nov 2024 10:41:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, upstream@airoha.com,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, ansuelsmth@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lorenzo.bianconi83@gmail.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/7] dt-bindings: clock: airoha: Update reg
 mapping for EN7581 SoC.
Message-ID: <173142967018.1156530.7241636919526215529.robh@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
 <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>


On Tue, 12 Nov 2024 01:08:48 +0100, Lorenzo Bianconi wrote:
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

