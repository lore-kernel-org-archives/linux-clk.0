Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB22EF66E
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463199; cv=none; b=dmiuv8SsQ/2DRakXl7vN460qXmTDXZp9Cvh9hQnApDaGaNl5t7bncG55k1V0Wy1iTSo0PCFKJ550uqYMb2v/qmytsZnoFX/mcXZR1HXs3XNFGiURUCgBvBeYdumH5YR39FISeUxE4YoyxxpOW31luyZqIP1q0HdQyyBuLOzCqCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463199; c=relaxed/simple;
	bh=Je+uFR/gKcyEuTvfBH3qS0r6UZEWmtchEn4qD6chTo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2RePbBdzsyvL7HjlYkvQ4EQELfOpr9jknXpjz4wp48Ftl5LZmq2c0CimEK48hoD+Ptpj/iwBHSnyO86v7ZLOSO0I/bJjKfkNnCK3d+RGzlRKlp4L0T55v3wcQcQUizPh+t0c8fu7ghwpOY3rPBnrMelebA7tsSU19j3yvaI11g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n85jVYcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vc6l+VrE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n85jVYcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vc6l+VrE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIA9xDn027649
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QOEpZdLwr23M5PcSgMSAlSqAB08Ao7RTKoVOZt6jIUw=; b=n85jVYcWd3bjuvGN
	+yUTyiO/HBV5tP3sXXa4QKWGsuuB9fDNEiH0fPpG5r8fFwPY+2CdwklNLw2wGb9k
	NFwMrSb8ypmv5ABE96j2XocHFtfadhiTLIjhRDsujTFw1UB7g5dknCvrP60aIFAb
	tKqgOOo84t0J6KwLGOLV2FXJr/HukPfIdr8FOOocAAJ+EjrywD7gctRi7zuYuCUf
	ul1hFSyKRuBqMW+4pV9kGvnaeSsfiqrEyoIYFdv6lqt6GsNthFn4g3XheT29Wvkw
	CkNKUx4pG94TGI9o0Mrlj/56nOTLT5X/ry8ep51yWpGeiGiwvPK+twrWBqpPwhfY
	yYzsEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t2trx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:53:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34566e62f16so4231917a91.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763463196; x=1764067996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOEpZdLwr23M5PcSgMSAlSqAB08Ao7RTKoVOZt6jIUw=;
        b=Vc6l+VrEfHfTmXZNRrsxVmp4BlAJNfYsvRrDu508KcHa4GD6u8Zo/LezH2DUUMGhay
         w/dI+PKm2I5ZKOG9vvDicE61nUOEPciT5e3VSCs1aMIpcZafUFC9wr5+rGUsV5IoOkdf
         FOFVhAONMEusm+Ibac5CNw3f8una02t9J4eZD5RAWLmsi0q9yVJ2nwxiOzYv8+0wRUyB
         QdaycsNe6wu6M5mxArWV3LYufNJt5W9zPNi6clSvOkl1SFwwNyufeKy485gihH/HE9CC
         NoNM8t+aylL+eiC3YWIenCf/p8xoe7RyQPPsNM6U5+ZMlm4Vs9/woioDxwg0geUMbL8W
         697w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463196; x=1764067996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOEpZdLwr23M5PcSgMSAlSqAB08Ao7RTKoVOZt6jIUw=;
        b=a8qShHtk2GOs2FDwBE4lXJg76+a4aeigkh8N2J8MGg0dfR4FNNCXHMSa++pANnMAAB
         yQbKTvpWnQO+MHsYC8S2ImzEC19TbzKT5F6DL9g5e98rsAM2Snmkz25jL8hQZPtVT8P8
         p91S4eA6H6IgFTTbMYWEp05j09adcoAsGshkqarCp9AJ5n5YclOsqy/wmkpMMyQB64f6
         UKX0UuHeL+WpFZeJjsjTdzh6y0tHwd5llWwcheZi6CqGmpd05YHydp/LCFj1xEIHgxRx
         ACL/fpJ59dwtQ14+7jQIcEEc1p7A5j2Zk2fyC1zw/70VVTwofX6sx1cqAGvus8QZLox7
         yx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvcMV5yojyFzyQQlm7o+k2whjzYO+lf/zehKEp7WIM/52bFvO+Ct096y7PiR/8UOSAI+4L5ftuWF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxoT+2obQzDaHi0NmRCYIl0s6F5A1Mrh+OGLof2TAYd1gG0P7Q
	zFbofb8dEW5fSjahDkW3gJM6D7XtoeeKzuC9fLCRb4bo92pQTJ2+nNzw9hwEoL/G0EiKoOwbQPb
	GwtlHKaY76H0oXQXZtes4eQ6Mf4u6USDGHrGqixYxOFmKYFdDh7opIb2TF9p1MPw=
X-Gm-Gg: ASbGncv2MicN70HaUvaa3k44M/ksorXVr1q9Re0QhFSpA+0aa6aMUolCOrTqx75FZ3H
	nKySdSs54jjb9QNPdwiHBARB0qCa9ETop5w1KJYZQAe0amfLV7PQkIG7N0TB9iXBV9ok/bLdq3Y
	S/tUJe/uat/4wfagAZKqftFkn87y6zZKEKRxKjNL7PTSucU9lGgVQq20fmwXlvk+CyZuLNQZIKR
	7VaHmxzzkkU7kSiyrW37Q6rM7/zYMo0vnUZaP0HqjBT0ZsspvDfHxi6Y7nGifbpiWiRRB02CxbK
	WAJD9KADMp2WE3RRPV/4rnMHdHYSwY6bwhConEWLG0s3/4RVW6ce8j3fSLf/Y2+dyvvAbvSJTZR
	r6ZGhDcARvU3a9sI47IUiEHonhA==
X-Received: by 2002:a17:903:2350:b0:298:616b:b2d with SMTP id d9443c01a7336-2986a75275fmr169692135ad.51.1763463196416;
        Tue, 18 Nov 2025 02:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcvWmssKapPjaiv/k1PWZMgAUITJJJRwptMhWR/dTJczZEwt0nlVri40LH/mEvb1TLwTCuFg==
X-Received: by 2002:a17:903:2350:b0:298:616b:b2d with SMTP id d9443c01a7336-2986a75275fmr169691865ad.51.1763463195961;
        Tue, 18 Nov 2025 02:53:15 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d91sm171022975ad.63.2025.11.18.02.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:53:15 -0800 (PST)
Message-ID: <430d8ec2-9dc0-4bca-9f8b-294d273af302@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:23:09 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
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
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-5-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-5-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4NiBTYWx0ZWRfX3L2g0RGH4P9j
 OUJbC/TpYcLUJ3Y9qL16OAakDjhqXZ916kzGY/goKMSIEkGoH5wy5+0VE+/E3W7HQGj6M3AbH4l
 uxNyvPa5pnkgGVCssPmLYFuiHJTwpzzoqBW9JO2tksGxK3RGtjY0UU09HcH5lOeVBjIdNGIu+E2
 qoDyr4NGpaFcW2TgFQ9WYvdg6Bj7ntyuwsCy2/oCw/UkQxoE7YsRXuYn5W9yihE1dj/XIjtcckc
 9hocSMyUxx5z04nD7XTKVJMhZveZdL/JMmI52mmnPX/E5K6qWlIXPJrIqEOLmYhpoKF+Q6aZ38m
 2Y49h2SVU5ghPkCfd2kDAjLBj/o2UPRcECiHCl2zzYCdZGmkkkjg+yr9WLuhzy2KcscgeMIaDf7
 Zk8fObePe2ecHHrqkO74Axfw3b/rCQ==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c501d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: M7i3cMupRDfJAvJo5ZWzC1CrvEwTS1LC
X-Proofpoint-GUID: M7i3cMupRDfJAvJo5ZWzC1CrvEwTS1LC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180086



On 11/18/2025 12:47 PM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on SM8750 platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          |  11 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-sm8750.c | 463 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 475 insertions(+)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
