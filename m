Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DFE420472
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871469; cv=none; b=a0LdVXBoWOi55IGUdjqi0bECfQSALZh2MQ38V3UPr6rXKKAfWyONiFMe5q+6ILA0b1hdCNJ4VlEYO72/0ZaGC6fxEn3kFnsM/tBVKv3CG8cfbR8jISG/YHPnl5S4tmv89aldKCj9/oQEOb4i1MFXnKPD+J29Y4/62voivlZZTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871469; c=relaxed/simple;
	bh=skBacWyG8sqPOZwfFEjjgU22nY5e9p9nHDoaPdYF12E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guMo4cRDovMy+GcYvaQptVmeYO/ehyikNetbfdWEEnqoGQpDcFBTt5wOED6y44lgDb+ZNNm6uZ6IGOfM2mINhRv76QkdnOFuWecdwSwICeqwkkMLQQ+g9p4t4WqXJ++RCf9yja1c+fApPIMvVMp2MqapnIpaf2eecZvRdW8y1fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deA1ook6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VX2+E27M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deA1ook6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VX2+E27M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691FsWZ82475309
	for <linux-clk@vger.kernel.org>; Thu, 1 Oct 2026 16:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bn13l10L9mJreC53wVZPdJvvDx7swzvrFZFrk8UgCKc=; b=deA1ook6/L8/w387
	M3pK3+XxAY2HN6tqzn0Lv5KDZqi+auYn5Vl8I8/CasLUgaTwjJf2Z/1CBzkgaqMG
	7YX0rghohVb+7UJZ/8m4FkKm+xY8BfolhziytDKT17qSe9IwhdVt+jV8iCnx+exi
	+jDdoIebiwHkN83QKYAcK/85bF5lL4XDLDbYmPk1F6e2T8kjMLCU4pFHyGh+keLj
	XzxcjOH8PWzwANmE8NVC0hby4rHpyNQ96ioKgYh0p6gG1fK4AuhdDCHkbRkMfoI6
	zq8VBxDkVu0QXZtThTptW5clXjLpV495n3FMK1bJm1HrDlg/4ZbaToQYEn2DuSTr
	5G9XTA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbg870j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 16:17:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9f1f9c38dso117277e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790871466; x=1791476266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bn13l10L9mJreC53wVZPdJvvDx7swzvrFZFrk8UgCKc=;
        b=VX2+E27MveBHvf6IwanXQYQlP58vtFFShyLmnB7fE6zK70eVcGT+nbihv5/8Uc8lQg
         0zdxFELxMq1TuyBUaRw/eWr+k4dGGiHKfuTXyrOTDR1Qxyaczl0eAw2HASMivCsfQMvS
         vLU3JV40XWTmaWYjvNw8k04Lfry21dfnwTkCruNxuDhYs/YPnqIliwobW3bFqOD/vb7E
         iz40kdYNPGUR+1a33nmk79x9mVcbl0cD7EILK3UXdqkoSoOLaWUM7SkPKme5BVLYeWkI
         4GvO1WLr5HQiR8MO0qTDuaTRg62GOibrVOLOup8+vkEMWU05TCeIk2GqS/TBNZpix0vW
         MLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871466; x=1791476266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bn13l10L9mJreC53wVZPdJvvDx7swzvrFZFrk8UgCKc=;
        b=u/8ym0bhafLMA3OQm6/1gzBctHkRomjxdytZo1ouEcchCuVzcb6t6K7DcaQAAD5PNz
         nsRcQ4viYo1MS8e5gCYUDk2F1pjpSMYw/AnyJTKv6J/KERlpscb5mw5UFI1x7TGFejg9
         6mCw02VO+dPQ+ZO+unuAC/EbJDp+Rm0whvOCRt48dp9mV8x0EweiAo0WcrEfw1NtEg4e
         Qbrk7+ETlUgRAr2NpsXfheq/uO8Hu5K1RcpaqxmS7WOpKi8qnYC4YvRHwAP8u0mE8exC
         fzCm8h5qq2MRSqZyDoWUypKBCtjuMR0s4S/lW/oF7EpQwdbTUGuDrljLJLbT/smiEZEJ
         Xltg==
X-Forwarded-Encrypted: i=1; AKwUvByXAOUMVGr1Ajs438FU1ZKp1yyNi3aqA/n1DBcOkXwjIOUAOniyYlOrn71zM4V7KESHlK0+hEzcsIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4DldSEjdleCsakf8vPyy9f+icl6hjM+Ze4OpEi4s5vaeDx34o
	T23bEka+ntz6ck2T88weIU6NtcTpd5c5NOhLLO3pe09GS9Khk7swIWFjvt0TbGm91lOtlV93eyl
	fVexr0w15fGuXL2NPbAIJPFPrTGq0YZLgy6wahqcWQqZ9lB6rSrzfULQC73IhoQw=
X-Gm-Gg: AYBFou0wB/Nh13XZlzDxaKSaLLYg+XiauiN5USlferyJoF2R+sxztx2iCsqhJE90qFI
	AQjZw/NMhJXeCH0icGjB6dk+wtQPNRvWgRxCfwG4OqeYL5CrLEF+juEM6KraaMPkUtWqjG8m5Zx
	2fwb2/pzwTo7huDUjaTdCgyjgkS3vWPZW+AQ31EF+2zxhFTzOENN2nINuk3/mRTLFmSxW4p8nEB
	m8MIXsuJHE9gNjc5SRQEjdIw2hMeNPB4GiQnXcCwnzTTKVfa+kaaXUv3j//JYdMaQmsifN6Gl7g
	StCC9RkYFSc4iBkU7W+6+1S4f1UvMqSv+uph/7e7fhFNwoP3ZwxALDtstmuGgdnaR9Wqo/yuCNW
	MWMriT2nUSAMIUQgAngNFfg==
X-Received: by 2002:a67:e716:0:b0:7bc:a347:2058 with SMTP id ada2fe7eead31-7be722c3746mr1130673137.2.1790871465801;
        Thu, 01 Oct 2026 09:17:45 -0700 (PDT)
X-Received: by 2002:a67:e716:0:b0:7bc:a347:2058 with SMTP id ada2fe7eead31-7be722c3746mr1130660137.2.1790871465289;
        Thu, 01 Oct 2026 09:17:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d36785sm191691866b.41.2026.10.01.09.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:17:44 -0700 (PDT)
Message-ID: <d5253189-70dc-4279-943f-accc2b3ac703@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Set
 FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON for PCIe pipe clocks
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfX8JLWK+X/siGr
 +obCNUZKD9S/g8IuMpigXv9fnV/P41p/S1oM7k62ufQtjN7fgOpysd5MixdAA3PD72Dsjdz14H2
 hdsEzg4H1t56d5Iy3aW7SFJVpgx5ZOw=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abe87aa cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=m8Gnl63oPaFM7zqXGsIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfX2So4JeK+Y++6
 Ih9F9OjyEr756IcHmQo8utUXM2MNjSKn1RYlUloYxT3ALmbtcytlq/8m/NtlKMlgfM97jFPHX+a
 k0ViQccM52y5FCGBDG8zdtvM/XnZhG+QTO7zWPoAUmHHk/EczEQW9sgZROOAf66MhR11NeR5zyS
 NreWvac32aSTSZ7I1aGpqWrP2XbfylpG7sCgp0EKakVxCXRRbn2py7nJOfE93JcuB/Ytq1Oy3yq
 gU8+bWz3dg/DXRu/dfXOOWDvvFlQB6g3SQy7x8JCg2l1/0EPe/+79ytoCUAJs0ZJT9XfecLJAz6
 xYAmxAHz04KuzZuYShP0aac/Zvq8vPj7cm3/Ka1iKm+8to8eLpnDQj5TO5qF3wmmfAacPp+It9d
 QOigVL9DUP/EaoN4CEzX1pXaknVgveUJlGizG87ffVqHi7RlW/QLI2W//oNwTT1YM6sjaWzpgKh
 ZfuZXj/0ZFpwnF7HNDQ==
X-Proofpoint-ORIG-GUID: 1zO4mqJ6XRPtw2sJcgeb1x2Mn6JQjf5X
X-Proofpoint-GUID: 1zO4mqJ6XRPtw2sJcgeb1x2Mn6JQjf5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010064

On 7/15/26 8:23 AM, Qiang Yu wrote:
> Setting FORCE_MEM_CORE_ON and FORCE_PERIPH_CORE_ON for the PCIe PIPE
> clocks so that the inbound data path works correctly.
> 
> Without this, the PCIe link can come up but the endpoint can not access
> host memory, with the host sometimes seeing a completion timeout
> reported by the EP, even though the host can still read the EP's config
> space.
> 
> This issue is seen on QDU1000, Kaanapali, Glymur and Nord. Hence, apply
> FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON to all PCIe pipe clocks on these
> platforms.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

In case you agree this is desired

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
