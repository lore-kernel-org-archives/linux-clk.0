Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B18B1C1F02;
	Fri, 27 Feb 2026 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772235058; cv=none; b=GxxMpijHGEEJIh136kSMNSfzmjsf6VUiPXv1h3CYUlDKpFHZG/3tMA/ZMR0lx2/Swbwgqvg/TZ9LBGbE5WlkSbKOO/FASv38lF+JHKr8jZxBt09Y+BRYGw+Z3+tEGSuS5TKLTCMzBchATpeOxhsPazFmBuLE5Jgye5KShoUF1cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772235058; c=relaxed/simple;
	bh=Lwcc9URf14dHVzzxPtmFHc76iirTitobfd0XRDxX8Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VodkDdXpzpTJTgKciad0yDm72kl909sZgMHDDwjDw6WPDc6WDRkI6dZTf76UF1shgWBpe6v/FpBc+U3HDuRvrRj/w4DYaVmA7ZTcqNh3FA5gy/HcxIrKAmraHYN2lX1ZtbxpZAza1/nwb9JsL4U4CZA9unBIrftu0hfwQQ97ln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u08WgcF6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u08WgcF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3586C19422;
	Fri, 27 Feb 2026 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772235057;
	bh=Lwcc9URf14dHVzzxPtmFHc76iirTitobfd0XRDxX8Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u08WgcF6VOE4UW2WXxINT9tUE+z80VYkHkl8lpYH+0C/t4hBgwoSYmEI7fJktGJtu
	 acPA19t2lS+7bYJK4cXImNMlkiwR8AU/joUdK1ZoYJW4R/vFn0iSIOQMUrVYdpNaqi
	 yTS9kOtaaHpAfPTT2Sa7UCPhsDD3FuAdhUtcMN0GFESIC9GC/pCTtsgzgZN3vD8cUv
	 s3ES7ybw8A0sJDhkdbZWVkMoJIzyIRYnaN0FUqwlxIEyvl8oTDtiaztsoyKQf69Wk6
	 2nsOQUIqbs+rI+8sj+VN5CTPfiPJ/DBfpp3JmYyfhQwhHMdtEp6AmbMYx2QLqzyKfW
	 agt0YI3MwLLMw==
Date: Fri, 27 Feb 2026 17:30:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Peter Chen <peter.chen@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Marek Vasut <marex@denx.de>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>, linux@ew.tq-group.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 1/5] dt-bindings: usb: cdns,usb3: support USB devices
 in DT
Message-ID: <177223505600.967600.5996144600232538797.robh@kernel.org>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
 <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226153859.665901-2-alexander.stein@ew.tq-group.com>


On Thu, 26 Feb 2026 16:38:50 +0100, Alexander Stein wrote:
> Reference usb-xhci.yaml in host mode in order to support on-board USB
> hubs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Fix commit message typo
> 
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

