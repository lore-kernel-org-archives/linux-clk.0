Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795608177;
	b=ja0u1xHWJhDFxLrRQUi+KDXvwIrQG3tutBhrEAHoNkDG6Z1Uj8/E2ZBelbjTr0h4wqKo
	 yHyr+FBDnDcpk4JM5niHvK9/u1ArJk7c5+g7+y2i39Vxv4+uqMnVaf7UUNp3aKCAEXOwX
	 qc3nse4fhfYVfO8Zsynicg8VQ1tIiKyw1hxTQqyKTPKEC+RCPhXtAJA0QSQ6zc/m/0FxJ
	 EZEjfctsRAoJrqxlnKQDwAU3sWIax/zJ+fDWwzK+fYTaVZV6L/0YMvGCOIY/trUJlqeiw
	 cY0CITsp0esYDyH+qcJXTMSvPGiG3obheYl7puSsz1oYH/mcDx5Eafrpy2gWK0GW89A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=;
	b=jr2dkWAAYXSu8XVqOQXJmvm8/+o6So12SR8D4n6/K7hZcSpQ7ypdMdl9vqw1yB7qWSZ0
	 hezk38/+isbaB+2zvVUAUzPXPSMBJy6dqi3pRduFTWGcLfMm/ZYFWCQU7qLJuytsKUBm5
	 Ac0sX0rYFtI3EekFLUDMXuyNLvzTjkvkZmK5FEDoT9cSzmQxMyjRo2fEnOAJO3F6vi2RZ
	 c2eX8Wpz6yU4WWV60p48Ap5ZgvV6fj/BmKOsAzShULPiXVlsJMsskU3rBDTZk5WS3f3c6
	 qznopDMW7eatjS1Y1gmr54ls1R3p4r7mH1w2jJnL9XxeqPzvKj/h3U0v9tebTa/WS8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mhuwtsfP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FmP8qQzt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F5606A323
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800F5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mhuwtsfP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FmP8qQzt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mFSC3126472
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=; b=mhuwtsfPr5AGvE6p
	fwSfZvqeBdTl1/D1nhadjSBV1vUJNEhynUdpZiRx8rOflS6izzyVYmzOmsk6ipJz
	+xmsGByIzzA2UoBOa7dheLVvQc0p7l+mueaQo4A57u8YNeFANZXZ6uhFKSw/bbEm
	QenHMCxQlXL3MSO1k5gsnFFmgsfc6wTKkvYWvsmWzarD1Mlewyd5e4a+oXMtwBrY
	mZkWSjzUeFVMesXkiXpLKhQxAvq/3gSExl+K+1dBD7jg5at3vo9XWH4lAYyK3/ad
	2/CYM9kme/Kugl2vuur1/4/cxJOov4PHSTnExK+BVBuSKAfHfComNKZvM4whoJ73
	GFSFRg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydc1x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:02:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05b3eaecso52985305ad.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 04:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795608174; cv=none;
        d=google.com; s=arc-20260327;
        b=nVhS7C9FSZxlBXxFfDpkGiUgpnzqo8BRqSr1LyuGXBGjfIjs/QUo25ePbSv//SjMw7
         k2EbnyRy9Sjpus/h1UNsne+9Q1XSBhNBRSu5Ph/87H6BJ1JRqk8w0CzEC9EpC57kZYPR
         b4dukZWV60PPtW2I14wSyG58ilsJkzrGErvlqO4m9oay0lndyZ3E0l1+T6wxR0xUevB2
         eOoQQVNNWa1joDuiXPuhedaLglvHJJoTHJHLJR7romQsKr3Js/Jm4mg5GLKZR3YMevYg
         7g0uz+jDBAEFLa5WJxjG858PdTVUgEQauJaKMr8MtIYg3x+DOBWiiShJ9snUNltXT9o+
         PWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=;
        fh=GxWHA9E//1JSc/gjeLcJsrhrLMVH8gWMVGQEr0XHZ80=;
        b=Yja3Lmu/uIZKPgdTj99N5qBlmsvTE4bnaVMSO4TZY7MOMwJ8FoH35bSjj40y7betVF
         8vU7OyxlTS1d1GolJYLstDHUHQvN8uoAuuwqSE5gjrh4ALbH9w3gN3R0qvTL+AhRHQYX
         JIucHC9AXF5WHdNmhqEGf7DmzKPfa7AEd9vtSpo1Nkz1ZH9RWFIsPqFqWnmYLOZnP0dd
         QVzBd3uvOc7ht5rtTbVfr372ZJHwv1kUxy+Xi/thDvk4vWFN60V1ElUz3HlrTeTDm3kn
         2TFol4g5MeJ169+IlniiyAeWRhRPevsDiLjuSeNQDdFTp/gkaeIYnuNlDGaHg5u7SFWL
         6Efw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608174; x=1796212974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=;
        b=FmP8qQztCIF6R+95D9bkVvZcGVN7bNvzrSan01M2jzOb1AM5Wp1xkCamlUf0gHtAm+
         GbqW3H2RTaLy+9npsRfHkkVgi9NOJwZgmD6g9Fz6Dbelr9O0cmcwlyOvc1e5FQpjDuIA
         CEp7KIeYkXKwsU7fOuLLI+F6mMpAihPcgbSLFV5GLHDWbEjDyLD1Y48DtPB+SY6hp79K
         DN7YUGoHsPrfEF2sePuTPmCP+b+jMu9Ewe/9KG0I6qmxuBQlbO/a7wbErz9t21hgJkwz
         NyNMokMmtGndUJJig4CqYotINq6jvxs5mQWJUEawGiJ7+0q4NMvv8DIq/PubWQbcLgEw
         yu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608174; x=1796212974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9dlQGG/jzBvs7dH7czqRMGYMnw4r7omofK4BoXES8U=;
        b=YJBBKw2oy6GuoYBPJjcHHFxcYQ2IUwT4WYxNZoQqqpuQpDoqdHvujPBPTiFKc13QYH
         MNskCcsOUDfPW52O+pd/CE6nfYBwPqcy2TYYQpMBM8QWAigmBPvlOqVS9IucRlxVxMXw
         8N0XQyGQ5NuedtJ7dE1kRW1pTrAj8E6qdnFJgsrg0GG7wj2bjqYc2eLus7QaNWgAWT1l
         lndm9mei2ZVPelc+SDtve5pGiz6oNfU4Axms+QS9jGFqpXBS15IYq6Tgt5LuqN0P3Mla
         +VpOkfDi2bLvAWz8zNJDD2zTHp8VWrIIiPGRZPWtRVpD94A1Mrh9HDjxTI2YeZbiep9+
         J3Yw==
X-Forwarded-Encrypted: i=1; AL+hErEHf8IY2pJEqDD1VNaqyZHpdlGJxWOq0Q7XfWbiIFixvmU0VKTlRAgLUvYD/eC3FOsk353MWEL0gEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QYyBwWzpM5+biOaEA1VGA4Y9G+yzySOfuBk88psa7rOuUCXE7
	uuupN46Bp0ZfiS8NnztjYnoT61OODBp6wyFbpEgq6qAqYc8atZtrP5ZsEL9wT2/tbL0Q37L0dfk
	29ue83TYrkpojIY93eXNscyJu/0k3SSjJ0ozQoEUK7eaKc/QaibgeYMNjmht7zfuZhqQAxp38r8
	PXyC9xE7dCw3olc9ZTSbiocaMqCjfodLvoejbXDQ==
X-Gm-Gg: AZFdTZeXdXv5cH8pOGpxFSgz919NlQY636xeE7fEGqkZ8BV2t1lCxYYyIvZkYZrTcjM
	eJAvJLyK0f0roR0foa7eDZbnNY/ERxSKZJP5LCfRzzTeH9z6zNw78jHnuFtB2w4u9KoE/WKDP8k
	7l0Xrjy41WTZEk3oYl4bbMo7BKwSASu1rbaVBWxyUVY7wDBbhAT+timtpS1Q==
X-Received: by 2002:a17:902:ecc4:b0:2f0:3c38:9133 with SMTP id d9443c01a7336-2f0c5f91aa0mr49108945ad.43.1795608173778;
        Wed, 25 Nov 2026 04:02:53 -0800 (PST)
X-Received: by 2002:a17:902:ecc4:b0:2f0:3c38:9133 with SMTP id
 d9443c01a7336-2f0c5f91aa0mr49108355ad.43.1795608173161; Wed, 25 Nov 2026
 04:02:53 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org> <20261122-xg6846b-bcmbca-xrdp-reset-v6-3-bf2104a25095@kernel.org>
In-Reply-To: <20261122-xg6846b-bcmbca-xrdp-reset-v6-3-bf2104a25095@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 13:02:40 +0100
X-Gm-Features: Aa3M54qQSa1-iu_NQ3Vu-hbUnlJTISMBYoMz5cyhIaJ8PjDAWNwA46R1m2mVESg
Message-ID: <CAPx+jO9Q-kSftm2iZn+5LJ84G2ANRO5HyxGmUZ6RAySZf5ZnGQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] pmdomain: bcm: Add BCMBCA PMB power domains
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfXx1EKy63LnFAF
 Hi7POv67IxX60PDjV9+TFb6g0lSaMbE0Ah9c1Qk14uEkMo4ndpEIA3iDk4+S7KyMx7jk9+zW6Za
 qqqSJovBd569Jq32vVZwwGggdxVhKXE=
X-Proofpoint-ORIG-GUID: K2XEbfRmF_wTpPTDC-e-f7NFo5PawLOJ
X-Proofpoint-GUID: K2XEbfRmF_wTpPTDC-e-f7NFo5PawLOJ
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06ce6e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=K0o9GnANF0TDe8bVdfEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX9wawvERzGZM3
 hyvQuADJJTEJ9CaFUN9hDkd3Gqx+X1eob+YZD0fcRbIay178WlIR1YxneySJYHuqBzAKB4fLBW0
 6Ru40muY/Npa9RdmtRD9pYST0ZaEQkXJuUaZT2/sY3QxrN+uVP+H4D4svERv85m3b2cffKFwEnV
 VqsurYgUm9FsiaBu17s10DWBvk6G5iIyFcozOHSW85BoM4d0NOhHs/ihAtPmjgu8hdsw6dl75KY
 Td+ur/A+/5jzOkPsEEpaWxjRs0zTZXY9qAyHzYDDsudrRLkiw3otrN/blqU0JrDZu4fWnrufTdT
 iPUocj7ENnNiA7CL+nZHF/YrjMUq+mF2IKdVB386zw9ejWZr4EG8hQo5IdJVSiytZYBjlvniAPc
 pfcCMlgAknJJBqi0U5+/JFIkycX60hzZHfylXO+6FYV+7LSxrWjLliBp7jJYJB1IPO4L5U1xfOa
 M0eoZyVRzkc7z2YOMAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On Sun, Nov 22, 2026 at 9:32=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Implement BCM6846 BPCM power domains.
>
> Group XRDP, its three Runner cores and WAN in vendor xrdp_pmb[] order,
> so consumers can power the complete packet engine before resetting it.
>
> Also expose peripheral, memory, USB and PCIe domains. Keep the peripheral
> and memory domains always on; exclude CPU and PLL blocks with different
> register layouts.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

If Lee wants to route this via his tree, that's perfectly fine by me.
Otherwise, I can pull an immutable branch with the DT changes as well,
doesn't matter, just let me know.

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  MAINTAINERS                       |   1 +
>  drivers/pmdomain/bcm/Kconfig      |  10 ++
>  drivers/pmdomain/bcm/Makefile     |   1 +
>  drivers/pmdomain/bcm/bcmbca-pmb.c | 279 ++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 291 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1857e720ce3a..cfe64722a708 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5449,6 +5449,7 @@ M:        Linus Walleij <linusw@kernel.org>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml
>  F:     drivers/mfd/bcmbca_pmc3_pmb.c
> +F:     drivers/pmdomain/bcm/bcmbca-pmb.c
>  F:     include/dt-bindings/clock/brcm,bcm6846-pmb.h
>  F:     include/dt-bindings/power/brcm,bcm6846-pmb.h
>  F:     include/dt-bindings/reset/brcm,bcm6846-pmb.h
> diff --git a/drivers/pmdomain/bcm/Kconfig b/drivers/pmdomain/bcm/Kconfig
> index b28c9f6d256b..fb0c2baea156 100644
> --- a/drivers/pmdomain/bcm/Kconfig
> +++ b/drivers/pmdomain/bcm/Kconfig
> @@ -31,6 +31,16 @@ config BCM_PMB
>           This enables support for the Broadcom's PMB (Power Management B=
us) that
>           is used for disabling and enabling SoC devices.
>
> +config BCMBCA_PMB_POWER
> +       bool "Broadcom BCMBCA PMB power domains"
> +       depends on MFD_BCMBCA_PMB
> +       depends on PM
> +       default MFD_BCMBCA_PMB
> +       select PM_GENERIC_DOMAINS
> +       help
> +         Provide power domains for BCM6846 blocks through the shared PMC=
3
> +         Power Management Bus regmap, including the XRDP packet processo=
r.
> +
>  config BCM63XX_POWER
>         bool "BCM63xx power domain driver"
>         depends on BMIPS_GENERIC || (COMPILE_TEST && OF)
> diff --git a/drivers/pmdomain/bcm/Makefile b/drivers/pmdomain/bcm/Makefil=
e
> index 6bfbe4e4db13..ed8a1d3d4c10 100644
> --- a/drivers/pmdomain/bcm/Makefile
> +++ b/drivers/pmdomain/bcm/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_BCM_PMB)                   +=3D bcm-pmb.o
>  obj-$(CONFIG_BCM2835_POWER)            +=3D bcm2835-power.o
>  obj-$(CONFIG_BCM63XX_POWER)            +=3D bcm63xx-power.o
>  obj-$(CONFIG_RASPBERRYPI_POWER)                +=3D raspberrypi-power.o
> +obj-$(CONFIG_BCMBCA_PMB_POWER)         +=3D bcmbca-pmb.o
> diff --git a/drivers/pmdomain/bcm/bcmbca-pmb.c b/drivers/pmdomain/bcm/bcm=
bca-pmb.c
> new file mode 100644
> index 000000000000..9a631b7b0360
> --- /dev/null
> +++ b/drivers/pmdomain/bcm/bcmbca-pmb.c
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Broadcom BCM6846 BPCM power zones, accessed through the PMC3 PMB regm=
ap. */
> +
> +#include <linux/bits.h>
> +#include <linux/mfd/bcmbca-pmb.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/power/brcm,bcm6846-pmb.h>
> +
> +/* BCM6846 BPCM zone control, in PMB words, with eight words per zone. *=
/
> +#define BCM6846_ZONE_CONTROL(zone)     (32 + (zone) * 8)
> +#define BCM6846_ZONE_DPG_EN            BIT(8)
> +#define BCM6846_ZONE_POWER_DOWN                BIT(9)
> +#define BCM6846_ZONE_POWER_UP          BIT(10)
> +#define BCM6846_ZONE_MEM_POWER         BIT(11)
> +#define BCM6846_ZONE_RESET             BIT(12)
> +#define BCM6846_ZONE_POWER_OFF         BIT(25)
> +#define BCM6846_ZONE_POWER_ON          BIT(26)
> +
> +struct bcmbca_pmb_power_block {
> +       u8 bus;
> +       u8 device;
> +       u8 zones;
> +};
> +
> +struct bcmbca_pmb_power_data {
> +       const char *name;
> +       const struct bcmbca_pmb_power_block *blocks;
> +       unsigned int num_blocks;
> +       unsigned int flags;
> +};
> +
> +struct bcmbca_pmb_power_domain {
> +       struct generic_pm_domain genpd;
> +       struct device *dev;
> +       struct regmap *regmap;
> +       const struct bcmbca_pmb_power_data *data;
> +};
> +
> +static const struct bcmbca_pmb_power_block bcm6846_periph[] =3D { { 0, 0=
, 4 } };
> +static const struct bcmbca_pmb_power_block bcm6846_memc[] =3D { { 1, 8, =
1 } };
> +static const struct bcmbca_pmb_power_block bcm6846_usb20[] =3D { { 1, 10=
, 4 } };
> +static const struct bcmbca_pmb_power_block bcm6846_pcie0[] =3D { { 0, 18=
, 1 } };
> +static const struct bcmbca_pmb_power_block bcm6846_pcie1[] =3D { { 0, 19=
, 1 } };
> +
> +/* Power up XRDP, three Runners, then WAN. */
> +static const struct bcmbca_pmb_power_block bcm6846_xrdp[] =3D {
> +       { 1, 12, 3 }, { 1, 14, 1 }, { 1, 15, 1 }, { 1, 16, 1 }, { 1, 11, =
3 },
> +};
> +
> +static const struct bcmbca_pmb_power_data bcm6846_domains[] =3D {
> +       [BCM6846_PD_PERIPH] =3D {
> +               .name =3D "periph",
> +               .blocks =3D bcm6846_periph,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_periph),
> +               .flags =3D GENPD_FLAG_ALWAYS_ON,
> +       },
> +       [BCM6846_PD_MEMC] =3D {
> +               .name =3D "memc",
> +               .blocks =3D bcm6846_memc,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_memc),
> +               .flags =3D GENPD_FLAG_ALWAYS_ON,
> +       },
> +       [BCM6846_PD_USB20] =3D {
> +               .name =3D "usb20",
> +               .blocks =3D bcm6846_usb20,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_usb20),
> +       },
> +       [BCM6846_PD_XRDP] =3D {
> +               .name =3D "xrdp",
> +               .blocks =3D bcm6846_xrdp,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_xrdp),
> +       },
> +       [BCM6846_PD_PCIE0] =3D {
> +               .name =3D "pcie0",
> +               .blocks =3D bcm6846_pcie0,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_pcie0),
> +       },
> +       [BCM6846_PD_PCIE1] =3D {
> +               .name =3D "pcie1",
> +               .blocks =3D bcm6846_pcie1,
> +               .num_blocks =3D ARRAY_SIZE(bcm6846_pcie1),
> +       },
> +};
> +
> +static unsigned int bcmbca_pmb_zone_reg(const struct bcmbca_pmb_power_bl=
ock *block,
> +                                       unsigned int zone)
> +{
> +       return BCMBCA_PMB_REG(block->bus, block->device, BCM6846_ZONE_CON=
TROL(zone));
> +}
> +
> +static int bcmbca_pmb_zone_off(struct bcmbca_pmb_power_domain *pd,
> +                              const struct bcmbca_pmb_power_block *block=
, unsigned int zone)
> +{
> +       unsigned int reg =3D bcmbca_pmb_zone_reg(block, zone);
> +       unsigned int value;
> +       int ret;
> +
> +       /* Request power-down and cancel power-up. */
> +       ret =3D regmap_write_bits(pd->regmap, reg,
> +                               BCM6846_ZONE_POWER_DOWN | BCM6846_ZONE_PO=
WER_UP,
> +                               BCM6846_ZONE_POWER_DOWN);
> +       if (ret)
> +               return ret;
> +
> +       return regmap_read_poll_timeout(pd->regmap, reg, value,
> +                                       value & BCM6846_ZONE_POWER_OFF, 1=
0, 10000);
> +}
> +
> +static int bcmbca_pmb_power_on(struct generic_pm_domain *genpd)
> +{
> +       struct bcmbca_pmb_power_domain *pd =3D container_of(genpd, typeof=
(*pd), genpd);
> +       const struct bcmbca_pmb_power_data *data =3D pd->data;
> +       /* One bit per zone, tracking only zones changed by this attempt.=
 */
> +       u32 changed[ARRAY_SIZE(bcm6846_xrdp)] =3D {};
> +       const struct bcmbca_pmb_power_block *block;
> +       unsigned int i, zone, reg, value, mask;
> +       int ret;
> +
> +       for (i =3D 0; i < data->num_blocks; i++) {
> +               block =3D &data->blocks[i];
> +               for (zone =3D 0; zone < block->zones; zone++) {
> +                       reg =3D bcmbca_pmb_zone_reg(block, zone);
> +                       ret =3D regmap_read(pd->regmap, reg, &value);
> +                       if (ret)
> +                               goto rollback;
> +                       if ((value & BCM6846_ZONE_POWER_ON) &&
> +                           !(value & BCM6846_ZONE_POWER_DOWN))
> +                               continue;
> +
> +                       changed[i] |=3D BIT(zone);
> +                       /* Enable dynamic gating, memory power control an=
d block reset. */
> +                       mask =3D BCM6846_ZONE_POWER_DOWN | BCM6846_ZONE_D=
PG_EN |
> +                              BCM6846_ZONE_POWER_UP | BCM6846_ZONE_MEM_P=
OWER |
> +                              BCM6846_ZONE_RESET;
> +                       ret =3D regmap_write_bits(pd->regmap, reg, mask,
> +                                               mask & ~BCM6846_ZONE_POWE=
R_DOWN);
> +                       if (ret)
> +                               goto rollback;
> +                       ret =3D regmap_read_poll_timeout(pd->regmap, reg,=
 value,
> +                                                      value & BCM6846_ZO=
NE_POWER_ON, 10, 10000);
> +                       if (ret)
> +                               goto rollback;
> +               }
> +       }
> +       return 0;
> +
> +rollback:
> +       dev_err(pd->dev, "%s power-up failed at bus %u device %u zone %u:=
 %d\n",
> +               data->name, block->bus, block->device, zone, ret);
> +       /* Preserve zones left powered by firmware or an earlier attempt.=
 */
> +       for (i =3D data->num_blocks; i-- > 0;) {
> +               block =3D &data->blocks[i];
> +               for (zone =3D block->zones; zone-- > 0;)
> +                       if ((changed[i] & BIT(zone)) && bcmbca_pmb_zone_o=
ff(pd, block, zone))
> +                               dev_err(pd->dev, "%s power-up rollback fa=
iled\n", data->name);
> +       }
> +       return ret;
> +}
> +
> +static int bcmbca_pmb_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct bcmbca_pmb_power_domain *pd =3D container_of(genpd, typeof=
(*pd), genpd);
> +       const struct bcmbca_pmb_power_data *data =3D pd->data;
> +       unsigned int i;
> +       int ret;
> +
> +       /* Powering down zone zero powers down the whole block. */
> +       for (i =3D data->num_blocks; i-- > 0;) {
> +               ret =3D bcmbca_pmb_zone_off(pd, &data->blocks[i], 0);
> +               if (ret) {
> +                       /* genpd keeps the domain logically on when power=
-off fails. */
> +                       if (bcmbca_pmb_power_on(genpd))
> +                               dev_err(pd->dev, "%s power-off recovery f=
ailed\n", data->name);
> +                       return ret;
> +               }
> +       }
> +       return 0;
> +}
> +
> +static int bcmbca_pmb_power_is_off(struct bcmbca_pmb_power_domain *pd, b=
ool *off)
> +{
> +       const struct bcmbca_pmb_power_data *data =3D pd->data;
> +       unsigned int i, zone, value;
> +       int ret;
> +
> +       *off =3D false;
> +       for (i =3D 0; i < data->num_blocks; i++) {
> +               for (zone =3D 0; zone < data->blocks[i].zones; zone++) {
> +                       ret =3D regmap_read(pd->regmap, bcmbca_pmb_zone_r=
eg(&data->blocks[i], zone),
> +                                         &value);
> +                       if (ret)
> +                               return ret;
> +                       if (!(value & BCM6846_ZONE_POWER_ON) || (value & =
BCM6846_ZONE_POWER_DOWN))
> +                               *off =3D true;
> +               }
> +       }
> +       return 0;
> +}
> +
> +static int bcmbca_pmb_power_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct regmap *regmap =3D dev_get_regmap(dev->parent, NULL);
> +       struct bcmbca_pmb_power_domain *domains;
> +       struct genpd_onecell_data *onecell;
> +       unsigned int i;
> +       bool off;
> +       int ret;
> +
> +       if (!regmap)
> +               return -ENODEV;
> +
> +       onecell =3D devm_kzalloc(dev, sizeof(*onecell), GFP_KERNEL);
> +       if (!onecell)
> +               return -ENOMEM;
> +       onecell->num_domains =3D ARRAY_SIZE(bcm6846_domains);
> +       onecell->domains =3D devm_kcalloc(dev, onecell->num_domains,
> +                                       sizeof(*onecell->domains), GFP_KE=
RNEL);
> +       domains =3D devm_kcalloc(dev, onecell->num_domains, sizeof(*domai=
ns), GFP_KERNEL);
> +       if (!onecell->domains || !domains)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < onecell->num_domains; i++) {
> +               struct bcmbca_pmb_power_domain *pd =3D &domains[i];
> +
> +               pd->dev =3D dev;
> +               pd->regmap =3D regmap;
> +               pd->data =3D &bcm6846_domains[i];
> +               pd->genpd.name =3D pd->data->name;
> +               pd->genpd.flags =3D pd->data->flags;
> +               pd->genpd.power_on =3D bcmbca_pmb_power_on;
> +               pd->genpd.power_off =3D bcmbca_pmb_power_off;
> +               ret =3D bcmbca_pmb_power_is_off(pd, &off);
> +               if (ret)
> +                       goto remove_domains;
> +               /* Always-on domains must be fully powered before genpd i=
nitialization. */
> +               if (off && (pd->data->flags & GENPD_FLAG_ALWAYS_ON)) {
> +                       ret =3D bcmbca_pmb_power_on(&pd->genpd);
> +                       if (ret)
> +                               goto remove_domains;
> +                       off =3D false;
> +               }
> +               ret =3D pm_genpd_init(&pd->genpd, NULL, off);
> +               if (ret)
> +                       goto remove_domains;
> +               onecell->domains[i] =3D &pd->genpd;
> +       }
> +       ret =3D of_genpd_add_provider_onecell(dev->of_node, onecell);
> +       if (!ret)
> +               return 0;
> +
> +remove_domains:
> +       while (i-- > 0)
> +               pm_genpd_remove(onecell->domains[i]);
> +       return dev_err_probe(dev, ret, "failed to register PMB power doma=
ins\n");
> +}
> +
> +static const struct of_device_id bcmbca_pmb_power_of_match[] =3D {
> +       { .compatible =3D "brcm,bcm6846-pmb-power" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, bcmbca_pmb_power_of_match);
> +
> +static struct platform_driver bcmbca_pmb_power_driver =3D {
> +       .probe =3D bcmbca_pmb_power_probe,
> +       .driver =3D {
> +               .name =3D "bcmbca-pmb-power",
> +               .of_match_table =3D bcmbca_pmb_power_of_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +};
> +builtin_platform_driver(bcmbca_pmb_power_driver);
> +
> +MODULE_DESCRIPTION("Broadcom BCMBCA PMB power domains");
> +MODULE_LICENSE("GPL");
>
> --
> 2.56.1
>
