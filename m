Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794655525;
	b=DqA8X2BfT7IIg+OVULVIRBGMESNhvEyZ7E/l/Uz3Git2OOAR+W/KVFxC7io9wLjJasn2
	 3b03C3/UBrM30UW/iew7iCqOsrx/ajKqf4KC+0ZVgxh7CXx/q3s1lJXPdY5aPRi1zFWNx
	 BISRnvP1SiWaYJZYwvhazYHa/gI4pJScuW0uGoqXNWGo/7CkrK+SpaJU+rJhuiHdIdi7U
	 siWvXhFGw3npE4Sxi3nl/rgEgHhnXpQRjBV13OLvIBdtYGrdwoSiQ565Krt3E4mjniMSR
	 ns3AC1cp5zfvHvk5qbxM5HOFE9AaPjqsX7+2LodymswrJDa5ZPDrdSYsMxba8uyli8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
	b=tRGUJxHVNetamTDDGZWyHv+qq/9t2pCIoisZAbVfyWKmSkBz8h8nNAPYNqRyNS5FkCg6
	 Y51gbExUPKEGmybfz0CvNvtznpfH+Mc84B/uffoPlyUn/lsG8jL6GsqmBulOME5h2qpeM
	 YpWz9ndA+L9mQAdLev7Cr2v16Yk7pPEaAzl1PPg5PFVy8V3lc3D+Ap7sgGFD/4P4Tn6Sr
	 qDvuGSasbCIx2nFEzrl6CES2Lm2jrqXQv8Vw3vO1rOZOZQowUlwcNSyTETIdmhekIBL2S
	 ZYWI6E6hlzVXGzPjM1J2ctskbTij8bsn8zkj8WSMkfMgGsYT+8bvJwIztbBIIHorxww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXgSS9Rd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaRin3UN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287DD606A329
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 11:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287DD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXgSS9Rd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaRin3UN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w3aL3844289
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 11:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=; b=QXgSS9Rda3Kv+k9P
	gzqe3kFPN/uWfUmI7OADtIldqWZDD+slzWtMPC/6dTDxMoFuvQd0N7gxLeJPQzVL
	Gx34zKckA+LaBZxTE6Es8GYa5XxLVKKy317T8OsxSwsgfLMrwNDpbiV3RWna2uNQ
	Q633p0yhEKggDTX7xY11chbADeulqMByJf3qChWKnbWHcJGNHise6+F6CcEqaBXO
	v7Rji8HvkddJBsZBOsexcXlNKMu6jOxc8MdeQ2/nDx6+sCsRyufemJ7r0Jkq9hAj
	v0Ns66yN3GBHSutZp6sEOu6Enxd5pUElkn+mYUsqEfaGQv8mIwxQ2sA9HyaUMbFB
	AVbl5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgmf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 11:25:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08be1c84so29446755ad.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 03:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794655524; cv=none;
        d=google.com; s=arc-20260327;
        b=ZkrFRc5IcmR05Ps445/9Z93/57LBnEiue14nmJzqB0VRnOYHPp3br1acykP/wC1Tg/
         G+ubGwaAeVeLwBLMLCKD8xLlgH69a9yLB1UnFcxs9yUiKldj6k99TyYJWy3PMfICbv7H
         Zq+gzQ9VWbnc8MOw5O3b97ulnazgCzWTkVg6aoHUl+a4m9Rm5WwIMiJ0PpT1yV8LNjXE
         eP1R+mEcaK8Cm68DoJI8D8MbO8DSo9GHw5W+5n/iGaTOTjmyKDc5P14QlcB723t3r1vC
         O/kaVYh3cwoH5+8WPVf8FwncN5aRnMqX/Ax8Kbu3oVmVK3KipFRVKxELTF250Rkb/Z93
         U+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        fh=5ftXS6Y1hp99E/70BBOeVnWz61l2Gr7SzGOX6D1/WF8=;
        b=UTGogfMHt+i1EP6fCga0kAY0+ThbRj45QijPhsU/BBRFbbnDvGfZM48+juYFd4wxzA
         PEZuqjyn1YrFKBATsjMfIgl7ngSojL5CHq7xTcD8hF1dbIL4DKmIxRW+CKElyuZ/5L2j
         CDWjb+LjPKw5NMhlRm2J4eQbYvv3Kb4/Vvab2ggpRTi47CFsh4lOaStpUUuBahjXVIty
         gvZCwTcx+vQALtA0JLmV74F15E40fb2eZBWAhjkIdQIH1jogP8oc/pbnXGS8X5N94rDo
         Md2LUsji7LQ+X3gsxdRIrWiCeQDp2Mj5MnEMZ/ZO2yXlKHaKN5D2wXR0KDupNSU8zDzL
         1Qew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655524; x=1795260324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=gaRin3UNqXhDB/YURAsg1NbNfWKgh1yehCZFMlaT8YX9rr5tZsfT7Dih5G0GvWJOSm
         xvWb4tmWJAOEb5bHlGg56+NNS9q+LgULUCyLExKDiT8NhgafE+A2c87HJ16ZE7KS4Ypw
         iRv07UvoK2l9mhasYV/lsSSjbxeqByM1+YDJDF0AXu4ygUD0FWum+310aYxT4d07jPMY
         SqKIveZNUmECHZYtQtmW53BJtAo52x5Il/3ROs1nHJqGnP4VRVq1zipQXzv4IFf0eeZD
         xiu9xmBhFKXYP+JKhzZm9XsSZSZKeJu+xFB2j67q0HlAu3L7icoArOYDch6dRql4lSdh
         M+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655524; x=1795260324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=e6UUrAe7yCy/cWO0TCVYEetgB4T9Fmn7DTaMuUl0Klp0VOMBPAcuAQP4E3MVD6FBYh
         agcmZyZlrsB+d0CTiICb5NNU4Ua8q3wRuZAiuBhsAZ2vBNAZi3tvMLd6LMRBARu1LYXK
         w7FCVUqx3+WTYqQE9ZyenshPe2ErKdItXB9CdwesgGiRNSvhOuUjdP/G6U9HSzk7pSIf
         NdG2bc/OVmmqetpT79ytphvUaO5Qds3OvuaTVmhKQLdCt+Ac6W398cD7+BERJ5UdMYs1
         Xgs0x/NrOwMmF5LHyunojym0wjUcdYzuQamxfaFDWOzEp6qQediT1Kxj8N+W7alVj9j8
         wIGw==
X-Forwarded-Encrypted: i=1; AL+hErGirg93GjtDnlR/+5nIrxeWfuQLAuIJw/dxjPlXLOaSwcPDbMJ/49vCg6V0Q/5YP8hwAIqPZJ6LvUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ceMhUqu9CjC30elfrtLa+LY2Ra0re9OwparVVX7lnitHwGhPG
	TWvdUElRkuGzWFvYO6363vXRM+cnVOBV27uudmn4/1D2S/gFBnL77gDoj7zUcR5K9s4P72PeHEV
	9fToHo/51c2Cy7078UJ8eRRW7sxT9ABI7N3x7MRTwz2ZeefaNQ0jIxPqCrR8mNhMfRzHaQEmCsF
	hDBVUfPGPQs+VH0tltrPnTtvj1XZjVyrMAli90BA==
X-Gm-Gg: AYBFou3FdkDuNQeNqphv6GyuO8PFBHTaBStMvnxGwQ9cgRntGmyMYvJZxwEaWx8GQRS
	s2wGxKraF0UIHDF+vo5PGZ3KOY2CjOL90q96nkatkD/a2HTC9GiI4E67qQqfvRxDFa0JBBbVpwA
	oVXOMm6ay/vbEJiC/HSiI7Jgi9l6zBiWfpYZ+mJqwrbuL57vUKjNaPNq5+iQ==
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b1b0ba53d2mr5901015a91.31.1794655523660;
        Sat, 14 Nov 2026 03:25:23 -0800 (PST)
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id
 98e67ed59e1d1-3b1b0ba53d2mr5900978a91.31.1794655523156; Sat, 14 Nov 2026
 03:25:23 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:25:11 +0100
X-Gm-Features: AclHuK8s11-7hbgMIVd4tuDyslF9iqGa3b4ELmL8p_Ex5PIsvw1_iyvVguSEqG4
Message-ID: <CAPx+jO9GW7e0ai2o4Ycc4BKBywTaP=7NiWk68=c2kqcD_VrgRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] BCMBCA PMB power, clock, reset and hardware
 monitoring support
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
X-Proofpoint-ORIG-GUID: 0Hq7CgUkha9AUlP-xfUayrW41Z3rZ60r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXwWSCKUJ5hlI8
 y4D7yECfTx0F6w0XRoKVSjJD/0WqLgMF9tUFkfewwhpkT3MmwSYPHD4fpXmptlcRAU3ogJykL4Y
 SlzE3LjNNFqvgPjViCVSey/2ZtWaP1EXTpDAkLyDGD4zH81Ki9sH+ULCdvxjkEDrjeConMl8W6l
 GRYsD5L8XhHFNgVUr+XHyVemrBt2Iz4krBKUyQYDfYfGZKbqqbTwob+kVt1EBpKMYOwLQmlusei
 zqygrNTqb2Mip+YOT3djM9P1mLjOW7F7yvtYjeqBQ6T/JmGMf9k3O6FnoYUt70mqE7pVGEDdTMa
 h6YSeAoOGE+swkRM3MNMFCdFwz3BHUZsRgQTKUakM+GAsXRlN3FO9gABc/9PVOmQK18f7iP/3Fe
 w8T3hrR/kaNsYXibAOf2YmzNe8K7C9NjBbhxRed6UBrAp3DMBflV0gypd7Ry65InlLCr6cgjwQh
 SY5l24VbP9EIaBLV3bw==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af84524 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=vyQqneORv_wdx-tV-QAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0Hq7CgUkha9AUlP-xfUayrW41Z3rZ60r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXwW4GlYb8WcoR
 9wLeus5gYvJq/ChxdVwUrxI/0j9xjwguhX7+Gt+zQ8qco61rxwTIXe3mPlTBQk6QZpzN8AnG9K7
 /hwKdjKDAql0k9xymst1YPj9qLvlQZ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

On Wed, Nov 11, 2026 at 12:00=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> This is another of these big upfront design binding and driver hoards
> that is the consequence of adding new SoC support.
>
> My stake is to be able to boot and test a full featured Cortex-A7
> system and the BCM6846 XG6846B is one such system on my desk.
>
> It's been cooking for a while in various prototype forms.
>
> IMPLEMENTATION:
>
> The PMC contains various stuff so this needs to be a simple MFD node
> so more things can be added into it later.
>
> Inside the PMC is the PMB, the power management bus. This bridges
> to several individual peripherals which are very clearly distinct
> devices on that bus.
>
> Handle the PMB with an MFD driver with power domain, clock, reset and hwm=
on
> providers.
>
> Expose the standard BPCM peripheral, memory, USB and PCIe domains and
> a combined XRDP domain covering XRDP, the three Runners and WAN. Keep
> the peripheral and memory domains always on. The power domain provider
> now owns zone transitions, leaving the reset provider to pulse resets.
> The CPU and PLL blocks use different register layouts and are excluded.
> This new power domain integration has not been tested on hardware.
>
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series. The zone
> power-up sequence also passed direct CFE flash boot in the Linux 6.18
> OpenWrt port; this folded v7.3-rc1 revision still needs hardware testing.
>
> MERGE STRATEGY:
>
> Through an MFD immutable branch once everyone ACKs the subdrivers,
> it will take time I guess. Queue the bindings and drivers in MFD.

 I assume you are referring to patch1, 2 and 3?

In regards to the power domain driver (patch4) at quick review it
looks good to me.

If Lee decides to host an immutable branch, just let me know so I call
pull it in to apply patch4.

[...]

Kind regards
Uffe
