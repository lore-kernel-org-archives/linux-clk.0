Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35AD4879B;
	Tue,  7 Jan 2025 06:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736232833; cv=none; b=XTgQuecekEFEbuScG30oIVL7LB1GP1DWGK0tKGEO3nSZNPT0UJggiVRtifiDnOATjxs2ZC2PvgSe7B7sFqZSCxofMwoODkhHf2MkJCNmRcP5H3io4tv1n2Illl5DoevXlXJDy1z3mZsIi9LO8bUSlD8vcGRVE1yGMXX0XdX705g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736232833; c=relaxed/simple;
	bh=m3/FRQQQbKPAM/g2RJnoojFYDz9f1uIEB6/zyLc8PVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWHGNlmd2iwsf2BfvJHMvndDL3p0V1ryJfNd0lP6MC9Y5l9TCwZmDBk/MfRzoXqpGQJOHhw7N5fc/nN1wqZw+slSHN7usYlUM6VUd9IenPS7JP2e5NjOJ/oVEN6ZCu55A7j+73GqT9qTOaUzwlviZcWD1gStak++NKVwm1CdSww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9+qEYj0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9+qEYj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3064C4CED6;
	Tue,  7 Jan 2025 06:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736232832;
	bh=m3/FRQQQbKPAM/g2RJnoojFYDz9f1uIEB6/zyLc8PVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l9+qEYj0W5rZA7m8YCKC6dxSFpnQMB8sAaXNX/siC8DUpiBzFjKwhAJoLchD/zfNz
	 KKTOuTJn1DoMti6Icre22euSnHxVg5HKdsvOEI9TwcxcwzdPiEOxDiis3Y1DizZj5Q
	 SPqEfVPhgxL/t4qVVqmwq1RM481TAK8asPdqZG2pD2CL0y1SLCLsSUPHEk45q8cjXR
	 zmJPJrwoNQ/M14HOo5g4T9VafjhFHkqYUT+B155YZBizKeNQczDS79daxFfpgIOPbt
	 6T7W4lfrDIZrVQ21+e9Y9OyjiTCtfWrHyBcSM3Rekr1jUBDrelME1KVdAicoIGZ6Z9
	 8mDd6247iaPVw==
Date: Tue, 7 Jan 2025 07:53:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohit Visavalia <rohit.visavalia@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vishal.sagar@amd.com, michal.simek@amd.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rohit Visavalia <rohit.visavalia@xilinx.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: xilinx: Convert VCU bindings
 to dtschema
Message-ID: <awuqmf6zp6aosxiyibz6wiv773a2cl7lxd4boen7utytropngv@nttawblsczdv>
References: <20250107044038.100945-1-rohit.visavalia@amd.com>
 <20250107044038.100945-2-rohit.visavalia@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107044038.100945-2-rohit.visavalia@amd.com>

On Mon, Jan 06, 2025 at 08:40:37PM -0800, Rohit Visavalia wrote:
> From: Rohit Visavalia <rohit.visavalia@xilinx.com>
> 
> Convert AMD (Xilinx) VCU bindings to yaml format.
> Additional changes:
>    - move xlnx_vcu DT binding to clock from soc following commit
>      a2fe7baa27a4 ("clk: xilinx: move xlnx_vcu clock driver from soc")
>    - corrected clock sequence as per xilinx device-tree generator
> 
> Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

