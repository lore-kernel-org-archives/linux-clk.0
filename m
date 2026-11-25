Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620264;
	b=aC22tOTXQfUbX6MkzDs2PAYV0BM4Y20eeXBayYBWYzINm1rSVzL8Sihw4oquhtzL/8y5
	 jOM4fIWAA554Z1GrfNz1a9QgZ5WzPGyvVGUEGTXQGHjYre53g7yKfFdwxXft0ASy55Qbp
	 wKguI3cmyM6qRNAv32W4rlW33Lm2FzvYiSFrnqc0w0maIl6m/aemYkdkkzfbuMWqJ7cuq
	 eL/n+vI6g1G3Ccek0wYsIUaCoN8LBfgHYGAjgSJ/jYdT7r09EAqV6RgJrIfefK4jyyf4u
	 cA8NUc/99X6DoZkFPcD9YDculD+bqFYRWw/ezWbPoUbu38ZCrk6oBYa1nxJR+i2fz4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
	b=1y6btqDM/ZmUZOPbCyuKSIXJQwFKTqkAish6PVnb8afi6gvl8daFOYfABxUAefAM6Z0k
	 k5dxlK0Pi8FfQyT/heIOAvTyu6xU96R2RpYtV7oXg8kHGhnGSczxvFoIs+Yj6Lf09oN/a
	 MACU/pRrCUWSEu0jwkee0+/GBDmn+6NcK20POMrnZ6OTqhXuaoi2hAcaXXGOrZFrfph+j
	 z8VaVsaVs6FY3NDjD4xTM+YW6Y92baQH+UGRtiRG92FM4gM+LmIYHWb/dCgSqMAaGepuj
	 lhUud/Bk17Poztgvqd/WROWCsvtRZMLMy/EJqlhzAIoZst8KKnOTFs6p2nNekHpU8Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpbdRQEC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOUmSRAJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E0606A31E
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 15:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436E0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpbdRQEC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOUmSRAJ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM4fG539720
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=; b=jpbdRQECJn9dd0rd
	YCzlMvxKh1E2FuxDCRdZgzLYxR58MASQ/lLJbK7mQZPHj1Gv6CsJ0tKvAJ6xMV/M
	gffkkQJSBTkiChotyI1wk1WWAybtK54prCKnQMFZH+eQ8C9VeCjTQScGYlMh0AON
	GmPvD0irgjac0Z0b+QcJN15xfbB9OBHRPmqm+yD2YYvref173bokKukzcTD7iYIr
	nKr2JqhbWduQYUrgWQQgIHZOcB9rEEmQ24/8vdV4MJ/APNNo2e6fRI6+Iz+0oc8I
	MH4oUuVBaeTRylx1QzrZUteb5v4YJcTw2b8S7RnbKVSkU322pPGVZo5XnxMUZQEc
	e0rN5g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhshkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso6637219a12.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 07:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620261; cv=none;
        d=google.com; s=arc-20260327;
        b=bUpMbpjJfAnl2T96lO5l7fbCFZ40FczFsW4K/s7QkWYD1oNZSt0oERWU44d4AncoEe
         Bt6l112/Y1gwEDhe29iLqyNqPoAUzd0nNhljqXqa/vOSPZRJMERCtWVuHc3w0cNXyUiH
         aUM+j8UMqW6nbyWt6Qe3c3wKkXkVlr6ElsIuHdpnxbNWFQC8EvBaUSEriwEPwHkWcTZX
         gkMDSeRjs0hI8K9kf24XvBBSPrq28EbJGyzAi1pXYxPdEt94ccZJXWZ4C2tDmzB8tzdT
         1VyjCbj1mprWqd4VpQ5kOiLnlDN2jFi0qJPP/3YGbPcv4zM+xu8lkNjKzupIWYfqlGDt
         pepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        fh=4rd0xgDHjxqxO5IDZAUNe4zdRVcF2NoJuBQpA7mHLnY=;
        b=IgH6GDWpZKwrr4bbHXWRGobSxBZ09FjlRUcqWY99cU7QQrerI6+ngyOdgS3lGFFhDR
         KtX032wrHavxq5RHUQJenQbu1SX0hOmaQQ1oBhGk6VL5AL55W0ZKOkcsqzgxUR4e+4bg
         h4lMq/WzP+iZZXapShqERuzHkjfMblaoiAK2siBw/5IUAish143wEcpyC7yKSbyHllx4
         UXDuez52sWOPM7S9iGhpjEgeGy1VQcC/keydjk0ZtW34M4FAMzgC++L29Z2O8tgagygM
         1RqGI9CSHOQ/rwX69WxM/O7NxxXHFLWqb2rX/CAnH2mHfneWYuITxlNRhF8jCQ1jRFZd
         cFXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620261; x=1796225061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=JOUmSRAJMjCviWfrKPzXLdwZgpvlk6WlhGFfT2z/yHl8Ch3saIBnQJiB2SEPcrTvWw
         dR1l1L8pRR+VfSzGt/GizrZxD5DipQDmF9wkPuhlDPAcb3OZBtCcyd5PZE22o6Yvl5rh
         m48o9IR/ddRF+LFx8PQ+tnr92Sb0q6sY20K0nQzVUPz8Dr8XzuLUFP2Q+HltPpoZzekb
         CT44bBAyzjWyhKvoeNgpg6DRqFJOmbPGY3acT+c1AMZ6Tbs5GchHCQiNqn3y5AFmwTK7
         dk+gJfO4Fam2LVYsWc1R+d4o4Rgf5em9/fKI3iCotf3rYydXPz95cUZaLsl7xAsW7Ltv
         CkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620261; x=1796225061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=yDANIFS8yP7QroYtABbQJUoHGZLChHgXLdLLHS0d3esRPRMyJFIu9WLyXRgkIxXHDJ
         EHkU3CNTwgP1eAbpuX6miTI253gTB0k8HoL2fCluoZaFHI3rP9u756aD9G1RAmc7dikI
         a9wPJN7ye4gFDoACCAWEgGG7dzPwkBA9yLrFcqX99kKiTx5H4l7UhtEYXgjkOm/VuRoF
         YUHxC942cdAMVQiqhlDktcw3h36ZMFfqdT0joSwAvXoAVhXsAYQ4MXwHiCCJL3tWssnt
         x43xg2SQCWrLChC07Q2vFeDebI08elwmBUaxH1TNisO9InleqrdjGh4BsJPdDc/ZAUoJ
         drNg==
X-Forwarded-Encrypted: i=1; AL+hErFr+/JvRQuleqqGy9ubpotTo+DGXEqr+eDydxywQXRkc6rtLbuVlnAlXZmFsvzYjLIHJem4OJmiLMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hATLvCLIaN1x0evmmS1NWFpmpOoW2/ZzqRfCfg/WJsZo2/cDJ
	hRprP8m+LsCnMWu0L05zYtErFiOylwJwYZurPmdC685YXhHpqoBn6kMPgfi3yrxYAch/4XwYTG9
	hmlfTCuE71MtaHxiw8YB+E5yFBoGvHiD2NRtQjz+6wo6ylZCsvkgqidV6/iLRIBni6zWvRV/fTS
	FX3Kyc7uZFtVEPd9p0k5cEYm3uqsVHfiY8lVvH9g==
X-Gm-Gg: AZFdTZenQg6pDmHZv/dGlXzpb5g2/ODdmwa47cp9eqLfrgkBOy040Pqkpf81tEXZ5b9
	InuX1r/vnL/ZHRLfvY3d6ogx0Kl/q35dvLUIwkpmOdwCPC584aV9c7GERYEWnJZEAGUXDasgqmg
	fo+hqrGig30CvM9k+GN17PXPV26TCA6+Ka5tJH26GlhNfhXvPC/CQlfBHq6w==
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id adf61e73a8af0-4014d35e690mr16693112637.47.1795620260982;
        Wed, 25 Nov 2026 07:24:20 -0800 (PST)
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id
 adf61e73a8af0-4014d35e690mr16693057637.47.1795620260386; Wed, 25 Nov 2026
 07:24:20 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:09 +0100
X-Gm-Features: Aa3M54rJMX4qh8HyzUvWFdsjdwQqxq_0OhXrr7tr5X8J3Des22u394yZEZEfoS8
Message-ID: <CAPx+jO9Ao4mR5wq_GTQOegLyYfgf6xpq+zz1tTwU_U7BULeb7A@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] pmdomain: Make genpd_get_from_provider() always
 return on first match
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
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06fda6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=iT_-64JVffYfEt0vB_EA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: RwrFEKr19b6fjr6MK24bd7quT_BoaUz3
X-Proofpoint-ORIG-GUID: RwrFEKr19b6fjr6MK24bd7quT_BoaUz3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX+gjrlUsgJoUc
 oKC4OW1vwHLTnZa+nv/cx+D5poI7Ojn3gO/h2EfITLB2uIVunvs9IwZlo+EIX5kknqDe1EjWdz9
 h13Sb8ohGK5iXX3m4C+NKVWtS4hEnQ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX7/p0v7JZt5Vz
 6pKGdfl5TfHzeeoS1tH8EUfV7xs+qJgApUh8cQvAumOy0XQs7hSi6DMql8crdTrs+m97M2nTzv5
 J706Xwi+nqRg02uoPWK4ffC1fQ8wvkMfVrKol+j6rGIyxeB+EFGAE5mXna4NYPbIZBML6wimDGN
 CoK2D5veBM4BH7jp66Dvw1w1i3/DvZNjSsVxRfwd+W0nBGn8O39g1/iVWv7j9nbOJy2H79JzUFD
 8fIJyZCYAgRivJABhJpLKj7x8mpK5eJhZCla2/y053uOSIyu9L3wIqkDyHzgrUTbSpAS4NkpJwr
 grKC1s0L8uTVYBMfc1sAJh0Nw14hcVZCPuoerFl+06gB9ylTSCkwAe5i8g91rpW20Hf/rkHG7tW
 syCqO8h0OI7/eB8IFwXVnnvTUQe09s7Jhx6uZlFDhkdk45H4X9AG5ElSMaw7KfGhiPXZ6c2RTXE
 g7tI1TCzclVQM98ub5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The for-loop in genpd_get_from_provider() seems to imply that one can
> have multiple providers for the same node: in case a provider's callback
> fails to map a specifier to a PM domain, the loop continues looking for
> another matching provider.
>
> While technically one can register multiple providers for the same
> device node, one can never safely remove one of them:
> of_genpd_del_provider() just considers the device node, and removes the
> first matching provider.
>
> Use the same logic in genpd_get_from_provider() to avoid confusion.
>
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/20261019160545.GC3705@killaraus.ideasonboar=
d.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v5:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 964e44c2f78f1d55..ee8075e90852e738 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3031,10 +3031,10 @@ static struct generic_pm_domain *genpd_get_from_p=
rovider(
>
>         /* Check if we have such a provider in our array */
>         list_for_each_entry(provider, &of_genpd_providers, link) {
> -               if (provider->node =3D=3D genpdspec->np)
> +               if (provider->node =3D=3D genpdspec->np) {
>                         genpd =3D provider->xlate(genpdspec, provider->da=
ta);
> -               if (!IS_ERR(genpd))
>                         break;
> +               }
>         }
>
>         mutex_unlock(&of_genpd_mutex);
> --
> 2.43.0
>
