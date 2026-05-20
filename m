Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D18E370ADC;
	Wed, 20 May 2026 03:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779249460; cv=none; b=HUDrGct3yte9SBwy51VchN7OYHgXF1WdiJzm0TAKhYU2pZu12NvCDzx+WxxGN+e9gGcbOyvndRJ8rFDhXSi0HCeeFBPdaO5REtNYRR4rc6yjmMGq9i2R5ElyWYM+98fuFPFE2wRTv6jUW6WYHM9TPO/oHiycqMH4SmZz2OE2D2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779249460; c=relaxed/simple;
	bh=YC8qRmmq/k5/5b+peTPbFAaVZ53DEJFUcvpKg8iJ8D0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q6OL9lOcJJqqSaiLYf7G17QmwLzW43s41WtNXSeKImUvyhfQ3adxkAG2ogJ0v7q4zoqz06gxx4qkRrmf/IQ/pvOxInj/Jp5PRhKskNOSsu/HvOndARvn0U2rLfFCB1YxHCdiOq6achN6AKpefV4X3OEuAAbzGmvXc+JV5r0OAzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=MHej4Fj1; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="MHej4Fj1"
Received: from localhost (unknown [10.0.8.3])
	by mail.tkos.co.il (Postfix) with ESMTP id 957194409AD;
	Wed, 20 May 2026 06:56:49 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1779249409;
	bh=YC8qRmmq/k5/5b+peTPbFAaVZ53DEJFUcvpKg8iJ8D0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MHej4Fj1FJgII7Koo1w9p39t/AcGgi3ic/5vxuoHwkYugHM1Oiih6eWT6ppN5uRW2
	 5w9/R5hGThaZCG/Mc1UEZ5gVsFCYO4MWcWBFVorxGEgvYmhiRWAioaXaKjVlX13MM3
	 cPDw3IFL/+CzOY/5Io1HAETefykV6RK1Ghsm+HYijcbg50c+CSHtIVUkvaZR6E6RYo
	 hAv0c36WMHNrik4cUkmHTUVWIv3CB21kQgc3E69hTiJKGMMkmapwUrQsf7mlE/9wBM
	 B0t8PQhTsYCiaRqy9LGPJyb7MLNA2VZc2AEE9WjvKIpMPi8wvotaOIfhBEuI8KPsWy
	 2skZqm2MYBWlg==
From: Baruch Siach <baruch@tkos.co.il>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Brian Masney <bmasney@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Vinod Koul <vkoul@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Lorenzo Bianconi
 <lorenzo@kernel.org>,  Felix Fietkau <nbd@nbd.name>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 5/6] phy: move and rename Airoha PCIe PHY driver to
 dedicated directory
In-Reply-To: <20260519220813.28468-6-ansuelsmth@gmail.com> (Christian
	Marangi's message of "Wed, 20 May 2026 00:08:10 +0200")
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
	<20260519220813.28468-6-ansuelsmth@gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 20 May 2026 06:57:25 +0300
Message-ID: <87a4tuu40q.fsf@tarshish>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Christian,

On Wed, May 20 2026, Christian Marangi wrote:
> To keep the generic PHY directory tidy, move the PCIe PHY driver for
> Airoha AN7581 SoC to a dedicated directory.
>
> Also rename the driver and add the relevant SoC name to the .c and .h
> file in preparation for support of PCIe and USB PHY driver for Airoha
> AN7583 SoC that use a completely different implementation and
> calibration for PHYs and will have their own dedicated drivers.
>
> The rename permits to better identify the specific usage of the driver
> in the future once the airoha PHY directory will have multiple driver
> for multiple SoC.
>
> The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  MAINTAINERS                               |    4 +-
>  drivers/phy/Kconfig                       |   11 +-
>  drivers/phy/Makefile                      |    4 +-
>  drivers/phy/airoha/Kconfig                |   13 +
>  drivers/phy/airoha/Makefile               |    3 +
>  drivers/phy/airoha/phy-an7581-pcie-regs.h |  494 ++++++++
>  drivers/phy/airoha/phy-an7581-pcie.c      | 1290 +++++++++++++++++++++

This patch creates a .c file under drivers/phy/airoha/, but doesn't remove
the existing file under drivers/phy/.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
