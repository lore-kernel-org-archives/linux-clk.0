Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F563F12C2
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146470; cv=pass; b=aH7TD0TvjgC7q4d+Tp/ODIsORt0+833OGsoqR+klUjrlhPdnH9wSWKQAXPJMc88hNJmlwSeXJinPeWRIjqtsamGKCeU6sTPiz0fQWwNTyHCIS8ZTpO7jO7t4+Q5+1RQZU9fh85faVqMZaBZEI+C7UDqh72/BsZ8o24D4M50m3Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146470; c=relaxed/simple;
	bh=PeyKN0baBhutHLbY8tpY5GwoAhsXPzOWCm1h3cCqBJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+YvW5NTZ0mxTAm9anPVbXNyVnT4hBGEmP9qszrhZyQDa8UQ9z1Q8WgdrUum4XlSaFqCmwZI/YYCCXbyX1AqLp6qEozc1681oJQGW5raa2rprmZTaPDl8RsJNypWmybL5d3TLq0Uwj5pPgUSRgeO3ByJUGEnXUKaLKqQLN84tJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pR4g/VVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQGGMBLg; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pR4g/VVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQGGMBLg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9WvsV3490831
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 10:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=; b=pR4g/VVDUj1stCtg
	quKe4ihAM1gvEsgmlEWtE+21OkUdNfPYciwb+yeHh03cLS28HXTex7gEzog62RaL
	N2d+cDiCvfrdjXDv8RwdHJAPqnMTlDlAy0hkXz0A4ojGe/T2xLeCu/2mk7GLi0ZW
	UrFvVAjMy3d4gC2jrb7+l3RyUUQ7OWlxF76JT8b86VGb1eTfc3nLfUX9X43DLp38
	G3s+8zd4R4gvaQq4q7cW5lhV98s5ca06f27h24pcadY3WichadQZPEJz/PexHuYd
	L93y8Az+sWt+fkf/DiFr9bTxglVYH/hyXM8gz+lEINLIgpczhK8smEgferrZ3EUK
	vAU/MQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngystwu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 10:01:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f27f49bso245137385a.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 03:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785146467; cv=none;
        d=google.com; s=arc-20260327;
        b=B4R00klpB+lHSWsxUDedOKaPVynpTRQwZjrQYDV/Qpw+Lkf70/X74a3PwpxBFyNcrp
         p3fcU/Hx8klLmn+Znv9zQvqIaLkEn+P6x6Xngnd54geqCPcDyhATCdPZ5ynAQf+vttL5
         KwTX8FEOwAJWXcXBshLKvsp24gIM4GP845z4Zi2ZsvZsmbZ3TIS6k8DoN6XpYcaRQkCW
         Uz6ZvhLhKZqejSCrx40a5bNj6ZmX28rY8ZmlepPsILhddjI9LbPjYqiAyajuTm+lOOwV
         jaiPiErxoSzY1eGQMnPaE9JlQBBrQWqo0IvimGNOnGQ+4l0Erw2O0ZhAABW3Sx1RUpvq
         exrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        fh=c+sBy+DxoIrI4fmIUNTtG8a+W5oW9LVtpTVM8oiD3dE=;
        b=iFqavg9CHMUm9a5fS6oyqvcZiKdGP05nJGAypE/91oS0/5uObtcAB3RysrdX2Al5B2
         sCrOyGC59xDxhzxDNLXWvQuOEeg7DdjDEPlYy8dy9VhAcs8p8UR1+lMsTUfJiqlMrgN/
         L76PsfpIEeoGPj4K9tvIrbqDEwpDVhLu4xDumbmw7jfwo7JGVFnO7ngIkm3WhSgJya13
         h9JxJWe0ECWeWQ5BkK73amv8HxIkkHNE2W6UB0WXPbcOAvssb5WKq2JkXXRA+0nKKnD9
         Yi7P9USr7heZIU0p5P6l4e/0UCOBQcqJ/VU6dTdjkeUpnfWMsI3g7L1ooKkcwF3wccyy
         a7jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785146467; x=1785751267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        b=iQGGMBLgqR7YeueMsH0zvOLit92OI7L4dPpP7RVpRObCBoXJXHk47OPtugPUftZp+V
         7ueQY9c68uEFrQ/ZFisO2jlF0eU+Gflirv3B7kNsz7DgYchgd8uinvPH4eZlhloYYXuk
         Y0tseC/4JZwFNV1niBAOddoRryMPOfNcmhAetPfQHVMifTbPBLEDAOzt2GfQejmc3FDA
         VucnZyrWrJrbbgvWGxWp9uir//IYaspBr9ZfX10a2o0/Gz8UiLIemFyFkay9yZzBytN1
         lde5Icyajr3LuWQCEwxAXUBifNyo5uZYuKRU25HYz5pZyGZ/uw0pypcT/efkZXOeJzn3
         zvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146467; x=1785751267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        b=BXcmKfX/bLHlJKHGqh2LHedEIpGx4Gvwv4uoB2QgFevo3l9tX3Job2eZnJWPnRjba3
         Ff0XFE/dyy6IOQL6R0Rhwvi1FbjiaLrkvpRieMC+bpu0US5GLco4ocZnyoJqxJkmuESK
         0HiOEWLTw2OkXmRO/yFA8e3CHBX6lS6H4xhiKaVzy5iAo/mJ6/UJt57dVeeIK4VDYrVv
         MwJ5ctg+R+SwzofoyKeMvgWyNgYtlDcHa54M5zVDpaLkibEUhNn+4sLzxYugPI9O9s1h
         pWcm5bE7ihCmqy7P+WVIs7OtA7bwfwZIai6aKA7DH9ijgXBG0tMXh98XDzoVigKvLWhB
         Rvgg==
X-Forwarded-Encrypted: i=1; AHgh+RoDuMdbBpTjedP+uzUVUYRnuIx+QyFXUcBAmpsfeIvPMT+adWixJ0cNFJ//m5YLHDt3/0bVanFbiCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Dv8tBPDcYytXHY4HV6NOvdZ/NRLuQAPxDyrSWAig3r+sY+sC
	lQyXdvdfQp9MjzRkLwq6YBDs47rAqYdq7uLK3jt96pdaxS5Be54GBIZaFmoiV5sBmSOmfL+/Iyk
	EkF5xcDYr5EuG7IgdsL+UyZ2JH731pacwwlnR3l+dU4YhhVgABWVAA5Pja0T9WlMcB5Uu6RAmcm
	Q44b8yZI79UTt4zAUb68X9zUt1OrAMnRVJMUQQYg==
X-Gm-Gg: AR+sD116ZwhvncK2zktSwDZ4yh8NeE1GcBPSAivQN6QhTRds3mvo5V/MRcsQF7YCn4K
	r9tKjaWVnV9V+D4SGhBHaPbtakImiFmIFRt+KWiPS8Bz+b6lt20jw1qAzfy3UR7qol0mFuvdVBu
	Tdcg5Ji4+V4/xzRbnE/4n18X1SSeRex+aVwhmy7fUTOUr8FNi5Xnb+jrhG8Q==
X-Received: by 2002:a05:620a:2688:b0:92e:745c:6c5a with SMTP id af79cd13be357-932f948144amr15123685a.14.1785146467044;
        Mon, 27 Jul 2026 03:01:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:92e:745c:6c5a with SMTP id
 af79cd13be357-932f948144amr15109385a.14.1785146465706; Mon, 27 Jul 2026
 03:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
In-Reply-To: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:00:55 +0200
X-Gm-Features: AUfX_myrKTD-P-po5naXNkkd8gbbZmT-1aLEtXL0NN10jCpUSfBDEv1NDisfyg0
Message-ID: <CAPx+jO956WAqXt-zbEyzU5btS7KsXn4fBemaj4r3qQNANNJCKA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pmdomain: imx: build the SCU power domain driver
 as a module
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, saravanak@kernel.org, ulfh@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        peng.fan@nxp.com, aisheng.dong@nxp.com, jindong.yue@nxp.com,
        xuegang.liu@nxp.com, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX71ZVPy6BRtGX
 s/J/ps8uNDAcOpFiGrZMkG1Hzyi0FqaVfR3KoinJsQEObevsAMGTmzmipz5yGv6wDBDAa9eqem7
 1kHjSrwmVOTZ/yvGe2C9KfVpZC1JSB1JzH/FF4KggGDSuHbD8J5x9n0F1PLqNgFoktXZN9o0hy8
 NOkrFsunZC3Y7oVmaFhfj5PTDuGehHFMrRTTR1YwmBrf8rvUwRCG87Yx1YzI+JiHm2wZ+DBPV+O
 wzqiIOYv4QXwX/MHDrqclvxWfx8ns7n4kZ5RU/afeXJFoDiMVANRU/Rkg8ZDfaF2bZjxiBjszty
 XZK8YcUiShF+x1FKzntM8d2ZtIBrm1TQtoQrkCY21AO6FwZCCW0wZsNNs9R99pPvwOuNZCxYMDC
 P7nwE/khChbESBePgSR8Z1Gu+v3sGzofiB2SQFO8OpfaRI1WrRuSrwV/uVcko8qe26vo/t1/aB2
 yu5n34+Mre/tbK+mXVg==
X-Proofpoint-GUID: V3MGLN6S7TGBZqk9X8X-8JL9ct6ciJ29
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a672c64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=8AirrxEcAAAA:8 a=73SNKA1z6Gcgn0qlyfgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX4L2KUkgIplY3
 /nK6yhIcc7Bazq4R7l8MeDNYHUxatkIDhwZMVb7i/MBHdQdxaKpHOea+pbN6sedU1cz2vo8xU2C
 ufm7jgkXMkVC8N3Al+mEd2QybZDTcKU=
X-Proofpoint-ORIG-GUID: V3MGLN6S7TGBZqk9X8X-8JL9ct6ciJ29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270097

On Thu, Jul 23, 2026 at 4:05=E2=80=AFAM <Zhipeng.wang_1@oss.nxp.com> wrote:
>
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> This series makes the i.MX SCU power domain driver buildable as a
> loadable module, which is required for Android devices using the
> Generic Kernel Image (GKI) where SoC-specific drivers must be modules.
>
> Patch 1 exports of_stdout (which the driver references to find the
> console's power domain) from the OF core with EXPORT_SYMBOL_GPL().
>
> Patch 2 converts CONFIG_IMX_SCU_PD from bool to tristate and adds
> MODULE_DEVICE_TABLE() for autoloading. subsys_initcall() is used so
> that when built-in the provider probes before its consumers (e.g. the
> SCU clock driver at device_initcall level). No module_exit() is
> provided since the provider cannot be safely removed at runtime.
>
> Patch 3 adds MODULE_SOFTDEP("pre: scu_pd") to the i.MX8QXP clock
> driver so that modprobe loads the power domain module first when both
> are built as modules.
>
> Because of the cross-subsystem dependency (patches touch drivers/of,
> drivers/pmdomain, and drivers/clk), I would suggest taking the whole
> series through one tree.
>
> Changes in v5:
> - Fix MODULE_SOFTDEP module name from imx_scu_pd to scu_pd. (Sashiko
>   bot)
> - Add Acked-by from Rob Herring for patch 1.
>
> Changes in v4:
> - Add patch 3: MODULE_SOFTDEP in clk-imx8qxp to guarantee module load
>   order when both drivers are modules. (Sashiko bot)
>
> Changes in v3:
> - Use subsys_initcall() instead of module_init() to fix probe ordering
>   between the power domain provider and the SCU clock consumer when
>   both are built-in. (Sashiko bot)
>
> Changes in v2:
> - Drop module_platform_driver() which provides module_exit() and could
>   lead to use-after-free on module unload. Use module_init() only, so
>   the module cannot be unloaded. (Sashiko bot)
>
> Zhipeng Wang (3):
>   of: export of_stdout symbol
>   pmdomain: imx: scu-pd: allow building as a module
>   clk: imx: imx8qxp: add soft dependency on SCU power domain driver
>
>  drivers/clk/imx/clk-imx8qxp.c | 1 +
>  drivers/of/base.c             | 1 +
>  drivers/pmdomain/imx/Kconfig  | 2 +-
>  drivers/pmdomain/imx/scu-pd.c | 8 +++++++-
>  4 files changed, 10 insertions(+), 2 deletions(-)
>
> --
> 2.34.1

The v5 series applied for next, thanks!

Kind regards
Uffe
