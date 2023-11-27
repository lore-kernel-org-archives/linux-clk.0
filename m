Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB971117;
	Mon, 27 Nov 2023 01:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXn7g2TQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A933C433C7;
	Mon, 27 Nov 2023 01:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701049874;
	bh=Yf0RlBxKkCevPjhmtcy8RBWl1zH+HJ7Gi5giPrZ5sic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXn7g2TQj9cWxkorbt+odUR2rXY9meKB68fjEXBTF/P2VilGgOyiallCD+krNzPBN
	 0LF04oB9Bo2kqyuCszefkeXMM41hMhwk1Kdem+u5QGz4YYr3/rmuaUcAMZy9NWSLvD
	 Lls7iS8awLOE6Bkjszv2ppd47wEo8r8K1+02gHDemt6tT1MOB9NjjebMZzBabV8Cz1
	 tgG/7jfXWLawi9jF4GOYfYzQIfRm5t3qHEpduR9ANZIxgqDbxlWlkxV51KM1hAW0QE
	 0b7hoOQBWOqdDDyFAGQ4gdsRxvsnEvC/WYWXjfjlg0Ii6NMThQHlIFhjyNB8XTvMAL
	 tlRTAXSdVYdSw==
Date: Mon, 27 Nov 2023 09:51:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] imx8m: Add CCM interrupts
Message-ID: <20231127015107.GF87953@dragon>
References: <20231012083123.2729494-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012083123.2729494-1-alexander.stein@ew.tq-group.com>

On Thu, Oct 12, 2023 at 10:31:20AM +0200, Alexander Stein wrote:
> Alexander Stein (3):
>   arm64: dts: imx8mp: Add CCM interrupts
>   arm64: dts: imx8mn: Add CCM interrupts
>   arm64: dts: imx8mm: Add CCM interrupts

Applied all, thanks!
