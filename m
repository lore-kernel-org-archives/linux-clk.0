Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22C636D;
	Mon, 27 Nov 2023 02:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8zq0IJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E069C433C8;
	Mon, 27 Nov 2023 02:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701052404;
	bh=TC8bErlTXY8SMV34kwRk2apyEXaXxVE1iXS1SQVMkzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8zq0IJIMr4irkYsiRwS0YT6Ed/dTUSuXZI+SKmUtBitPCyDUkW+sqmjJClOmi5J5
	 KTXibohwgc6olsL+QkYHSKG2SWYvN29FLrxs5GkLjaAXYFrQP9HKerL9GXcam7Dczl
	 t/VgAWqPLVoJxRm6zpdTmkcntL8ItzWRpO2RjCMLOO6nFbZPU6Zjf4ulfwZ4uIsbDL
	 1/jwFSj+8zzSxBFFb1xY4jnQ/DqNEIk1eQdYTLrn3rec/9ebzMY3yjHM0OSGqF4ON/
	 iDoYLHtbo/0/eyiEReDQpxcEvKlAtI0+7y6iHMcyrH57H2CaaPW3xajLGgEKcPfi7m
	 J34NJDUTn64rg==
Date: Mon, 27 Nov 2023 10:33:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, sboyd@kernel.org,
	abelvesa@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 2/2] arm64: dts: imx93: update analog node
Message-ID: <20231127023317.GL87953@dragon>
References: <20231025072242.1134090-1-peng.fan@oss.nxp.com>
 <20231025072242.1134090-2-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025072242.1134090-2-peng.fan@oss.nxp.com>

On Wed, Oct 25, 2023 at 03:22:42PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The analog module produces PLL and OSC for Clock Controller Module. Since
> the binding doc has been updated to clock-controller for this module,
> Let's also update the device tree node.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

s/analog/anatop

Fixed it up and applied.

Shawn
