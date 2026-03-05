Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F237754D
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701511; cv=none; b=HZJo+mn9gTyxUL8yUmxCL7H3OwPTNB22BxOS6/tIXotJjL2dQwiGQhCjbxvZY0Q/UrKwb6BirN00x2JX8rb6Li1sWeQtA8ynkbANclz1txPikXfi9p53Zu82oCDWZ02riQKI7fedZvgdeohFm4qE87TbQEPr8ApHjBaB3oeTEfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701511; c=relaxed/simple;
	bh=2NzzHCCdd/kB0NsB8ylavg1VlVI8EYGbzeMbZGYYf88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2QCWdhwWn5a6ynY0p2jv7hWBKW61PtJIdjiG+gIVCnPfq5GDTnH9E/PEaW7d61ZGy2F0Iz/WeTJpPkxsIFExdwJxURcOdcLckHVmeeT+0o2MqXVxmtS1ajqPaQcgWO89CazQnrwFOAWtGSnQ6yeKkLcxnpB3YHHIZkUOaqASsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnKGKv5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnsniAvW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnKGKv5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnsniAvW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6254KTfb1853173
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 09:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jd7Nx7xGhxleQ6Tw6ZaCssdPU3vlLXlCP60azoPIZIU=; b=RnKGKv5sC4EVBYX+
	6vJWiKtNI5fcleUmMAYoIWVZ0ck6cNd3pbYqqv+XhBWZkRPRgz+3bdrT0tzTiNJi
	4CwXpGRo8Klc8X7dUw80BX/Ohmf1WKy2pA9P12+iSmsCU/Qsci3i66cJgBvo+yIS
	8L55GFrcmxmS7o2beUQiXSFC8x/VuV99McotLuhl95yJ6xRs1R1nqofD+o87zAq3
	XVgqirMeT2yhCKqzRTXUv7hOor/ylC4zJg+w1JYyyRpsCtB/AxO8l3ku4EJCodmK
	vrThw+shk4JCkCA3LWdXVzLYVnXox2qFdCar9I18f502kh+Ze2EIqTBvaNtBTMv3
	eYhH2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq2q80vpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 09:05:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so577884685a.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 01:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701509; x=1773306309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jd7Nx7xGhxleQ6Tw6ZaCssdPU3vlLXlCP60azoPIZIU=;
        b=hnsniAvWVRITMWyizDnV2cRjfHkI3oNCNr8JrOUtry0Ejwazx/NjOkP0Vs/9MgJhK7
         fNeSQMGKx3P6qdzavJh8HWx/kcD4qdiVLRfcDCax+DFDhShFZKC55qtNCKeAckRfd+Xp
         okRTZ8tl4at8jP85AJIA97P7uX+obQ2b4F8iI4Ke1SWOuIUX43PTK2cvESc6KEThdxH7
         oGJ2NzeWvn39v+LX3gdxcaj8bCuXhQyASwjF7HUt0JasVnFYEM3fe464N3Y0+Ob+2d12
         3qkSMfb0AJaK7EWkRq1iR0kAkmbwHcde1ZmzI+4bnBAA6bWtDZIC16bqqhxM1AKiLa8l
         EWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701509; x=1773306309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jd7Nx7xGhxleQ6Tw6ZaCssdPU3vlLXlCP60azoPIZIU=;
        b=jOTbLIEsp9H9Y8y4eZQTYXcCdfDLO4Ujv1fcjkuMTnJSDeGXnw93yR/xcx4+brAymi
         eh5ymXtLVT/gnoc9TntxO/WzE9wkjq6Y2GnSZHhuM7fvxvkjHAy5Dn//7Iz7YDNkwtyP
         QbVAP1gxbrtIgRP7GPx0O/VQQKx6N9JLytC/jdmnd1js41F3lvXwzKx2MOCtVLi9XnCS
         RrVA7aAH37k31ihbRhcGO1ZEdLIv1ApkTSQbscAcrciP0T2kjXgQP3vXS1wFLZ/yS1yN
         /TaHqn9ESN9qrzJBntAPtlfd0l9RUY8qYdnMR6bhh8Ehcp/BgSo+OXKs+KR/yjtGmjU8
         qTEg==
X-Forwarded-Encrypted: i=1; AJvYcCUzI0mZpFG4dNljSwv0a1vRLEUOML8G9JaNKJXt1hS9uPLey+jABmGuGTwX2rpVSh6WygRWR/vznp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvBvuBXYiVWKRg3VIKw6SkJ4ZvaJWK9JmNsNctxStRXoOfKUmF
	gnH8pTaGQYA165JEu2hHO0vz2QwqFpjugB11utE/4dXp+rRmYxMW6EsqHwPMcuRPAg7l29H8NtY
	+/ohqgI3InrdcF4eKpFxkKgxvitjSgcM37bJiCQd92FaoHxadbGndnL/6iCEyCQk=
X-Gm-Gg: ATEYQzw+tA37llg69Swg7xfRv7AWZR+1z6HVt9AJ4b2VpW2WgWXtOCIa3Y1rWuK/lDb
	S6DPJ9NyjPB232/7h3C9Gwu1CLsxdtff81bIgnqSNXB4XhlgkpCtJMfD+lNWpHue9P1uQRX9erO
	GySfreOcMJxRl6pxTBMnhMmDgiwqByahGknrKvNkYNvJzlXupeMvQrulEfkg9OXpABYYkmEpbun
	9ipRnBMjXTp/Z1E3fq5einpa5ocn06eyn52SS34pyq9gh7Bk9gVhhdiS4f3eS7KyrnUViUYjLT9
	nYQM6BLW/yFQR3kBwzg/TRC2lO7HR5ia62cEYRs1hmzmZ/sKUXJBhBekRf8KQsRyPwDVdirGGZp
	owPcrAj/nBESMmsiCPUXve3XpUA0gDW+8/1xNqUqdQKpMBUTEc2M3PIWjoV4gAeEyKJpZJWuv1U
	jf0NI=
X-Received: by 2002:a05:620a:700b:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cd5afa9ac1mr542626585a.8.1772701508817;
        Thu, 05 Mar 2026 01:05:08 -0800 (PST)
X-Received: by 2002:a05:620a:700b:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cd5afa9ac1mr542622685a.8.1772701508311;
        Thu, 05 Mar 2026 01:05:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660af3bf657sm2569281a12.5.2026.03.05.01.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:05:07 -0800 (PST)
Message-ID: <a7e8d1ae-63cb-40ea-8d59-aa168b104748@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:05:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-5-dbbd2d258bd6@oss.qualcomm.com>
 <2byedzh5w6ymnoebve74a2a7oezgich25wdh4pdsqmvv3jvpkf@kyk2gz5khibe>
 <2f1bdd7a-04a0-49a7-b275-4332f2979378@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2f1bdd7a-04a0-49a7-b275-4332f2979378@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aviAvbxWQTKq1AW6xPavz986unyezuXW
X-Proofpoint-ORIG-GUID: aviAvbxWQTKq1AW6xPavz986unyezuXW
X-Authority-Analysis: v=2.4 cv=GecaXAXL c=1 sm=1 tr=0 ts=69a94745 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SOEfcho8Kit_SEfO-KEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MSBTYWx0ZWRfX5JA26Yey2k31
 kxBJH6QJ1KTY2x7NQDk6du64HaeSI16cTbKiaswbJlfNBdggEEgP9Vb0FwI2MaNQQbrt32DTvEv
 p4kBPDQaw4yS+pCUdUnuCekojK6ngj3gzHLxQKpZsPAU3c5lugPd7QIfGwp2pgMNNJdZJVdiutb
 lpvJhWrkesJ7wm83yOTfnTgJ/n17WkS3edx8REEQpb0GjOy71T10msEb3D6tRyRwWqzKEqU5iu/
 y/JWQ/m0LnfrFJaJyf1hyYE1yoEF6Gse5oYzz6Du/30qSiozEBrbE/ddBkfqoRPyEO4/pdVV7dn
 6XbOsyEGfY3aynh9ygxHv8DzfS5urJr6N/8r8nH+yH1kYGjB2hlj34pwh/8em99Ho/ikPE8u/BN
 OG3qynpxtKcnhd/UM0/DhZ47bByy/aKQWWInR1zwbbOhiqL8qnZZzQRW0r1C/KreJYOGFR8GpZ+
 ALMCmV15UGxN/ZmA0Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050071

On 3/5/26 3:18 AM, Bryan O'Donoghue wrote:
> On 05/03/2026 00:33, Dmitry Baryshkov wrote:
>> I've cross-checked this against X1E80100 driver. The main changes are a
>> drop of IFE_1, SPE_0, and two PLLs. However it also:
>> - uses hw_clk_ctrl for several clocks
>> - uses rcg2_shared_ops instead of rcg2_ops for several clocks
>> - uses hwcg_reg and BRANCH_HALT_VOTED for cam_cc_camnoc_axi_nrt_clk
>> - uses HW_CTRL_TRIGGER for cam_cc_bps_gdsc and cam_cc_ipe_0_gdsc
>> - uses non-AO clock for cam_cc_xo_clk_src
>>
>> Are all these changes expected? Are any of them also applicable to X1E?
>>
>> At this point, I'm torn between suggesting the merge of this driver into
>> X1E driver and ack'ing the current form.
> 
> We can test the diff but, I'm not sure that will really answer the question if it is the right-thing-to-do.
> 
> OTOH if it ain't broke, don't fix it.
> 
> Reverse the question - is there any reason to have this driver at all ? Can the x1e CAMCC be used as-is ?
> 
> If not, then we can accept this patch and potentially look at merging the two drivers later on.
> 
> I assume the code submitted has a purpose though i.e. its not possible to just use Hamoa and Purwa interchangably.
> 
> A few community members showed me CAMSS working on Purwa last year in Amsterdam with the x1e code - one error if I recall was a clock splat.
> 
> So superficially it adds up to me that its not a 1:1 thing with these two parts.

The difference between 'can/does it work in some simple use case' vs 'is it
correct' is that the exact match for clock configurations between H and P
is (according to the computer) 4 clocks (out of 200+ in the camcc topology).

Most of the changes are small differences in frequency steps or which PLL
is used for a given OPP etc, which ends up being small in the Linux
representation of that data since many of the freq tables are reused 3, 4,
5 times and many clocks (branches) don't even feature one.

I would imagine almost all of the points raised by Dmitry probably apply
(but I'll let the people in the know comment on that), which would greatly
reduce the effective diff. If they do, the drivers could indeed be merged
since the delta would be just those couple freq tables and NULLifying 13
clocks on Purwa

Konrad
