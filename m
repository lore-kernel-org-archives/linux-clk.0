Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674A343C063
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610756; cv=none; b=WmLMi14BxYzJDN0YzchO86ReMfPw978oc5Z39MBzHub8Xjtkc51oZ1NxmRzeGMbSHndOjv/alRLOvtNA7f98L+SozwbFYCEAQjwXyC4zzCupB9y+meWfXsC7NWOL4SHFB/c3ip+wtwdl1oh1ngP3fLx62SOiB5jArTgASNiiik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610756; c=relaxed/simple;
	bh=IQKIBUWJRljbzFuRZD5swT7UNFw7zs05w6Zor98regM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r27f2Cyz8sWASzpwVc9Lk1IYxO+SOobdCMNTcNK5TrnE+rkaKMLOtLbcdlAFdfO9HWtDLsHKsWDRPGpKkN8UYsMNHuY1pwFG8F1OUjYyY3nAFeQdi/2XR0QVhYOl2QCkaBPnrrCVxCOJw6jg9hUp1NhKToPMSV5ytT9OclDCwkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sbwks8Lx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+zCz2nU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sbwks8Lx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+zCz2nU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9Tex1414887
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 11:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZQPWjj7slAqgoZN9nlRgXxKY7urHNPS7OlUM/w31FM=; b=Sbwks8LxAPsLwcU/
	ur697lpgyRLak84Bd9T3zTc2Qj/W1qcUyEU0M3WqP2SvcjQcvUyiq29571Tn9kwe
	cuWUKg7hAby5j3Ms3IJgu3ZCXJ3zu+EW6RxKIMtVdpqvHsieQzS6sehjYgq56N0h
	rwQB4fTgaxcqn9R4lysGh42Ll5CPscbr7pvLZbFbojjH2SIXNGLIai9KJyu3pnL9
	n+ROH3FB5PooXV0SS1Hp1x8f9O78EOn3nmmfVazJyBZ2LkydY8phmuQtFMwZJjTt
	Ff+uyHcMMtT9gR5OXGdb853PY5AZLlj2JXx1sfYyLjBxHxFzVGoNxmOiDtQF6TV8
	YujduA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct0pu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 11:52:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccdd99d20dso13344826d6.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610754; x=1782215554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZQPWjj7slAqgoZN9nlRgXxKY7urHNPS7OlUM/w31FM=;
        b=V+zCz2nUlnq6poAKio+MLQTt5zHsvkbH3teR+p50DXCbT6uwCOkvLTqfBUX/1P2Td5
         faf1s2f7lBq7IL9EGTi6OC7Gw+MJKv5BZUYT/dTUKmqWGvkHtz4p7osYmEXoGQxhq3VA
         MOwpKO/1SdEzhyY+LRcqgWkXuNo29rnRS3+1MdVTnfJQnniqv7/QY+XunvWz75+1cLO8
         /iWiTUf56n01ax8/PdnKQnjGujEgmwIP0Ssu4debEYgQ97/nQ8ym/YQLVrMB5dE+hFwC
         9gEGZrpOnjKEcEph1Z8RfHCL3EaV/YEddHsPwT8BRH6rSykKZQvbRvAgW7n6SemZZSoy
         Hz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610754; x=1782215554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZQPWjj7slAqgoZN9nlRgXxKY7urHNPS7OlUM/w31FM=;
        b=lciMZY+V6lcXuOxRt6iqa83CxILjeA0vzAwplShhdtTi4esEu3zRZItrlWB42sgz8q
         DaKpL3jU3/CiY8kcI7kU2RxVblLWCDSrmekYon9TAFRcZoqDpNt26AznqB5QzRqKVn1v
         psi4ZUzTt2sjq7qcRJvicPZWqVZzEnnldZTCo3s+169R2kv0/kfHZbTNyHFVRmz7HC+9
         rw7EDq19V8IBXMSLkiExYWn9iHDZ1f7o/XqGzgWLH7MW6gXbIHzH4S+B58j8lLim+3G0
         Rt20JnJFhHvAqmobmMbIUYYyH3lfMoaWWBseQWXlOSptroo77biZKkI+VaS0syi9WJAz
         Ucmw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ofcc8xQbrMnRwJhLWhObUgN7OsUs068yuKzknEIKim4fuE7L207q42h2SKW+ot6nRtrU6SCWo/ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA0yS7fi+2TXwfIARhsv9x+F65OtbbyelrmIkYim7OQ6nLfXsu
	Bm1k3QrJ561+6ffu7ntR0g8KpqDx3IFkDQv6l4RRyQUQGkBS3Vzi9EXWaVyofDbTBotPNXIC52R
	ZxNzIQcCt2oibzp989XNJyhfxX4xIpoAKu6dKZkGFePeY/DB64qt9S9S5QpvAQE0=
X-Gm-Gg: Acq92OE87YlpFiWXnwIqmw5mp+xl3gqi+X7UfaYkJFmhFNqhL/ciaRNHGWaSgo9v95J
	Qce5xCy2A3fZ/s3NOWEKg3KlR2j6trK3OZQubOHZIe4bGFaDLjxIbe5aqvh6c74orXbMFe/zzay
	9F90mfulnkcbon5lF9EebquDcYVqaZgDJQa0q2FQKvt0FMWRjl9leOyNhlwR4NGie/NKbJfPfQ4
	YsFoRhjNdTP9S+RY14NlEi9+tV6qaCe76GvERaxzEj3yp9vBYXlbExpW9IftAU3H/VNMFp3USTZ
	WDGY5S19hDU3CnAnzgXwJrnrn8VC13g8DpPM8EHqh28ZCVxyhqhfaQnOZDy8Zro0AQ6AkqDnbus
	/iaZQVUfEoj+k/QCe4nL1WZg8IhjGaCyWrHGWH7/t9EViog==
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1644855785a.0.1781610753644;
        Tue, 16 Jun 2026 04:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1644851085a.0.1781610753209;
        Tue, 16 Jun 2026 04:52:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm627583166b.27.2026.06.16.04.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:52:32 -0700 (PDT)
Message-ID: <1e6eac45-bf28-4ffd-81ec-b3a2a24ecaf0@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
 <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
 <73a30753-527b-4662-ba99-2ebc3878861b@oss.qualcomm.com>
 <ijevonu6ib5daesvvzis53qh5ztufrdlqdsfmx33kiajplqwhm@muhxbznlx5k4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ijevonu6ib5daesvvzis53qh5ztufrdlqdsfmx33kiajplqwhm@muhxbznlx5k4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a313902 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-aIog7HT_t0rU9SwYjUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: DI-9iexPMzt7qnvnCyfuWdJAaJg0JiMA
X-Proofpoint-ORIG-GUID: DI-9iexPMzt7qnvnCyfuWdJAaJg0JiMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX7kEnX9qlD0jl
 mxH9oufBidLnOPqOKsfhIHXgO5MOWJya/23jcqva6zudnYROK2V9f4NWLwlXtmf7qd+JQgsuPhi
 gkxXjUSKqD6NazbLBEEkLCgg4vazcjNNgUpxdTjfIZ6Czpt+bzJS0SbxfZVEk6qStfs6RFrSWzA
 0dli0ZLEi4fJk+1O93GwvMmzSUvBY6wV+Fb0xD4jpPwYf6+mNAMsThhrivp5Py93+A2lWs1LhQU
 NWQPYP4nYizshq79Ndga1DWXnVkYxaoNfBv9WfKzmT6iwItMNZ6MA1mX3274U+9QGujnUZZUFJz
 Ra3+/IqfFNfzOO8NymxcPYVlCrbPCkVq4r6ylNJFjVGGQm2zyOATtvstl5/Se7UtuB98A6BJKwZ
 DU16sTTA3bT1kI8+MCwFJ2iS7k7SlYyoalpNhPn5V5eVg8fqhJqhxuPe8X0SETLPm8u25E8NbAn
 vj2qE/hT1R1JA6RfKxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfX+4dM0lu3RMww
 9GivShSim2XFo/qSM0CJ1ZqZdKw9ox3gQ0ft1L4zMwTFcV2AEKaLK5Fc5ppYM2+rHykYQXJWEzn
 7YBO36D5F875epix8mMRsAXAa5t4+mI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160120

On 6/12/26 9:55 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 03:52:09PM +0200, Konrad Dybcio wrote:
>> On 6/10/26 3:34 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 10, 2026 at 02:24:24PM +0200, Konrad Dybcio wrote:
>>>> On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
>>>>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
>>>>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
>>>>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
>>>>> MMCX voltage levels.
>>>>>
>>>>> Add MMCX domain to the Iris device node.
>>>>>
>>>>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
>>>>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>>  				opp-720000000 {
>>>>>  					opp-hz = /bits/ 64 <720000000>;
>>>>> -					required-opps = <&rpmhpd_opp_low_svs>;
>>>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>>> +							<&rpmhpd_opp_low_svs>;
>>>>
>>>> So the computer tells me low_svs would be enough for PLL0 to generate 720MHz
>>>>
>>>> Is there some transient dependency that bumps this to svs?
>>>>
>>>> Your changelog mentions you altered this in v6, but I don't see any related
>>>> discussion
>>>
>>> There are two sources of information. The "clocks plan" and the "pll
>>> info". For some reason, the clock plan doesn't reflect actual PLL
>>> requirements. See the info on the corresponding PLL type.
>>
>> OK thanks, now I think I asked this already in the past..
>>
>> still, both point to LOWSVS @ 720 for sm8250
> 
> Not really, PLL type points to 615. I've posted you the screenshots
> privately (sorry).

Alright then

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
