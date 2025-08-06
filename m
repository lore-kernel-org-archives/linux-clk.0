Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43B219A67
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472640; cv=none; b=VBpdKj+ULfUnH8owKNX6TFSorFzvXCuvh4IRErpHebeYut3O32PU8UCkQTHGbH3MEev83kaqSOOKD6lQa5P9SMk76YYPZY7nyBrQA6KWTxQePKPji7Qfhgxvkg/hMjbNKbhRjnJqwRZyOpvH5WDXwKiEc3l+QswZ8kLPTaE+CIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472640; c=relaxed/simple;
	bh=oM0lMX5NbA9LV+vdx7kVpo7EN9KJbvCiVdEvhHKvOIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QSwhLo01xED0WT9Ppcr0iFeYoFt8hTd5K2bq1h+0nlyuuc7QR3ndjPW5YQUbCqI6L55l3bA3cbm2eYHiHXby+NZoLEWoP96gaqGjtKy5n3/+7Vb7v8Ond/vpQmZxwAXvOW3w/gIucens4AR/v98jRuBgFdl0juLu/oTW1Fg6by0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa19P0tJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa19P0tJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766K2mW008114
	for <linux-clk@vger.kernel.org>; Wed, 6 Aug 2025 09:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3F7jW292s5J/5EU/tt0B7PNoOU6z1hNas34m+AYe5s=; b=pa19P0tJNdOXEswJ
	Pw4gd7FffZPMraN/BaQ7eF8E8gVkZp2zUozm9zTZUhWDYpEzcq3CKQRKv0qMh9W9
	89+kvoyyND7HaI2jJeycRnJul++h87ihBEGNYgxYndq/iRE/VWEGYSrKIdl6/pnh
	lT1biFG7wQ2w0se8AvUGPLFixi1SPB6xfWma0Du3ERVQzo7M2/Ij5tR4siyYXSUL
	Bm/tmjTr7O7+WOtOS8y07P78Ie4ISV1aedhjsnVJK+SXhNXy25VnFElbYy05LH2f
	IaVxiko6R6avcytDxCOwu5xwuPUZOU1t/sHOSYLzNHal/7L86n8Yb5huxgnpdMFx
	fhGinQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7t6ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 09:30:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fafb22f5daso15942716d6.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 02:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472637; x=1755077437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3F7jW292s5J/5EU/tt0B7PNoOU6z1hNas34m+AYe5s=;
        b=HkC/AZxBiBpNw1G1/Q9WM4Y6jb4zDUFLv+6CgSmqY8A00M3Q3YwY6nmab9+JU/d1kp
         CR00heqIDww/hzjy7tZgsNQVH8zb8hDxvKR1UDmpA4yPHdgSfdIBYYQp4eglTZrL1hfT
         24pqScbDU/sDqm14yA5ubwVRIFY41Cz5Wf5oFkrnoohWf7SNdRqTPuzFeHaz0cAxNsZT
         2Ul/IJV94P8kRN8MUC+Rqj7yI59N2Z6rtIFxOWfRI40M7xm2WGAzDEy9jlOzqzfrB41N
         t+RyFcF68xpyl47OxJN8YCDZvdd8PnEFeOYgR/ZO8UQ+7okKrme+9sbw/7mgYSJzeHOp
         4wnA==
X-Forwarded-Encrypted: i=1; AJvYcCX13aUyFjdsfoty0Mi7w0H4923XvFasENW9j1CN78uIXPkpZZeKcDTaGAAm0qU7sa3K05AJNQAFFio=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHGzxG5FxO0luHByvcwq0N/jN8ORhBGdGaJcyUJUMkp8eCgvS
	+DQEeQPUQHumclJ+lRMWgr5DEW3f0FLskjXDr9mWKyhOB7qWE50INgC96w0AnS9wd7cK7Nys+Gl
	BOPYex7NFMD14wknvPe61UN4tD4Xg67/AGSxlz9Hd0YNcExfrNsi7Ah4P/Bnyr2o=
X-Gm-Gg: ASbGncuRiwKRlvNZHWALFtzotWo3lDYprhFRYeVvo4zjfQi0Sf5zHCCaC+UNhiC4GW6
	ducIkM5ZqjlRxC8j09quq46YKVlua002aAvy8DPQTOLNPWNwcvp9Q/wukf5jQGw+hsDEzC77bWs
	AHy8ztCRNiScq3jsnf1VOjTpj2JdXRMLzDATJWQnZ3FUy5iHTgqVbumOSKLIw6IJWF93zUOWorB
	4puGPUid01faOjR88nJUAcgggZkD4TQO03zBhdvPvr8M71VZUC6n28RtLWnPWx98/oKpUPn13ns
	JsAmiqPNaUiPcEian9jrFHKbWz1ZrHdn+t5b5wLAtj7mDFubNphBTa6gxeftHIigLg03kWSLvM1
	fAGWX/4iC2famlXV9IA==
X-Received: by 2002:a05:620a:191c:b0:7e7:fbbe:a193 with SMTP id af79cd13be357-7e814d1869dmr186496285a.3.1754472636615;
        Wed, 06 Aug 2025 02:30:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQKtkuAek7TR7Gpi3LxI21nwdlFWmLTMwrNP99WIXsIbBRgltr6cJsFAy/rkQ4ETKM7Y8xeQ==
X-Received: by 2002:a05:620a:191c:b0:7e7:fbbe:a193 with SMTP id af79cd13be357-7e814d1869dmr186493985a.3.1754472636112;
        Wed, 06 Aug 2025 02:30:36 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm9983730a12.25.2025.08.06.02.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:30:35 -0700 (PDT)
Message-ID: <d6a2937f-7d63-4f17-a6fb-8632ec4d60c8@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 11:30:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com>
 <bnlnz6nz3eotle2mlhhhk7pmnpw5mjxl4efyvcmgzfwl4vzgg3@4x4og6dlg43n>
 <c54e8ac4-9753-47bf-af57-47410cee8ed7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c54e8ac4-9753-47bf-af57-47410cee8ed7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=689320be cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=UDxpVAc4W1oXZRtQ2dUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: ocnZ6uEfRIsEnPEX1pmYElQuc9JksgyZ
X-Proofpoint-GUID: ocnZ6uEfRIsEnPEX1pmYElQuc9JksgyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXxQrrWbJzsym9
 GEpCQWy9Svdp8N/fMnMFd9MkXtETlPzmRCBhJZyNAqOmb6D8wWEf7FNC1MaLyFsAuHJHM164PG7
 t4SmwHV4n7zmXuakLItrjvOtS4UIk53LnXQSVKbvHuNrNmIIXo7ymXOesVzqO2zqSe96iDH3jCT
 HBbAmRry3VF5Sa1iEe2Tg0iZMB1Pop1lofyMnguajdG2/IZ3r0oweYo8yPwKZu4SQvMjpP2UsYR
 aya9UM2s8GwMCXhxdq0USCmzGgPNdEGWjW/YDWrtkp1v3K9Be7flrDySotVPsw6XIfbqGpJWYT6
 3qz4bSmrAt0POHa45HCMblarpV1GMEVlfXH8e67fNChlEiwww1bLtF7av6l1AtIy6Heg/nKqpxo
 dLE7n2D3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 11:27 AM, Taniya Das wrote:
> 
> 
> On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
>> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>>> boot. This happens due to the floor_ops tries to update the rcg
>>> configuration even if the clock is not enabled.
>>
>> This has been working for other platforms (I see Milos, SAR2130P,
>> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
>> seem to use non-shared ops). What's the difference? Should we switch all
>> platforms? Is it related to the hypervisor?
>>
> 
> If a set rate is called on a clock before clock enable, the

Is this something we should just fix up the drivers not to do?

Konrad
