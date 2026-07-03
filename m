Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3D1261B70
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 07:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063827; cv=none; b=f70tz+QD4PJFVp76dI8Y+sq//Ma9azp14WUnJzZWDPn3WzUhxVZkYP4i2ZN2ZKkkHD+IjZ90oQP3CjtRa+5hVLSh7r5kN1uN0YnRX/e06KArj34fKs2k4+e5Xi4BJKJJuEhkVlvuuU/it1PbDkSMy4UpSKGkkysxFcEhUfvj7f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063827; c=relaxed/simple;
	bh=NxIOBQqw4GdqqNxy+UV7RTjAVLmJJi/DZMe8MQDibEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MT/5uYVDYoMvron1WwinBHFStDlFyY5A/UYSQag7qXdAtk4EISeFTcLBPhU30WZ/JqEONSdIZeS+X5cbScgoYzMeNXU8rhrAYomHoHAePQp4ye1zBRL/SlM2v2694qesSXrG1i9ZwFXYPXxjO1iJ/WMIddPolnyvVyFKakoArZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0ct8c+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcUx6eIA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0ct8c+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcUx6eIA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636gvlv3144211
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 07:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZbmjKhc7zOTfSEw06CDNOZpVsSHHj1w1jZrWO2sW5KE=; b=U0ct8c+B1MJi1uA0
	ClE0GxQezzCpIccuZz++Wn7yxkjl5c9H08TnNZ+ucENTp5SrvaFU3KJ3Y27mwPEw
	O9YI3ZMwmgaMooo53oXetMbeKI0rnx9ujFVgNeWpE3XD3Ckh1gQOlZwOQCVU5GJT
	voCxbbU7r9EqKIPHLkZSQv3N3wzuxyPLetnMmPatwCaH5wbCkyr9KvZVWRovF6Fn
	jifX+Ct9jqODj31Ql40pn785y8cdL5htgiKE8Wb/Byi69MPAYrNTWJH49mEyHA9n
	epIpjEjZswyS/EyCmfgGGEsZREdjS8EPYwtSnV8bTF32iLcPswu84Zt+b+t+/4DF
	TN5s/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682br69a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 07:30:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c267931ebso1894451cf.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063825; x=1783668625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbmjKhc7zOTfSEw06CDNOZpVsSHHj1w1jZrWO2sW5KE=;
        b=VcUx6eIA08TXZmZH2h1nH/ofW9LHXumLguI2BD5QRzvaB+6LUmtFU0LiHPH2638uds
         uQSvrtCq70WOJN1v+FQCP4WtoX9PDoOsrwblP6o65dIwdGJH+SlFihFvRFvTaWerIxZF
         pUzgtILor7PS03QxR8M2aZnazV2UhyI70v4PG3NGMk9Ddbb6wKq54AHlL8gUKSXac7Wy
         RH+Op9PbeXFNz2tXeGnhO9OcEe7SvetNvwPv28SCfxcQbCW1oY+IlAxm2rQwJ1mg7shW
         69NtlERU3RXAgdpMk95w+kN5oMU/C/yVTgIR1J2KiaXTcmFRfGHipm/hT8cOs5n9FGBp
         kAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063825; x=1783668625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbmjKhc7zOTfSEw06CDNOZpVsSHHj1w1jZrWO2sW5KE=;
        b=C+9tMNo/BtmCWY1eavA7vU4KAfk78//9cTNy24RtwqGnf0WD2FY1qH+mDYb96Ion2+
         R7OnTERBRDh6EGStrG8puUQ02xy30FCdNkZ2tx2XBHe5c/G16Wc3Zd6H+AOBpH/23iNA
         v+C7uLAQi/8hfOChNdKUG+roMInh8zD0Skpm6HGz0RuaSOBXI1hQg8bbjN9NTjiWTIwa
         YguYr4mMNBw4Gr4iUvJi2XRmjmO4/AMG5UWD3ZpkQeBnB/OxWZENQ3jG2I5xGtqpdu1b
         KpiqjCbMp7JmWQXsOrbgOuQ3dFbMWjx3CrxlGULmzAw3eCQTT2Tbv+3GsEKGv/I9LrwX
         voVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+La3iY6rjkpOxIZERdgYVK7f5VcEJoyrZ+fgVfwAWnooh+ZexXeKWCEe8THifnek270961iCJoRX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUke+s2oaQgFtuYPiNY7Al6UOCxmqaa7Q+RFhsVTflcTVWKHof
	p9/iX528DgMwj2pjjFU1IxaMa25eDl7dvK3VkVLIQkS32Rrz9HNuLUpAHRRAJbUVRoNQbAIEASX
	V4ABdrUry4fl/+yBw1ABGuT6sioIv7vYz20EHukklMDYZUXQyApXOtZoKry139Kk=
X-Gm-Gg: AfdE7cmCgtlqByXEN/RXQ33FqZ9uml8w8of5lwWxgRqM0T8bSbP4MsIisCsMzyxwDhJ
	NMe195UhO5rFYVgWEzIb9Eyhdkl+uhpBKw1gFZK1W73vP05WSpOj54sc4O/E6VG69m67DZnrws0
	CEVnwIkL+6cyO5hCsRCRgAUSNE3s9UQt4kDt3l00TPrESrI/AEj4CACQRNmAY2dJKYLFO6lmWat
	Uq26ceBX/nQ112b+2xPsIn76EzkvIy+xRvO1gb/i4r1L0KEnlKNpfFs7mNgfilxhJHJZ/Sy8enk
	vPMaTVMJzoA+45orY98hHKgvYYT6cM5AAIQuf4zf9uZNjwgY3iQRPfW91WFYt8fSSz5g12ykZko
	3xcKCF25xxCkeYc4YMwYfgdu+zbQk8lRFyqI=
X-Received: by 2002:a05:622a:487:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c2690658amr70423591cf.0.1783063824864;
        Fri, 03 Jul 2026 00:30:24 -0700 (PDT)
X-Received: by 2002:a05:622a:487:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c2690658amr70423371cf.0.1783063824331;
        Fri, 03 Jul 2026 00:30:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm239906366b.19.2026.07.03.00.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:30:23 -0700 (PDT)
Message-ID: <221133d2-758a-4dd0-90d4-ac3f3525ab42@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:30:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/19] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXxbqlDuQt9Pgj
 UmEVCqzwmj+x1pTo2KugcftoksOPA1AaoDy3yg6j2KoeYDH7IRUF20A4cVMufB4OUL2fAbFcv8L
 gqCeBaa07eGJaqMSvk887DlSa020jDeZDANMM/0AybVjRI3g8hUKQJsgbrGBQ7LEBQ/K9mB2nk4
 vvYBvRmbHHp/TKTDEqL76aSuufEMcRPEWSpnUsmc2uh+77M2cDz0evGaf5tKYxQBk+LNeZCyDEx
 L8vsPzqSar54Yv+8xBbnntjvAYZ6VcuH9HMy0BLxTJfPnpMrQ/1rjt7gCBjK31obHXTEZ7HnV08
 owG7cfeYQYbnCIzu01bWmomydwvePQtdXekHpa8MVP+U4jkiwIShFkih+9gen/djRZDf7gDaKaV
 KaNtIQq7gvPoc6q4RKfUW6t/FGEK2heXhLedCNqqxeCpO9gRFC+ja7Kxj95L0mqz6cAxw+8loZ7
 /xqgyBIMYoot63Yvpfg==
X-Proofpoint-ORIG-GUID: azJzDr5RDBJghqENwoqoneakHy_z2ASQ
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a476511 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GABpISGgAy3S5f3vv6IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfXzfCj+569ZZed
 AbxcdCEDGCdcuqcWZEA383cEnZI2BFl4vZmm9tyruvrZNQTxXqhZeW1jg/fN95peBacJEb3SY77
 lFs4Y+iKrHOzAVqwoEgfFD/6QzHKm6I=
X-Proofpoint-GUID: azJzDr5RDBJghqENwoqoneakHy_z2ASQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
> similar to other critical clocks, since marking it as CLK_IS_CRITICAL
> causes the clock framework to invoke clk_pm_runtime_get() during prepare,
> which prevents the associated power domains from collapsing.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
