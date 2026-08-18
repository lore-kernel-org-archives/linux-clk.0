Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0255742253D;
	Tue, 18 Aug 2026 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041641; cv=none; b=LZSyHbXNEbSWs4N59Lz7fdJ9nDqakmImdxaEoJfC2CCiIJhRMr5r8FdDAkde545NBHTIClawC6bk1gRoCb5atmHkyLrm9DwBiYtNBTEHNeqVN4Ev3dvlTM5DsihIk/E/aRAHz4pN6TBNJvAObUM8knPs4WEMp4hsmovbF2pwTj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041641; c=relaxed/simple;
	bh=ZnfWNCntcF0G8nOPeIJhlyUWAXz7fca4GWtvis5vh8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBXyJxBKMwJvcET9GmYORaUIlpBZhcZpIIrDQsAYYEY1rHt2BTgq5XkiNl5CknEPthQ0kHOtnCgCHpKUs5GyXXxwSvONTgaxGnO2RNMeoY+GtiXuHSW059WIu0ZdTOPS9QjDtxJgrQOWqmGOG6Q/8VhzbDaOr3aauqCHAZ7kx/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nY5un2B8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nY5un2B8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA8A1F000E9;
	Tue, 18 Aug 2026 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787041639;
	bh=22+FNa7Rs0ceguta3A4r7QZXZ+7rJL+TIRiptyOPD1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nY5un2B81PwDmd2M+R9uhBZIBK3ThWE5DwVufH/GcrWLzba5ZkgLPswCJ6t3INRJ2
	 t+72gxzEHNqPbYpI86yqSyGt7XnNhNydN00JH5MO+zJN5g9C1xHAL2yWr809sEPEHp
	 UK4wL2gv7bGOhfRKeDAh9iUw3bmgEOkkeFiIAnN+ObCAMpTy3Zp23tXuZYolcA2jAx
	 l5Y9H1wvyoQLEarv1L5Bu32Qayh8QyPXRq5wBVA1i2kMgeYWzp56a0dN7MKRT4x4Zn
	 sfRfCxN/VKE4qbt/E2I0WTssZMburYJq2TtnAt+wyctfA+V/MszVC3tAFZjmF3TXZv
	 XCvZQlvWSx6IQ==
Message-ID: <cd16fb78-551e-4630-83d6-a44a68e2e411@kernel.org>
Date: Tue, 18 Aug 2026 10:27:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: altera: move Agilex72 DT and use altr
 prefix
To: evon.chiam@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>, Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1786006669.git.evon.chiam@altera.com>
 <a3de82b47b6b7638159d19c87da1e99e93fe2e7e.1786006669.git.evon.chiam@altera.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <a3de82b47b6b7638159d19c87da1e99e93fe2e7e.1786006669.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2026 11:25, evon.chiam@altera.com wrote:
> From: "Chiam, Evon" <evon.chiam@altera.com>
> 
> Move the Agilex72 SoC and SoCDK device trees from dts/intel to
> dts/altera. Update the board and SoC compatible strings to use
> the "altr" vendor.
> 
> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
> ---
>  arch/arm64/boot/dts/altera/Makefile                            | 3 ++-
>  arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi    | 2 +-
>  .../boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts      | 2 +-
>  arch/arm64/boot/dts/intel/Makefile                             | 1 -
>  4 files changed, 4 insertions(+), 4 deletions(-)
>  rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (98%)
>  rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (84%)

Everything there is altera, except Keembay, so moving only one file is
quite a confusion.

Feel free to move ALL altera files (or none as this is just a churn),
but you should keep dtbs_install unaffected (as not broken).


> 
> diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
> index 540bb5ae746b..a1a9ccba5334 100644
> --- a/arch/arm64/boot/dts/altera/Makefile
> +++ b/arch/arm64/boot/dts/altera/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_stratix10_socdk.dtb \
> +dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex72_socdk.dtb \
> +				socfpga_stratix10_socdk.dtb \
>  				socfpga_stratix10_socdk_emmc.dtb \
>  				socfpga_stratix10_socdk_nand.dtb \
>  				socfpga_stratix10_swvp.dtb
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
> similarity index 98%
> rename from arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
> rename to arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
> index c29c2afcaab7..354c775f577b 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
> @@ -7,7 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
>  / {
> -	compatible = "intel,socfpga-agilex72";
> +	compatible = "altr,socfpga-agilex72";

And this is not fine. You are stuck with what you added, especially that
you added it recently and this was conscious choice of using "intel"
instead of "altr".

Best regards,
Krzysztof
