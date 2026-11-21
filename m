Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264389;
	b=TMww9bcMYOH9C8DS8RLCLKyQ8SOSx/ZQXr4q06BIgdCisnQ6jalYzQ8qBhi6CmDHrSbv
	 410lCV/p7I8N6K6VAdwNr/XU3GpCkw09ZdtCSxGxk8Q1X2Pta/zlI3tZDqcYXugKKluyC
	 bbA5j0wicBW9HUC0H5cmo4nM/tZvFtdz0DPJCIK0dlmefHE+sw5VsdhVrteowg4GhrrWQ
	 oJ4CHwhhq+r7+/kbTNQyEgytMpoJVwcI+2TXJ4Tvjol28HjvHCcUIhFWG/y2Om3Xg1MAt
	 kSwj1SmuPGXNc4kMReO1SCt+0Zr+InImKBtMZEPwKVYQ0ioWOssdq4wlVPXI9u4HsvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264389;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q2RflKUMj2o6ng8pkHNRaKPix3X/TDTn8exAZIMBdbI=;
	b=b63/TL9LsEDgdQEqItE/8VGvghox7uGxq8FewNg+AYrU3cnubSo6LsbxeQrSJ/nvPRl9
	 jUD4FoNEcxu1xYCzTYADF4m+iZ17UFGKYNd6nr2Ke0idgbqv5+NJMuKm7O18HXCnqJzLG
	 2gKxvvj5MqRH0SVn9TntTIk6D4SM74nPZ7q2go7hCS/RCsGhNqnoE7+Rc9a3oEyt4y6ud
	 x3csShP7KMI2c1ewqaCE2e60q2iwhni/L0j84hw56M9JdOtQOaXd/3t0mGLdcggLN9KuD
	 I5QRVARXFnUIBxbgXJF42oAcKBtpvCVZaS32T/gn+7D9SZ1Apz5j+P1vRM9eKNILF1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M87x7a5Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xo9J+GJi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB7D606A32C
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 12:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB7D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M87x7a5Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xo9J+GJi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ALCGxP1102543
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 12:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q2RflKUMj2o6ng8pkHNRaKPi
	x3X/TDTn8exAZIMBdbI=; b=M87x7a5Q2hU7uEqLR8VCL1U86g4/xog55vqjU+sU
	C9WbXzxM7SmjBGd1RQS5pYGrNRjYBbr+ewwIEfcNDpbOYGWshx4egWLHNzRBTmRe
	IlSAFkmPjQZCyJdve3uyXGs767ixX2i6C4DGqO5BmRujyYNu/k2w9XJVvnlIo2+M
	ZGRcnM99TTNo4WbiMMbr74N47XD849AdhgRxlMlFduzRTVQwcdy5m1l9vLeOtP/i
	MeFJRVDQNqrxuHwJmGBmOXQmMEpdKIxTlYZmHWmZoyPibMcm7VaU2CJMWrXlXJIK
	xlbdzD5TOS7gpTFxhXCeqz7oILPD4PpgeyQzNxFJDWg+wA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7s1r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 12:33:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92111028a03so38910286d6.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 04:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795264386; x=1795869186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q2RflKUMj2o6ng8pkHNRaKPix3X/TDTn8exAZIMBdbI=;
        b=Xo9J+GJiECQBpx0b7hv24DvCHb3Z3O7MGxM1w9QNSwhi8TMste1GUIu3qw+gNvgj3G
         Z7KIc2LKxkjQEMHMEY8TGDT4AdZsEo8ihgxV3kZDFXp8w89biutir57/l+EmgpWt7j3l
         TQ7T2l1P4iyCQncvYCrIwyHJ2KeaWgbO10yofSrclROLBsVpv94kizccFsR+mFKRw1KI
         hx/7NoMIN0lL4L4sYikFpD1LzkoOkoBDW6iB7dSZZOp+lt+RQbBMZtWnJNE10cE+PdBh
         NYc/+2KlNZOuXzarVglYFKrvGg4J645mKPvnOcgyltUi3I/olQTL2g7sE0BRYeWcWVKN
         RLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795264386; x=1795869186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2RflKUMj2o6ng8pkHNRaKPix3X/TDTn8exAZIMBdbI=;
        b=Fn1+KK4e0XEWKlO1Uu4bjaeoGLHxh7j+lA6LE1hAa8uSkmkSJWPrpXLT7S85qIjbQ5
         vVLBiVdAQlSUXkSHu9SHObICtrrMkipOaZTQk1wUWLGZc5KX2aDLXgcceLYNgmeyKn5K
         kTgHT4zIKpogOWMpgDVOojAan3FCllW+0WUSDeuONuuU882EYplbg8IPFn+IvHGqUOI4
         yS/k/cAQBbgnCHB6v5ln16nN5W7Xz64Q2AR+0UjRLv+7CdIaSDWLVGsgpGPLpSWZzp2N
         yIe9L9NkKmF+yaXzl1NyuP/8kzWR7dvlKZuly1mF3kdTWnNWL8RLTr6z8afR/lkbIsEB
         pqLg==
X-Forwarded-Encrypted: i=1; AL+hErG9hurIKN8U/qpXL8LrNB5YcbcPirv1wp0B7YcHuYhe+Y+y7Q9FZN57wh1SA2WU6eJuANhgPgc38aM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dC6mEDhCUWF/eadCBmpcXORSA1MEqRlfgGk7ShslChmNXy9yT
	9Q0BPVpfCfAOVpw4c9CyrvFwlfT4tGO3XSlmK7LgtpINw6XapUPZ+WC6PBMiDjU8DbsatCIJbpy
	1mAux+6Dfdh/Pcm161kP/aqsoV3V/N3H2zjnKU6SKtsOiX0ioYkutlwhpIHroY22JNGEGQV3Ehw
	==
X-Gm-Gg: AZFdTZdqZgKdePx4rFC5DFupeHOTeFKU00JakPlrt84mGFCH6+C0ZIBMe0TvhV8BGWt
	p3D5JsEzUgQ40dheTUFxP8PX16l+p0GRJP6VaxkvnYNW0PcdfAnanA44BG6au0gd+R1aOlf/t78
	bgExQ0mNoDRcQ5vRNEVrFxKbDMYYimmdv3UB5RvMny3d65L51rWqM/SciIvyB8n45fa613va7ij
	rEFHkF3Dm29SY78aSGIRIPbBCMYvk3H6kdocGOH15gIryNwogHUZaVhIBnp8UxwLvBkZGKPU9lN
	W8RDw1smfKAlZ2P6UJ58FCNpfNgZ/ElXedpWW1FHIsq9LpdXK5jXRkRVegvrDyl+ZfZ9ZJsOHPl
	xpQ1deWI1dT2Rzjx2rixjJqS70rK3lD8H/A9coCOOU8z5fSVrWjpe270jwuM7S803ckldLd7KjF
	DtMC2y7cd8vrjHsfmSyNQMD7PsehI=
X-Received: by 2002:a05:620a:8081:b0:944:192:85f1 with SMTP id af79cd13be357-949ba9dd015mr1020193985a.48.1795264386119;
        Sat, 21 Nov 2026 04:33:06 -0800 (PST)
X-Received: by 2002:a05:620a:8081:b0:944:192:85f1 with SMTP id af79cd13be357-949ba9dd015mr1020187485a.48.1795264385429;
        Sat, 21 Nov 2026 04:33:05 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm54887405e9.0.2026.11.21.04.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:33:03 -0800 (PST)
Date: Sat, 21 Nov 2026 13:33:02 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
        fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
        marex@nabladev.com, changhuang.liang@starfivetech.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: toshiba: introduce a TC9564 clock/reset
 driver
Message-ID: <awGPfkiR1ujU4M7i@lore-desk>
References: <20261120183212.1264522-1-elder@riscstar.com>
 <20261120183212.1264522-3-elder@riscstar.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1SGWw2ZiB3HrP99p"
Content-Disposition: inline
In-Reply-To: <20261120183212.1264522-3-elder@riscstar.com>
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b018f82 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ee_2aqc6AAAA:8
 a=VwQbUJbxAAAA:8 a=WP3ZLRQoy5FHNR339nEA:9 a=CjuIK1q_8ugA:10
 a=bPPXRXOAgEK3eSHWmLYA:9 a=pJ04lnu7RYOZP9TFuWaZ:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA0OSBTYWx0ZWRfX95XxupNFO5wt
 s4TEL7YLo2VsV4QpBYJbcgRTEArd5iHVpnmHkaZKk2zrcIZFom0U6XdthjgHA2Pc28g5fU0UDFO
 pItijko+1GK05aAmNj62s0AgTuh4k7U=
X-Proofpoint-GUID: MRnhV5Z78s5bcoyrsfZDZ3EHwMRfBODN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA0OSBTYWx0ZWRfX2ApJNX/h3VmJ
 iSqdl9M9xOPp/jYZmD8LaCf6RSGoRoDTJ4k+vG47oyTBxRwr6XOonu/luxUSehGrcuj4dQ+uZ24
 ZfZtQWcjsAIgDiEMXoKzPs2LEu9udLnJDyMqx+6ADq0Ez+7bUS+5GKypMi6C9hCSVKLaCIT7zl3
 +vR2OSqqKmMXcnZ68kQ1QLW5ef/Lh9VPnwqLkceX0T50tIOt4tYdmKO+th9Djmu4GWLariY6AgM
 2QN6h6nAB8Ai4RX8hDXdL+KuPZcWj7ZUR8C5Jy0xxeccex+PTmrD6jAKRbmba+8bKKumsYEOQpZ
 OxItb4FLB3+Y2qBqNoO7fpLn+muCGrn5yxKZ5MZiqrTxdL3nPVD7rMHEwKNhtghV4aEj2mz/zO7
 V4wMcIUDncPR7PGI2qlDSapn3fvxyNJY7BlKoU08wI/hJyElqfdPGW1tHBS9wHeNm+oL1ESIEj9
 jZHbMB83PwIX19isTMQ==
X-Proofpoint-ORIG-GUID: MRnhV5Z78s5bcoyrsfZDZ3EHwMRfBODN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210049

--1SGWw2ZiB3HrP99p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Define a new platform driver that manages clocks implemented by the
> Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
> and disabled, but currently only the clocks that are (or will soon
> be) used are defined to be controllable.

Is it a repetition of the sentences below?

>=20
> Two registers manage the state of the clocks.  The registers are
> accessed via a regmap supplied by a system controller.  Access to
> the memory region is provided via a BAR on a PCIe endpoint function
> embedded in the TC9564 SoC.

I guess this is a leftover, right?

>=20
> Define the binding for the clock and reset controller that present in
> the Toshiba TC9564 SoC.
>=20
> Define a new platform driver that manages clocks and resets implemented
> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
> and disabled, but some of these won't be used any time soon by software,
> so they are omitted.
>=20
> There are also 13 resets that can be asserted or deasserted, but support
> for some of these is omitted as well.
>=20
> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
> state should never be changed (and a warning is issued if changing their
> state is attempted).
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - New driver that combines clock and reset functionality
>     - Map the platform memory resource rather than using a regmap
>     - Kconfig adds COMPILE_TEST, and its help text is simplified
>     - Clock names now defined based on dev_name()
>     - gate_clk_manage() and reset_manage() return 0, so their
>       callers can be made a little simpler
>     - Flex array counted-by field is now explicitly assigned
>=20
>  MAINTAINERS              |   1 +
>  drivers/clk/Kconfig      |   8 +
>  drivers/clk/Makefile     |   1 +
>  drivers/clk/clk-tc9564.c | 501 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 511 insertions(+)
>  create mode 100644 drivers/clk/clk-tc9564.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index af088e1092e63..9503c304c35ed 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28689,6 +28689,7 @@ M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> +F:	drivers/clk/clk-tc9564.c
>  F:	include/dt-bindings/clock/toshiba,tc9564.h
> =20
>  TOSHIBA TC9564 PCI DRIVER
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 6bfa2c8fffe1b..b27807ee93863 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -185,6 +185,14 @@ config COMMON_CLK_CDCE706
>  	help
>  	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
> =20
> +config COMMON_CLK_TC9564
> +	tristate "Toshiba TC9564 clock and reset support"
> +	depends on TC9564_PCI || COMPILE_TEST
> +	default TC9564_PCI
> +	help
> +	  This enables support for the clock and reset controllers embedded
> +	  in the Toshiba TC9564 SoC.
> +
>  config COMMON_CLK_TPS68470
>  	tristate "Clock Driver for TI TPS68470 PMIC"
>  	depends on I2C
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 99377a13ebc57..d67cfb6d623d3 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -111,6 +111,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+=3D clk-si570.o
>  obj-$(CONFIG_COMMON_CLK_SP7021)		+=3D clk-sp7021.o
>  obj-$(CONFIG_COMMON_CLK_STM32F)		+=3D clk-stm32f4.o
>  obj-$(CONFIG_COMMON_CLK_STM32H7)	+=3D clk-stm32h7.o
> +obj-$(CONFIG_COMMON_CLK_TC9564)		+=3D clk-tc9564.o
>  obj-$(CONFIG_COMMON_CLK_TPS68470)      +=3D clk-tps68470.o
>  obj-$(CONFIG_CLK_TWL6040)		+=3D clk-twl6040.o
>  obj-$(CONFIG_CLK_TWL)			+=3D clk-twl.o
> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
> new file mode 100644
> index 0000000000000..65ed524bf2ee7
> --- /dev/null
> +++ b/drivers/clk/clk-tc9564.c
> @@ -0,0 +1,501 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights res=
erved.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/clock/toshiba,tc9564.h>
> +
> +/*
> + * Two registers implement clock enable/disable bits for all gated clock=
s.
> + * And two registers implement reset assertion bits for all resets.
> + * These offsets are relative to the address space defined in devicetree.
> + */
> +#define CLOCK0_OFFSET	0x0
> +#define CLOCK1_OFFSET	0x8
> +#define RESET0_OFFSET	0x4
> +#define RESET1_OFFSET	0xc

nit: I guess you can just put these values in clock_init/reset_init structs.

> +
> +struct tc9564_clock {
> +	void __iomem *ioaddr;		/* Mapped clock/reset registers */
> +	struct clk_hw_onecell_data *clk_data;
> +	struct reset_controller_dev rcdev;
> +};
> +
> +struct gate_clock {
> +	const struct clock_init *init;
> +	struct clk_hw hw;
> +};
> +
> +enum clock_type { PLL, FIXED, GATE, CRITICAL_GATE };
> +
> +struct clock_init {
> +	const char *name;
> +	enum clock_type type;
> +	union {
> +		u32 mult;	/* PLL rate multiplier */
> +
> +		struct {	/* Fixed rate clock; parent is PLL */
> +			u32 numerator;	/* 0 is treated as 1 */
> +			u32 denominator;
> +		};
> +
> +		struct {	/* Gated clock; parent is a fixed rate clock */
> +			u16 parent;	/* Parent clock ID, e.g. CLOCK_100M */
> +			u16 offset;	/* Register offset */
> +			u32 mask;	/* Value is 2^n (only one bit set) */
> +		};
> +	};
> +};
> +
> +struct reset_init {
> +	u32 offset;	/* Register offset */
> +	u32 mask;	/* Value is 2^n (only one bit set) */
> +};
> +
> +/*
> + * Clocks are initialized and registered in the order of their IDs.
> + * There is one PLL, and it is initialized first.  Fixed clocks are
> + * initialized after that, and the gated clocks are initialized last
> + * (after their parent clocks have been registered).
> + */

please see the comment below.

> +static const struct clock_init clock_init[] =3D {
> +	[CLOCK_PLL] =3D {
> +		.name =3D "pll",
> +		.type =3D PLL,
> +		.mult =3D 50,
> +	},

unnecessary new-line

> +
> +	[CLOCK_62_5M] =3D {
> +		.name =3D "62.5MHz",
> +		.type =3D FIXED,
> +		.denominator =3D 20,
> +	},
> +	[CLOCK_100M] =3D {
> +		.name =3D "100MHz",
> +		.type =3D FIXED,
> +		.numerator =3D 2,
> +		.denominator =3D 25,
> +	},
> +	[CLOCK_125M] =3D {
> +		.name =3D "125MHz",
> +		.type =3D FIXED,
> +		.denominator =3D 10,
> +	},
> +	[CLOCK_250M] =3D {
> +		.name =3D "250MHz",
> +		.type =3D FIXED,
> +		.denominator =3D 5,
> +	},
> +	[CLOCK_312_5M] =3D {
> +		.name =3D "312.5MHz",
> +		.type =3D FIXED,
> +		.denominator =3D 4,
> +	},
> +
> +	[CLOCK_I2C] =3D {
> +		.name =3D "i2c",
> +		.type =3D CRITICAL_GATE,
> +		.parent =3D CLOCK_100M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.mask =3D BIT(12),
> +	},
> +	[CLOCK_PCIE] =3D {
> +		.name =3D "PCIe",
> +		.type =3D CRITICAL_GATE,
> +		.parent =3D CLOCK_100M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.mask =3D BIT(9),
> +	},
> +	[CLOCK_MSIGEN] =3D {
> +		.name =3D "msigen",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_62_5M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.mask =3D BIT(18),
> +	},
> +
> +	[CLOCK_MAC0_TX] =3D {
> +		.name =3D "MAC0-TX",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_250M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.mask =3D BIT(7),
> +	},
> +	[CLOCK_MAC0_RX] =3D {
> +		.name =3D "MAC0-RX",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_250M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.mask =3D BIT(14),
> +	},
> +	[CLOCK_MAC0_125M] =3D {
> +		.name =3D "MAC0-125MHz",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_125M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.mask =3D BIT(29),
> +	},
> +	[CLOCK_MAC0_312_5M] =3D {
> +		.name =3D "MAC0-312.5MHz",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_312_5M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.mask =3D BIT(30),
> +	},
> +	[CLOCK_MAC0_ALL] =3D {
> +		.name =3D "MAC0-ALL",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_250M,
> +		.offset =3D CLOCK0_OFFSET,
> +		.mask =3D BIT(31),
> +	},
> +
> +	[CLOCK_MAC1_TX] =3D {
> +		.name =3D "MAC1-TX",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_250M,
> +		.offset =3D CLOCK1_OFFSET,
> +		.mask =3D BIT(7),
> +	},
> +	[CLOCK_MAC1_RX] =3D {
> +		.name =3D "MAC1-RX",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_250M,
> +		.offset =3D CLOCK1_OFFSET,
> +		.mask =3D BIT(14),
> +	},
> +	[CLOCK_MAC1_125M] =3D {
> +		.name =3D "MAC1-125MHz",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_125M,
> +		.offset =3D CLOCK1_OFFSET,
> +		.mask =3D BIT(29),
> +	},
> +	[CLOCK_MAC1_312_5M] =3D {
> +		.name =3D "MAC1-312.5MHz",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_312_5M,
> +		.offset =3D CLOCK1_OFFSET,
> +		.mask =3D BIT(30),
> +	},
> +	[CLOCK_MAC1_ALL] =3D {
> +		.name =3D "MAC1-ALL",
> +		.type =3D GATE,
> +		.parent =3D CLOCK_250M,
> +		.offset =3D CLOCK1_OFFSET,
> +		.mask =3D BIT(31),
> +	},
> +};
> +#define CLOCK_COUNT	ARRAY_SIZE(clock_init)
> +
> +static const struct reset_init reset_init[] =3D {
> +	[RESET_I2C] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(12),
> +	},
> +	[RESET_PCIE] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(9),
> +	},
> +	[RESET_MSIGEN] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(18),
> +	},

unnecessary new-line

> +
> +	[RESET_MAC0_MAC] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(7),
> +	},
> +	[RESET_MAC0_PMA] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(30),
> +	},
> +	[RESET_MAC0_XPCS] =3D {
> +		.offset =3D RESET0_OFFSET,
> +		.mask =3D BIT(31),
> +	},
> +
> +	[RESET_MAC1_MAC] =3D {
> +		.offset =3D RESET1_OFFSET,
> +		.mask =3D BIT(7),
> +	},
> +	[RESET_MAC1_PMA] =3D {
> +		.offset =3D RESET1_OFFSET,
> +		.mask =3D BIT(30),
> +	},
> +	[RESET_MAC1_XPCS] =3D {
> +		.offset =3D RESET1_OFFSET,
> +		.mask =3D BIT(31),
> +	},
> +};
> +#define RESET_COUNT	ARRAY_SIZE(reset_init)
> +
> +/* Parent is the input oscillator running at 25 MHz; PLL runs at 1250 MH=
z */
> +static struct clk_hw *pll_register(struct device *dev, const char *name,
> +				   const struct clock_init *init)
> +{
> +	return devm_clk_hw_register_fixed_factor_index(dev, name, 0, 0,
> +						       init->mult, 1);
> +}
> +
> +/* The PLL is the parent of all fixed clocks */
> +static struct clk_hw *fixed_register(struct device *dev, const char *nam=
e,
> +				     const struct clock_init *init)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(dev);
> +	u32 numerator =3D init->numerator ? : 1;
> +	struct clk_hw *pll_hw;
> +
> +	pll_hw =3D tc9564_clock->clk_data->hws[CLOCK_PLL];
> +
> +	return devm_clk_hw_register_fixed_factor_parent_hw(dev, name, pll_hw,
> +							   0, numerator,
> +							   init->denominator);
> +}
> +
> +static const struct gate_clock *hw_to_gate_clock(struct clk_hw *hw)
> +{
> +	return container_of_const(hw, struct gate_clock, hw);
> +}
> +
> +static int gate_clk_manage(struct clk_hw *hw, bool enable)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(clk_hw_get_dev(hw=
));
> +	const struct gate_clock *clock =3D hw_to_gate_clock(hw);
> +	u32 mask =3D clock->init->mask;
> +	void __iomem *ioaddr;
> +	u32 val;
> +
> +	ioaddr =3D tc9564_clock->ioaddr + clock->init->offset;
> +
> +	val =3D readl(ioaddr);
> +	if (enable)
> +		val |=3D mask;
> +	else
> +		val &=3D ~mask;
> +	writel(val, ioaddr);
> +
> +	return 0;
> +}
> +
> +static int gate_clk_enable(struct clk_hw *hw)
> +{
> +	return gate_clk_manage(hw, true);
> +}
> +
> +static void gate_clk_disable(struct clk_hw *hw)
> +{
> +	(void)gate_clk_manage(hw, false);
> +}
> +
> +static int gate_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(clk_hw_get_dev(hw=
));
> +	const struct gate_clock *clock =3D hw_to_gate_clock(hw);
> +	void __iomem *ioaddr;
> +
> +	ioaddr =3D tc9564_clock->ioaddr + clock->init->offset;
> +
> +	return readl(ioaddr) & clock->init->mask ? 1 : 0;

This is racy with gate_clk_manage() but it is not harmful as for reset (ple=
ase
see below) but I guess regmap can be helpful for clock as well.

> +}
> +
> +static const struct clk_ops gate_clk_ops =3D {
> +	.enable =3D gate_clk_enable,
> +	.disable =3D gate_clk_disable,
> +	.is_enabled =3D gate_clk_is_enabled,
> +};
> +
> +static struct clk_hw *gate_register(struct device *dev, const char *name,
> +				    const struct clock_init *init)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(dev);
> +	struct clk_init_data clk_init =3D { };
> +	const struct clk_hw *parent_hw;
> +	struct gate_clock *clock;
> +	int ret;
> +
> +	clock =3D devm_kzalloc_obj(dev, *clock);
> +	if (!clock)
> +		return ERR_PTR(-ENOMEM);
> +
> +	parent_hw =3D tc9564_clock->clk_data->hws[init->parent];
> +
> +	clk_init.name =3D name;
> +	clk_init.ops =3D &gate_clk_ops;
> +	clk_init.parent_hws =3D &parent_hw;
> +	clk_init.num_parents =3D 1;
> +	if (init->type =3D=3D CRITICAL_GATE)
> +		clk_init.flags =3D CLK_IS_CRITICAL;
> +
> +	clock->hw.init =3D &clk_init;
> +	clock->init =3D init;
> +
> +	ret =3D devm_clk_hw_register(dev, &clock->hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &clock->hw;
> +}
> +
> +/* Warn on requests to assert or deassert critical resets */
> +static bool reset_is_critical(unsigned long id)
> +{
> +	return WARN_ON(id =3D=3D RESET_I2C) || WARN_ON(id =3D=3D RESET_PCIE);
> +}
> +
> +static int reset_manage(struct reset_controller_dev *rcdev,
> +			unsigned long id, bool assert)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(rcdev->dev);
> +	const struct reset_init *reset =3D &reset_init[id];
> +	u32 mask =3D reset->mask;
> +	void __iomem *ioaddr;
> +	u32 val;
> +
> +	if (reset_is_critical(id))
> +		return 0;		/* Just ignore the request */
> +
> +	ioaddr =3D tc9564_clock->ioaddr + reset->offset;

AFAIK reset framework does not provide any serialization for reset_control_=
ops.
Since multiple reset lines share the same register, reset_manage() is racy =
and
multiple calls to reset_control_assert() can write stale values. I think you
should add a spin_lock here or rely on regmap.

> +
> +	val =3D readl(ioaddr);
> +	if (assert)
> +		val |=3D mask;
> +	else
> +		val &=3D ~mask;
> +	writel(val, ioaddr);
> +
> +	return 0;
> +}
> +
> +static int reset_assert(struct reset_controller_dev *rcdev, unsigned lon=
g id)
> +{
> +	return reset_manage(rcdev, id, true);
> +}
> +
> +static int reset_deassert(struct reset_controller_dev *rcdev, unsigned l=
ong id)
> +{
> +	return reset_manage(rcdev, id, false);
> +}
> +
> +static int reset_status(struct reset_controller_dev *rcdev, unsigned lon=
g id)
> +{
> +	struct tc9564_clock *tc9564_clock =3D dev_get_drvdata(rcdev->dev);
> +	const struct reset_init *reset =3D &reset_init[id];
> +	void __iomem *ioaddr;
> +
> +	ioaddr =3D tc9564_clock->ioaddr + reset->offset;
> +
> +	return readl(ioaddr) & reset->mask ? 1 : 0;
> +}
> +
> +static const struct reset_control_ops reset_control_ops =3D {
> +	.assert =3D reset_assert,
> +	.deassert =3D reset_deassert,
> +	.status =3D reset_status,
> +};
> +
> +static int tc9564_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct reset_controller_dev *rcdev;
> +	struct tc9564_clock *tc9564_clock;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np;
> +	int ret;
> +
> +	np =3D dev_of_node(dev);
> +	if (!np)
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	tc9564_clock =3D devm_kzalloc_obj(dev, *tc9564_clock);
> +	if (!tc9564_clock)
> +		return -ENOMEM;
> +
> +	tc9564_clock->ioaddr =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(tc9564_clock->ioaddr))
> +		return dev_err_probe(dev, PTR_ERR(tc9564_clock->ioaddr),
> +				     "failed to map registers\n");
> +
> +	clk_data =3D devm_kzalloc_flex(dev, *tc9564_clock->clk_data, hws,
> +				     CLOCK_COUNT);
> +	if (!clk_data)
> +		return -ENOMEM;
> +	clk_data->num =3D CLOCK_COUNT;
> +
> +	tc9564_clock->clk_data =3D clk_data;
> +
> +	/* Record the driver data pointer before we register anything */
> +	dev_set_drvdata(dev, tc9564_clock);
> +
> +	/* Initialize all the clocks, then register the provider */
> +	for (u32 i =3D 0; i < clk_data->num; i++) {
> +		const struct clock_init *init =3D &clock_init[i];
> +		struct clk_hw *hw;
> +		char *name;
> +
> +		name =3D kasprintf(GFP_KERNEL, "%s-%s", dev_name(dev), init->name);

nit: I guess you can use devm_kasprintf() here and get rid of the kfree().

> +		if (!name)
> +			return -ENOMEM;
> +
> +		if (init->type =3D=3D PLL)

nit: I would use a switch here.

> +			hw =3D pll_register(dev, name, init);
> +		else if (init->type =3D=3D FIXED)
> +			hw =3D fixed_register(dev, name, init);
> +		else
> +			hw =3D gate_register(dev, name, init);

I think this approach is a bit fragile since the clock dependency is guaran=
teed
by the order defined in include/dt-bindings/clock/toshiba,tc9564.h, right?

PLL clock --> fixed clocks --> gate_clocks

Would it better to enforce it in the code allocating first the PLL out of t=
he
loop, then fixed rate clocks with a specific routine and, at the end, gate =
clocks?

Regards,
Lorenzo

> +		kfree(name);
> +
> +		if (IS_ERR(hw))
> +			return dev_err_probe(dev, PTR_ERR(hw),
> +					     "failed to register %s\n",
> +					     init->name);
> +		clk_data->hws[i] =3D hw;
> +	}
> +
> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_dat=
a);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	/* Set up and register the reset controller */
> +	rcdev =3D &tc9564_clock->rcdev;
> +	rcdev->ops =3D &reset_control_ops;
> +	rcdev->owner =3D THIS_MODULE;
> +	rcdev->dev =3D dev;
> +	rcdev->of_node =3D np;
> +	rcdev->nr_resets =3D RESET_COUNT;
> +
> +	ret =3D devm_reset_controller_register(dev, rcdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register reset controller\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tc9564_clock_match[] =3D {
> +	{ .compatible =3D "toshiba,tc9564-clock", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tc9564_clock_match);
> +
> +static struct platform_driver tc9564_clk_driver =3D {
> +	.probe =3D tc9564_clk_probe,
> +	.driver =3D {
> +		.name =3D KBUILD_MODNAME,
> +		.of_match_table =3D tc9564_clock_match,
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +};
> +module_platform_driver(tc9564_clk_driver);
> +
> +MODULE_DESCRIPTION("Toshiba TC9564 Clock Driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.53.0
>=20

--1SGWw2ZiB3HrP99p
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawGPfgAKCRA6cBh0uS2t
rINbAQDq97AwSn+9LjjGJE7WFYTISD5C7x15ms/l7PjScfplSQEAh3sF4Hpb4WXj
2jZvqaHFd+fCtPiUO4lS/nFaW3B+YA8=
=CJKM
-----END PGP SIGNATURE-----

--1SGWw2ZiB3HrP99p--
