Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5299D3E8C46
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696063; cv=none; b=PsPDLnNBuToUTYUNN0D9Gfm+slP199A5jWvt9J0jW/klp7vNjyYn4rodtwJWAJLnW48/YmXrVLovG8jGHHqGWstQefno031pqjTxVeyoXBVfBdfO6+MChnxVlIqyr6e/TgKcOsO06TRswtSqUyuEZUz5yN4QkUup7HiCyRXEPVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696063; c=relaxed/simple;
	bh=ZL6NzegjaQYk/nqnKbONUU0+tW/kHrBfXeGyEtWiwpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y55VjyNmJ+ZSxRbbl3f9qC5XU70kyw2Os4RUn9e1VlbPKWIrnzyIm55pDfuJJxurfu0nqKqctbP+sjYH4dZC2xId7JCyUkt2mg9XvHLItCEi9HFxUz7UvlMbSIoDIlrUJUuQVaVz8Wpe+PONFMT7+dl0YK7ZKTCs8DyPbyVErKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8XAmmUX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaqSLzKx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8XAmmUX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaqSLzKx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Ug1F1654590
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3fJNaZNbVpx61MjZen3xJ80Xr0pmnhphRl4LG/r1wo=; b=c8XAmmUXUgoaaBnw
	c3a7aAggN+cpEBW4RLlN36Yc245I46wDmKLeBy1I7yIiOARyT8OU7fUpMBSWH+PA
	odXVxuHY3BuJU0fn7eU9/ciMFTRIruBEa6RMUQWLPGpEBgs06Ann6MrL9wyjrcO8
	uec2HQkxuaN+SXG+2yBxKoL4UE8A7uYL+oNwMqkvceO34oPFdclur0D47TIgtlz3
	UYx1uS1wll+w6nPmlPr9Ac9A9+YsoEOmV5peFpaxpCZUSNOlCmgXXSJGOD2I43PQ
	mXc+F8JuuRklniUJSWkKN3XuIZ7hikhN2bUphSY2ro9zAQ6BG/O3DpSdajkFiT3V
	ZmwNsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2u1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 11:34:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-917fd2bafdbso97231785a.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781696060; x=1782300860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3fJNaZNbVpx61MjZen3xJ80Xr0pmnhphRl4LG/r1wo=;
        b=OaqSLzKxeuZofLWj2+n3Dbagtv4LsKQZ8HlZfUgpa3fJ+vCMVzvpAcPawPrVXFqneB
         oyKvPNyTu0tjvLfFKO5DIr0CZ4o92dKSgyKe/5I7w17epNiHoUxB3PT+QlkThXZpsRT0
         /nYNoWJ1hpoPMK1mKPrHGbGGI0MBzvHsTAtB5okMdF6tYLfrs3bSQiq69oE7/UHoAM2U
         kzNaVjXSgBFk99wMsUEYv3KEl9mGP97INvxJAZS6eP0+xhj6xD4Ncn3yLsBNE1LPn0QO
         Lo26y82rMnxc3F38J1VQgkuilYMaF73sXmdedxJ/0CTAcdIwKVpCyK5Uuhc7c0WVXgwM
         lGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696060; x=1782300860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3fJNaZNbVpx61MjZen3xJ80Xr0pmnhphRl4LG/r1wo=;
        b=sjYk0dokRwiPWzo3ASCYwzJ99RA00EwR033n+6aJa4lOmA7qtK2izb9ovlAj0hZR1r
         Ly63ZpQRzejDKmGgjsVq8fXBllkZvAXoxkWQYwMMYrRw2ORacoX0eO7z/QUIrRhjthCj
         zu/VImWkelNsFfLYqgAKcxldZX6v1E3W8KTK5UDVxl1+1wNnAGutsHMoMP8hpoSd0E7k
         OpLYcLGLw8hwgRefp1SIPQoZUEC/zcupGX6/tjIA9bvfNnpccOHBJwoZQv3dI7oDg5Ra
         dLl3PcmnpK8Q5KoHky0Gw5saAs+wuyvercxIsEif+KFfw1bUxXhRTEmT8wNM590fNWBh
         7Z9A==
X-Forwarded-Encrypted: i=1; AFNElJ9ditTIr3WATDk6sdYN4TfaxnNHytgVbDlUEZIJ290OX6pnsTGz/uCNJU/fy50OcmcL08b1RmuSni4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkN7A9oPgxTeXdWt17W5ybnfxV7dApupsgU/c2+0DcAY77D1hR
	zIGn9+8jpORbur3YMjEkXvMjTGMzk0ucg/bm+sqyaf5c/FI4+luknLYLmvwy+BLOh/ehlX32PsS
	RHmnb47oIo/rZCgErxKeRrpBwTJe6UBQ/2r21KhBHw/22euZW023YC4By0hmiHGQ=
X-Gm-Gg: Acq92OG7m4wGm1jDJYbWoXQE5bfMIBKOQP8txAuXbhNh8czh+daoNaaSv8bzWRzw2Db
	HSDfPb3/qmBHl/fKSPn8U7poKUgkcgJ7kVsdpE8g8KpCaJrqBc7S7e2r7TELaBA84OhsvoDLfYU
	aYxujdl2OjVJ52S3oWUiWc7ufwM5vEPLzUgVIKYbtBUSDSAhRj83YBMa0C21QQjigdqjfWoLILs
	zd/qVexaFy0ChzKUScjHyJ3mIZv6Y+/EaWzoyPXKOPMvOp2PubJ1GkavgKbRPi7WHYICWtL3H5R
	dHe23AIoOExnA8X/5eNFUETvNiZsctlkk/D5RsWAO6t6Dmsvrn1dzDZy1AB6tUx14SZhghaoCUC
	Ra9DwBv+bceYb5E2PNeDC6BiAwPTy9kWJ1y8=
X-Received: by 2002:a05:620a:4155:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91d85442f5amr358102785a.0.1781696059659;
        Wed, 17 Jun 2026 04:34:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4155:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91d85442f5amr358098585a.0.1781696059108;
        Wed, 17 Jun 2026 04:34:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dc48sm803810966b.36.2026.06.17.04.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:34:18 -0700 (PDT)
Message-ID: <3f850fc1-f116-4799-a489-444703314a65@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 13:34:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add EVA clock controller driver for
 Glymur SoC
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
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
 <20260617-evacc_glymur-v2-3-905108dacaaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-3-905108dacaaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4df7kv1HUk0B4WvUuu1B-HECMZnDomHC
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a32863c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KhKKGY6azsjSgFTL2HwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4df7kv1HUk0B4WvUuu1B-HECMZnDomHC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfX66J4g89CKj0g
 yBXCzDUw2s19PXsWz59hSu/HfpjEvZUCkHioT1+Q0SpwMBvfsP1mQfOtISPY2j6MkaH63YQJ8a6
 RqquWUMiQXNL7JoBoJqe+SmhttO2Mow=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfX5RiDESVAmNyS
 98xQd6fsFdau+4l9z4fjWnS8hGPBuf665zcO3MOMbLxddRkhbkGWHhAkpjnybeGdaxEVJ+v36Ts
 G1MaYkzVepf67cL1/84EEAAcq8J19mFLJVPnVF9JrB2A/2+pUh9ftHQIs8DVmKo3iomg0MrzqPW
 LxSZB7fKNLFReT0zWQCsfOtoflUMQJoYXhbb0A1oMHxARlgPfjwsnpKnfwyhQjTSS5mmuQjfh0K
 TbORoTOFtAmAv1TR2xqdIxZiihlBwk3D16gVbJLDs6Ew70Yt38ztj4E3kplLI+kSb+Bjfzlhilq
 rMFy3GjbLpE5VgjXM0X3lnwnIwVWGBl9mWNo5082zcY4seO6p7WSetzYdYc+2C22v4FZFaZAGw0
 OoTUGqh4Ub6Xshms74Bh8k+7rwnd4ggaIgxtivCz8WtuvzgKp/+ub0bJeuv4xhbYG23Klm7wkOa
 CgdRLPUf895l/eCOFhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170110

On 6/17/26 1:07 PM, Taniya Das wrote:
> Add the Enhanced Video Analytics (EVA) clock controller driver for
> the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
> and resets for the EVA subsystem which handles vision processing
> workloads.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
