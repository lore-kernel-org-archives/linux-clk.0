Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604913;
	b=wFZgvRONTBRrCPvS20FuMXI0cI1xF79HaHGlG0ylqyNbiBpVBXzO40KFdhMw4BCG/HLX
	 R4es1m1UEvFglyfD7VfyghiMqzAJeMfIrEBCFvlbp5VQ6jdjrJTGfR9eeTOrfJ68rpbXi
	 1hHeCYNtVPVUxEQLvdu5pLG/XWwoZtOF5p91hTgdc5nSgalo72DDKxoF69dl9R3MuolSh
	 ky/hzo7Ga3/mEOVxbcvFsEZ08KJSPgDUGvH3fOtAhn7lIi9MX5Rrwq5nI3T8/DCNrLTUB
	 tS61XezI6nVVnbw8CjHKmJj7Z+S88dcPxPQedb7JFk9PBku1edkEx6J5uTVhogQ+Gzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
	b=3EVF0dHTo2w4DPod8nG+K61D1xNyL5tzl9+PuJGb7STBQAaI+JfnEsLqWGHdJB084bij
	 sPF6LGQ0kjeBhgvYZT24yjTGwHb89yEAJ04fJZVqW8IyClnUYEUhivV7qY7c5VeilImv5
	 8HQ3kW6AKqqreEfrE0gMabU4VjyzfjPk3oBKh/NpvJTvSXHReTBVU3SiUCLYlnQkU3Xr6
	 gt8wyF+xvRCkHDF1KNc0OT0crwCFV9GV2ZSmHe5qHL7dpi7u4hI2tL2fRstYrPn5nXeXn
	 ug2OT/gaz+KNjxzUiCVGIVNivP5MT0VQ2Tj884XcQPfEKMxCmltLP/OC54zdlKHl59A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nc9uQR+j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JooTsSeq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A6960A2602
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A6960A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nc9uQR+j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JooTsSeq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mejH796860
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=; b=nc9uQR+jLwGYfJ+v
	wCrebLA8CUnPykqKns+CQ2yrRQX7mBdPXHCMWPqrppNP4EEqU2xz/ZDxv4GlaaV4
	diSFgLYngeA848CL7VUmP79lf0CGvoFe7HMV9ryXoUlJgFCDYVA+vY5YqMNHvOzp
	AP64yguW96k89HPWqInNVzFmbAczwLCAuNLpnN+AtB/co6g5xKucvRnn7YHP17Tt
	nsxQo16Kb9HnPlxBxSSD/axvQB25PQ9cB8UzYqupv/HjZ1aliLqhuH91v4Qctbk2
	zFH/QuxXH5D6PfcOI6atlTGFW72NTj/SQ4NkYR6bvlOtcKnV3kbeDY4jlT8UZFVN
	H9JRJA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtca3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:08:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso4457276a91.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 03:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795604911; cv=none;
        d=google.com; s=arc-20260327;
        b=TVXkcGp4wCgGQQTpem5Bo3l0H1Sgm8xtlUxv5eIlkkbPHCgH826QeEPIe3gmDrmOdP
         wotzMcEST+LTIsty2sERfrPq1d4+BytIOVeWUF9bY8lnWN4rl1/ZbFwGL4cAeEmGv9sf
         5HXpEpcN1xgvCJPxLo0cO9t5UIw2kD0GM/AajqhmqJUpodBvVMlqKLgj0wDmZGaMhXTW
         fzbJwj+5ExK36CORVQJg+YUQi7a60dz4/uNFU8Aw21FxrzYnZkSCjORFIMc0CbZPZyTh
         7bGHUD1NHpbuirFuCgM0KYpMfC4AarY4JZWBJ93JjUsEj+EfszO2gflLeLNkmzyRXipv
         7/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        fh=yyvRK/6MGF/EY4xH6uiNraukokDy+bGmeYnf3gK2T5s=;
        b=negVL1g/ozwDijPq1lsbHxjiQRjM7dCRjysoYk4dCAo2MCcGJnax4uPAmMFTmQtpFw
         EKTTA6btgWR9cVLeqdBdvDpmCu2YLJWpEw7GdoC6KcUBLSrLYAXeb1JH7wV3HPqwmR7B
         pfy/oKM3IApXUuR72EHvv09CB1rVLo800S9KTsOqpkDgZDLehlWqimRhEci/960l1Orm
         CRE90EfHpivrCpNEijr/lI0sahXY2Laqkd6nvoBF/DMNoAtn3SSa8Ob+eXyLjdH2WdlE
         Mc8oDRE92tj+llsjDuGGHoL0vMK7e4s/kF/5RFq/BNz2dHGdmIxcThnUdZokj2epCj63
         b7Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604911; x=1796209711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=JooTsSeq2RR1X9kQ7o0BsZFsA8NkAkFKzubTfUrfxs0AoHK0J6gRp/ranL0IYd4DTh
         qTFPTwolI/JQcnvGSgmo+MEX93AyyL2/zTlaOKAMWqGXXu/OU/+e+Nml21uA+/7i/TW3
         AdMpSpQ6HS+75nLtv4n1XMi0n4knpbPsOUxLp7zi+/cFhxR+qTBbpB5FWeoW/wz+mo1E
         L/TIjfPa4lOEIjrqRusrw/DGKvaaCaUSlWcHhH60n6vEOlahEwY4nM7VlyNTUMmgjtSb
         bJhUa4rVDCDmrO92JSSelxDCxWetV8Y/S+s0qvhkkRctw9hA8CuSIPoGQoLr5wa4JDyS
         nBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604911; x=1796209711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7zUToUS1+7RVlBq8lg0DAY2VTgGDQHEGVuEzMquWAQ=;
        b=UuCxI5yz9AsSf2cHWLt5gH0+P/AH42LuyUSdclcyA1E+sVCwXIdB44oXR97+FtzJA1
         iiO0TvBhe2UP+yruajgyF/7quti1BYr7I5PDbL7scb7Ur+ZYHr88L7ow4DqzYxJQpJ5p
         4UY3kLq9jswHS8YHhYPs7MvVC32uBy3Ei72TARCBerRUtj/+AAzzzgbJu+V7rxoHwmyo
         zjbiifRCjhMYYUNHiGtUWdyn3FL8nHaYFSgkLhY0u9iQO2hB3lM8OaaCudWK3fKVUjXG
         zvbrHyUO3/GDOhiVAqKY2CF2sp6P+Fz5BUa44XRshlAwgiscMVdkDkIipN15r9nxbAbf
         AMTQ==
X-Forwarded-Encrypted: i=1; AL+hErFBYyVbPMuBqEMWQ2WpUsJS80Lo/ipfpYwfVRvqqxX2Dq5QGVke8WftboLgIbQPl1b4X4WyKqx005U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+dIkGqu3tFgo8owzD1fAWUz/urXdstr8katGgGM2abg09CcpV
	Pb98xTGn6NAcavZE0J2f3welywEWOpmWX1zpcq+8uKdEEGR9+lcj2jWef8xEOD4zowooCaACSZV
	QZsWgkl9QRZP7NpB6giMZpTuQY3xjhAY3ZDQwHVv68kAJIyDLgRmAq0jpIa0zNUEKBpv2KmEQaC
	MTOwIppSinR5QTVkYsdVt0RBVS1tZuIYkL+PpSKQ==
X-Gm-Gg: AZFdTZfBDAQwPr6jTxssMC+tenvVp86OlVBKi9xWfP6m6ql+3Uk/uyyBAkj5hMDkfYE
	B5ez1JmjyS212k9zG8UHk7dRyugz/eBNShOzCcx0UFZomX0D3POvr2Xss87W+6Ij0XGSlk4doyo
	6F23DeXz1ZxsrrhGthB+yzflAcC1JlwzwHJ3EFs7ZJIOWWWlkhD2XxB1QqOQ==
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b41c911c91mr17608607a91.22.1795604910723;
        Wed, 25 Nov 2026 03:08:30 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3a8:13d6:f740 with SMTP id
 98e67ed59e1d1-3b41c911c91mr17608576a91.22.1795604910256; Wed, 25 Nov 2026
 03:08:30 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <16bd6b25711f0e5a4a8ff7484ad3acba83a2a2fb.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:08:17 +0100
X-Gm-Features: Aa3M54pwdhQzxCyuIzV30L5QTtG5r_OlDFzkU_dedYyzSv3GvUcS-vx6Qv1tWoA
Message-ID: <CAPx+jO9F6MkwODVi10HkGNYCTJHG_0vc8Bc3FMs4go2q9+=_JA@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Paul Elder <paul.elder+renesas@ideasonboard.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX1uK3zl955ZIe
 wz87IG3QZr6SJMp0Hj1Eh74KjwMfJVD5mtl/zElQn4l2OcGEHmYN01ajPRGexZ081vvbZ24I4xb
 2Jnk5GPMPIo3wWOdBDy+i4eSrxOFfHL9oUMP+Be4NrJxiyTe7ymwp6NM9U+fQ0Z26dU1ixy9Ft3
 vVpavQyxnFknSivMimAKwNn0vktuv7ywQj4lp64ggP2gpH9gwFcHSvBoFFipt9i496fC4jAgb1p
 Er4bPq+rzc+wcu7VX205dEriwJvAZsXDRD2meqp1tzlsxYCPeZRaaXIAQYK+65DSFAB+XD1dZ6J
 J4RDNQOaH01bbnhzhB2CEtmmqHvv5xVdIA4SZM4W7KUgroz1P76TmDteH19jlN6o2az9pgknCkz
 nK3DKO4wQ0+oTwBl9IhOsB/54puvSGIJbOTABWBvWoDtMN4X4la8IVGProG8bCY4Y/1BlBGf8+0
 SsURi3fPQS924v6D5vA==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06c1af cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=LDBv8-xUAAAA:8 a=wQiWHD2DouBedGx1vnwA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: dY1KFilxpKV6lP65X5L19l-bN2Lm_wnw
X-Proofpoint-ORIG-GUID: dY1KFilxpKV6lP65X5L19l-bN2Lm_wnw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX6wp275/yAq2H
 cSSr7TJWqU2Ofr/aqwW95y+D7gOuxMnRtf1cK3PI/LcTtOFCt9u9glLGXKSc2wCny36ZARg0B3q
 5TBjn/mqyLgK1gkG+SV7ylfG3F3Ws/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike provider-based look-up functions in other subsystems[1],
> genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> the provider is not found, thus not supporting probe deferral.
> Currently this is worked around in of_genpd_add_subdomain() by remapping
> -ENOENT[2]; other callsites don't care about the actual error code.

of_genpd_add_subdomain() isn't the only caller of
genpd_get_from_provider(), hence this would change other behaviours
too.

In particular of_genpd_add_child_ids() could suddenly start returning
-EPROBE_DEFER, which seems reasonable to me. My point is, please
extend the commit message so this gets clarified.

Otherwise, the code looks good to me.

Kind regards
Uffe

>
> Fix this for all current and future callers by returning -EPROBE_DEFER
> instead, and drop the no longer needed remapping code.
>
> [1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
> [2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
>     return -EPROBE_DEFER").
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v5:
>   - Add Tested-by,
>   - Clarify that all other callsites should be fine.
>
> v4:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index ee8075e90852e738..c242807f62579e5b 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>  static struct generic_pm_domain *genpd_get_from_provider(
>                                         const struct of_phandle_args *gen=
pdspec)
>  {
> -       struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
> +       struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>         struct of_genpd_provider *provider;
>
>         if (!genpdspec)
> @@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_=
args *parent_spec,
>  out:
>         mutex_unlock(&gpd_list_lock);
>
> -       return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
>
> --
> 2.43.0
>
