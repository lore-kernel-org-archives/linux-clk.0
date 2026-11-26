Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685088;
	b=BZH2vs5FtXf30jv1oCL/GecaGzjU0uivi2LIIVJKy+7Pt0SoaAQvWrVzV8vF+u0t9vMX
	 r3aBBezbIXyNFCh7NEabkQgMe6a0+cLM20o0OhV2s9uSMXuHpiGJd1WDmyT6lQnG8QHrZ
	 MbxOEq874r4nnz2ibtkFcwK9d7aIoNks5RZL+IsYLX4QHYJXGrBDuFbWyOlnsjiqHkqrk
	 rmLfZRHmx/qk4Wpr0Yd8GEemUOHCZushpy5uhPLMjDj2LvUXsLaIUgHj25afHKhzWhEy0
	 xGl9BQbcVmbez2IIyEefPHnOGjprTUjDD1pBgu//vMojkBPnPmekaO3FxnIqbCRdOPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685088;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XVUjP03ObQQTCRszlwgH1jANBROksOiYDbFXWYItrQE=;
	b=w2BsovjWFNCYCE7+ijvsGvx5h0KoZxXFviJPnmQ3ZQjgyqtBf5pQ0wKAE1nv2VGJH3eE
	 oZRZXZ/bUOBshMM0Zpb3UTNrH4PZdMovn//sukDiEHULm4w9aqYhdkfeUaYoZVuW7Csmk
	 aScFWDYU5SpetVnr4dCJEwD324k/jK9++3SrmQweQ3i2jk07Xngj+puPBtrUQTFQmOUJx
	 KJ5Y3j4SxdCr2S6Qm0ZGr8F+EQu+g9vwUhqQ2XvXsA+IIqjFIjIJdbVyim34hDF9xtCn2
	 TxQIQtAewWVWclDYXyzINsOjW6s5qQm6GuxSf8pnInDvGw5w42U45w4uP6Zzcig6V5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BX5xhDmR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F78606A321;
	Thu, 26 Nov 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BX5xhDmR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94281F000E0;
	Thu, 26 Nov 2026 09:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685088;
	bh=XVUjP03ObQQTCRszlwgH1jANBROksOiYDbFXWYItrQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BX5xhDmRtss+T/GjsGaOB1AiIp+FVuFDWZgJieOqdU5pyv+7fgjLqzptWwIwP7waP
	 8kGYsaqiRw+Ksycs3CdxCTJ6vFfPBAhWVYk12oDOnEXEIMKCK+4PXwndo7lzALevdR
	 MrGaArq++MiCwkAOttCWq46+VEoej6gkxw0pFRaj2D6cXMNV4ICzhRawnNktpqyPF8
	 EdiXjWA5KTaiq/ODOe79SAsZMjSQfCIfL3vTEq2vygTczRRkvlMI7vT9cu2tA442pf
	 IQ0AqwrNAZDo6K+0n7eUJKNdd92cIq7WqtQrEqMOcOdZ41rJape9S1EgOE0KupesWN
	 FbTH0zkcwQzqg==
Message-ID: <sashiko-outbox-235125@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: microchip: sam9x7: Fix GMAC TSU clock ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mihai Sain" <mihai.sain@microchip.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126091809.13012-3-mihai.sain@microchip.com>
References: <20261126091809.13012-1-mihai.sain@microchip.com>
 <20261126091809.13012-3-mihai.sain@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:24:47 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ARM: dts: microchip: sam9x7: Fixes tag cites wrong introducing
  commit
--

commit ab9dcb34321c197d0e90e97c7fa545aa535bd40a
Author: Mihai Sain <mihai.sain@microchip.com>

> ARM: dts: microchip: sam9x7: Fix GMAC TSU clock ID
>
> Correct the GMAC TSU clock reference in the SAM9X7 device tree.
>
> Use PMC GCK ID 67 instead of ID 24 for the tsu_clk input and
> its assigned clock configuration, ensuring the GMAC TSU clock
> is configured using the correct generic clock identifier.
>
> [root@SAM9X75 ~]$ ptp4l -i eth0 -m -2 -H --clientOnly=3D1
> ptp4l[3920.698]: selected /dev/ptp0 as PTP clock
> ptp4l[3920.702]: port 1 (eth0): INITIALIZING to LISTENING on INIT_COMPLETE
> ptp4l[3920.703]: port 0 (/var/run/ptp4l): INITIALIZING to LISTENING on IN=
IT_COMPLETE
> ptp4l[3920.703]: port 0 (/var/run/ptp4lro): INITIALIZING to LISTENING on =
INIT_COMPLETE
> ptp4l[3922.226]: port 1 (eth0): new foreign master 803428.fffe.37d483-1
> ptp4l[3926.226]: selected best master clock 803428.fffe.37d483
> ptp4l[3926.230]: port 1 (eth0): LISTENING to UNCALIBRATED on RS_SLAVE
> ptp4l[3928.226]: master offset          7 s0 freq   +7815 path delay     =
  650
> ptp4l[3929.226]: master offset          8 s2 freq   +7816 path delay     =
  650
> ptp4l[3929.227]: port 1 (eth0): UNCALIBRATED to SLAVE on MASTER_CLOCK_SEL=
ECTED
> ptp4l[3931.226]: master offset          3 s2 freq   +7829 path delay     =
  652
> ptp4l[3932.226]: master offset          2 s2 freq   +7828 path delay     =
  652
> ptp4l[3933.226]: master offset          7 s2 freq   +7834 path delay     =
  652
> ptp4l[3934.226]: master offset         -2 s2 freq   +7827 path delay     =
  653
> ptp4l[3935.226]: master offset          4 s2 freq   +7833 path delay     =
  652
> ptp4l[3936.226]: master offset         -2 s2 freq   +7828 path delay     =
  655
> ptp4l[3937.226]: master offset          3 s2 freq   +7832 path delay     =
  654
> ptp4l[3938.227]: master offset          6 s2 freq   +7836 path delay     =
  654
> ptp4l[3939.227]: master offset          2 s2 freq   +7834 path delay     =
  655
> ptp4l[3940.227]: master offset         -1 s2 freq   +7831 path delay     =
  656
> ptp4l[3941.227]: master offset          3 s2 freq   +7835 path delay     =
  656
>
> Fixes: 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for SoC")
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>

[Severity: Low]
In commit 41af45af8bc3 ("ARM: dts: at91: sam9x7: add device tree for
SoC"), the gmac node already configured tsu_clk and assigned-clocks with
<&pmc PMC_TYPE_GCK 67>; it was commit 765aaba18413 ("ARM: dts: microchip:
sam9x7: fix GMAC clock configuration") that changed both to <&pmc
PMC_TYPE_GCK 24>.

Should the Fixes tag reference 765aaba18413 ("ARM: dts: microchip:
sam9x7: fix GMAC clock configuration") instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126091809.1301=
2-1-mihai.sain@microchip.com?part=3D2
