Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461E629B20A
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458772; cv=none; b=LUo/fze8ZpFEjpdiAFyKD1t45iArOg7/sSYgt/YC7OQRvhbaMV3STQTZzLfoNso6YBr6XQrJwEzLj2xH4aO5C1JymHnoHKkIkx7OhTNSJpC9WZgEFPdMaXcpCLp+CiKG9CoiByl9YPIFW373XFQuuPrjpzNHhkASjL/YrevhkhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458772; c=relaxed/simple;
	bh=WrlyMU3FW2/XAd/LiX9aSpm26vl+hmVr+VlOf0zE3j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V01xp10INQjdg3q6aptXC/ZPnD659rhv+8mlGpEwUOj6xTDbiiiORkAt7GYzeUy2fOqKlY+nF9yE4a5//g12lAZkE46w+Vsw4Mkuc0N1PPytOKZpd4XHqj3twFCHzMJQZ4tQB0+JUjX/8VF8qM7kozdBSjG69keynSblHPHJFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3rQaBj5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8Gle0pE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3rQaBj5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8Gle0pE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI64oSV4107490
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBmMSKW7dW4ukgSY/vGPXYT23uCuYtGDCP8pE5OXSCI=; b=o3rQaBj5ScL1zN0L
	PHBjTonQzOvLNOKcZC6UVeX14zXdkTIPSgWOjisVnqIpwLep//EgkR6JUdotVUMo
	E6T7T0wFwFhX4wdVWtTq+tZ2W2izSD5R/r9a6m6104ig28ALDUJR9cT98evjB4BP
	SbT1gd0CtDVumpxYTC0pA9aLj5f6kCUH7su7D9px2Z1trceFZ2hRH0DsMJad5d8y
	ZW1giSiulFLiLVtqAONduuiRsr+aKZN7BYOhUxnupNtQ/6f1N9yJMN5tSPqOFQZ/
	on/FtN6S9Qk3tLvrIjIwnkrY3oDXKk2dGFcR5LaVRqIurmr46CS7tNTbez6Ody55
	rIg7eQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hpbjjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:39:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2fd6ec16aso31943485a.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 01:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458769; x=1764063569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PBmMSKW7dW4ukgSY/vGPXYT23uCuYtGDCP8pE5OXSCI=;
        b=J8Gle0pE1M5TQtw2pp4B7uAqXUhCnwN+Xevon+/Se+A5cAEIUZ9tGuJmJAWcorQk4T
         XP9LH9WnhiC7WPELFl/gehAn1WdkCMUUCWw1rh120rtArDe5Bc3An3sCWMAPJjTHf5gT
         172dSuWPiYxW3ZcJntichbGn58TBb2S1OmOak0yn5xnyQkGFTHH3lJxAPDK9rlXRU7H4
         8IUTOO0Mdk65ZuDI6EJKdrGOa8lIpiZdRZi8AL3SJjdKT/ypEp6K3aeVNkD78JIzgZdl
         KsKgLxX0nWDS5KuQRRFse2reeBG50kE4ckWburdRJZo1b7/OnGLgoYRuC6rEGZXUYBvU
         Z1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458769; x=1764063569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBmMSKW7dW4ukgSY/vGPXYT23uCuYtGDCP8pE5OXSCI=;
        b=YmnAA2voU7Fig3SJ65VNi5TStOzA92EOLPOjpDBrBobCFmPfRsDhkuuvhD/jRydxPL
         1ojuKOUauU2IqxefVqvMeuDIE1dzGNVpIJJPjyGI1x7hVIwTO+PyAiXI/aiExtSBu5rJ
         RtZhiPlMc99THddCzL4iTEyZOQ0eZMsf6VeCR2xPdjI80AfhnmlGFW9m1I2IF4v0t6t/
         YDYCE6bZZ75/b6pRm5ELP37GkXQAWazpjV5QwT0sJEmuQwUpatTxVClo4iccgpIs5cia
         6oWwvddfabSwg4mHtprq+h8J7cqPVjjsgbzFq2ts/wfmHO8WN70PtNnzFh6Q6/M798is
         QUZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6gD0/EuW1hbGJ9pjgU4hnsbulbrROVPNm0rIpx8KXWN6aSMO0NkcMC7PutjZxN29C3KqN4Ilv2q8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4CfW/whCkFVGZyZW6iRo48OmPqePROFL/0ycKhp6d2lam+CpB
	JI3M1KdnAnGnHvwmZAQUR/F1pnENKG9wB/9Loc/mpdLATXPzzOOop2VMp98dTf+e4ZxjHQ3Vkup
	2stYTcn6+Tb+m4Uv5PHvWLLv3bD6RkS3krNvfwtGXCdq34ecodw+RY4VR3ppfiXI=
X-Gm-Gg: ASbGncunSav0MiOHI4cVfrrWYAtujyqXrynXMTWhWztWHeqBo1c7nl1CFFOpiJPzopY
	dUppPC5IeZVWNId9Wz3cE/SyHSRyj4dyBm5O4mhMCSzD4dhBCCFkcbvS/jMQCxLdo7HeHl/b9kV
	Fw0SBM9Jug9vzLWPUCrjs6B8s3I8cW8MYZKXJXuoi4hpOAL0il5z2vzM7O7lfpwhBs6Up8kIorE
	e0X/871DVwd0DTJZDnCZsDJjtGvPcZMUPXn++feqrwqM0tOmy/hoWZioGvOtGS++2fDvubZayri
	vITKyfv4eA+YQMscsLjONFSdf6/Kq2SxsDxf36ULauLLyhUxa45mgZ7lSvp9FkepSRdZyaqrFAV
	cfIYCZbRZkNnY8ezjbs1FAz+UF5mMLGRAplnYZrAKyOeDpDN+OeJA332uk8rld3VLOl0=
X-Received: by 2002:a05:622a:1353:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee313e7788mr19437531cf.1.1763458769324;
        Tue, 18 Nov 2025 01:39:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpkWYRcH6Ic3hvyodSbScOYYm2d46nVwKpRacD79DGZMCLmGeLtZKUSf4TUfGF5y/FZ3a/2A==
X-Received: by 2002:a05:622a:1353:b0:4ee:1eb0:fbd9 with SMTP id d75a77b69052e-4ee313e7788mr19437361cf.1.1763458768906;
        Tue, 18 Nov 2025 01:39:28 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdac50csm1305346366b.61.2025.11.18.01.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:39:28 -0800 (PST)
Message-ID: <1599d0fd-ad93-4b74-8954-37a754907741@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:39:25 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] clk: qcom: clk_mem_branch: add enable mask and
 invert flags
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-1-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KuAqVNgDGGZ4QjcIFh5WLPLhzO-texXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NiBTYWx0ZWRfX39BClD/pCt7f
 pJa6KNKI6N+w7fWctz6tNPqCjxYeSvOsZz+CZeWxUTMd1yn3u6/YBHhAAfCNhYYUZUEK9OpxMme
 cyXqopZcXhFb8LeW7H1aNctQcGTuH18fEUKnRMf3+xcg+Jx08354HcLJj8eaEFP5dEaocOx51r1
 36rRbhTqEVLc5oYQxjaC5zIJD78xjxTFeRVd7R4o3zcRhTxEMtP8+lSUU/yBikfAjCJLJoc8PIf
 mFQI74hrGj1I7r6LRC6Yah3f2jZiCdaMJvC50RtZV9X246FU6/W81+VhOaOWM7tftIDiJREkVQs
 OuGeURWY04eD2jPD0mGMtqoOr6yxbTNXlP8mKTaZ1jkvQBgW0efwVBFXTa15Y8oXuOX0aSK4wVo
 yeqDGpNxfc3gokYGifnSf0LYCXdLsw==
X-Proofpoint-ORIG-GUID: KuAqVNgDGGZ4QjcIFh5WLPLhzO-texXt
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691c3ed2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ryDgvqaYVM-mru2dUqoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180076

On 11/18/25 8:17 AM, Taniya Das wrote:
> Introduce mem_enable_mask and mem_enable_invert in clk_mem_branch to
> describe memory gating implementations that use a separate mask and/or
> inverted enable logic. This documents hardware behavior in data instead
> of code and will be used by upcoming platform descriptions.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
