Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B22637F32C;
	Thu, 24 Sep 2026 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259317; cv=none; b=j14S9/fQZplWEQ4r7VoENmkUPPTznOQ0B6fk6rTZje5gTiEUDQKKIY9yp4xOvmlVDgQzs5T2vQ0+mUhcfQa93pvkcbzflKY4j6l/Kg0EMAS8pdkhZ20ucL9bZALi6j4KFgYdgY29uDPluMbm/HAmX/Y1++GEum87M/DNypgoZko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259317; c=relaxed/simple;
	bh=v1Zl3eLodsbJbR8FP0robGqvh9JyFU2C/tAZZGtNcC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bp6lccjd4CN2T7jBJkVWtxk4/E9wUOQ5vFM67YA9rOjwYjAbalaVqmaMKAnARwhgv2WEk0w4y3PjbP5E35NdNTvUS4ITokJ+BL8QeeCTiIB1q+ilXvD5tTszI9dWWDc17Qhtuu7SImN5Dwua4dFka0AilpEAoD1fHhHTvyJdUrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBKRD+OW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBKRD+OW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DEC1F000FF;
	Thu, 24 Sep 2026 14:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790259312;
	bh=qTdT0Pnje9Db4mI6g9mHhsv+qLxeAIpDfVpVO6cj1T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JBKRD+OWoeubfRo5gPpJwJc3aBMFeibR3f8yEydfDyM/bk4aLgeJhsqPPKSne3YB7
	 D+PszabqrNryBW7EUSo1MmBTKDVi/qN+CYKGZ1oJ+viLpE/IEZqRy0/10rQ17k8vAy
	 FhQ1OyGdoF50czcfuhC8SDUE127jKXnseOA9YJb7GqhAEWN++OY2k/sTUx3IxAaANL
	 FLVDY6A1Uvtv45K1xBTseTEM/28NTBxZcU1dGulqv2zfZR7IGoWOmUEep3eWv4+8s0
	 BW4HCdA79Idm/IA/CMxP6yNFiNUzYtuAk2MHyi9ybiG1g3KFb9Nzey3h/oQUAUvinc
	 94UZc61v0Rpkg==
Date: Thu, 24 Sep 2026 15:15:05 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v12 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Message-ID: <20260924141505.GF453446@google.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-4-9c243796b6d2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923-zx29clk-v12-4-9c243796b6d2@gmail.com>

On Wed, 23 Sep 2026, Stefan Dösinger wrote:

> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
> the next patches will drive the respective functionalities.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Changes v12:
> Added comments elaborating on the role of the driver and the hardware.
> 
> Regarding the names: zx297520v3 is the SoC's name (chip marking, boot
> messages). TOPCRM, MATRIXCRM, LSPCRM are ZTE's names for the MMIO blocks
> in their downstream sources. Sadly no datasheet is available. "clk",
> "reset" names for the child nodes are mine.
> 
> Regarding personal copyright: I am not affiliated with ZTE nor paid by
> them. This is my personal hobby project. I am using knowledge extracted
> from ZTE's kernel dumps, but not code.
> 
> Changes v10 (All Lee Jones):
> *) drop "select REGMAP_MMIO"
> *) Drop comment about unimplemented hwlocks
> *) Use MFD_CELL_[NAME|OF]
> *) Renamed the device type enum and its values
> *) Use device_get_match_data instead of the of_ variant
> *) Improved debug messages
> 
> Changes v9:
> Deassert the LSP reset and enable the LSP pclk here. In practice the
> boot rom needs to do that because it prints to an LSP-connected UART and
> reads the boot policy from the LSP connected flash chip.
> 
> In doing so, I migrated the match data to an enum as mfd.md suggests.
> 
> Changes v8:
> *) Remove .of_compatible from PHY mfd child
> 
> *) Move to drivers/mfd (Sashiko)
> 
> For me either soc/zte or mfd/ is fine. Note though that this MFD parent
> is very specific to the zx297520v3 SoC. I don't expect this to be reused
> anywhere else. There are two more MFD-ish devices in there: soc_sys at
> 0x140000, which I plan to handle in the same driver, and an i2c PMIC,
> which would get its own host driver.
> 
> *) Use PLATFORM_DEVID_AUTO (Sashiko). NONE was intentional as I only
> ever expect one instance, but I don't see any harm in doing the standard
> thing and use AUTO
> 
> *) On the suggestion not to put the link to mfd_cells[] into match data:
> I see that it is spelled out in Sashiko's mfd.md, written by Lee Jones,
> the MFD maintainer. I would appreciate some education on the rationale
> behind it: Putting a pointer into the void *data is a common pattern in
> the kernel. I don't understand in which situation this can possibly
> break?
> 
> Both structs are static const in the same compilation unit. data is a
> const void *, not a uintptr_t or kernel_ulong_t, so it seems passing a
> pointer is the intended use. What am I missing?
> 
> Changes v7:
> Add phy MFD child
> 
> Changes v6: Make the ZTE SoC driver section depend on HAS_IOMEM
> (Sashiko). The entire MFD section, which contains MFD_CORE, depends on
> HAS_IOMEM even with COMPILE_TEST.
> 
> Add a NULL ptr check for of_device_get_match_data (Sashiko). While not
> uniform, rave-sp, rohm-bd9576, atc260x, da9052-i2c protect against
> incorrect manual attachment that way.
> 
> Add lspclk here as well in an attempt to satisfy both Conor Dooley, who
> asks for MFD for top and matrix, and Philipp Zabel, who prefers aux but
> at least wants the reset driver limited to one driver type.
> 
> Changes v5: Use MFD instead of Aux bus for top and matrix crm because of
> extra functionality: Reboot in top, hwlock in Matrix.
> 
> LSP clocks stay with the aux bus and are thus not handled in this
> driver. The clk driver will bind directly to the lspcrm node.
> ---
>  MAINTAINERS                      |   1 +
>  drivers/mfd/Kconfig              |  12 +++++
>  drivers/mfd/Makefile             |   2 +
>  drivers/mfd/zte-zx297520v3-crm.c | 111 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 126 insertions(+)

Doesn't apply.

Please bring the MAINTAINERS changes out into their own patch

-- 
Lee Jones
