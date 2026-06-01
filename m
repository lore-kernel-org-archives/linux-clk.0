Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AB323E35F
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 03:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780282889; cv=none; b=XBxrJg60Ayx7UlOHrdHPbfCDEQ2W9UnJNn/gb8ZZNcV8jKTVXxIvQkBdyN5L7nSIlobbVlnQljHow3I81PN2NzVeCuwCEj5x81gH7RfdO9j9uG0QIkYmJvyvPRCf7mzUF/Zc0xEJtGVdluEZi/BZS3fbWSzDK+NWni4iRZEjQIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780282889; c=relaxed/simple;
	bh=V43roggDeue7KGYIxDOJm5DBfzT8v9TGwjS0aX/8l8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQc/TQ/hD6dsdKOXfz2gY5jK6soO/NZ3/7ZJMNsD9nPbgBvqDRzfjjx4sjT9xsvM55IBCkMAR7Tj7JapDL4g4vjjsszPglS7EammPN7Lkd2oGq8q3WoDA1mFnpoTJ9vvwdZvI+StaP/JxWlLOQlmtjuYEK76cH920mw4kiPD5/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eiv0R4Xf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1m1/WHq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eiv0R4Xf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1m1/WHq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VNP21k1369409
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 03:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP43wrZkySat33onj8AR4kzar6kKVaip+fGpyAmVilw=; b=Eiv0R4XfCjL2/s+u
	sCliQ+wCJIF51CIwJ7+eD+JsmjOR11IEpy2lpSU65GfRo8Mh2UI4W9zWpNy0xkOm
	OSB1ttB2d0uKtJf3G32tdV2aSqzu1AYlz5vF6X2i1ix+6cFpmemObcZg79V4fHFN
	1dcRu0bS+NB3KsiSIjqJ7ksvIKLeMoQ3Fl+nIwOXy+ZYgDpZa3l9Dml5ttvdtgVd
	D5P04boDeWl6hsSUTrXFBWejYrjX3WicswND/jyYTIH4pm3oRL2k5t+z1wDINmw7
	iX1QWM38cC18KED/Jwtw0xkVvfiiEswkP3+7v646bXiFCyyNdePBm2aZaLVFeFUB
	XEHgfw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux54w1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 03:01:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so1957063a91.0
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 20:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780282887; x=1780887687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uP43wrZkySat33onj8AR4kzar6kKVaip+fGpyAmVilw=;
        b=O1m1/WHqnsR/8MTBCJ5k1+4321MjwCIgIb+xfFm0lU9M/Dn2KudMo3FVa59BXhFA+L
         Ix/XKXJZ41kwPPp1DiHjWGrTlc2PY78hPTaxk+BDUOLte434zIM3hti4b3KsO22DvLsl
         ATFJZ6c9mhpmrjvQY93hsZ/Z4AC7ctYnt4QJ3hd4UDdGAAhmsAAgkdJ/+DOqGUrV3oAP
         NNy3kQn6kHNtbIocyRozNvthRA+xrynb0AOc6xIrLujEffPVMjou28tNDWvuaxDKBhHE
         j3L0uvKp3RNZ9kDZ8vpElaYdLrtAtww2roGNbHpJw1wSE8/FhKO636oUTcpywjgiLf7y
         p8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780282887; x=1780887687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uP43wrZkySat33onj8AR4kzar6kKVaip+fGpyAmVilw=;
        b=VrnR/cXFUFgZnYPSqA8XL4UtKivR/qw7OIcGq+85y7jCKD5VEYcNohPXiwZLAJl942
         1VqdNnbX0wIWVI3j+/R2sJ2iYidpdX4edbQNLVumi98IhZwNb00RdoM663sGnRuQ0qZH
         y5A4Lm7OsbUv1IciXisyoNLYfmb9Lw8s3lmR6Au6CrsqNsxrvTbd84ZZebUAHyWFTiVX
         a8zmOeWwj+TcwogEk7EQHmKAGdw8Q9k7fN9njnnHSNeBafp2KnKiDpjjIzqzSRKdLkH3
         4TdjB9a/QN0RXvtsOv+Jgrt+98GsF93ieheFYBK/Rf+DDLUyGyD5bW/9XknckjJ82lE+
         oQtA==
X-Forwarded-Encrypted: i=1; AFNElJ9DCOGbQ05MRfzEfpCFv/CTFLTtZxW/eEStujm8J0ULwUazvKt2A1pFlvzMP3dAd5uu9WtxhFmdIxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIB3s7OthSeTFVByVgp93Vn2Aa9B23g+i3+4qPt+DLWYF7/DzX
	3gUbNvyf0aIM0XEJd58bm/jIgj6TVaL3aLaW+a+q3OoWAuCPpEMZoIpZWqVCgYYD7y/GrBHSkJq
	8EOM2o7VGOLPJWWHMzGq01T77nDRBlrORV69Wl+8bSUnicXbF01krtKmADwq3UFM=
X-Gm-Gg: Acq92OGIlgpW9DmHFZ/MLh8TMt9jUm62U+nwuI9YmxOWGF8b3KHs1Wq8Xew+34OptdN
	ZlKmRZLhpUZe0IsZvC1Bk6rnZmjz5emWl+d5hfLN+PC1bDs2HD/fuADVEcVkcwkWYX2UZNJlZmX
	WipJPjz9c9gkBxIdIBx22zbJcnQa/0P9ERKmAtI9dV9w9alrKKKiLL6zgv+/RonbcGuVMMx2UWb
	BCQB7gugx2q2MEfTTfpusVtUxg6+RWSjXZmFAIoCPxX5yvnDTG4+5VicDq1KuuAuGBA/JDpQoWd
	MITK8/gaLNm9e0tBKj60UQC3qQKVqontkS4Oq0KIgM/0lhaRH+Cn27gkBDizm13hbQhzL+GJMl0
	45YFGo46n8z4qxM2Zer7cGm6BJ3WDP1k1mpb9S/VdxU3Qd33ps63Y4DODNr4=
X-Received: by 2002:a17:90b:5292:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36c2eb8be57mr9526853a91.0.1780282886603;
        Sun, 31 May 2026 20:01:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5292:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36c2eb8be57mr9526823a91.0.1780282886129;
        Sun, 31 May 2026 20:01:26 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02b8b57sm9545856a91.7.2026.05.31.20.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:01:25 -0700 (PDT)
Message-ID: <16d030b5-5e37-44a3-b879-e016655705fb@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 08:30:50 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add the definition for the
 USB3 DP PHY reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-1-6d9e7fee2998@oss.qualcomm.com>
 <20260530-venomous-ultra-sidewinder-42bccc@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260530-venomous-ultra-sidewinder-42bccc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XZfOpTX262dG7dpcCNfdYDqb-dGmxa5G
X-Proofpoint-ORIG-GUID: XZfOpTX262dG7dpcCNfdYDqb-dGmxa5G
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1cf607 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ywhEO0bdmV-DYKbozKoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAyOCBTYWx0ZWRfXyM8xKcupggxy
 s4cGmeF3fNQOlGYOoCV0bQUvGWJhUyWTPxp5fcpxd7uQIkkikm6+g9USKzeDN18ycoK+je9Y4ih
 BbfA2P7hrmNaijvrS80nWKLYuaRAYAcVBn3NLzmdRmExapUqw2oqysNR2PW4jHtgg+inNa+Nbd5
 0541BmQ1eFX2P+OX8+EOVu0EgRnTFPsl/YrOv/A61wsIvV6HRqV8+3zEz9N9za+UTxh7ejcNL9b
 z6UcIT3pxzTyBAP0jT+YHB2R+L2jSZov2w6zI5X2JY7DwIRiRAqYy3pm+K0UJJly57fsBlyoBas
 zqvnEXtO4WH33+QJaE5cv8hnPAPwhwk0SKjmg+aukoj2djWw/4eggHP0GtabpIdAqoDF8TAFEUO
 r+pks0jrPtyU5HcewLgl2vFljlsgu6HtFr+yqzROzLiG+2VxfGurKl8z5ktg50G/57nK2Mkmz3G
 lZHl9DrWq1+AWf2NjrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010028



On 30-05-2026 04:59 pm, Krzysztof Kozlowski wrote:
> On Tue, May 26, 2026 at 06:24:44PM +0530, Imran Shaik wrote:
>> Provide the GCC USB3 DP PHY reset definition in dt-bindings for the
>> Qualcomm Shikra SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
> 
> So just squash into the dependency.
> 

Sure, will squash these changes into the GCC series.

Thanks,
Imran

> Best regards,
> Krzysztof
> 

