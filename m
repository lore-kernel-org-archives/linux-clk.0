Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433436;
	b=hUQAK4EeRskg/4hg7bqPVAVG5J21Li7LLBdKhO0teXnxaim1S2CqPrVeqvgxH3N3Q3no
	 +3MRbeYn+DUkrR9RaJXwUci1wREcOQORGZe1aAhNFm6grq14TTgizHF8BiDTwIm+eQxW4
	 9Tte7ebktSTbVtbt8sPQsrelgKT23nGA1g8rop9g8iFqgvtNvz4krnGbw7PnsXYtwBXxG
	 jzfezU+JiIGKtXs5P4pVp04BaPddIrVN80anSqL/rpVqXs/QF7EadY5nU/lLjfFAXfSI8
	 tb/7MTk0KuOuvWx+IRo3ULK/RhoNHuLxxqRgLDDtMlS1U9L6W+PEfGBKA5WZP+gkkDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433436;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q/j6WirJUN5GZuo8ESQMe2tD96p/TfxN7ERvmMa2eZg=;
	b=pi6PyvcjsDRyFJE1C6n+NJK0qxaQrTq6Nc+M1VKNbeEgAYJMYc6VkgQw1wJCPKdCGjuD
	 sVhtKVnYxyThH/nZm5VDG47wiAVVQY/DnNRddF3OKYRNaZYPlO/2C4pGvGoTD3PFw/0kn
	 LkhE+eX8XhvkIY3erskOLmpa44SUtpF8QByvKUmeWfcbCbvSmryUydGmlzvXsRDByfSo8
	 pfVmx615oQoGGohviwa80I09kFu8ZIW4fPHv47Ec8hIKW/eRZRtEa7zX96Sqd9sh/Uyfk
	 JoYe5GAkS0niPjv6eivwvrztXsPrEP2vJFFkb3ilEfYMsqAMp3qb6x7taZB+K+52jpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anQvEdYk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74D1606A326;
	Wed, 11 Nov 2026 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anQvEdYk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D511F00A05;
	Wed, 11 Nov 2026 21:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794433435;
	bh=Q/j6WirJUN5GZuo8ESQMe2tD96p/TfxN7ERvmMa2eZg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=anQvEdYkNx+yEjmg+V13ijEuuDvDLl2UD2AgfEmTfm6mrTUhTNgIPo6VWptfZVlgT
	 io4xS6t8j0Zd98bRTxtBPT/ivT2WpmUieGLMXy3GFjCRCLnrPBnF52o5FoaYLT7b2C
	 tikStScHVK0FzHyxyUn6SEY7PnxaKd8wX13BjK0NPOEhFUrzQ4DfHKWTFmANW/Dao/
	 S27el57DnU++jrW4msHfqyCg6fCw//qdV8E30Cj/O8FtUHRUAIh2MmNaR6DvezVOTh
	 I7yZIwwYYKTp3K+fOlTha2rts0iTWjBrpeWZtuCe/faspPExQgW18grnDLhwlktaIo
	 zlbIVgM6DsAVw==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/4] clk: ingenic: Add Ingenic X1600 CGU clock driver
 support
From: Brian Masney <masneyb@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 letux-kernel@openphoenux.org, kernel@pyra-handheld.com, 
 Paul Boddie <paul@boddie.org.uk>, Brian Masney <masneyb@kernel.org>
In-Reply-To: <50983be55e467076e83e3ffc37b30fc4e5648e15.1792955907.git.hns@goldelico.com>
References: <cover.1792955907.git.hns@goldelico.com>
 <50983be55e467076e83e3ffc37b30fc4e5648e15.1792955907.git.hns@goldelico.com>
Date: Wed, 11 Nov 2026 16:43:44 -0500
Message-Id: <179443342468.1143992.1536494507903693852.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=5629; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=zYx5gEDCYfb/4k5A01V/xuE63SeQKUuL1sqAIc16+yk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+PJx42tf5qd/MXlPW5fXv7n+bUreDwUZk3bqfxoy/D
 K38Ve/JdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARmRJGhs7pbQVen9nF+949
 KLi7yZyB4ZaPsN//t19+LnplIHJXr5WRoV1CcVaAhsCN6cKfyh08Ln+VCrZ9cCSaX77x8rT1mmI
 nOAE=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

> Introduce clock driver support for the Clock Generation Unit (CGU)
> found in the Ingenic X1600 SoC.
> 
> To support the X1600 platform, update the common Ingenic CGU core
> framework to accommodate a secondary post-VCO divider (OD1) within
> the PLL configuration registers. Additionally, prevent a NULL pointer
> dereference in the rate determination path by properly supplying the
> secondary divider tracking during PLL calculation calls.
> 
> Implement custom handling for the I2S clocks on the X1600. Since
> complex compound hardware dividers are not yet natively supported by the
> core framework, explicit M-divider (mdiv) and N/D-divider (nddiv)
> structures are introduced to describe these specialized fields. This
> avoids a compilation failure and enables a stable, though limited,
> division encoding suitable for current needs.
> 
> Furthermore, this patch:
> - Fixes the gating of the I2S0 and I2S1 clocks, matching the control
>   bit behavior which functions as a clock enable flag.
> - Introduces the custom OTG PHY clock operations and initialisation
>   routines utilizing the hardware's OPCR registers.
> - Registers the independent I2S0 RX and TX gate clocks employed by the
>   X1600 peripheral block.

Just from reading the commit message this patch needs to be split up
further into several smaller patches to make it easier to review.
Ideally try to make the different bullet points separate patches.

> Tested successfully on the LX16 (X1600) boards and CI20 (JZ4780) to
> not interefere.
> 
> Checkpatch complains about not 4 lines of help paragraph but the
> style is the same as for the other machines. It also recommends
> using 'unsigned int' for the new struct ingenic_cgu_mdiv_info
> and struct ingenic_cgu_nddiv_info but this follows the style 'unsigned'
> of all other structs in cgu.h. Finally it complains about the empty
> line between struct ingenic_cgu_clk_info x1600_cgu_clocks[] = {
> and the comment. But I think it is more readable this way.

The checkpatch note can go below the --- below.

> 
> Co-developed-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Co-developed-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> ---
>  drivers/clk/ingenic/Kconfig     |  10 +
>  drivers/clk/ingenic/Makefile    |   1 +
>  drivers/clk/ingenic/cgu.c       | 150 +++++++---
>  drivers/clk/ingenic/cgu.h       |  42 ++-
>  drivers/clk/ingenic/x1600-cgu.c | 476 ++++++++++++++++++++++++++++++++
>  5 files changed, 646 insertions(+), 33 deletions(-)
>  create mode 100644 drivers/clk/ingenic/x1600-cgu.c
>
> diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
> index f80ac4f2992b..9b8b00c9e6d1 100644
> --- a/drivers/clk/ingenic/Kconfig
> +++ b/drivers/clk/ingenic/Kconfig
> @@ -75,6 +75,16 @@ config INGENIC_CGU_X1000
>  
>  	  If building for a X1000 SoC, you want to say Y here.
>  
> +config INGENIC_CGU_X1600
> +	bool "Ingenic X1600 CGU driver"
> +	default MACH_X1600
> +	select INGENIC_CGU_COMMON
> +	help
> +	  Support the clocks provided by the CGU hardware on Ingenic X1600
> +	  and compatible SoCs.
> +
> +	  If building for a X1600 SoC, you want to say Y here.
> +
>  config INGENIC_CGU_X1830
>  	bool "Ingenic X1830 CGU driver"
>  	default MACH_X1830
> diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
> index 81d8e23c2636..7e93e0893abe 100644
> --- a/drivers/clk/ingenic/Makefile
> +++ b/drivers/clk/ingenic/Makefile
> @@ -7,5 +7,6 @@ obj-$(CONFIG_INGENIC_CGU_JZ4760)	+= jz4760-cgu.o
>  obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
>  obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
>  obj-$(CONFIG_INGENIC_CGU_X1000)		+= x1000-cgu.o
> +obj-$(CONFIG_INGENIC_CGU_X1600)		+= x1600-cgu.o
>  obj-$(CONFIG_INGENIC_CGU_X1830)		+= x1830-cgu.o
>  obj-$(CONFIG_INGENIC_TCU_CLK)		+= tcu.o
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index ad223aa20e8d..c4fbee32c3b9 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (c) 2013-2015 Imagination Technologies
>   * Author: Paul Burton <paul.burton@mips.com>
> + * Copyright (c) 2023, 2024 Paul Boddie <paul@boddie.org.uk>
>   */
>  
>  #include <linux/bitops.h>
> @@ -76,6 +77,40 @@ ingenic_cgu_gate_set(struct ingenic_cgu *cgu,
>   * PLL operations
>   */
>  
> +static unsigned
> +ingenic_pll_recalc_rate_od(u32 ctl, u8 od_shift, u8 od_bits, u8 od_max,
> +			   const s8 *od_encoding)
> +{
> +	unsigned int od, od_enc = 0;
> +
> +	if (od_bits > 0) {
> +		od_enc = ctl >> od_shift;
> +		od_enc &= GENMASK(od_bits - 1, 0);
> +	}
> +
> +	/*
> +	 * Use the encoding table if indicated. Otherwise, use the value
> +	 * directly, interpreting an encoded value of zero as a divider
> +	 * value of one.
> +	 */
> +	if (od_encoding) {
> +		for (od = 0; od < od_max; od++)
> +			if (od_encoding[od] == od_enc)
> +				break;
> +		od++;

So if the entry is not found, then od will be set to od_max + 1, and it
will pass through the warning checks.

I started to look through the rest of the driver but I stopped because
there's just too many unrelated changes here. This needs to be split up
further into separate patches to make it easier to review. If your
commit message has the word 'and' then that's a hint that you may want
to consider splitting it up further.

Also be sure to go through all of the feedback from Sashiko.

Brian

-- 
Brian Masney <masneyb@kernel.org>
