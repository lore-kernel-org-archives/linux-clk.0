Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8DB2765E1
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668436; cv=none; b=UFbRdRkm1+68Ir60riLl6HoB4CyHpmn6zO1iNG5IUbEc2AYfhvrj/B+Z/sKn0zPiDsnoCfv3QKD1C/Bff4z7+Ko4QYXuKVwbLckv+6BhEJePIkCdE63AGIAHy/jVpF3NbiRh3mgWRWTTb59k25cZ9uZfKdF83vDgTO7ocpr4KYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668436; c=relaxed/simple;
	bh=ldXbC9SMsBCqpgzVecPRyoZxT3Gxq+D1+RjXF/SLglI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jr2Gro+pXi2E5a0QBh3RDW8qOxbgMc8vXM/7UsdYE1QKY2P1ff3yo+Xv52zGTeCH/tLAaRa/teuTysUPcHsnlgn/G7XaloCfOMTzWGhqLJm1Z2GtBKBSbdM1CFNm531rDavl2lU+DeJgvSJ5mkdZnjHuz6x58q3xbVoKRxUHME8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyh4kkX1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyh4kkX1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C71okR025747
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 09:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l03jg7XbVLsjzyUA/wauJ2yxOhp32HR/FKDFzMmGCMQ=; b=dyh4kkX10GImy1g6
	qT///8wU68rLVT4rOhh37myDhMV0hftZLPbqNVX6jVm/STd0UKQzgqM6XnxzyahL
	dKFfjZ8KUSyV7ksNl1tA43kyxAV+NVB+gXC3RgsGtynm9i/7FX1Y7FFjx7sOuBEL
	KQ6OkwtUL9cBmFqEVgmiqDLEvIDP497JHCkeS9r9ljkwyYvm7wqTdu8u82kabmFd
	DEBCqOLnulI1grv0eP1D98lo5rxDXRnIhsB9FVgXf21THLJudu9j6sUJUGAfY/XW
	NOJn0jBiwYlJfeY+/wpd5n23tb2qxgBdPo9uanhHLe3z1yOtkNsjU2wbMIqVr2g4
	T3v12A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj12wuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 09:13:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72d3778ba04so5369286d6.3
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 02:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668433; x=1758273233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l03jg7XbVLsjzyUA/wauJ2yxOhp32HR/FKDFzMmGCMQ=;
        b=tWCcaC8gt/idEl1/h0mLaSxO8zBJD7+eWiaDE0j7FoCGiR8O2mSPUhElIGwy45iuOZ
         Z4iD17RbFDOofh8MFcE7bgiNh2DcyJnl7IWCFZATbfINfzpNOVaIodnCP/toRyrnJA7I
         +rHUZDzsy5XSwgeMnb75wkGV6hM837m8XSNz4L+UyIQRt59bGFcODTFpJx/BgufOvQD0
         S8Gk3rpxyK9loTK+6bUDsVodBC7TIIj+keFdiYQk0nKOnG8lHp1HeQ1yBbHtulfaZmsT
         a9eD1DxvfOej9qiXMmHHJUb7AJvyT3cKNWMwDAOazRP4gToRnYI4MH9sqmubToyHq598
         fwWg==
X-Forwarded-Encrypted: i=1; AJvYcCUqzJPHQCgzDP47OEsCsEfBZkLcIyFNvQQjRMyNFutPtCD0fsSTBh5O2ngEg9sEo6YtBVft7GuYG28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYiGsGslSZTRdQEW0JmR7Vd/g/EOSOkF0LjjJ3iofmPlzk7Rm1
	p7rr2u+XFW6k5yVMaiwETBz+WuxFeefJq9cCpZnsL5jpityJy/4Pd9rOn04NruPCIEX8+O8Vgg9
	98NVhgJPOT0SnZvSis/QumEPp/F9rtwqUXIfjfp2HTAEOIiRYuUoLty/4Nu3wOm0=
X-Gm-Gg: ASbGnct4hFxRsDWqy20FVn7zzn7QzwR6n795IFzyBHSosgroO6MPyU8qF9u9hjdrWey
	qE/YypZ+mMM4oZ1A0UAsWMDTpUVxwTq4FdDOAQ3KvFX4B+tyyBBjFVF9XhihSyPAgj6kapqTbKV
	B4dsUOt8cH1E0VQ/9EB3JpnWA0sehZk1uvPWiAYOPPJlyUntFU1kGspQdFC3Nt4IdsMQFALorO5
	4a+II5BXyFc1/zYgZ/szmJYn6kGbY+1pXCN1sf0UNF31/XAJaWLkXQm+mm/VOmhd/3JpogROMpa
	E7fbrm5e/2G2GnF6EGT8P/FTxkLKCVDoeaCWqlwfxwTHD0NE4paEp0JvVnbm6BSF6QrxORTSgz9
	n1eR1sSakm8Mb2Kq88Gn/Gg==
X-Received: by 2002:a05:622a:491:b0:4b4:8e4d:6671 with SMTP id d75a77b69052e-4b77d08479cmr19486091cf.13.1757668433169;
        Fri, 12 Sep 2025 02:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV8TvRgejfYIcKWS4JnF+RVS5QxXiaupLov7itJ0nYjCvvDQfhH2p7vyIIoxHj+cjEPYJlEw==
X-Received: by 2002:a05:622a:491:b0:4b4:8e4d:6671 with SMTP id d75a77b69052e-4b77d08479cmr19485701cf.13.1757668432570;
        Fri, 12 Sep 2025 02:13:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm332163866b.102.2025.09.12.02.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:13:52 -0700 (PDT)
Message-ID: <2951b362-c3c1-4608-8534-4d25b089f927@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 11:13:47 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add required
 "interconnect-cells" property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
 <20250909-qcom_ipq5424_nsscc-v5-2-332c49a8512b@quicinc.com>
 <20250912-nocturnal-horse-of-acumen-5b2cbd@kuoka>
 <b7487ab1-1abd-40ca-8392-fdf63fddaafc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b7487ab1-1abd-40ca-8392-fdf63fddaafc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MsYTnuxq-7v_DowG3cGSV3OD0tPNS9eV
X-Proofpoint-GUID: MsYTnuxq-7v_DowG3cGSV3OD0tPNS9eV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX/CNKEhdun1g8
 96ZwtmEc+CA5zbbPX2wsI2Kd5su2rOBbfnW26GA/rXLzbQA23C1GKiJOI3fN91ZjKkrSKSLXnXW
 I2woBsf75f4deZUAW07MeylaeBsl7lW8P8IM50I8kms0qwyxIe6RDY6CTUNlQBxyZNlyK38kGWP
 QQUoldhDsX1CiEMWnjGgnMhR1WUiCqG9VXBMrLvFGRfjKhRDb8k0cJFAhHpeAcL3FUJykff9wVb
 he9Yb/CsFTSUAjUBFDUJnCnflWysUYATaKkgUm1JqdlXj5qKeRe63B7Bms1ZM2GcUJKcwO9BfTh
 jxZx+hykz7gEJg+tDzsmWRjAvQynPcHLFAZYd7ApsEekU3GLES/yLyVDqpsVwRvwKbd61MH0u3F
 9g9C2WB7
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c3e452 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vpsw6NEknGMoy4p6atIA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On 9/12/25 11:13 AM, Konrad Dybcio wrote:
> On 9/12/25 9:04 AM, Krzysztof Kozlowski wrote:
>> On Tue, Sep 09, 2025 at 09:39:11PM +0800, Luo Jie wrote:
>>> The Networking Subsystem (NSS) clock controller acts as both a clock
>>> provider and an interconnect provider. The #interconnect-cells property
>>> is mandatory in the Device Tree Source (DTS) to ensure that client
>>> drivers, such as the PPE driver, can correctly acquire ICC clocks from
>>> the NSS ICC provider.
>>>
>>> Although this property is already present in the NSS CC node of the DTS
>>> for CMN PLL for IPQ9574 SoC which is currently supported, it was previously
>>> omitted from the list of required properties in the bindings documentation.
>>> Adding this as a required property is not expected to break the ABI for
>>> currently supported SoC.
>>>
>>> Marking #interconnect-cells as required to comply with Device Tree (DT)
>>> binding requirements for interconnect providers.
>>
>> DT bindings do not require interconnect-cells, so that's not a correct
>> reason. Drop them from required properties.
> 
> "Mark #interconnect-cells as required to allow consuming the provided
> interconnect endpoints"?

"which are in turn necessary for the SoC to function"

Konrad
