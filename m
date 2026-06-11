Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE843F4DE0
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179222; cv=none; b=cBqd8bBgoAva0KrI2ryqqYejjj+9/VHkfK5XwqNSKViyzQTC1JGqWScOajhB1SO9r6ACA7uuZB2rgc+rC++dhfKjak6+XRBDU+SwomAwAO1m3FfS3wCdMSdfRtVHmBthPGGZXBi+pedZGSKOk7Q4m51pTktE7w/syh9eX9XsrS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179222; c=relaxed/simple;
	bh=mfwra88telGHmlK8pwk/qUqf4z2Dpnxn0DRxiXNQG+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHG24DR6rkq3l8iwk0MIpXMAX93ls2/8+3ez1vi/1iRGGePwYUxnSMik3VFmPnX5S2XG4eBFMw/cCe4JIhbyCUvimz8wGzdhQyUd3S2BZWBsJtbAQBGV17MwasoJudKTkontVgVjnqSiolV2TxKwbZobnprIUu0XTkduPEJyJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjPsErVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IftUlu+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjPsErVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IftUlu+J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA08BJ319144
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JzeBJn8FIGue9gwzl3iuXpkwL3cazzGEmpclsocTaAE=; b=UjPsErViRphn8y8O
	JS2I0WSC4C5ooDIbTf6q/ZBSj70ciUN9zgW6fhpNcu9dMt+s2hMPoTurw1WnwaE7
	FT/VYDye+nt0Q3IC2mBVcvsFgY16Dg8oRGfFGnDTTpgl8Gdeb6v4BSWHeXOWVhTH
	Qm0pDB22qazQbSvOnFsDY0l2YehhJRlQ6G17Kin5RUIon4VgZOiqpjLRa14OvqcW
	sG+OJpg40JR6i36tFZ2zwMMzJpKWGybbXBA5bKKYi0xDLLzwyH8hEaqJwRg0Nohh
	6/tqDErtbWqHAYEkMUevV2urNcCTp7dXyZX8aBFQzW+7xN/RRqzjjAAit/dU/oI+
	gg9G0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ska25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:00:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51780e3ca44so15885391cf.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 05:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179219; x=1781784019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzeBJn8FIGue9gwzl3iuXpkwL3cazzGEmpclsocTaAE=;
        b=IftUlu+JtUYW+OKgjlxs6w4CNnf/qXpHb+SzGjzxxujPcr9W20tBp2V7/4OfZQdf1r
         o5wPSEdnIyvwTr1ZVBcn+DjdYjdEp7mz5tjoVUTE5cidKzPOmDnQZ2O3iOPAhEnmDhVy
         eS/93plwL/tqbmTzSE2Dg/koBKlz04c0NNkYAj+IZkprnXYsDMwQp3Tr0gyVqOr7+1aB
         iJJn/QHMLinzlcrT+7V/og/9ZcoxMfSDswPF73cAYtkwp3ltClraE11M5FJUIq+y/TRp
         8TqoIDaiVtnm6CPBdOg0lSKShBZzrOZDELtl7bMAqH28FwelGgh7gNSE5ODGnA3jOIO6
         eqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179219; x=1781784019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzeBJn8FIGue9gwzl3iuXpkwL3cazzGEmpclsocTaAE=;
        b=Y/f70ludK/EAf/XPX7+EyLneh89X4C1KyR8EXt89crz6rLAH6hR5UcAOGdAHzj5Bag
         8H9exVex1bHAmlkGhOQ5Dti6M3M/MhmVN+R5KmVNv7ZH38gW/n6Yg1TNOmbAbEvq5Hjq
         2UcOeha9HFTmDnPqCNJbBSKlrNS1J8cHZVhALllA09mcC1W+VJYwTbtvjP6WkWcg8vaF
         nyZB7sC8Cgd2hrezL5i0rDItq2UpomFfhcQ2bh6VAPmilMwiNcMpO1qKnwIDXKFBuPTs
         tv6HF4/g0sjCTlW/z1daSj9k/pnM82TZAA9rP1fGL9MGHvhhr5IREakPKwTFxxKmLLKy
         pi4g==
X-Forwarded-Encrypted: i=1; AFNElJ/lXFx1VoqNj0ee9VnsXZS77fgFpTi6ZtNH+imlqSEccfN0C3+4ioxLvM+jyzJaM7G6HFVUSmFt/3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyyts/LjRYOcNJaBZqJsBf09mgoOb9GzN+Lgfq30kA2ONLSqJd
	2Ge5kMJDQ+eFZ/uCSl67EP3jvyGjvTql7IQklpaLUmJjNQPryFAH4qsC9KK7Xbzns47EBItJrnN
	Rf1clLSaAK3958JLRnG3GZf3lQTvfMlP29DRHgr2fKWExUIG25mEh7qv6p2+HQF0=
X-Gm-Gg: Acq92OH0obOuo2z6g6EfRxCOTWvwEGX72XNUv1iIrJzoO8BKvnGeIc85FvlNiocyntm
	7hhGuXlnkvtptka9LeUzOCc0pXshbXvDtr+DWqtB5ItClgRW3BXhRCAXGYHdKNDQh9va6AMMKb3
	re2oelTaZTmsUeFrLC2DnltFVhsB4rY51Tqc7bxoXKseE5Spl0FSV+JcjV1kZnTjldJV7u9GJz3
	NaNWSpIohLWLQHjiBUJI8WWlVUz76mPrcY+JAcM05vNoT32M5UIiDVbSTz/dngfWYXVtqaOvRwF
	0ZBW5UJ8ynnUZb6OkSiDzIVdEJmMDUeWLmkpzf3f60ONT0DbrODtEbwaSvA+4Tq4x2pgo6sZKjx
	SU/vHoxQ8mMWsWGbRD9ul591c3IHc3jSSc2c2DvIy6Wq29JC3d5Swj1TZ
X-Received: by 2002:a05:622a:4287:b0:50e:6311:7380 with SMTP id d75a77b69052e-517ee3c76f6mr22740241cf.6.1781179219286;
        Thu, 11 Jun 2026 05:00:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4287:b0:50e:6311:7380 with SMTP id d75a77b69052e-517ee3c76f6mr22739371cf.6.1781179218495;
        Thu, 11 Jun 2026 05:00:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14cbdsm55083266b.2.2026.06.11.05.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:00:17 -0700 (PDT)
Message-ID: <67d7280f-54e5-4e16-931c-92049bee3e00@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add EVA clock controller driver for Glymur
 SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-3-b61c7755c403@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-evacc_glymur-v1-3-b61c7755c403@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U0tulq6vXPQlJTmN9ioDxm1kh8z_Jn2x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX/paK4P6PG/oK
 +R1SyNTIrj0j/xtFA9Lu5Se8OVaw81F2H7mW2kg2MiKhVZNrRdOrX2lY9ZlApXlPFVtbxbIgzId
 wYrk6AI0q2PwwOgC+0wGaI0Wzm4rMgQ=
X-Proofpoint-ORIG-GUID: U0tulq6vXPQlJTmN9ioDxm1kh8z_Jn2x
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2aa354 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KhKKGY6azsjSgFTL2HwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMCBTYWx0ZWRfX+1V719WCWGcg
 5AM9/gfSArqBm+TeLIWZ2JGzsAAAzn06S4yqZKNBXa8nMj8TJB6pF0xTFOvWIgmW6mfVRcEekVe
 F7BKG0o9s8phpGLkTVwY/sJLpKi0lwANh+fsQvRg58BoHkuQeOUH1VRI0iFHsykAgtjfua87cO+
 WHj3SDv1csA/qb4mmU2rZh2LTpF0gsW37gR3NeM+fyfsplJa73/RBnRvFGYqlJFnw1Syd70e62N
 GvdG7kujv2pi31uIkTJIakeBbwUgriCJnRcaSirBJJpxnF7POpB9PjfIebEIFjMIfx96FO1qNac
 LKQUIBrBc4FtN3KCOdM0wqafTzCpwRUb8yutaw2q3FEv2Kr9ptl3EVufRu+5PXwVoYS7Qa2cj8r
 1DevBCXXp8kYHx/RLyoYwmP7aHA9NDVhgljXY1Qtm/oZms8S2LMZPkGU0OKlE3m2r7ELyAM6npV
 PMpzZw+lvI05pzQgKKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110120

On 5/26/26 7:29 AM, Taniya Das wrote:
> Add the Enhanced Video Analytics (EVA) clock controller driver for
> the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
> and resets for the EVA subsystem which handles vision processing
> workloads.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +enum {
> +	DT_AHB_CLK,
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,

DT_BI_TCXO_AO is unused, will it ever be?

[...]

> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/* Update CTRL_IN register */

Is there any better comment we could share here?

> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));

regmap_set_bits()

otherwise lgtm

Konrad
