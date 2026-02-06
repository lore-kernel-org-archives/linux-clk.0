Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468D22127B;
	Fri,  6 Feb 2026 00:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770338166; cv=none; b=qGDeQXUcllqMKtiklEsOobpCf5GZ4fa9Ln4wureYt9S7ucT8w3P4JTdTcpmO4F1AJrWrX3uJm90Vb+LrRvFfnvQZDYIX9pP/g5RcXcSakJyKApLb6HgDeNpTrOCEri3dCtW6bWZkE+03nBS2S0G9N6YSQJoap2Xvv3lWNpoebX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770338166; c=relaxed/simple;
	bh=Xhkea2uuWgsFz5RIwUPCylSMm3n3sBnhjKt3SVa5kPo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JwtIHCVdY6Mtgi0+hYGAaclUmEzENxY7MNPVNBly+pOkfGcB2o0gD7hWlLMAGkP3dDWTLY5UDtvAQ5uULNzHCMye8C3+GLyzGDjrsUVrlpiPGX5x6htApJCiNbjdgt0d+kzaNFaICLuok7H2nQmFpkys19uPe5djTlxfyEiTMxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=ziswiler.com; spf=pass smtp.mailfrom=ziswiler.com; dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b=Or49auqq; arc=none smtp.client-ip=74.208.4.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b="Or49auqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1770338161; x=1770942961; i=marcel@ziswiler.com;
	bh=Xhkea2uuWgsFz5RIwUPCylSMm3n3sBnhjKt3SVa5kPo=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Or49auqq5TOaoraO/5JCgpn68ik1a26TfCrvJExzKlykYFC/cxsrbXJyVDaGzC4B
	 yfzll7ZJs0q2ObW7ffiC+CfmX6u3MabiO1PZgc6LZIJ19WlMJoSwVSaUgux0BHe//
	 uy3GhXlADtf3pcP8TMO0bnP0cV9B0XH+4KULzPBpPAPDenEImLp0zH3kn/TfJzIdW
	 1m0hiVZZoiQ/5N6KVYtUUzVxxp1vEP3H9Bbi9lF7iLhk0vhyDTLr+6ftwfS1rdTqq
	 VYTStUiFD7oaxUthxGRXScCYJu4AjE10C8CDnMjGPeeH4lvFnodfJqFazU7I4AoWI
	 CMdxKF2eOqfYYJ2HRQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.10.1.155] ([84.227.68.106]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MgOMF-1vKrBs3W99-00h0v5;
 Fri, 06 Feb 2026 01:30:20 +0100
Message-ID: <2931a866f5daf82e57fd0a87c04bd583658db946.camel@ziswiler.com>
Subject: Re: [PATCH v10 0/3] Add driver support for ESWIN eic700 SoC clock
 controller
From: Marcel Ziswiler <marcel@ziswiler.com>
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
 sboyd@kernel.org, 	robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com, 
	ganboing@gmail.com
Date: Fri, 06 Feb 2026 01:30:11 +0100
In-Reply-To: <20260205093322.1030-1-dongxuyang@eswincomputing.com>
References: <20260205093322.1030-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Aug1QhwJRosjBkuLTR2iyMa0FfhDgjzDGkGlqDsWZGtX6GVQBpr
 7i3Kk36hlnTs8/peZGELUafMN5UHRmlLLNrsu0VCCObr3FHFA5KuSZUELyoXIk5icNkPNn+
 ZjUPevCm52RLDOUdQIBYWUsOPwT2pkd9+N12fMxM/TNjTid/JDUDZPeAhkyTUDNrCHOD41l
 x+KpXCQqznC7n6sNynDfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JnqF4fu1XXU=;QhKuutrFwLIzCvdsUg58WbnehJz
 sktUrHSPsOrGQzkgvKsBIbFLWwEE8p5/xiij5aKZJo/msTmv62HZ4RKX72fNhT9CNDtSYMWvz
 xCGylLwaIONMaJR7y4+UBUU2DoONmgEQQ8FgcLIkfHxnsSFefBA/ehbDfbSmYGBvBR1dllCtY
 VBh12jVbPhXNcBSXLVYRzVldbot1AH+v5i+ty25ollzNOI34O3tEMHJq5z5a2EpUHyDjke7qZ
 LqLdAFq21JVqZQbmIJ3IjkVCPtdKj6HKqRocE7u2UeL6P/ZMBEuvtuGpRUdmzhAy1g535fSm3
 VR/Z5GdwkJGT4gQR3e96Lrg67uy8I2PZBOZ2T1wsANWJGNqNScT8eVTl61uGadKKOXkAyxdFR
 lzkb8zEZyy1BDjasTuVq+fhFzSiVch1AIMcp9OMnfVsV+elzkNiP4BjFQaprL+hronwfaXjJu
 5li0buuMSmbH/MCRrXprp/c7RIAZATs3h1RpsTa3QrOKcVctd3P8qzUKI30+iOI2hsbeAGmd2
 /BtLTJAcq2H5Xp3IrgSRDJcQlBloPHqPMxLfKNKGhxOyoRwt/2WDmZ6d6zzLRxh+NoorY5Fts
 kxhHHx8FtQS3Jkhh2K0pt1cqPgGQjk8X/adbQ6DFi0s/IAOztjDzS5vVs955izVr7SsXgZ15j
 6tqxmRX8cJpXYSz35PbisoezBfeNWfHJt2MuV1pKX8zFG99av13dH2+ELfUy25C0t6RPjbF7A
 PEXgM6XngWfN7sb/mePnwVMDBWgW3HaQ2yszJNQY0IhBWIJd8uRNeCZ7d6jUPH67ZOKQMyo9x
 29f9S41Vq0OzW0Vs1Hf7QZrp5qT3adqQ6ylqQ7PUX1jgzxAOcYtnYDpx/yCXlwSTKGEBL3t9t
 zp9OZcwDNz1izxLpBOEjD89fuhhFiZ4IfaaQ5hjMm/92NeTFpbAk6PcXhw06/zMAJixNdxlV4
 RB3P97r4GTImg/1u5hjL5Pw8sghKzQhDe40O9dHoc6gM3hHzJ95x4+yAM7qA8MG3w+OF5+B+L
 BWR0fHtYv6YKbBGwHSWo7T79FCfDq2vwERWRTrhLhjMV5BANCSvQsUchfQrs401PTsByl/n2L
 NFST7ISJJPV/6pnVNg7Gk5FVQOGCy4Qdo14BrPqbUkNsgHp8v9mbvO84uxy2a6typEOg1obsM
 F5i1kpl3GC/Se9OLEDU+zPhXQWmCRTfZz9D4mz0tH/FqRqAA3SQNJ2FIHJgvk7RM1hUQC3nGl
 onpfv3FS2NbSC7zvaqOWJkY7+lmgJyXGRXAjkDF3iok+rzq9RLpLmLUzVAF+7kn6KtRwtz7Dm
 /T1ksD56e5KA9AcrOKwx8SSyc1YiZ5DmNcvDPBEUPioXjSR/TmHrB/Rk0DXrmcgqtX91pNm11
 1ZIAWT5BrB0RKKZ4qVwEn4om/H9+IwnkObhYgj7YKH1zTFltN8UuHO8aHzFGIssHvbpJ6gLOI
 ZH0cXeO7FbtAK9Se5h7FBjPJjpQxhdZDnQxBiVz9YxkSQXSz1fZURZhrlijMtNO8MOdT6j6zt
 56hJTWxfp+ZBuLnpfXLWD7J6Ur1oSJv2Q8oH4roWBg91rqddXXGnsOHMcdSXNrN9RkFwqRu8G
 aPclBMBbf7OHZj79LuG2klCrwQifxW1/ZHTigGYe8M5bDbFW0X++EX3Y1YSOHUWGbn8bwRhGH
 u/KhpxDP8SdGvgUs/4JAfalaaY3rCwFTYPgVTPSh8IPmpoIUXy8nTxmGc1RDGtv4XEeCXf8Xb
 J6qRHlaj7YqBRJaqYMpW4a/ve/wNYPLQY4xaMkCOO7ILU/lQWigJmDvs=

Hi Xuyang Dong

On Thu, 2026-02-05 at 17:33 +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>

Thank you very much!

For the whole series.

Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77

BTW: Should anybody else want to easily test mainline on EBC77 [1].

[1] https://github.com/riscv/meta-riscv/pull/594

Cheers

Marcel

> The link [1] provides the official documentation for the EIC7700. Section=
 3.2
> covers the clock subsystem.
>=20
> [1] https://www.sifive.com/document-file/eic7700x-datasheet
>=20
> Updates:
> =C2=A0 Changes in v10:
> =C2=A0 - Updated driver file
> =C2=A0=C2=A0=C2=A0 - Add a private clock divider API named 'eswin_registe=
r_clkdiv' to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register divider clocks with private flag.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Define 'ESWIN_PRIV_DIV_MIN_2' private flag=
 for registering the clock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dividers whose division ratio start from 2=
.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Implement the private set_rate, recalc_rat=
e, and determine_rate accordingly.
> =C2=A0=C2=A0=C2=A0 - Add CLK_DIVIDER_ALLOW_ZERO flag to the clock divider=
s whose division
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ratio start from 0.
> =C2=A0=C2=A0=C2=A0 - Replace CONFIG_ARCH_ESWIN with CONFIG_COMMON_CLK_ESW=
IN in the Makefile.
> =C2=A0=C2=A0=C2=A0 - Modify the help description of COMMON_CLK_EIC7700.
> =C2=A0=C2=A0=C2=A0 - Move register offset definitions from 'clk-eic7700.h=
' to 'clk-eic7700.c' and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remove the 'clk-eic7700.h'. Remove '_CTRL'=
 from the offset names.
> =C2=A0=C2=A0=C2=A0 - Remove all unused headers.
> =C2=A0=C2=A0=C2=A0 - Use devm_platform_ioremap_resource() instead of devm=
_of_iomap().
> =C2=A0=C2=A0=C2=A0 - Export the functions from clk.c as symbols.
> =C2=A0=C2=A0=C2=A0 - Use readl_poll_timeout().
> =C2=A0=C2=A0=C2=A0 - Use 'clk_parent_data' and '.hw' instead of string pa=
rent names.
> =C2=A0=C2=A0=C2=A0 - Rename the header file from clk.h to common.h.
> =C2=A0=C2=A0=C2=A0 - Rename macros from EIC7700_* to ESWIN_* in common.h.
> =C2=A0=C2=A0=C2=A0 - Add a new function, 'eswin_clk_register_clks', which=
 can register
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 divider, mux, gate, and fixed-factor clock=
s based on their types.
> =C2=A0=C2=A0=C2=A0 - Add structure 'eswin_clk_info' to manage the clocks =
that need to be registered
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in a specific order.
> =C2=A0=C2=A0=C2=A0 - Add macros 'ESWIN_*_TYPE' to define divider, mux, ga=
te, and fixed-factor clocks
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with type. Add enum 'eswin_clk_type' for t=
hese types.
> =C2=A0=C2=A0=C2=A0 - Remove 'eswin_clk_register_mux_tbl'. Use 'eswin_clk_=
register_mux' to register
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mux clocks with or without table.
> =C2=A0=C2=A0=C2=A0 - Add xtal24m as the parent clock of the PLL.
> =C2=A0=C2=A0=C2=A0 - Change 2025 to 2026 in all files.
>=20
> =C2=A0 - Link to v9: https://lore.kernel.org/all/20251229105844.1089-1-do=
ngxuyang@eswincomputing.com/

[snip]

> Xuyang Dong (3):
> =C2=A0 dt-bindings: clock: eswin: Documentation for eic7700 SoC
> =C2=A0 clock: eswin: Add eic7700 clock driver
> =C2=A0 MAINTAINERS: Add entry for ESWIN EIC7700 clock driver
>=20
> =C2=A0.../bindings/clock/eswin,eic7700-clock.yaml=C2=A0=C2=A0 |=C2=A0=C2=
=A0 46 +
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 8 +
> =C2=A0drivers/clk/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/clk/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/clk/eswin/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 15 +
> =C2=A0drivers/clk/eswin/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0=C2=A0 8 +
> =C2=A0drivers/clk/eswin/clk-eic7700.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1337 +++++++++++++++++
> =C2=A0drivers/clk/eswin/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 575 +++++++
> =C2=A0drivers/clk/eswin/common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 373 +++++
> =C2=A0.../dt-bindings/clock/eswin,eic7700-clock.h=C2=A0=C2=A0 |=C2=A0 285=
 ++++
> =C2=A010 files changed, 2649 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/clock/eswin,ei=
c7700-clock.yaml
> =C2=A0create mode 100644 drivers/clk/eswin/Kconfig
> =C2=A0create mode 100644 drivers/clk/eswin/Makefile
> =C2=A0create mode 100644 drivers/clk/eswin/clk-eic7700.c
> =C2=A0create mode 100644 drivers/clk/eswin/clk.c
> =C2=A0create mode 100644 drivers/clk/eswin/common.h
> =C2=A0create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h
>=20
> --
> 2.34.1
