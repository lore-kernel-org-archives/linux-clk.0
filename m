Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA1E34B691
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227279; cv=none; b=M4bhFJPQ6T2MCOUQH+qzXlvZspIUJC6s8pWm1VXJ++ykHQJHfw1eR8qVDFBorMVWbsIlZNUHYEaFnQtcE3XAl0sG3d0DKR2CSD5LiqRKWe1wW8/zF2y5nnl29tVVgNz0ODglwDSmJMUdL5R7OeCQ5bs/5QKUY88nxlhibrp5gcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227279; c=relaxed/simple;
	bh=6/WPQt7BwJrOzLy6rmTjQFrAh9jb0HTaryIYwua5nFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWwc0wg/29+5vcL3MSVDCKE6uDeLOv/nCKMWpHvo7SZb3o8ihnwSe6/jbj7SEQFIonjWfoDo8Pe7D+C+G9VKDXZYK2WNSsN6X/MU/9boq0BQ4Z54V3fLGHBzjgbOrTcW2ojioSZqI5Ayq00dUXLjMt0+spNo1Wq9zCdj/5j8ux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahUSvrxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SesmB5hQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahUSvrxf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SesmB5hQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIaF51246530
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 17:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KQzNQZgJIkrTfJA9o7+eF/3VJZBZemUAsh45mfBJmo=; b=ahUSvrxfHy2I6Zpg
	jyvkWEZrBcMJrHPgFXNQFdl1u65uAXhxb1Elfv0WHgLF9RZmKbdBPblKIAknZy1/
	AjwTRi8uluLRsullV4uP0e07KuE2StqkPlAtTUVkafDPIlrnaAAqeVw/acxud0u7
	vDrL8Tm9gNS+GiFk+Hs8BJQEqZGbvahXeP8+K93t3Rdi3DinfA1p+/ANyC+KwFBE
	3EzEEV60y4uBcvnPZYcTq+BjpTYMSl+0XxQLFu4XZaMV8UKCt/O6byjAS8uND9kx
	lMXr8G0bHuzGgiT7TkI45EVUZSpGhDdxdIBRreEufY54+xxt5il5bsdY4oleZQat
	Oo5Ibg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ru9bhfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 17:47:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c56848e6f53so728969a12.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227278; x=1770832078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KQzNQZgJIkrTfJA9o7+eF/3VJZBZemUAsh45mfBJmo=;
        b=SesmB5hQni3CPyI/Qkud+/6jfnfWPxLDMsOqfKsomZy7+CT/N3a4d4hQ2ATB3APYpe
         oikBaIn6oZC7ZGNgDZ19xfmBzBoqeGZmpx//hK9gvtSl3GX9cu4vEAZ3P3FGITvCF2DA
         mv9+9TdEqz8yd3UBfNc97v2mWYgR+/h/4T22n+WD3+fz0gVApaYIDLKk70MlDOpX+Af2
         oHz5RF9fCP5f8upB9UWehGwUZ+S8eNh7nVZNc8zp4qWITvzckjCtixFz/u3enxAnuyeV
         f/nz/PD9jrcOzZf21LtWbbEbZn5Tm8cMN+vLf7QWAr6Nj6rJnHxTCGwiJS6zWtvDTTyI
         DLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227278; x=1770832078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KQzNQZgJIkrTfJA9o7+eF/3VJZBZemUAsh45mfBJmo=;
        b=HoBo1zbEIGZ3w8rY2QPOEi7Fey2Y2xsftpGy/35qXPn+7cqb0nu48dLlh2muU/mhuH
         xE5xMSsRIXzD9smJUKYeQ8CF0tmqhjj8VAIoWPUkkWkcQtHX+TmLUXuZlN1Yjn8rgbF7
         YlZ2Imk8VhvRR19tBLVv2gvOEd1EB9XH4C8CgCClL7Cx1sUQFX4RuxmrLepPcNs2CYkE
         9BIpi8JQ+Cz4/3x8pux5W7aX+zDrdWK0axnFD2f1EZY0F8zgzz1pb5mP4mSSSkswmVI0
         l04XSfHD794HeTYiGDmUSdAy7QsSrqBD9FPNrUKnz8KU27RITqpPEGoggoX58szb+z6Z
         2oaw==
X-Forwarded-Encrypted: i=1; AJvYcCV8IsFOtVa/BjEy6eqMx6Y5xflnjJEEiyE24sOkZgdgP94CzQ75sZmHjO0oqthvbUjNR/fWhUpRVRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3OfDsvmp/i2r85uDn0bA80kb7YNLCgHSduDsK2NhfwryfMgT
	ahALPiU0ba2cM/jsFCMJM8FCRscaM0G28FmG1GpXLaRNi5Gof8+Xi8C1DjCRbNDNOpgW1dN7UJ+
	XCsOM3Gy/ehtiDpXi9l1oaXhja8PuwdQ825EomkHtWjYtYxXlPb8ml0TL9A5Q+bo=
X-Gm-Gg: AZuq6aIEx+VbIZYG2wC21B60IvcpFRey+n9PzSna2aGLAO6eSb0hYsCJJlI3FS0uprC
	fp+JQShWBGEctATU+kkMFwPYerwGBGZgpA0+L126lb5mIqCjeI5qVAypIUT7Ff5qL0NjUmIsaoK
	11wvhc8wLoP4rDhoEwMtho7FMwjE4PLo/y0SEPUDqN6JiAOWDLhkxvS13KjbRgbwhALlj8mZ6ff
	BGivrujG843qROGp+VWUJMRFcCOW53BM8HyipW8kZrQx1zNSwdEjXuYOn1BT8wdOWXwqmg2wzs6
	pPA833tUqpW7HlQzn+/7Z54PJuTOTSlT+0EJ3XO0p01firDH4oZVxpagFvtMZbLoYTtVoGsvRB3
	FRLXG6kBQuVpfRXZiiZoFbQdCAx1bo8rB3jnh0wXTo9hd
X-Received: by 2002:a05:6a00:a226:b0:81f:46ba:1817 with SMTP id d2e1a72fcca58-8241c684c3bmr3724149b3a.66.1770227277993;
        Wed, 04 Feb 2026 09:47:57 -0800 (PST)
X-Received: by 2002:a05:6a00:a226:b0:81f:46ba:1817 with SMTP id d2e1a72fcca58-8241c684c3bmr3724119b3a.66.1770227277547;
        Wed, 04 Feb 2026 09:47:57 -0800 (PST)
Received: from [192.168.0.103] ([124.123.178.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d47dcd4sm3815619b3a.54.2026.02.04.09.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:47:57 -0800 (PST)
Message-ID: <faa4cfff-0d12-460f-9866-1ec124d0f5b5@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 23:17:50 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-5-b23de57df5ba@oss.qualcomm.com>
 <bftoltz5p6rbvuhsialcoiynrhymilwyfqlhlhuvfodelsz6ms@5w2vd4hkof7g>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <bftoltz5p6rbvuhsialcoiynrhymilwyfqlhlhuvfodelsz6ms@5w2vd4hkof7g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX+ONty/YarTst
 elRb+YBgwCOBjSSx0JV1C/rK785Q3zh4aPhROsYLsZ1T3QFN0+VqSGIxi7Hzjj3cWGE3N8FZjws
 3+1ldk9DwW8t54Du+3WQqq2yqajX8hqQNsiBRVpAWQc7/6baL94qlmOfNpTpgFIFvpybz1xbBSQ
 P3TvK+gtuVaspvKbn0rO6NzW+cJWA+jWqjDBDHd3DlxFhBww7uMCkcwZkVX7XVoTA/1leeMSTqt
 6UeLK5K0oVzY+kugfgC/sxT7N6uid5y/JgrGzIsqwpNW4555kteOg/+rcn9g74qilGlJLEr/D1H
 MQTVeFHA80297JwhHgsyGsdIFK7J1upvyzpuVWVbvcOLOLCK22BeLlHVMUtLhQXJ+q60GUCfpOA
 VuiJktREN9uzqRWOTd69DNAVxJPOXjlg6jKwKR+qOMud5yPqVs0TzQLh37tTqwqd26D4sj4BTr5
 jeHMRGbdwC/dF/hMq8g==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=6983864e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=2H5/5ZkxJs/wMzWGxXwROQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pI_CbpTJgPHuRsTpROIA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 8qaI_FSjFKHH8qbqDOFqgrpr5aiKQmwm
X-Proofpoint-ORIG-GUID: 8qaI_FSjFKHH8qbqDOFqgrpr5aiKQmwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135



On 1/29/2026 6:09 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 12:56:36AM +0530, Jagadeesh Kona wrote:
>> Add support for the camera clock controller for camera clients to
>> be able to request for camcc clocks on X1P42100 platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig          |   10 +
>>  drivers/clk/qcom/Makefile         |    1 +
>>  drivers/clk/qcom/camcc-x1p42100.c | 2223 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 2234 insertions(+)
> 
> Again, this one is pretty similar to the one working for X1E80100. Can
> they be merged?
> 
> 

Here also there is significant delta. Few PLLs, clocks and GDSC's are removed. There is delta in
frequency table for most RCG's and parent data structures also changed for few RCG's. Hence added
a separate driver for Purwa.

Thanks,
Jagadeesh
