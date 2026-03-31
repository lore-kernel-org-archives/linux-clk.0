Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9CD3A7829
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951995; cv=none; b=a247O1yaGvOWgjSQz5RRfGFVm3q+29aZB8PUwV9NPErx9BNcCUVyC+ekjYz2kmNN3NW6395uvWttD/4LlXqwzK6UvwmvoEGCjKkQe5k4LaZUTgBL0WHev+kPyh3Gn9Yfd8rNIjOBwLDY+LFcP8Jy7xLMpw5gnCPSprIP3gLGLUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951995; c=relaxed/simple;
	bh=9xNhDS5PKD+4IQ0VCB+vixyBSWMz+F03Jc+iX82GXDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nRa23sH54zfnMqqCrdHw1ZwSABnnvz97Cv+cWZC7EXQlpxsB2hN5nqZOP9ZMj27NQnZo4IbGyJ90W4Z2yDdn2iYCoVxEiqDdlmYjYOtzA4iU8ZkPleOOcS1Ahh31avbpu8YOVmszOCisFprsX6m+ijFm9wgqxv2pd8AoAXQvFX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5k+RIvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgOjumSm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5k+RIvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgOjumSm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8CPAs430939
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=; b=d5k+RIvtCbkMAd99
	ztZGN/zNYQrsTobAB1MdAWfas7w9n7w42QWCFCUtVvknWMNocNG5G0b05+n/f8m7
	6fEe6cNyrgDQjeLjZpGJB6dpHW/M+8mBfu/tOd8rSVaVsuyL7SaChveGF3QB0ZNN
	ziWFpkHUlb/GTHtajCl3Sw2N38TLLp/jyT5aeufl/bC3wtv/4d4gM5uJNtjKssTO
	BhZIfWuX+pXVQIrAFtKCF/ynSCGOJK/pQlbsanQfMK5vhQBjhyMG6diw5TBHXSdL
	63JAhKeV3DZMsGmQzSxHxeRNYceGirNiwd+6zpFIUCD1es6lajyXaoF2PtJRoIeH
	5x4BNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhwr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:13:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509219f94b0so44757911cf.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951993; x=1775556793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=;
        b=JgOjumSm78IkTa1qtqIvV3zGMWbGSbxepWoEb52x/DVN0MteFKa5xO4LZM//dXchHx
         FufzmsfcOsck9YWFoDPHruHe1WocFUT228d9lBB+SLVrrQs7+JZ71MT7MO5oC8ZlKZCp
         ZT+PEvjxleay6By+bXHYf+cONfLvRWwxMHEnX0FO5ViIg9n45VBES5RAddSsI/xMCAQJ
         9hb934FPcQbWJTjA9AuAbbCR7ghqqbtjkp165b5vyInL4dLiaWqoFIkptzZBvTR7BgEF
         G/vgpavdFDFPE/POWGfiGF62RJaBWAqchz8LAT1IsVegeGrBHnALsjaS1KJa8tEAJxuG
         HiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951993; x=1775556793;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I00HUMlFpbdKy1dJDRfaFyFxut/3IQjGIp0xHB+nWRU=;
        b=feCm4XLpDF6x1w91PsH5QRgEgCxKlHNvCJ4e8gQS4dgxO1nkU9CQyHPI2SbO+kLGHn
         O/5ELr2ay37W+2Hx9tgzQ4hWSMzJV2IZKjIJDlDYSlRXEZC4TNn+6tB1gyI6JMByJMZZ
         cvB8HqWHkynAmAWGw+zU1AfKtMqT1rfMk/AdxVpkY+2YrlthEji+4usZciQTIp9FI+c5
         O+i9vGydhxwSvhlhhHYsh11Q1+JsceZdy/D/n2M4dttOSbCEI0hh9aq9hWTYRmVHzkS0
         v2zUoFXxyyWkLsSl9AQgqoXNG2ZjySxRzHQuMPmCltqIe9viM6uXrBJz1vfA+LXvgWQt
         NC6A==
X-Forwarded-Encrypted: i=1; AJvYcCXsimVmxs6KQmVms8/5xvfQyksJBblFI5BhrIJAEHte6YXlkTG2iY74nbgd62v5lF85M8dqF110fsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzkmiUyHos60uZGnrONHUSeIrT8udxZQoyFCuatWWHSt0G/1E
	6georzHoTaHra1h0AZ5jdmkLA55J1CSW1T6CP8r9Ze6+WhYPc3DFjvB5HRZu0DA6glKaVO6C1ba
	MNmnhrcaiciaFwjvpSAjPvcxzC0d3OBAndRJCuOHnoLiEUx4WqDj/fq+3WROm7AY=
X-Gm-Gg: ATEYQzw6iHAiJtQfR/puZzgLsoLHHYu5o9oM0JZgcOwW/WS4kfCTmbeeaK0iOQfhjUF
	ZT9NliIXjPm1lp+AOc0wjSC5lMM7X4dkG9cMXBOPLY5gRzEHywrDLuL//pX3XtdZIegq0aZih8b
	9OiEujJ9iaEA0UqkmOr7e8nivHGx/I7h9XBHWt695IfWHdTmSGibT3eoC1rzxjmtMhqqlng0aL7
	NOwIHgOjYIbK01J/IJ1ZxHwKsqmCIlemkXZU+FvI48GLe6OT+zCQkBB38u5Y2z9RaCqQ+CLMLo3
	0/7EepDlPfBuYVAJOm5qTLV5l0+093N/soxwyJ25NFg0QjbBQI9pd/D9uYmvCGsiaT6QD1Z0pnf
	fsqcVIYOvoRvhhc8eo35KSOBuYSyoFZGTdp4bjZZOqlJYOv3w
X-Received: by 2002:a05:622a:283:b0:509:1244:b83a with SMTP id d75a77b69052e-50ba37f623emr195160121cf.24.1774951992695;
        Tue, 31 Mar 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:283:b0:509:1244:b83a with SMTP id d75a77b69052e-50ba37f623emr195159851cf.24.1774951992280;
        Tue, 31 Mar 2026 03:13:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93cf2dsm22769205e9.11.2026.03.31.03.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:13:11 -0700 (PDT)
Message-ID: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:13:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb9e39 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=B9NW21ypFFtUVvRuEjQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NyBTYWx0ZWRfXxSvrjgCiz9J1
 BIYcUsWTNEzPTB65SzsQxMlX+8V3offRLw9QDXV9BjfIcQ60Mv5/rptEcPiqod7FGiY3qU7DzXL
 rMHhfCTDdWVpeA/XCUXGlf/eFL4RVJW35tojIOvZwSNF42eXsnUxdDjGIje/eGXS370ostwPdOt
 tVqQ9x3WEhS0+UoBH1ANT3vCYz0KwYGfsHbYtrPaoB0zoB6WXrWPvxxgTKRRuBvxWKL7ZzAhzza
 hmc4QaTQSlpr549/ddgTtLOM8cgTtRz4RQC7Ff9Toz1RAKvqqcm4fzRlye3EW79YH0C+TN0x0bE
 Tqbn/HkBvrCjzze/U/CoULHp7LIVSPXIkhO312jzuRSZXhXkP7j79JxFE5us7/6ftBx4yK6EVmr
 j/EoCNe1oN60uRanFW8nx9Q9o4/vYoykLX8tZ3ZXKS2qG2Sd9klgiosGtAbOb80WELFOdi2ehj8
 C/10GFHzEco7Iuoy8Fw==
X-Proofpoint-GUID: lsMdNspCHUK2J2IIKB4fiQ210f1T2z0A
X-Proofpoint-ORIG-GUID: lsMdNspCHUK2J2IIKB4fiQ210f1T2z0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310097

On 31/03/2026 12:10, Konrad Dybcio wrote:
> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>> and is not modified: neither by the driver defining it nor by common.c
>>>> code using it.
>>>>
>>>> Make it const for code safety and code readability.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> --- a/drivers/clk/qcom/common.h
>>>> +++ b/drivers/clk/qcom/common.h
>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>  	size_t num_icc_hws;
>>>>  	unsigned int icc_first_node_id;
>>>>  	bool use_rpm;
>>>> -	struct qcom_cc_driver_data *driver_data;
>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>
>>> This can be a const ptr to const data, even
>>
>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>> they also could. If doing this change, let's make it consistent - so
>> shall all of them be const?
> 
> I thought about it, but then it turns out that videocc-sm8550.c has:
> 
> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
> 
> So we'd have to duplicate the entire struct

No, that's not a problem. Pointer is not modified and we speak here
about const pointer.

Best regards,
Krzysztof
