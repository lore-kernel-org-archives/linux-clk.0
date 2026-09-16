Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740074CCDD8
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561656; cv=none; b=YBTbuvefwZMJ3Z81SaWzZnj9ung6Aav0jJwMreyXdh5K0Sveunq2mZ8VZ2hlAzXWBcSTp6mOfZW6vbxrkqQPL+jOcNjyEpQKRg5pdyvm+z2APkBfYdtX1TNmEgTbrIucqYqSP0Sp7uow1LJGq9M6bLRVzn/p9G4ncyWBgdtiWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561656; c=relaxed/simple;
	bh=ZEcUcshear5LPgt8z8TEQgEtqWzLXrp6HEezPRLIBuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1WYfdnxQxCwAlszppHSvBmHVQ6TIO9xgewmtJhqwlMylrk0hlexDsLOYhH8gYc4B6mnmbSDQCG4Rf2s8qIg2fhW4emeouy8eowt1AvuI/D6OhLO+XG3Z+o4CobbaaBRmlvE6CT9KRnCWQyYdahh2QGJZxfY0Hn5a18gQrIa5j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZ/TR7gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPd8cpRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZ/TR7gl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPd8cpRH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G939QO2658217
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 12:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0jia/Qee46Ll8brkm8aJP8twbg4qWS9nR+j1ou7EFs=; b=RZ/TR7gl3V8/2b4K
	B89G+uiqpZFq3UIORmHAX33uLUsXXjjVni6syzLCOBk287w6Q+tivWOz4QyBNmIp
	YkR+LmDrN9DibPMb77FNxalS/7ixBu20i+RRyb/CHu7S0tTq1q0Zk5AW20qMEsTE
	WdVBXqrHN+5qi7MDOh1wl3/vLoqG6o9GnV3q9svVMkViNtS07OQplK2magHrdsGZ
	OpJlFEx5w/0VTqbEDaMe2pFWaCXD+7Ms3lNogxWO3nPE1KkN3EOwSICbUPU7zYHu
	wdpXGXzpcvXFyaRQCCLDDZEcPOSZDWaopqy8r9Gj7NX3XlakRIYhxT5FR4ub0lPB
	MJDgdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujsq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 12:27:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so97973485a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789561648; x=1790166448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0jia/Qee46Ll8brkm8aJP8twbg4qWS9nR+j1ou7EFs=;
        b=fPd8cpRHvQndCsX8ORekkMFZGhvBYuCVn2SwFSWjivVEPaDF6hulVoLKYvoP6v110A
         fu6u6lInskMKjzkxdu7KpvczrKGwpVxepTLuA8weunxkgI8IuhnkS4RMot4fY2L5TfP9
         OQwy+8RjA53X3IzUBEd1jAwpL6x866Nfw5xNmxz43nGVCnIfgrExXdrxs1UHCHoQCydG
         LABDtdclW522TQEmDN2m7/CEZ3jquvayqHvYKXL7u67JjYp4i85Jqa6Kx/fwIekKLbsL
         nePsEPtLKYh7tmCmhdlCOEvZHMrZpCskJnWUfD8OryizrxtcYU+CwGwMs6S9I2zHqlFK
         K2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561648; x=1790166448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0jia/Qee46Ll8brkm8aJP8twbg4qWS9nR+j1ou7EFs=;
        b=XO+NI0yV8jBvZ5p4s7x2lzBcmLnxesXzmj1xsTSB8Tit4LppKrIjFoMUwuq+jhKDna
         MyOEMvul5p9da+/1VNnju67yNimdtrRJzP8QfpF9nvfhbNzWUuHBWKQ2qT0IQdSqtq8Z
         M8oOqDWzBB18BFobUWhAbfpzeHTr5eR5Gy5G6kDbaZofvNmI6zmvMqgaIwz/DkoL7Dft
         v24uQqRPUah8wYGZj5t8DyKb7MFPFCsS77Q7eUoWxBy4ulbA4jorem5vJUFkalroc275
         61KuTV1JipomNCnWfwYG9iC96sfXyixx/JxlhLV4Whjksj419oRg73SS0vvMn4qhxHtE
         ec/A==
X-Forwarded-Encrypted: i=1; AKwUvBxixyE5QHfviLLdZP7tJPdKxZ3Gbh1INu8YQoZrwT3nX1Qf87UGQRlQZ/1ORr0UKGaz/ZnxvBlSVLg=@vger.kernel.org
X-Gm-Message-State: AFuF++nrfhjIISWkkrvtydFYaH8ytylkhDIg3Lq5C2Ok4//1SkHh6xIt
	0aXZKY7Bi9RzeA8rUh8FKoOcAd+LxHx4aPMmCRcxEhbhRXIxjnx302vMrLp9HPKGwgjghItCAr3
	9RXZnKLL5vy1wu7DiTXDBfkugarcc1rzzl1667g9x15nhDrNkGpy9TUeD2dC+y+4=
X-Gm-Gg: AYBFou1lNGwCcMTIA/Frk6zA1AQUBu1HT+y3YKt/QbwUHYuwkSHsyerBBEqtE+ohCZY
	3rhr2fdKtwuXudSjUyrEtXA8K55H6+UdOFOheel5pZVjpBDcs/Opd1qBvXya30io0pi1lCSGqRc
	NnDGmGA+F8jBoYUu/VV59MnbcjenuQt8NiidpHcIVyzB7lAFIbekWUMQZG1JCkK2vN19bTmkngS
	6LKAM7ZQP1FVWHnj0q2/JWhBTYqAyN6F/n+4zFC/JbvzGY2nnf70MZ603sCPlyiHKci6+PYfBF1
	6DSjgBAOqA3frlq3r5rp9Jn+rglSVmh7h7jEctjGnz3paen1SOvrIUM3RvfEslNJMSVX32G5JUA
	hgMzTxQSWxe8MqV/6z0sSNA==
X-Received: by 2002:a05:620a:25c6:b0:939:48e9:51a1 with SMTP id af79cd13be357-93bb7738f0dmr300220785a.2.1789561647716;
        Wed, 16 Sep 2026 05:27:27 -0700 (PDT)
X-Received: by 2002:a05:620a:25c6:b0:939:48e9:51a1 with SMTP id af79cd13be357-93bb7738f0dmr300217285a.2.1789561647302;
        Wed, 16 Sep 2026 05:27:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de082ac7sm124957166b.7.2026.09.16.05.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:27:26 -0700 (PDT)
Message-ID: <260ee81a-e900-4f84-a757-04747f990e21@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:27:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2NSBTYWx0ZWRfX7bLH6C2KkbP2
 cnMKPm8SEW0KMC4gtRkupQCx1Say998phdAadR1iIBnkAFsU4GlKwiEv15Lqt/PtzlQpFnKS2uB
 i9wkOvr9VLs8bxizSwtrfLtZVGTe8w4Gah4V4LdVGSpj5bEReiDoTSs1Jj3ftIblA+JPVfZxDpr
 DteCsFKaI59uQA/XbMLCO0XMAPLc0VhUucAZXV1BosF4wVZW+Rl/GEAhxeBNfsMnt+1ZghLSzWm
 +PPp5lE3SaBqNDColHkUonrO64fQwAF5qpxaG4JbMPuEIMoI5YlEJSqnIPO9YmMYPzhKyP2l5Mi
 UeVCCixl1zafjRwLTvwLBfJw0POyrjvGIjB3Ppxu/ZEmzUEq0r0UpZ7NqWI+KzdnQaPgC8kQK5X
 KVSwZHw1LU40yi5S5is5ryPNbxhvdMksAKe7bkncBOneoU/Wuy0O+nmWTlCvrRsmL7Zqn+PFf3I
 0xvPB27L9lJSg2Dypyw==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa8b30 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0ETrVkJFHnd_pK7WGEcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2NSBTYWx0ZWRfX2f/M9avor3k2
 sLb+Ez/sANIdN1uTMDXi6GzdY3d+83d720T6P5ADoZh6mRRWIdaGYVKQFoufEpVB2ucrrLV8pGC
 0xgczTzprX9I+0ZiM2wcR5JujPXO8w4=
X-Proofpoint-GUID: GMW3828Q7AMfXfCUz8d-K0XuKykIVlHj
X-Proofpoint-ORIG-GUID: GMW3828Q7AMfXfCUz8d-K0XuKykIVlHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160165

On 9/16/26 12:01 PM, Abel Vesa wrote:
> According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
> Drop the extra zero, otherwise we land outside of regmap range.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
