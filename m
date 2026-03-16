Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496EF382398
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651492; cv=none; b=pExGCoAuJjeFEqTZE4rlKKkIvb8HHIquyCSzqMfNICNoSAkieoAqsdHYk9CQmIDUz9BORb5I9cZj+yZMCsBcls2WV55uaE/wK3LeI2seipmI7Wl5HnyBsR9wpR3yzTYnz3GtgNJINvZcaezfffIUg5mHs9zwj7DsLgfXpj8z7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651492; c=relaxed/simple;
	bh=WYEOtTpKJKbVcM32oVrlyRCNjAkwiCmSqVpChK7R73M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sd93aG+DLK3TzDcKybqw7HYWvIOlI0UwpmiO5RKOzG8VhhV/xXrLMuZeRcZx+MVp7yohOPdGmMLdA/A4XEBzjKa94EH91d00hTSXq4nkrfQUOdGD31UYFT5BvsVSpkV7k/FX5B9ISHK0uMaLm+SwfzwfKpeBPhTt71E+zPvSIgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEX2PrQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHQmr/Mr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEX2PrQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHQmr/Mr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64thl539830
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 08:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ew5aCzTfbJfZsbqot4EZ7SeBCdkQpT3b6lAtmV991M=; b=CEX2PrQpnsH0GmTT
	DPYwpfXotdf94WuXr9weW7ykDEqYV97/z+IN3jWGhHEZR9N4DZ6k8OSNTXAdxoUj
	ywFNYavlXfakz4FrdBYdZ2CAPJ4kUJ8YkhWyjs6daN/X1Zrz5AwQBg6T8sOPBxrE
	nc8LoM+mJfR1ev0p5Y8adF6y8MiktWyTcSdYVNz8dYysV5l9gLfrCMuDTv/y5ill
	srIEd21eUoaLFWseoqAJNS95KadaEe0T2xdsgta1y7TZJBqx5vbD1kv2gp6bRb50
	oIZ7rUuFnrHDLCpQqFgURkVsiYtnpL60awQ2jzqunzj5dLcMKvo6U6NqMD7LP38+
	/ZgjUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5mw7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 08:58:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aecaae9506so45881215ad.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773651490; x=1774256290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Ew5aCzTfbJfZsbqot4EZ7SeBCdkQpT3b6lAtmV991M=;
        b=RHQmr/MrGkwHQ+Wd2ciVJw1x3Zg80YcSRpq8o7V4iFz+oOZoEKqlFL3b/URvzO9syo
         3kAUnEvk0CW4n6WPiaxfkdZMu8H06tLpnW7FvSJofMjepfPXlyrpMF0FYG1Yxxn0IU62
         Q45sHHytRBJORC2A1Bn/G6h70rgg46EGX10lQsCQJB8LgW7Oz4XT0178Eto0IiiJdkJT
         fy0ABapIO2ST5qJl9+Cp/kNYuN113oXdA62rxntvIl3dUMAA5uJYP4skJAo+9oA8VLCc
         t8LmBVo4B+NRMKrJ0hyh9Amt5lLHryoz7JDazu66uk56Fv/YWxmYQFyMUIL6pjwRmnTB
         vzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651490; x=1774256290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ew5aCzTfbJfZsbqot4EZ7SeBCdkQpT3b6lAtmV991M=;
        b=N3RlSOs9kX72aXTBMlRhUipM0mR5ULik8FT12/KrK8RFtFBVIQrK0b7tBOuBZ6KUKh
         QTsLOowVP03PlXIpfkiRE3w2FVLaygkXjSkg0MYazvbX94vW3O/60u07lUeCkbzwTNDT
         OHD+0Il4F+RJHeZUp+G3f5yaPqt6sCSjXdf5MwWtfq0mTq/3ySP2PEDoHahhPIWEBaKZ
         K+oNpDbCdmCzTTujisLcmTW+pVB/INLSIvk7qjIW8DGb2oFxN47yeaBddw41NustvvBM
         4scMlQYRttwafuVFdiPBjrs4KQuQuFJ9NqjCDCvrLkWwvR5DW0Nmi+7/LoE6kc9AFTyw
         /1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVy6EMrH37yUfhOWCMIwztqLJ4+e1tdFafVtzx+etVHOddOS+IcdREcoNJpmRALUTgWgpeizXLJVnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSTGUuIREXWfD6ITMJc/lq++SSO8oGJ1r3HkB8lvcaixwvGMUo
	hJSX7YzZt83gXwJm9VzZ3pMunPLxuPc4coeQgSBt/kgssHjHNOS+Tu9mTBFj76KgGGa12wVHObh
	PiZOqcghti42u71gkN4Fpu9hW1FlJT/8RTCyK5XJAUWZp/1VRiaPnPV9tKGfaJ/A=
X-Gm-Gg: ATEYQzwiOtdJXz6p35Jb6fDBxTnxFD8qmGzOVkxMVqe2jmdNurH4yRn5pVuzGZFLxKD
	ND1IJH+0ZpsFJMYwpvJr/ZWU1IkOvn2tdOLh+wzQbjvDPFuk0lb9ezbihX1Rvd1Ho35NmJbGcCr
	7IJVv9BgKL6n/5b/3BPazk23YxooAXUHhRJcLvHgKUG7sZTfObTyl5J3WTimTkEHteXbvuLNc0j
	b16u6/WVnJILUVHWRtmOb6B7kOrwEQAWfDfnmYuLYBLxFA5dxy1xaFRImIcmq5/U9opGH5/1end
	k0nGTgqu31MVUcZX1dkLBVlaY5TUrjyixWBqzrP89AMtKpYY6qI6aPTZUX79PrXsEmwEeLDeAiC
	zUMwFaRu10KLTB2DMx6QNChK5hd45kyNbP78DtI4xypD8XGQOQ2b2RNQEYsa5Alh3/Q==
X-Received: by 2002:a17:902:b946:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b04f162497mr29871025ad.16.1773651489974;
        Mon, 16 Mar 2026 01:58:09 -0700 (PDT)
X-Received: by 2002:a17:902:b946:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b04f162497mr29870745ad.16.1773651489142;
        Mon, 16 Mar 2026 01:58:09 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8363b4sm100193485ad.76.2026.03.16.01.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:58:08 -0700 (PDT)
Message-ID: <1eef0fc0-d33a-452a-9da5-3d0903b1712f@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:28:01 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
 <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SntrY0aKLVyFdPyIMJzKKhk1u1q8cO9r
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7c622 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B7sYG0t6GpuNDl58wUIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: SntrY0aKLVyFdPyIMJzKKhk1u1q8cO9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2OCBTYWx0ZWRfX7sbeCvqcwtSI
 w/s/wPMCAPS/MIo+BK4GDVNcRvftiO9dMJzQ4VfYzMrKh7C94lyXe+8ceyf1GNe5OWwBINGTLVt
 JIyK8g3x29KCrPVO/CKfqDSMOwB2JsIjag8Pk/ZC1Gg+gGu/yoDEPkqIMid7ZAKaTEg2MvliEqK
 NsVG1hdox/HzP0XfmjQBOEgOdPEZ6/IU6Yz1Quh375D6gnWGmHl514pGocOvSBIZXEl0o5uCEaQ
 Tp3XKlLMkamCI+NtPIvZ1WmEreC2DMgcmBlnm6cTJbRoLtawqv0BxZ9i6dnuRW/y3gxpzeSveWI
 YMNXIsM/lUj+Fx/nqgWBGFBcdrcdPk3Mr6iseEu3vV+CgCbN5ReP8pBTjQzP7fx5cg0Ytp+Mepw
 Fv80i5Dhb43+ZJRe/CId+qFTEBSbvAkKImHr7kIg/NVbbaULAglwzE9NnxOyswWnqnNKr+NGm78
 wirRvi7vRozBv1MAQHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160068


On 3/13/2026 6:24 PM, Konrad Dybcio wrote:
> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
>> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
>> so add a driver for it.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +static const char *const Led00_groups[] = {
> odd uppercase


Yeah,  in HW document also only this name has the uppercase. So I just 
left it to align with the HW document. Do you prefer to change it to 
lower case to maintain consistency?


>
>> +	"gpio23",
>> +};
>> +
>> +static const char *const led01_groups[] = {
>> +	"gpio39",
>> +};
>> +
>> +static const char *const led02_groups[] = {
>> +	"gpio6",
>> +};
> What do these 'ledN[012]' functions represent? Are they muxes for
> getting activity/status signals for eth/wlan ports?


Yes, that's right. These LED functions used for the eth/wlan status.


>
> Konrad
