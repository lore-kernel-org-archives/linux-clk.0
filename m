Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277514;
	b=RwJtmqLru68yz8xYR2IM0zMGq0Vy+4YEbkzWpAnv3RvU8UTGXIRqy7bSKeOgPp8xe7a7
	 Wcwuu7TelHY7MitakW4yoSFqClar97P1ww6VX576yubftmhmh/GxdEpn9dsEFcCMJ7NyA
	 7NIIiEtjdvAwjWihidEXEDo3D7OIssofHd7nAsJxWqS0LhcslIg6EB1V6GKN/JcwvnUPL
	 szWaoQm+M71z5ul4hZ57lxP9TlcnRAQ1wPXp3t35oW1a2EV8AvbQ6KauA1SmwMazpBNPH
	 IoviDQJOfqv7aF9qhoWUOZ0wY43kbWna6CBv4W5YDEwQrVtsvyZXcyXoS8Ogd4l/qbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277514;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=m0WmDK5YpzItIq6Iup6bRPbDV3Aahu+5M6xQLHZAPnk=;
	b=FKVlj6pNS/+xyEzSnIpHWnF89OQhLEz1xjfXreiC4vFRthzouONqq9bEp6y3mbxgYaaU
	 w6z+clwIQ42VrYFE+1fRueOlILllLLF3OoBydKsJPPhW8QFghH54kIWaK1l35fRYyzAiS
	 4avRnsjN+Obr0d7ttUL+nIJUuAojewCwnjVnsqnFa5oOxDQMoVgMD19vD8ZarodvVCfDs
	 mknE0F81FpKT3BV1V+oterY5of5bYJ+/Te2i2DGG/uA2ZGm0HJOCXBvjZjocjeZ0yCsNR
	 TocLnxPwZlwJoHODm4fMrRqFd77BfpRyI97v9904asm33N8dzS3F+ns1WBgQOnVa1Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0Lz85q2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E01606A31C;
	Tue, 10 Nov 2026 02:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g0Lz85q2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A101F0089F;
	Tue, 10 Nov 2026 02:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794277513;
	bh=m0WmDK5YpzItIq6Iup6bRPbDV3Aahu+5M6xQLHZAPnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g0Lz85q2AHQWzKjntw9HrsA7ZBloF/oHI+qwb/PUEv+v9RoLDNmjPCk2j3L3r+VKW
	 Rza1QBHSdOJJpg/hxREajrAKVACTMkJsijDSLvkaiZ1Zoa51q4Z7qt7ydiLP7kgorw
	 x5jBMFksKMgTBZuSTSZqy/nSa8IVcp9IRH6JI1wSrZ2uMqkJEvyEqqHhBP6+AXzrCd
	 4duiLO+5vfpOzag2JOnHGjYP0KKlVAziEQeq0xk2qaiLi5OVY91+DfD6tVIxNyXwQm
	 dK+STGyp0srf5t582XDAYgNvnEgp394YvWD6AM9IZo2b+BaRzKdMG5DZSheQmO431E
	 vF5UqYih4kgxA==
Date: Mon, 9 Nov 2026 21:25:10 -0500
From: Brian Masney <masneyb@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] clk: add a driver for the ath79 PLL controller
Message-ID: <avKAhjtbi85dpGoV@x1g10>
References: <20261110013646.1582970-1-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Rosen,

On Mon, Nov 09, 2026 at 05:36:40PM -0800, Rosen Penev wrote:
> The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
> arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
> clock before the driver core is up. This series replaces it with a new
> driver in drivers/clk.
> 
> Only the reference and CPU clocks are registered early, with
> CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
> plat_time_init(). A platform driver bound to the same node registers the
> DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provider
> returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.
> 
> Patches 1 and 2 move the two remaining non-clock duties out of the arch
> clock code, so that it only uses its own registers and the clk API: the
> QCA956x timer interrupt workaround, and the reference clock that is
> read from the bootstrap pins when the device tree has no rate. Patches 3
> and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new driver,
> and patch 6 removes the old code.
> 
> Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
> DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
> of the old code. The serial console, both GMACs, the PCIe PLL with a
> QCA9880 behind it, and the WMAC all work, and no devices are left
> deferred. The other SoCs are not tested on hardware. For each SoC the
> rate calculation was compiled in userspace together with the old code
> and fed 2 million random register sets. The results are identical,
> except where the old code overflowed 32 bits with register values that
> no real setup uses.
> 
> Changes in v2:
> - Post the new driver as one patch, instead of moving
>   arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
>   patches (review feedback).
> - Register only the reference and CPU clocks with CLK_OF_DECLARE, and
>   the others from a platform driver (review feedback).
> - Describe the SoCs with match data, and read the CPU, DDR and AHB
>   selection of AR934x and later with one function.
> - Keep mapping the AR934x SRIF block from its fixed address. It lies
>   inside the wireless MAC registers, which ath9k claims, so it can't be
>   a reg entry of the PLL node.
> - Drop the clkdev registrations, which have no users.
> 
> Claude Code (Claude Opus 5.5) was used while preparing this series. It
> wrote most of the new driver from the old one, together with the
> userspace test of the rate calculation. I reviewed and tested every
> change and take responsibility for it.

40 minutes elapsed from when I asked for changes to when a fully formed
new driver was posted with major changes. Your cover letter says this
v2 was tested on real hardware, however I am honestly a bit skeptical
given the short time frame. On top of that, that's not enough time to
also go through what all Claude did for you. Please slow down!!

I'm going to pass on reviewing this version. I want you to take some
time to test this on real hardware, and understand the code. If after
that you truly have no additional changes, then I'll reconsider
reviewing this version.

Also, if you want to help, then consider helping with reviews on patches
from other people, in particular with the large series for the new SoC
vendors. It's a lot of work reviewing the flood of patches from
everyone. You can see the backlog for the clk core on the kernel.org
patchwork server.

Brian
