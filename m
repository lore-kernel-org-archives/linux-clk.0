Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256450;
	b=gM5YHtNacKv2Fzr9omioo3ltYnkZ+5ixMrrQSRVEXQaNFucGBbDTb4TIe6Ymjg0V9lZ6
	 LP3zMhaDdtpYRZWG+XdjzOVYEHRsCMbLyyCLohp/R6gLdv+dtfd+2ZCX8i9LzfLCSu3wY
	 WBciNfD/g9cqYWZdMHrdriJIsNt7yJfr8bAWtetrh/Tq4JSA45XM5mH5VaDxEVkEP6E1A
	 TK349jjKaEM0saAd23GwRtRbTZoX/blmpuEp7ZsJNvOaLQK+OyzHA9X2wvufW03QsSzdC
	 2uxbZD2z8tnyU6M+80USGbFmJp7C+RTKqBmwSV7f2Ex7ZyXLSS0mRl1Kbd2C14VvYuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CXYi6ELkOoT9uHz5fc4tdk5+APeWmFmbN9MkRaxLJmI=;
	b=XTT7ru+Qhs+6LVG5Svpmhemo4Qa6+6UhIrR7XSNbhv5CUuoj0HoWkxcWTNcx3f9qtyGq
	 OU1kDntN8ZSBqLsY1IPwp5Nwn+DhA6exHmHY6pL8jX1nECqxmIORDzrGMVbLWNnyqu/hD
	 00ahm39uX9LJhLR6cMYBQvdr2YJe//55BfSV+rxGH7dYDoFX27fEojiE+5TLyDPSIgWY8
	 FFS86D7it7TSXyMrn2QAvE2GyV/Q1XyZZoaxd3FYkIoQ0mQgaQcp2gevZtDG4OUEjzDzp
	 N0MrWsuG59KtGzHo9HHigOldt271Bf4QlsJZmGfvxaalZsdHqMszdv0cNzUucqkDF8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXAaN49S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L/gSzcN5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FADA606A325
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 10:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FADA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXAaN49S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L/gSzcN5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL8Ak15063533
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 10:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CXYi6ELkOoT9uHz5fc4tdk5+
	APeWmFmbN9MkRaxLJmI=; b=NXAaN49S+pxRLORUip3jdzjhR26uTGLBv8HMgO7a
	liXjKBS9aOWpY8eO9EB3NKxf3opGukJ9v32brE9mY/qPM08fZVdQ7CGAeHszZei2
	Mwg41Yekw1y4PmbKdT3lrCZ2/5fUJTkCf//Ar6+FNKavhcHrsZvepwPR2c9ND8Kh
	8rHrDwZWloBI7qycwVtk/EkaZGYyhsWOExlXEyaiSZIcBMdrENELwtBK/o/UIhty
	SgadWgZJIglHcQsC+bkq9bferetXV5WGhmNOQfqkpqkaJr8Jlvv2438ocb1e7J/K
	w8QZbFEswHuC5zU2p+j4jjhG2DBi05OlJ0qddJrM69Phow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu0v41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 10:20:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so317365385a.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 02:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795256447; x=1795861247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CXYi6ELkOoT9uHz5fc4tdk5+APeWmFmbN9MkRaxLJmI=;
        b=L/gSzcN5RadQx2m4cXLA3uiwJAlA17TsXweK75X60pCmUJldrPf/j88W7buDRMB36Q
         qDm6AvvqFm9jYMxEh/YmpxRFOAKDWLP0eUOGXjViD4CWPJKsffuErH2T8o8YYl5ii4sv
         V3BpTHWQMzsCRvJSos1iWxV2/jmFvgZfTy8dwWlnP7v0ATboXcmZqCf/QhZWSu0La8mu
         xFMhhWTqLiXwhroiBc83nWbwJXpYsal/BOMEGAopTNdEOVdhaGq54HowuyqNZ5Fr4zsI
         l78tTT/DrGi2aeUqu+Vbnw9iRiLL7Sg3XsEn9/pBkdDYFjiI3pYPwbi3/Vu32PmqY0GV
         LTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795256447; x=1795861247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXYi6ELkOoT9uHz5fc4tdk5+APeWmFmbN9MkRaxLJmI=;
        b=vlm4+0QG2A2MK2YS0pSoxFUrXSSB7QeHCMWDgArec+O5/S+GA1ny4SV1A8Qo6Efcb0
         X1f+1eDXDh7HMDkhsDhB0QIHucTx6MwGitFlGKCQiwUPpwuXOazQ8ErNBmyrmA1R1T6y
         jA5tlGWYdmLyNrBv0LJKY0W4Q1VVdvgqSMQRHr0rSpHABGl9PeNeEs/kGfWXElEVGkp1
         2KKwitDNezRfXD+6ArR3bXk2uphF2z2TLHJ80n6zLmE0m0s58wefe3GPKTBq4OXByA9q
         nI32oro1RaE1JSYwYbETtZ2/LJAXo/N+bnfoRWERbEuFI46JtEs6rkr+mK8WhClvKVDj
         srmw==
X-Forwarded-Encrypted: i=1; AL+hErEmCDWpl8w6KZrQim88HQVwiGXU8PPLy7uBfONEJBr2Wepksakm8AYZ5mI9gLVJ7BKSjqxv3+U/E1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/epM2J4l3KScgdb2PTb9hDfajLy5PaRoAQu+p+pIgzbqV7ICC4
	zgabq55P4XAwNPQjhb++w/cn53ZyEAmPBtLq+hgMFSUpbJ+cQB7gRIFul0rosNvMvF2ECMplL1N
	8n8f1IdYnZrYetv+eoqHVrLTYm37N2pRtvDnbUC6sOCIjLDmsDexWdfKmUokwNKg=
X-Gm-Gg: AZFdTZfNpUxG/fUiQ5P8StmHZpuexLiGqT4enqk7odhM3oTE0IIe8jezbtysyYNO8/k
	KPP1gP4aopOekiQlkcYtlqOoUchqZwI314NzytFKcyQti6xpnYDVuEcTdgmX0ZpY/+7DKIO7Uiy
	jCJ/wBsu+cuJ3hYDp5M2ozFASnzzjgcy9h+K+zNQBbpiWn813dEZZE+Q6vzRyeTbCjbSuTkMg8m
	EORdhE3i7ArGHjxa2g2GncDi13zaOSaeTv0i18jWtnGhvg2DuwROBq7vUylJiPvmHx3XjjV95ld
	bOTakZrituTaM2h/uqgSYHthVgUbNN4iXJsXDFPOWXz1gwc39GdimVjHa49F5aaLkX4C2HKtaz9
	EqXiWUcS5rr+kmtuRXFdaATokdewaiwU/nd0Hh9zmNKww6gF31DgDjVxmPCxVx+iZrCK3PUUrJv
	U4j1sUaZ0yoFGSmfKfmQ9/Ufg4BQo=
X-Received: by 2002:a05:620a:2901:b0:949:7473:b1ab with SMTP id af79cd13be357-949ba95df99mr898044085a.17.1795256447455;
        Sat, 21 Nov 2026 02:20:47 -0800 (PST)
X-Received: by 2002:a05:620a:2901:b0:949:7473:b1ab with SMTP id af79cd13be357-949ba95df99mr898041785a.17.1795256446818;
        Sat, 21 Nov 2026 02:20:46 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm49433115e9.1.2026.11.21.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:20:45 -0800 (PST)
Date: Sat, 21 Nov 2026 11:20:45 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
        fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
        marex@nabladev.com, changhuang.liang@starfivetech.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: toshiba: introduce
 toshiba,tc9564-clock.yaml
Message-ID: <awFwfR6UZ5CRxb25@lore-desk>
References: <20261120183212.1264522-1-elder@riscstar.com>
 <20261120183212.1264522-2-elder@riscstar.com>
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
	protocol="application/pgp-signature"; boundary="74I8zLIQFI5Rhphx"
Content-Disposition: inline
In-Reply-To: <20261120183212.1264522-2-elder@riscstar.com>
X-Proofpoint-GUID: 3Rwh4s1vAo0zqRmQW6wQ5S9AYoGuI4l3
X-Proofpoint-ORIG-GUID: 3Rwh4s1vAo0zqRmQW6wQ5S9AYoGuI4l3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA0MSBTYWx0ZWRfX1YtmJEYNYWNU
 P6ESftvvlSrrD/EebLnpZXQpHaz1RMdYiQJRr/QAlEvy/OukJ3iVVt610Qvv+91KrAaE60XJ2BL
 c6BDSwzDZIPDFQif8yRwRAX0dujk6dBkVH/Zb5aLQGhBYmoDCD91bwkmBWU74RTf5k/HGxGGKlB
 do3UHFAG6atsVZ4mZRIU+MDkiig1FmAmXnJmhTvL0ef7C9pJnkckCMy2UL3uyVmUaItPjs99BoJ
 4uhY52BGQS+lJ0hgYtuns3oqDnShQMuxp0l958X7qvjryCbR6tKpekKQyaQDBm9+PO9Z16HlVqC
 oYELqJ3tFuSqUhaKlZCazPHh7beNLXFFmR+wZ+bq0Tv9Tod48tL+A+dGXzqXQWV3oQXskZQrVdy
 hekrx5EGZeFmNhhoS/bkuiMTvpEANHnRCkEswGSDAjZN9hgXCjkA5yULtwJcL5jYRDFb3mepD5P
 yeK3GjyvDcuSbHNLURg==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b017080 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SNAN7obyeoS8sKvqHW4A:9
 a=CjuIK1q_8ugA:10 a=yYJo9gpscVuyvyc8L8AA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA0MSBTYWx0ZWRfX2XegJ2+vypOz
 9H7CbnvzxhcrYc8n/UTB2pmdfw41YXgOvuM+WoY0oVi3oNgHzCswIOrmQt/K3+k+FcBC76Sb2O4
 aWMnIMkrRuZqEJshSTpBVJDptD74mSg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210041

--74I8zLIQFI5Rhphx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Define the binding for the clock and reset controller that present in
> the Toshiba TC9564 SoC.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> v2: - New binding that combines clock and reset under the clock node
>=20
>  .../bindings/clock/toshiba,tc9564-clock.yaml  | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  8 ++
>  include/dt-bindings/clock/toshiba,tc9564.h    | 50 +++++++++++++
>  3 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc956=
4-clock.yaml
>  create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock=
=2Eyaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> new file mode 100644
> index 0000000000000..e789ce8c6a3ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC9564 Clock and Reset Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description:
> +  The Toshiba TC9564 is an SoC accessed by a host system through the
> +  upstream PCIe port on the PCIe switch it implements.  The chip includes
> +  an embedded PCIe endpoint that provides access to various peripherals
> +  within the SoC via its BARs.  These peripherals include a simple
> +  controller to gate internal clocks, and a reset controller.
> +
> +  The TC9564 chip has a single input clock.  Internally that clock is
> +  multiplied by a PLL, and the PLL signal is divided into a set of
> +  fixed rate, always-on clocks.
> +
> +  The clock controller uses two registers to control a set of simple
> +  gated clocks, each derived from one of the internal fixed-rate
> +  clocks.  A total of 21 gated clocks are implemented within the chip,
> +  but support for enabling and disabling only a subset of them is
> +  provided at this time.  Two clocks (I2C and PCIE) are marked critical
> +  to make it clear that they should never be disabled.
> +
> +  The reset controller uses two other registers to control a set of 13
> +  resets that can be asserted or deasserted.  Here too, only a subset
> +  of the resets can currently be managed, and the I2C and PCIE resets
> +  are treated as critical.
> +
> +  Clock and reset IDs are defined <dt-bindings/clock/toshiba,tc9564.h>.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: toshiba,tc9564-clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@1004 {
> +        compatible =3D "toshiba,tc9564-clock";
> +        reg =3D <0x1004 0x10>;
> +        clocks =3D <&tc9564_xo_board>;
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c00d3612c9acf..af088e1092e63 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28683,6 +28683,14 @@ F:	Documentation/devicetree/bindings/media/i2c/t=
oshiba,tc358743.yaml
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
> =20
> +TOSHIBA TC9564 CLOCK/RESET CONTROLLER DRIVER
> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> +F:	include/dt-bindings/clock/toshiba,tc9564.h
> +
>  TOSHIBA TC9564 PCI DRIVER
>  M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
> diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bind=
ings/clock/toshiba,tc9564.h
> new file mode 100644
> index 0000000000000..a0325b10b6c36
> --- /dev/null
> +++ b/include/dt-bindings/clock/toshiba,tc9564.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights res=
erved.
> + */
> +
> +#ifndef __CLOCK_TOSHIBA_TC9564_H__
> +#define __CLOCK_TOSHIBA_TC9564_H__
> +
> +/* Clock IDs */
> +
> +#define CLOCK_PLL		0
> +
> +#define CLOCK_62_5M		1
> +#define CLOCK_100M		2
> +#define CLOCK_125M		3
> +#define CLOCK_250M		4
> +#define CLOCK_312_5M		5
> +
> +#define CLOCK_I2C		6	/* critical */
> +#define CLOCK_PCIE		7	/* critical */
> +#define CLOCK_MSIGEN		8
> +
> +#define CLOCK_MAC0_TX		9
> +#define CLOCK_MAC0_RX		10
> +#define CLOCK_MAC0_125M		11
> +#define CLOCK_MAC0_312_5M	12
> +#define CLOCK_MAC0_ALL		13
> +
> +#define CLOCK_MAC1_TX		14
> +#define CLOCK_MAC1_RX		15
> +#define CLOCK_MAC1_125M		16
> +#define CLOCK_MAC1_312_5M	17
> +#define CLOCK_MAC1_ALL		18
> +
> +/* Reset IDs */
> +
> +#define RESET_I2C		0	/* critical */
> +#define RESET_PCIE		1	/* critical */
> +#define RESET_MSIGEN		2
> +
> +#define RESET_MAC0_MAC		3
> +#define RESET_MAC0_PMA		4
> +#define RESET_MAC0_XPCS		5
> +
> +#define RESET_MAC1_MAC		6
> +#define RESET_MAC1_PMA		7
> +#define RESET_MAC1_XPCS		8
> +
> +#endif /* __CLOCK_TOSHIBA_TC9564_H__*/
> --=20
> 2.53.0
>=20

--74I8zLIQFI5Rhphx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawFwfQAKCRA6cBh0uS2t
rKhKAP462A+O+0d08oJ57bD0xi8kZxoMIy69AvPWSsVll1JMRgEA0+CAQJ89voRL
FIgXA/+1Tpy3ashRbhj7E1SQUL+mXw8=
=fQZw
-----END PGP SIGNATURE-----

--74I8zLIQFI5Rhphx--
