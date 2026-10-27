Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103306;
	b=tLboYz72wdHgJXG9CEYBdTQD/gIymiv+tSCTNX29lcvLVVcUTEuQRIC3X7OyvjqPSWOT
	 ZO7mtQmUS4w4xnKdziicKdI2dPaH3D1NyDK0k+bBaubJ11wrx9B0IgASorlEVNQSeyAhc
	 b4Cm8Vts9YpqfiqoYUe+GOWDuc9usZFpXbuzQzwmsR4g8WOVEtI7UIhVgsOwL9a7qe7g1
	 H0oSwWimx1pDCkS5TimBSpylakea96kg0QaNV+jcWGi1Kq/0u0aBtcANU35VT6dSM2gri
	 UCYETkEnE3inv17aP5gIVhlCFge35G7+gXWpLDy+3Bcfd4aYZ+lhn5rbwqPLNUSFqBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
	b=xbzXw10v1wFTiQl6fPgG2878zc06VddIwzhVidcwHAKoAz1Tvz25D+8KI05CBr8jBtt6
	 QkHphLV+PkWQT6TEkAkAMUKTUi0dSqyAK/frBg71HDDttutXbcMuecFbsZJBhvvFWjCQG
	 fXtxtM5VyDK/TORUIxWItRLON6ZaPjxUItbeKwB7TrpjSt7PsPie4B/4vagwA32F6mchk
	 Ec+3s/etVyUda29IYh7y5ZBQk6hKExE+IA8Co0dGIfdF1JADGN+DeIf9rr7SlhBxbetA1
	 YBqFkICQdBJwQE3u3fFCl4lOn6mM/0pJlo0/X3WiMYY9NpGmUqUppai/HRk841z4ClQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwgWJcIC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=earvUgEV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B322D60A6F52
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 12:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B322D60A6F52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwgWJcIC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=earvUgEV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe39M1061340
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 12:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=; b=iwgWJcICdcc6gV3A
	qe0suHdChWmHmOKJsdg1kL1rZzjhWhOVWIGk9E6CtdYtKM35tb5ZgwZhL8sLnpID
	RfEnkAUttShz5+WVJ11jDGTgVP2LyGM+FxxxhKTnLK5g3PONLtzL/sAOu4izbKHc
	NGwAiq3tEy4lG8Ch5K+vxfaCTQVLl5fNwFGZx9IysMNinK/hI+tGYo8w5Q/wLzYK
	FTKLGf0FAdxr9F96r7F0bk06GOZCpBbt7isN0TP8Pl+cGykH89kf1l7isyFZACk6
	uiLWCcX/Nk0SR2isRw1YEqls9hn+Yovvd6v91ga3xC28qtnEYLthtExGZj8TL+hn
	7s+MrQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9eg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 12:15:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cba2460f8fso198377137.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103304; x=1793708104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
        b=earvUgEV45W4sQyW6cT4D9W69MCVM/ofR9SAHYeIs2efFlqa3RnqT5PWx9vib5PNJO
         xZESJ2A4LjAU6QBI6ySuBmFBygHQI0Is2hOWX6i5o7PmpFc9p4Hr6MIH3d02O6OA8qk9
         giW/yTZgMtmm7dSx6F7HnrCpxKtE0HuANkTA4KdxaWk0DP1+RmFgyp/XqHOI2zny4sME
         rA+aTEn1K5HfBnMZWdi32A593DaTEvsYnMB78ybv1bg9wSx1mvhOHPFGkhOuxfewYslr
         /X1hxTrm0/AEivOaUIt0hV/REJ2D3qbpnLgsK9329ssXMabckKV+HeDnMU6ZT7brrexP
         dgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103304; x=1793708104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
        b=F2MxQNC+wYsWicGUKhYBh99lfBPflSJxJO7m7HsS+Dhmlh07arXilgjZhDjXosDwzL
         nyrno7oOhB4jwPKFE1fOyPZCfVUxgIY2a5ej9tcHVVMFKJ86HGH5DICBpkzVss6vqdr8
         IXGIwxs0v0ASgENc6ju8HroFqlNk7To1kG2/yD4WxJVOiqm2Z9A1xUdcI4rIGJOWIFpO
         hOdfI5N2soZU6s5b/unCq4i3w5IbnMnCLBs1Iwom0Dfnd9cBG/nOE3Gz2HNRh6f/f22L
         JaHdQZn8B+c964nc/3tYhKmXoKuZQlH/McqPwwV101dcFNoOx2EcguCRNnvfik/kvOa1
         9WfA==
X-Forwarded-Encrypted: i=1; AKwUvBwFwrkLRCkQk1i4FwCryw7aUqQIFSaIKN0HkIVtDVxUZJRlRKx4QzBKwkwQFgylqMkJyxjBVgm3JZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG0ftkYXPKIDPgaEymirupICk5ePlUTx4x29AMt7E4C9hbb/hb
	edN5hwx7julFpkqPBI2uq6u6PuNDHVNzbhQ2NHDwdHMx9cnz/PuFjsBm0lXbVR8YZb6T0YNWXzt
	lzqOtf45lPN16+NvuWqj5CjjQGZWb5U/UZsmZuMlskLxwwWBOLnqSkO38XOfPx5Q=
X-Gm-Gg: AYBFou0i9KrAGk6Xs5LiCQg3C5JkawOR7vVJS0VgpTZWlyQ8KQeb3joMepGM9P0FP+S
	9QxTYWrITSDGH8cjNgwiQs9GLcWa1JwojUKL3bes71MkbBhOypEhdAU/zGQye50cgJMFcPBTAc9
	xAynUYIL/HMKXXW+Inw9t3LePGhbrWK2sMmU00rgsk3O9XmcFovJou9q/b1s5nezFg0Pi0/kFf7
	uPfvaFBgF0TXtRjvBxqqAiS4v2eeVGodgIMRGLjm5AZcZxuogDNY/0fkvl5j74CfykVaGD18eOF
	t2dgaifuvomEmR+7fCQiVq2MiSqd8z1mYtwt9WRvxGEGJ8PfAOpa/M+uUW1TFOO6y3uQzxB++0i
	590MyPYgdFlVI5oXP84SI+A==
X-Received: by 2002:a05:6123:5cf:20b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec23954451mr3371775e0c.0.1793103303873;
        Tue, 27 Oct 2026 05:15:03 -0700 (PDT)
X-Received: by 2002:a05:6123:5cf:20b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec23954451mr3371755e0c.0.1793103303398;
        Tue, 27 Oct 2026 05:15:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89dbsm432825166b.18.2026.10.27.05.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:15:02 -0700 (PDT)
Message-ID: <c0c38ce1-7491-47b8-af5a-d3968d755085@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:14:59 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae095c8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2zQhOlC99_H9tdcWL1cA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: SgPNS7F99GWbdh1IcJOrDsOgiBNNd3z6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfXxEqPwjipDeU0
 KcmwTHk3YDZUZqjdqWLeyqBORNkbvGa2DMUZ3Gvl60MKZOkect7B4m8UemNMnUzOX55W3h231H6
 or7sSDH4+QlOP0MVm7unH+Wt591VoI0=
X-Proofpoint-ORIG-GUID: SgPNS7F99GWbdh1IcJOrDsOgiBNNd3z6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX2poHTiaDw/3V
 1vzLh0dLJ5q/scgiNQew1LirKoOZJyvpbP13g+iI2WDWsGUaZwHO8vVSFah4tzR64C2U5YcdFPo
 iFwbjSV5P2nXvfrOqsyD8ftBsd9kd6OkStnhTx2Yiu4zoYKiMq0BaDRY+7uKdAXjDfSh/ZRoy8u
 6DKJUHYYW8MaKmzRUKUHpxjT4SwruOd8SS5tHgQFtvZfi9Eqz5VakfrtJSkM4NkOVSEH6rx1AEN
 VCl+vH7AEtiRuR4IrtdmJPf4zZnXgp4qD2qr0sy10APscQ10IWxxR9b/W8YWSw4XCII2Ztbtgie
 pUbOWFUZpmh7QBPlrmEdpm8RCKLMwh8U9EMtq+8YmrP1HteBizs9ICEsu4Vczvc/UFdzaIKOIXI
 vpihfpe6dPBESq+/P0Nqm/DlC9Uu3HY57WjTc74SNTWroOtYuk7i60Fo3139DXH8pJ8NPRSf/iK
 O8FJy0fOW+KYShpdkaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270048

On 10/27/26 5:35 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.

[...]

> +#define CX_GMU_CBCR_SLEEP_MASK		0xf
> +#define CX_GMU_CBCR_SLEEP_SHIFT		4
> +#define CX_GMU_CBCR_WAKE_MASK		0xf
> +#define CX_GMU_CBCR_WAKE_SHIFT		8

#define CX_GMU_CBCR_SLEEP_MASK		GENMASK(7, 4)
#define CX_GMU_CBCR_WAKE_MASK		GENMASK(11, 8)

[...]

> +static void gpu_cc_sm7250_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	unsigned int value, mask;
> +
> +	/*
> +	 * Configure gpu_cc_cx_gmu_clk with recommended
> +	 * wakeup/sleep settings
> +	 */
> +	mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
> +	mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
> +	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
> +	regmap_update_bits(regmap, 0x1098, mask, value);

and then here:

mask = CX_GMU_CBCR_WAKE_MASK | CX_GMU_CBCR_SLEEP_MASK;
value = FIELD_PREP(CX_GMU_CBCR_WAKE_MASK, 0xf) |
	FIELD_PREP(CX_GMU_CBCR_SLEEP_MASK, 0xf);
regmap_update_bits(regmap, 0x1098, mask, value);


you'll also want .use_rpm in the desc struct

Konrad
