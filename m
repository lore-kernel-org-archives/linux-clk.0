Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D71A9B27
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735567103; cv=none; b=r6scnvBEohm3g/aEmxcrHXXB6GVgfAdwedtSsPfObPPu8+EbLuCoiJN0Dy1Ugq39VkkzliYPURjQVJxc9HAdnw3LnPHGIXmAxP5GVQaFpZtsXbgHhMMQ8qX+HQyY9glm1c2ABdjLBG19OH36t9lg8WhMuoq8RoE0lWjrSBfoYpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735567103; c=relaxed/simple;
	bh=PeuDHt6WcPomzSd1kduGTuYMkTKSLCaF1kT1zNFqK8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJ6dbZ6t15ayE5JyIzyBeF6gQgNV/jcFt0Decny9Ct0Dx2Ski7h7aDo4k4NVTjgQC+ijPKNoWvOD5snGwBjA96VGKOmJM/aFi6dDVNv+WAC2cgN2u6Z0OLjXuWNmassmzQ3s++ooOcBRAiJV4a8n8hsAM3hMSd/vU4ObiEcCHEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/13v46X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/13v46X"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU2jpWr026640
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 13:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CWKkDS4rL6iLIjRza4Fuki40YBqixFHV8VZY018esFk=; b=V/13v46Xf04FOtHw
	X3k/WrAAZOZ9Tc98vcfKplgm3dKruJHRpJYT+VMwQe8x/kTiA5/E2tcFQHZjTRRM
	lPcBqoRgPqU/et5IuEtnC0xK0o06n4jtSwMeo3PGOBUBxqKHIvE1lqcg8zz1x0HC
	bh7tZ7l7kxip9f/fq3oTAOvBD0wx6RKb1f6SptT+OJBD1ALsrc1zFGY6VjeJ4wXe
	LZT7HA2YxPIXxu8yFKKBh89cDEkjTHDGYuJyHjFg5k7DInAN5kqWpizvdBoq/YQd
	EQ5LJH1IZZ6MiDqAORrlQVPYvb1FR/Iw89lhhLwdDaH2YgpncCiWMd3txIZoStyS
	0c7lPA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uk121880-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 13:58:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467922cf961so30966541cf.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 05:58:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735567100; x=1736171900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWKkDS4rL6iLIjRza4Fuki40YBqixFHV8VZY018esFk=;
        b=VJcHkLpVwqgWwaYrZUG35DwPlfVzkNwUbMDitZCUEK50nk/N1R1A30/Sma6lkSQgsh
         dHD40bP7Jaaaevh7EJnv/tzhhZm975JwNKNspyDX2Z6ekiSNIJCO60AFTtOswKiOrFGG
         zMFq/JF0xWgeqX8TlMJ91d8USZs/I/F8xCqRIEhLtqqG9MNe7C3SJxEED1E/g6gWXqY2
         YeZPYtijHcYfnSpm3mRQZPq4K46Tdy61/cuZpUGoS664ymaSP52HRE/0AQx5J+farbkh
         AoQV/pgUmaBDGpuGbWrSvOQK1TtjUWHxrZDaKq0JKXFBErUGmhR36XMzxHAGjJpe4Mq+
         wG5g==
X-Forwarded-Encrypted: i=1; AJvYcCU1sNc5ymYNUY+ktNFJBJ5t4fatzFi04+5o1u/W1kKOQEoVU0c+FK/FSsA/jwsgbY9fdNCqvbSSzcA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+PeAV/XjaGeDj3mmSoolvzM6iaSj2xa7zHFpfx7SFjRiu9gsx
	5HP6FZqDEGXqHs7kcV2Zex+/GaZpGbhJotAHUu7xvVjOkNY42P3E7D5ucRFuxT9JWpkg1WaQ8XF
	j0WG7EzCruY2YYl0dJJSrVlplCrKm+B+x/JAQgDDdcg+Hv1HN/SSbFADGfEQ=
X-Gm-Gg: ASbGncsnCbwhuHBhJgZWhX8z/cxDUelZvrS7u4jzUUnvAdnKf4r3z96mMRjKti6tFsK
	A4Rdr7EJGF2+ic89ELbwZVIuhqpiflQDhz6QWUj2cQ0mgxBBl8bMom6Yg/aaAmNOLZOQLafrGLt
	AL6kiJxgixIRRtxC6dFkk6ZJXCICMhKzaBrzEbbguH0PhVVZ7MQRQKbOS2ETY7qDLsACozLi+h0
	zWwjqD0f5UWtsgXe999YJCpcHvzy5WMCKQAGAiToFHNdj2UxaPYDIfedIuTAbZkkzgU/5FwpIBT
	z9/Qp2Ci+HKLfgTYyT8UbiuNf+kHiQD9qXk=
X-Received: by 2002:a05:622a:5d0:b0:467:6b59:42e with SMTP id d75a77b69052e-46a4a8efb50mr244987311cf.7.1735567099785;
        Mon, 30 Dec 2024 05:58:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7uS/Qtj7X7ktl4p9ibnbawCELVofusbTIDAqUnCjvZkfb64VxafvNGVvkkrFA/FIpSAXeqw==
X-Received: by 2002:a05:622a:5d0:b0:467:6b59:42e with SMTP id d75a77b69052e-46a4a8efb50mr244987051cf.7.1735567099386;
        Mon, 30 Dec 2024 05:58:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4e1sm15216164a12.70.2024.12.30.05.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:58:18 -0800 (PST)
Message-ID: <fbf019aa-e8f9-4169-9543-f85d2a17ce7f@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 14:58:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add SPI4 support for IPQ5424
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <e673dbdf-9b16-4c64-a3e0-cf5bb31e2b82@quicinc.com>
 <d4875732-ec24-4e35-9a7b-af05c6ee7d4b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4875732-ec24-4e35-9a7b-af05c6ee7d4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CdcwwJ3f8fps1F8GsSNQcSMMOm-byCFp
X-Proofpoint-GUID: CdcwwJ3f8fps1F8GsSNQcSMMOm-byCFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 mlxlogscore=875
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300121

On 30.12.2024 2:54 PM, Konrad Dybcio wrote:
> On 30.12.2024 7:51 AM, Kathiravan Thirumoorthy wrote:
>>
>>
>> On 12/27/2024 12:54 PM, Manikanta Mylavarapu wrote:
>>> Add SPI4 node to the IPQ5424 device tree and update the relevant
>>> bindings, GPIO pin mappings accordingly.
>>>
>>> Changes in V3:
>>>     - Rename SPI0 to SPI4 because SPI protocol runs on serial engine 4
>>
>> Do we really need to do this? If so, it will not align with the HW documentation and will lead to the confusion down the line. IMHO, we should stick with the convention followed in the HW documentation.
> 
> +1, the clocks are called SPI0/SPI1 internally

Ok, I looked at a bit more documentation and it looks like
somebody just had fun naming things..

SPI0 is on SE4 and SPI1 is on something else, with no more
clock provisions for that protocol.. Which is not usually the
case.

Let's just go with what you guys use internally, as this is
mighty spaghetti

Konrad
