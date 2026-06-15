Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529133AB480
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513800; cv=none; b=JgOO8FwyLICEw14rzh8tNJJK2bBrqr3X06lGBrowoMqf8lTZw0+f0iltXfZgEdv3CemQ9Orffc8hn6BDWQ8QaR6ipbJhViEVvNoIoUWgxG5KQ66QouysItCkRyI1IVyNKSUkCNjXDHNBoc3NMTN1yQHuijhSAxy+7Tw3pMKkYOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513800; c=relaxed/simple;
	bh=XWgT1kGNO6ECwHI7KeVtDswPKVdOpecFG5b1u3WSEYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe7bgyqz85ZJ0Bls5w5eEJEkGcHOFmmPpcGWSY4GryK33OFy601zg64Hyi4TIk7KRgHBK2tF/TqrpGqJwhsuWzKAiLRIOsfMdaqICIaC2MAo2SA5MrG7/66JCLSSI9m8Y/CwJ5QYYcX/u5p4mcgPUnfuL45eN+VCZsu3iUzKe90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASkc/cyF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OO0msEGs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASkc/cyF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OO0msEGs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6K9v43692489
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FjpsFq93269SiO0nGjpKMG6V
	iOATVyX6+3QFq3t9WRc=; b=ASkc/cyFDpKDrVkO+Tmz64F/qqU2RFu/uczWRDEM
	37lMnAraBttpL+PaLdh7FJa+NJtqL/VnfaSuxfPQPVJVgF8nrzVwgWauRj+8hLLc
	qxUkro3SCgwLbqeW9h0NP7L515YeVVCLzD9QQVR3WB9lJU0a66W6qs4Tr5bsFroE
	pkLfOSqDAEb8sD921A6CpHPDjyfKp1j7vH5zaxsdVjSVqcme3JUsynqZbCJxcAId
	fT+2a9Ovl3ZInD8/kf6KedQtHgMXpBI9LtUtJ5JxbaswHIdFCgojYJYib9QpxWSA
	gHTfSzp6/YaSJNFivDJPpzog9qkBT0FfW/4Irw/1BmXg+w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6efc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 08:56:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30762d67a64so4406087eec.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513797; x=1782118597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjpsFq93269SiO0nGjpKMG6ViOATVyX6+3QFq3t9WRc=;
        b=OO0msEGsYEVStz7XtdQSTvbIkkrTKe3fteygDAYCImRSVf+npPEHng5ntTenjP67ts
         jHvAHHk8mLMg5TmkLcptbPGISeJ65Vs5mHPxYYKkVmy0TpzMPsEUUDDtpcvsq/eEgFiW
         UU1lRqLyRVdP93GGWIj4H1OH3UbeGxvTZNQXQgUhZYhKOqjjnyPO72qp5SHH0yd57uD/
         4krm43BU4u91MCZB3apgVLgFhdJYwuqMn+RsIFZlvjdXTNregJS6CKjLzaDYyEnuWpp8
         1ljAyM+jA0SoB31iPVE4ROAMf8eHbTfKl34LtcMtv5pr45lfy05v28cXcqZSK/t2rAQn
         pdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513797; x=1782118597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjpsFq93269SiO0nGjpKMG6ViOATVyX6+3QFq3t9WRc=;
        b=NLu/uDYX5vuD7b1xgWjHzeLXEvAFmOjEMVHdidgC1YoCB3C0F9FpbBkeYnUWnFZbcm
         0XbyL7jZsK+LtaEON6EpFaC/RhfMRO7Jq/Fban3qv/RcQ3yfupbHfRiTdf5Pc6Gz3ke1
         T6mB+6xJ6ZM9IK16oNvKrVg8EOtbaM8pdyum2RBqbCjD0Uzx8CyKQ34fbDdCwDvNau3n
         nSJqk7naHg+PHSIFG2E6av1wQnKNdF1nhL3bGGZqdwZXnyzK6YwgVqKogLSPdffG+WGH
         bHUyCa56GHR0DTKXDvnsdbWolYVuXw8MtuMuspWWjDCDBiVERNla05KoYtOAW6DEvRxc
         /KAw==
X-Forwarded-Encrypted: i=1; AFNElJ/f+qE2WCVbeYXvPchxb1ZQ1cIJf8BHyqonpXgAKGtgiebipwpl8PchvtgyYlFxjIhmV2Xshn2p78Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQeMr41BV0k1wf4NxkA0kYcR0sTd6/owLFtRFLctiA5aEML8v
	CrslrKAclbawh72JsnPGliXlGSGEU0tG7dU3mkQJgeSnPe7mO1R4UKakLPi8jZcrd18Td/KfFmK
	lT6VxfkL5mjVfhceLSJGAPRjMYo2gnQMYN7bjlob5RqNeDMhtzAdAgwA1QroXwq8=
X-Gm-Gg: Acq92OEbMyZyCH+C0+A7LUgwknlY++Wpz0rvGFFf7+rJSU1bb7i+oUSFlH4eSPszebD
	OhdS3HK6tO3Kvo52baaU08W7pzwhz0hGa6nyPEQCy1J0s9jXa0Hq80i5NgfTPIbpff6/eik9sy0
	fKJ1kwspYR4y4M7zcSpEFXI25iwzpqeF2fiDaZzPUS5Dm2zSBhCpPaIVlTxSYmRdhTiizZ7aUAH
	byebZJMYNnLKRRAmoCCrOkfvSB4nJTADvaPRhuanC6aCslK9avQzJEQsb0JvlTUOSg7DGRLMBV5
	t6gr1PevmxiZ6LIYkh0CQNP3uzLQY0+coDUKf2IH7VhZm0wx/slHkPWDYukt6Z/60k8BGUIZaKc
	ya/D3JuZc7Tvhj3ruPMkkH8yBcgfjiCMFRZ9zEGAKU9aEsmcNCa9Me+x23QTrWRMW4xxS
X-Received: by 2002:a05:7300:8188:b0:2f3:3daf:3496 with SMTP id 5a478bee46e88-30820098dd8mr7313139eec.26.1781513797276;
        Mon, 15 Jun 2026 01:56:37 -0700 (PDT)
X-Received: by 2002:a05:7300:8188:b0:2f3:3daf:3496 with SMTP id 5a478bee46e88-30820098dd8mr7313118eec.26.1781513796733;
        Mon, 15 Jun 2026 01:56:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95342sm14150909eec.29.2026.06.15.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:56:35 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:56:29 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v5 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ai++PWgSGZnD4Haq@hu-qianyu-lv.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
 <20260602-tcsr_qref_0527-v5-2-8ea174a59d7e@oss.qualcomm.com>
 <178139077723.819343.8364833855890359860@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178139077723.819343.8364833855890359860@localhost.localdomain>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfXyEeTIyHYW2c0
 93KMrQzfsypr+LcCZm/fAtfP5skChcsXGf6s3ieSX6un+pTyv4k13JSqAvCLGZRSo5rDyAYzkGU
 pLfzf2kr2aSWTS0jtZcqe9nNpFIrxb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfX5Xn5XxaLX1j8
 /BS9XY1g+tsN+W3ksMNiU8siVLS7mmVwAId7mfXkSbD54FME2bUmsXMov0A7kd/Wk2ejtigtoRH
 2eOacyI0Ex9vxc5PqtlTWqWqqVD1DqbrUGvEj11bxYbpFlrlQBzlCyjH+zikIZPQB+02dOaX3se
 +7LpmN8/KlIIxw7vxOnCGpABWKFL6rqSjfHV1scmTT4T8BCm8cwaaXUW15yLv42QHp2Te/2bcEy
 bDKbSyJ7pUS+KxfxbUy/uFs8U0dsFoqZw4zUAh2rexisPGxq4bZfFG3r8adGqJ4p5ETWU7xueER
 5+e9qpmSyQMC/cALzatFswc7OKYtebj/Z6HOJFZHvWHm4sdlAe3QnWforyjQ2/jWaqChHkc/QPK
 JWi7VA7XHNgMj+ELq9+IMZx9U+leRiiYFbrDDSFq//yc8IzDrBYiyMurgEgY1QGD5MEwpg+WZEr
 zNCLHgMRXHbZFzgC2Lw==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2fbe46 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jYBClPptyWQWpWkDfbYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 9kqRo_lceXohzbtSAmg4VzE8lmq0bBrI
X-Proofpoint-ORIG-GUID: 9kqRo_lceXohzbtSAmg4VzE8lmq0bBrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150093

On Sat, Jun 13, 2026 at 03:46:17PM -0700, Stephen Boyd wrote:
> Quoting Qiang Yu (2026-06-02 01:02:18)
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> [...]
> > diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> > new file mode 100644
> > index 000000000000..09e2e3178cfb
> > --- /dev/null
> > +++ b/include/linux/clk/qcom.h
> 
> Why are we making this file in linux/clk when only drivers/clk/qcom/ is
> going to use it? We can have some qref.h header in the qcom clk driver
> area.

The header is placed under include/linux/clk/ intentionally for reuse
across different drivers. On glymur the clkref_en registers are in TCSR,
but on SM8750 they are in TLMM, so the registration API needs to be
accessible from outside drivers/clk/qcom/. Keeping it under
include/linux/clk/ allows the TLMM driver to call qcom_clk_ref_probe().

See this earlier attempt for context:
https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com/

- Qiang Yu
