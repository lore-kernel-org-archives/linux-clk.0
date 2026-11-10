Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279255;
	b=qnOhFw8XVNMvnzjuLFQT67EAa9lTv+kSSRh9ooX3DaiwzunpIts6gyDNS8DN02y867VN
	 sl5mCpgeIegu9xks4mscY9ud/RhITH7Vfs4CE2aX3kcAfXSYGLJQ5CCdqZyq9hoyzw1eG
	 Acug8wGgJf7rqn9P2MltN12ckE+s26ppxbn/NMzVJrgNGqK0TAEOfoHKCBmbr3Ubwn7z9
	 ZvoTneD4OGHoZ5/1m6zMSVw0ovrD6LVUrX4/sWO8P9i2O4WAxPV5VpRFKB/wLvbQ4PGlJ
	 6SLkXbJC/UMLiks10UC++LZ95GR0+84eqaKTSXx1mi8d0VIrbAl42486ymqEIAzp3Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279255;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=L0FesyqekxcreqPmbLKaXNf2uKAXud4unlEpOkqCHeE=;
	b=O5utS/lUbz7hhlDoyg4GrFSuAx/RXQblWMEDP0dRxqks9svPyexN3ZwqpXBBOvi6zzZN
	 sJ7iEkf+5Tt8pGwTzaWmYmh4QgfL6wnnBjEw510dy4u0Trr61VUNabCZK3mFtQ8UHdTZ2
	 1e0ctfgTFiquRiwb2MZ4kFcNitK938jhicRwZmRk+MESZlfdn19gza6QfZBeO6lqmR9nQ
	 OEDTITnnbbK56yJp3Yf6mfiEEaeU8DeqMfKOyOZpI75iHWZ2MzaZmhQEq+otcF/oo5KqB
	 oLv16NdMXD6VvxMdxFhO+o3UEpYJBzm5l1YBX8w6P36OVNfDyV07IJjLXN6rLlJaQ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TCDFt/na";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951AE606A31C;
	Tue, 10 Nov 2026 02:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCDFt/na
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1FB1F0089F;
	Tue, 10 Nov 2026 02:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279255;
	bh=L0FesyqekxcreqPmbLKaXNf2uKAXud4unlEpOkqCHeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TCDFt/napVv9OM2gzICUXVEugkfDr3IUPOknLyVhaQbC1893zobf9f4jPKA5UwIwG
	 MdCuDZ+v4oyZrqyAhwnbqF3gNMjXiWB9BVOIxXnZp9hSETNvfoSw6P7KNdLyOspGon
	 UBu2UblrikCl2jRaUO7v/KU21v/1S3BHgwl4GsgafnFJtkQS2esBNxu31Li39P5lco
	 f+M4Xi/aIrY0+kCdnl+UNa1NVbE/nrEWi8UAj69NukPDqGh8nPgcZUGj4NuWiZRee5
	 YxXIXDH2C0qVV9CjLxyjYEAjOwoL74YeL5RfMQjbySMyWpWAkFDGlMcD0T6uTHZQAg
	 JwO0Gbu+pWcfQ==
Date: Mon, 9 Nov 2026 21:54:12 -0500
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
Message-ID: <avKHVDJJkhGgyBsI@x1g10>
References: <20261110013646.1582970-1-rosenp@gmail.com>
 <avKAhjtbi85dpGoV@x1g10>
 <CAKxU2N9Rdw1vWtfxEzaiFgyzWZufWxKNQvWmW=QeCtGFa=813w@mail.gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N9Rdw1vWtfxEzaiFgyzWZufWxKNQvWmW=QeCtGFa=813w@mail.gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Rosen,

On Mon, Nov 09, 2026 at 06:35:32PM -0800, Rosen Penev wrote:
> On Mon, Nov 9, 2026 at 6:25 PM Brian Masney <masneyb@kernel.org> wrote:
> > On Mon, Nov 09, 2026 at 05:36:40PM -0800, Rosen Penev wrote:
> > > The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
> > > arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
> > > clock before the driver core is up. This series replaces it with a new
> > > driver in drivers/clk.
> > >
> > > Only the reference and CPU clocks are registered early, with
> > > CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
> > > plat_time_init(). A platform driver bound to the same node registers the
> > > DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provider
> > > returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.
> > >
> > > Patches 1 and 2 move the two remaining non-clock duties out of the arch
> > > clock code, so that it only uses its own registers and the clk API: the
> > > QCA956x timer interrupt workaround, and the reference clock that is
> > > read from the bootstrap pins when the device tree has no rate. Patches 3
> > > and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new driver,
> > > and patch 6 removes the old code.
> > >
> > > Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
> > > DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
> > > of the old code. The serial console, both GMACs, the PCIe PLL with a
> > > QCA9880 behind it, and the WMAC all work, and no devices are left
> > > deferred. The other SoCs are not tested on hardware. For each SoC the
> > > rate calculation was compiled in userspace together with the old code
> > > and fed 2 million random register sets. The results are identical,
> > > except where the old code overflowed 32 bits with register values that
> > > no real setup uses.
> > >
> > > Changes in v2:
> > > - Post the new driver as one patch, instead of moving
> > >   arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
> > >   patches (review feedback).
> > > - Register only the reference and CPU clocks with CLK_OF_DECLARE, and
> > >   the others from a platform driver (review feedback).
> > > - Describe the SoCs with match data, and read the CPU, DDR and AHB
> > >   selection of AR934x and later with one function.
> > > - Keep mapping the AR934x SRIF block from its fixed address. It lies
> > >   inside the wireless MAC registers, which ath9k claims, so it can't be
> > >   a reg entry of the PLL node.
> > > - Drop the clkdev registrations, which have no users.
> > >
> > > Claude Code (Claude Opus 5.5) was used while preparing this series. It
> > > wrote most of the new driver from the old one, together with the
> > > userspace test of the rate calculation. I reviewed and tested every
> > > change and take responsibility for it.
> >
> > 40 minutes elapsed from when I asked for changes to when a fully formed
> > new driver was posted with major changes. Your cover letter says this
> > v2 was tested on real hardware, however I am honestly a bit skeptical
> > given the short time frame. On top of that, that's not enough time to
> > also go through what all Claude did for you. Please slow down!!
>
> This was tested with a linux-next kernel on an Archer C7 v2 hooked up
> through serial and two ethernet cables (LAN and WAN). There's no
> difference that I can see between the old and new driver.

The clk_summary debugfs entries would be a good place to compare as
well.

> That being said, I only have two pieces of hardware on which testing
> can be done. Both are rather new relatively speaking. Older version of
> this series is currently live on OpenWrt with seemingly no ill
> consequences.
> >
> > I'm going to pass on reviewing this version. I want you to take some
> > time to test this on real hardware, and understand the code. If after
> > that you truly have no additional changes, then I'll reconsider
> > reviewing this version.
>
> Sashiko had two complaints. I'll fix those in v3.
> >
> > Also, if you want to help, then consider helping with reviews on patches
> > from other people, in particular with the large series for the new SoC
> > vendors. It's a lot of work reviewing the flood of patches from
> > everyone. You can see the backlog for the clk core on the kernel.org
> > patchwork server.
>
> I agree. It's quite unfortunate and have no solution to it.

Just some friendly advice: If you keep churning out AI code as quick as
you can generate it, then your stuff will end up at the very bottom of
the review queue. There's a long backlog of other changes that need to
be reviewed.

I'm not saying that you need to go review patches, but that goes a
really long way to building goodwill in the community. Maybe if you post
a large series like this go help review 2 or 3 patch sets that's in the
backlog from other people.

But seriously, the main ask from me is to please slow down before you
post new patches. Provide some more details about how this was tested on
real hardware.

Brian
