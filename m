Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884450EC1D
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568933; cv=none; b=ihQ04OPo2Q6cCtFU91BiKF5daLt4Fukyi1AIoFAO5ATG8QI5kWDSr7FdHcVm8Ms1OV6pbyxbf9lz9em40YVKMAmAYUlUA0zKS+DcUMUx1JvDZv4KALs6o2cQFNNyzB9BJYQbVCd+bxxv/mJZQr44aB1MpppLV7ZD9hWqA10r1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568933; c=relaxed/simple;
	bh=9ghc6tZH/4fPr2oKxlI7fOcbF0TkM4CiGrTLxSiHHZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGPwAFmzO0rmODp6RGmi55M/eakARSWMCOsCqLYkICRHkLVulFCONnguHUn2N32dZATJlYKZmJmcKPHdAj5/r32z2+IxG2Mc+q1Z3fYjHuNHa9ev1yTnvMLoey6TakVtTlB62bblOEzLuBlQVQ5159iGtvxR80qzmr+vY5RwAnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErHzdGix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbjjUXPy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErHzdGix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbjjUXPy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GDJB2Y2788790
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 14:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqTCsPGnfug5X3iCX0D0UGrR50kMZM9Gey36ErTsVO0=; b=ErHzdGixubGKzp6E
	zDCaiJbQgYa51ICV2Ncv07CCsJkmp/T9lPQb6s54q5L9NAuLQH1S5aFRx6y/yoZ4
	5Cf+yQrRf5MdddxEegJkVpu/1LLpVkaENycJwqV1LvTPzi4w9zyGM1cKqqdfTWYt
	sxq5RHVhvHRA09PvgjfazIVLFpSCleFOAhofDidBKx3/oe1GFIsTwc0UqMrgv1ap
	+XN5ftJTHgvnB+816gnBSkF20bvlH2R12FIi4xfwjldzXiPdd6DCv14QduK6HHot
	TZpjsLPAUTI3u87Hh0X23m0lrw7Jc3Z3khJNrPGPvdpFZVsOKopZ3WDAz5dYABxJ
	PdHlmg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2r910-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 14:28:50 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-671321441d1so5735861d50.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789568930; x=1790173730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqTCsPGnfug5X3iCX0D0UGrR50kMZM9Gey36ErTsVO0=;
        b=LbjjUXPyv/pureKxrFa9Ri2EzxeK0sG1d8b+SM5mOztOs+7gR+iyxWJs49zSaaoVHJ
         MNGulz/PQmoJQ4VRYyRm9vK4uaYINpzvgZKmG92R37R7iDld64quw4iSplyVvVouH/6S
         I5MlSYOq21CowOvhugeFMiM4K7AHjGgSWXUXfd+ThDIb+t+0/Jc/vLBpa5sFIGof286N
         o7TAF2indl1PoCNB9kbJq4ZFixLASR9VxVApLvGnVyem88TxUymQ3CzlWEBwpOo0poXx
         07uKCSzIYgIVtPjoXRqr+i6MNI2G8QtsPcB6ITQGVJ6b0I0GUsAc+zqRFgoe2wa0eKew
         4xXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568930; x=1790173730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqTCsPGnfug5X3iCX0D0UGrR50kMZM9Gey36ErTsVO0=;
        b=enBjKdrjGpasuFlnPcRlP26w1G1MoWytseGEWudcrluKQBEkV9+nsi9JdPl5IpCog5
         Us9JC8ELlKAdgAmCG+JL9XuvvzF0/jXNE9ycw/X+/VHrCd80jK8CFA4sF7VgbqXBp1Ue
         YTpnKUyWbLcGFf98AMknGxVa3uIGWqvhGPD2XW2oDh9pZHtoWfooEC2sQFLC7IDSe2sl
         POm6MDg5kgkAy5Py+Tp1/zVETDgpYGXuk6uJyALQfBJFSAlgisMv2mBL3v72GK/zvor6
         PAvtYaJMWERqsJcHLf29sKBR7dy1ryLKov+g0KDE6L9u0Bnkp9/H2ChqSrlW3YrtzJNs
         1lzw==
X-Forwarded-Encrypted: i=1; AKwUvBzfmNukwDZZZJW7szBP/PGJcFM5OksVIgVrwh0ai67ybwnSh+eSrAgebOWz93ImwlCtUBa8SbAgM0k=@vger.kernel.org
X-Gm-Message-State: AFuF++miATKOIrioV/UdyigjmazRB12Z0AIx6p6mMLC5qTdm8aZRSHCA
	O7II4cne+t+7QPuecWfnrKeVIbxdJkJsA/eIAYO0r/lmla0Qpd/Z1D232oYfEB19eXgiyvOJpXH
	JF9tn/XnRJCRBnVNQxSwN1PtdepX614fVGR4szksuFJjSJdFaBAYqUYmPDkjNfo0=
X-Gm-Gg: AYBFou0iz/YFv10h5wFVXgz04cYHXAEnU591ywmSJiKGjPgWFDY0l4ny1/AnqAB0HBj
	cjD7dY2DFrnfc8KM7AFoklNh4QPks/oHamwropxpfheohw5xWDYZ0zPuANfOnu7zoXZYPnDOiXp
	5BP7wRg41b2OP+547v79bx05Mnv4vfYNYLEz4JOxVk1Q5NQgU3M7jYxDn+bdn/UjV543nBXYyrd
	lXVh6KLc9dmNay4C+SUTervBDxUUDwmYj0QjN5VG2p8Fwf/3FHhE5beDqKxuJBxlFrgYhN1p96m
	FVvhwV4xD4azBPuH/nEpJ2RYaoaY2DqQkKW6hWpfOHp8AUWAgTiMByXu98Nb5MKgLr9gsOk6u7D
	gdk5DyoWfv+1WAzOyOjvnkXcqQYOjfU/AObEwOXKyV78=
X-Received: by 2002:a05:690e:144f:b0:66c:bb59:e065 with SMTP id 956f58d0204a3-671631ddb2dmr912613d50.2.1789568929975;
        Wed, 16 Sep 2026 07:28:49 -0700 (PDT)
X-Received: by 2002:a05:690e:144f:b0:66c:bb59:e065 with SMTP id 956f58d0204a3-671631ddb2dmr912602d50.2.1789568929510;
        Wed, 16 Sep 2026 07:28:49 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.83.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-891f0b96dc4sm8668607b3.36.2026.09.16.07.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:28:49 -0700 (PDT)
Message-ID: <e82fabea-ec09-49ce-891c-81e0445534a6@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 19:58:40 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: Fix TME reset register offsets
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-v1-1-0fa10674908a@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-v1-1-0fa10674908a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5NCBTYWx0ZWRfX/PD+Kv7owCgW
 t8hjzjEhLqsOP7/ghx1Cm9PEOFJid78pFF+2i/OqAcxKuQIEHi+ByrZKv+AEzjOGGE8FdStivKL
 24UA0Y9uPFjXUSBiIMPzJ5P05PgVEtU=
X-Proofpoint-GUID: LQmEmvPvTynPgmo34tWqlBq-wdFpGdZ4
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaaa7a2 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=OZlrBAJz/5WJp+wn98y/tA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1YwTZjUziwFERy13GwQA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: LQmEmvPvTynPgmo34tWqlBq-wdFpGdZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5NCBTYWx0ZWRfX2STVsyDx7Fb+
 G9egyVYAsvZiLOF+Qq1ulDoXym+A1KPJtz+df+lSsEsN9YVtf+hdFYEfvmAUEs7jSr/FqYLR6Po
 LufKIKtTBVWE9PYTzeIFABhIznhdG6Q8Z1tnDfRCIqtvuAGrP9i6au8aRK09g0Kpy+Ai3Siamj8
 VfsYUE7AUwmTa+0MUrPA7YAlpqBhqg6g9lEfWLMM+OqZ8EivH2x/Clu/XLyluQMUZYedDUtABhS
 LkrYEv/amLky2eu0gfn6KMBzYgosEBq9yKmCji7LGSlozYF2/Pko8Hv8ndA/Z6aYGF2rdNkvIFB
 JS7lHAGkCyIigHYS1KDOpPSG5Qspx46ls45hajq5NOwulkwJ7r1dSceMImAxFJPoXbnr8NQzpVM
 bdn1tC85+x8vU0R7zVNjn8b9Q3blQ2SsRMppukFr50Sb4naR9baRJhXqchztQLICIAXtYRJ08BW
 3V9tt8sm1XD9syQn8ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160194


On 9/16/2026 4:59 PM, Abel Vesa wrote:
> The GCC_TME_BCR and GCC_TME_SEC_BUS_BCR offsets exceed the regmap maximum
> of 0x3f024. Regmap therefore rejects accesses to both registers, leaving
> the resets ineffective while the reset operations report success.
>
> The offsets appear to contain typographical errors. Use 0x10000 for
> GCC_TME_BCR, matching the offset used on IPQ9574 and the surrounding
> register layout. Use 0x1a030 for GCC_TME_SEC_BUS_BCR, placing it in the
> same register block as GCC_SEC_CTRL_BCR at 0x1a000.
>
> Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> The replacement offsets are inferred from the register layout and the
> IPQ9574 driver;
>
> Sricharan, could you please confirm both offsets, particularly 0x1a030
> for GCC_TME_SEC_BUS_BCR?

Abel, I confirm that both offsets are correct and matching with HW doc. So,

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

