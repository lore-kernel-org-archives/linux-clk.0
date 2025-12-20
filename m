Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753562E62C8;
	Sat, 20 Dec 2025 02:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766196421; cv=none; b=QtIPQNPlC/0FkLq8KyO/Xf3tJYEeaVCQbLDY0ApbuljOWfYw2CeCKXqkCz7Y7/t9LuZPpJHsqjaiDVR7/OFGp7naJZIhQWNHCHN1wmH6zUGxOPgcDojiUxcsG06Xf2jrrzQFiF9s/okQzgZIgf3BjDWTMvQExBD9kS2FDLGKLWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766196421; c=relaxed/simple;
	bh=wEXvmEKyIFrnHKRquW8HLOdmbtTIV8EBnBes5n6SzFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoHpHPfPFXk70wdhS6hfZVFY6HWHoRRtUg+QUBty2CfghOuL85mKgY2JzG/zTNkOyIbnNZj3bA/6DJ2PNkECeY6/V5sHOCiLWAICva23ny2vHV9etSKbSsAf/l0oT31mSPjaCseynIHSdvRD2oMUr21D+4A681grGuf8tJ853rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pu1atnqP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pu1atnqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11690C4CEF1;
	Sat, 20 Dec 2025 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766196421;
	bh=wEXvmEKyIFrnHKRquW8HLOdmbtTIV8EBnBes5n6SzFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pu1atnqPB+6Plnmla0u814Vr+bOstL6yGKPEBrVZReTYp0Sfg/2484wUdqfAeV+Zn
	 tNn3ftAEz3VwF/xX/KBdb2OZLjOZKZMaMajFcQEgy2AMROFRwIzXAoWOGcY8MSUZ6T
	 p3Up0w2hYUmqT0Sz9/OJHdJ0nfyb5cLIpfIDedJAwdpZf2CbM4+DURHn46yzdZZkCk
	 cb1rg6YdJUp3FRZvC5dwuB//UFZ9m3+YybaHpUFvxKHE3CXQWL6zQnUo0xR9o64aW1
	 GBbfs/ekwST6PPVlZ5r1x03UzcjM6WhV49J2VVjGfwO+DEKVx11Xk5WQhYDvDXvCOm
	 EBzeDyA1rjEuQ==
Date: Fri, 19 Dec 2025 20:06:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com, Peter Chen <peter.chen@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	linux-usb@vger.kernel.org, Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Roger Quadros <rogerq@kernel.org>, linux-clk@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: arm: fsl: add bindings for TQMa8x
Message-ID: <176619641876.374149.1170239999077862047.robh@kernel.org>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-5-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218152058.1521806-5-alexander.stein@ew.tq-group.com>


On Thu, 18 Dec 2025 16:20:51 +0100, Alexander Stein wrote:
> TQMa8x is a SOM family using NXP i.MX8QM CPU family
> MBa8x is an evaluation mainboard for this SOM.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

