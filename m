Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC32D0617
	for <linux-clk@vger.kernel.org>; Fri, 26 Dec 2025 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766772005; cv=none; b=S1XfgejLUcp170MdB5S20D6fUAkh0o7k7xPXeP/Ee+CKMhZMutvxzxx/04moGKxeF0Jeltmp2+YnPK6sRpoutdyfqZNxBuz+D7xTTFFHw2/smXZcCyDg3edwb81REDIA7TtCCVCyOLyhvQOHAjYSSxHTGNv6RJKMX0uL1lGsdcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766772005; c=relaxed/simple;
	bh=y/I7q0O4Ga58ZlxZPQG8u8oKJCJD29rWNCtbiWnl85g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omVa+Co0lPyTaO0IG4p6/r9beMG7YSn8HI5cmm8F2HSwaDdD3Q6pkenmmkZW/n9q7AlzJfUzh+CL7wv2HlU05M4w53SovzJXxF7zK/X4urT99KKsKSwiYGPaGr5MPu98EdOcX4R9Ff5vwk+eXKzFqwrG72NvO4O109yrmnpJwo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGfgBETZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbT6VYCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGfgBETZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbT6VYCB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8brHU1012157
	for <linux-clk@vger.kernel.org>; Fri, 26 Dec 2025 18:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZfYs8xJ+7MQfozKFwq/ifb0ZE64KSo+e0VJzhZF5FyM=; b=OGfgBETZxSB9JVKi
	du1A8RUCqiqIV1/yG3Qq0JVpLyIduPwsKkyZH9Pj+FpC1U2CnpIe0HjUp/3+VRpx
	TGmShtWSN9wcPa9D3RqEqKOVOp3QLzn1KGlsVWnGb85oPkTmZnltDISzD81UBXGZ
	6AQMTx4Q0auILoSAURFDir3Z2LaLTcbC9ECWukw+PaW8AhFb7Ov7ccTRQqh/ikKW
	hW0N4zPxP1SSCkbNDMoygx2GpjPSh2h2wZ8zQgc/B2rasKUjEwOjlAtgF2lSV3xi
	XFfxw3arHrJR0WuBNDrI1BJbjDEElD2BuxpoP2oVJw20duZfXYdUMIjaFLoFunEl
	bAvSxQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kywmdhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Dec 2025 18:00:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f21951c317so6268208b3a.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Dec 2025 10:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766772001; x=1767376801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfYs8xJ+7MQfozKFwq/ifb0ZE64KSo+e0VJzhZF5FyM=;
        b=IbT6VYCBywhZbhCEIri2QmWyMeZpPN6weEBjHNr/t4yUteyj6WukL5iJjB9BT5N+4H
         T6/EXkmcvQUr0wF/zvlRbzA8gO82yqtzWhtvCTsFak2/w2GzWSIaCgALoJigzK7XOCjq
         DCnGHgECP5F2cYGC1rLUDnL/jITzNUA1K+ldvcJJPKGqEZ1WYqFkbNC0u3io/+3cnfQv
         bE3uHWSbvqZu41aKorXqWjwtAnVfDXZOA2CWtr1AoVdpYuqPYJVP2gQjReAYEIbn3pck
         UwaidpJfCgUm/La454IFS0JHpA4Ki4IO5L4xNNd+Y50oam4ovFHYOftXy0aLOZSRkDuz
         cl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766772001; x=1767376801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfYs8xJ+7MQfozKFwq/ifb0ZE64KSo+e0VJzhZF5FyM=;
        b=paAGcdCWX3znkawXgrnV7gKJksm/xZlQOpRrO566RVdWLpLZgrcNO3zbWOsyCyZ9V3
         Pb3WI4A/eC3ePlhDJIl/wE0Tps3HRytKyh5toqIKiAolgysK5dVlCplw7kr65ispCJ1I
         pcX0Vsnrtys8xHOlyOl91BtgHvvdZssb3AQVXF2ADUdv5RZVfBA2ywTxJOJwvHwnKgsY
         TpQJNRpq5yWoGr0njreth9OVZD+JMHqIMjitNN89lcWD6tvyx8rTnDUZEEFAm7fTKArY
         4J1uI/B32uzPNkmRzvtyRUNuwRCqAFuGaD7a5seGTRkVCrOn6Ska0Dp1PCwLL+ldamyF
         7JbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtyMd9YQ4jOi/dVQ7wOkkRFDTN7eZNeSAD5liEhvBlEQdWUQYdisZ6pOAeL30SyaJa/SO2EvWf2o0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbdbCGeglINfqFiD+P3UtyYId3oJ7J0/dkyfe2SSCKH8dSiubc
	z+dYk+TELJzn/DLBTst/lcajbAsVB0v4Jxlv3Qjz5W5vifmjOw7Cj1Wl7HKGBMhOzyNpsubyu+O
	U8CHZQ5j5g/LHtzhCDhiFXdly7a3MgAE4JUXTMehKaey8JryTHr2y026pOZphZ5A=
X-Gm-Gg: AY/fxX4V5RH5J8lyrnojBnnjgnw3PuOq0bkEmgsO/NsLhwlEQiZHZRWHAGtoWprGeiq
	Z7AMieuBaPg9npPImUXFMld3BLTRmhvPFe73eQTt1LEwNoEJTDYbHrAKMa0WZZ5oIA6ugkVjfbL
	idm4HC5mXLj+fVl4ul1qlbg35WqmA8NM5GyGgj3yH86Ws6mbyBJXJandTt7LN2P1sLP9A9EL8oX
	gxBDgGx+K655DjKb8fF70RqsDAiqlKiMXsKsulGmRAepmzOgfovIqFo+jl2XBM3lZeqkzJKgjmb
	/3Bnuykpqaw0waj3pZqsG309FzBIFk0C5yYzNcgqtC8xsfNK8sBs24SNQVVNOl3vO1JuSHP4GFg
	hrJ+5YV0GPeJUkXSSl1BK/0j9JXhsdgYCoXI3/g==
X-Received: by 2002:a05:6a00:e11:b0:7ab:e844:1e76 with SMTP id d2e1a72fcca58-7ff6420d910mr19282728b3a.5.1766772001160;
        Fri, 26 Dec 2025 10:00:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrjdKe74XNeyCLrdBcvmvuUM9K5k3eYfkt5yHRiiGMnTiJ4XHanppN7uvWarTMwn+8NtSfwg==
X-Received: by 2002:a05:6a00:e11:b0:7ab:e844:1e76 with SMTP id d2e1a72fcca58-7ff6420d910mr19282715b3a.5.1766772000625;
        Fri, 26 Dec 2025 10:00:00 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a1a2asm22487141b3a.41.2025.12.26.09.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 10:00:00 -0800 (PST)
Message-ID: <ce162164-d9c4-43c8-a99b-5fae3bb981a5@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:29:55 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
 <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
 <fa75d5b1-e805-4d3f-9b6c-a21358d3d4b8@oss.qualcomm.com>
 <jxj23rczlysmrrrzdmtaa2ymrntamp2hgkzwnfaxgnnzsqqxoy@l5shaguts5oj>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <jxj23rczlysmrrrzdmtaa2ymrntamp2hgkzwnfaxgnnzsqqxoy@l5shaguts5oj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE2OCBTYWx0ZWRfX9PozjJWj6EYG
 vfsOUQOLDFxUODOgBQVQSnBSWwRzabcqTghnqqbRArKS9+PACArzV9v85FRc1RGSjaz0oPBmg/q
 do0dHqa3SBuxcU/DnK/lZITXr2mxXhJcsRtTfH0IcKpRV9b8wvBANNa1ol55LvVpmFZJDIhmDjL
 +UQNe5xjQE/ihrJhs2CD1ubWON39fK7KFzBwT9i/fWoezfJjGe/0W8eVIGV+0+/QhrJB6nwAzjF
 DsafGn2MwVUT6d8C8f93u1b6zlvCMeI6Y57/amPvYcQVOUVQ0mH+OaKbfLpXsR5qPoVnJxw69u3
 XP8sRUvGJx3uAkWRYZkJHVxvaHsaO7nQ8LSgzkeeeI9sKHs3kHMIHkDeTte8tAOdLryYRNc4a3r
 HlWsJKlt/G4f0WRfBMue/4m++rAujo3tiodc5l1Zry3WLTrWbxItNd2d0wYwA2ObB7SN4AkZ6WT
 XElRusiA+FSBifYeFag==
X-Proofpoint-GUID: dKBOrmcjZdnLzri9Sg52ZaMiIWpWuDD7
X-Authority-Analysis: v=2.4 cv=MKVtWcZl c=1 sm=1 tr=0 ts=694ecd22 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=CGk/GHK3MkyyyFueakV4jQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=62drwnB435mJaXsBqUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dKBOrmcjZdnLzri9Sg52ZaMiIWpWuDD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260168



On 12/25/2025 9:21 AM, Bjorn Andersson wrote:
> On Tue, Dec 23, 2025 at 04:18:20PM +0530, Taniya Das wrote:
>>
>>
>> On 12/23/2025 12:39 AM, Bjorn Andersson wrote:
>>> On Mon, Dec 22, 2025 at 10:38:14PM +0530, Taniya Das wrote:
>>>> From: Taniya Das <quic_tdas@quicinc.com>
>>>
>>> Please use oss.qualcomm.com.
>>>
>>
>> My bad, will update it.
>>
>>>>
>>>> The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
>>>> derives an intermediate percentage `duty_per = (num * 100) / den` and
>>>> then computes:
>>>>
>>>>     d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>>>>
>>>> This introduces integer truncation at the percentage step (division by
>>>> `den`) and a redundant scaling by 100, which can reduce precision for
>>>> large `den` and skew the final rounding.
>>>>
>>>> Compute `2d` directly from the duty fraction to preserve precision and
>>>> avoid the unnecessary scaling:
>>>>
>>>>     d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
>>>>
>>>> This keeps the intended formula `d ≈ n * 2 * (num/den)` while performing
>>>> a single, final rounded division, improving accuracy especially for small
>>>> duty cycles or large denominators. It also removes the unused `duty_per`
>>>> variable, simplifying the code.
>>>>
>>>> There is no functional changes beyond improved numerical accuracy.
>>>>
>>>> Fixes: 7f891faf596ed ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/clk-rcg2.c | 6 ++----
>>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>>>> index e18cb8807d73534c6437c08aeb524353a2eab06f..2838d4cb2d58ea1e351d6a5599045c72f4dc3801 100644
>>>> --- a/drivers/clk/qcom/clk-rcg2.c
>>>> +++ b/drivers/clk/qcom/clk-rcg2.c
>>>> @@ -755,7 +755,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>>>  static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>>>  {
>>>>  	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>>>> -	u32 notn_m, n, m, d, not2d, mask, duty_per, cfg;
>>>> +	u32 notn_m, n, m, d, not2d, mask, cfg;
>>>>  	int ret;
>>>>  
>>>>  	/* Duty-cycle cannot be modified for non-MND RCGs */
>>>> @@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>>>  
>>>>  	n = (~(notn_m) + m) & mask;
>>>>  
>>>> -	duty_per = (duty->num * 100) / duty->den;
>>>> -
>>>>  	/* Calculate 2d value */
>>>> -	d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>>>> +	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
>>>
>>> This looks better/cleaner. But for my understanding, can you share some
>>> example numbers that shows the problem?
>>>
>>
>> Sure Bjorn, will share the examples.
>>
> 
> I don't think these examples need to necessarily be added in the git
> history - in particular since the proposed new style looks more
> reasonable than what's currently is in the code.
> 
> So, providing them here would suffice, for me at least.

Frequency requirement from customers as below.

F(10000, P_BI_TCXO, 2, 1, 960),

For example, with N = 960.

Duty cycle(%)| num/den | d_old |NOT_2D(old)| d_new |NOT_2D(new)|Match
--------------------------------------------------------------------
0.05         | 1/2000  | 0     |0x0000FFFF |  1    |0x0000FFFE |No
0.10         | 1/1000  | 0     |0x0000FFFF |  2    |0x0000FFFD |No
0.3125       | 1/320   | 0     |0x0000FFFF |  6    |0x0000FFF9 |No
0.50         | 1/200   | 0     |0x0000FFFF |  10   |0x0000FFF5 |No
0.78125      | 1/128   | 0     |0x0000FFFF |  15   |0x0000FFF0 |No
2.00         | 1/50    | 38    |0x0000FFD9 |  38   |0x0000FFD9 |Yes
2.10         | 7/333   | 38    |0x0000FFD9 |  40   |0x0000FFD7 |No
2.50         | 1/40    | 38    |0x0000FFD9 |  48   |0x0000FFCF |No
3.00         | 3/100   | 58    |0x0000FFC5 |  58   |0x0000FFC5 |Yes



> 
> 
> Adding kunit tests certainly sounds useful though.
> 

Sure, will take a look.


-- 
Thanks,
Taniya Das

