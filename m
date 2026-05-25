Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201732E424F
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721526; cv=none; b=bU2CPf0NT0p4IvpbYNNLEqbLY3xTnFWQV8W7nCgnZ+KdaJwnw//0LfhGVW2cWQedQpFSbRqtE+EtdMHqMTS64Gs+JioXekLQJMFBNYRaOuyptBRnHiGyCTI2fuytSAYqlQpbnDeelBJmwCsoH9eLS9v4UqniUIqniFSgr4c/T5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721526; c=relaxed/simple;
	bh=SvebSh7tS2AuOA06cr9I79bGLooOlLFtdnYvUL/hV/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8k6kSk5EJsx2T70H9m+GQPWvCyuNfNMz+c8Rvgk5R7tAj9qAOmqNE1WqRdOg2TeaZ4lKO7Q2HdbBeHVpyVgssej5lCTlJho+BjoCj/CN3AhjTTC8OJibaNR1A9ZcoA0bGm2Jyrx3d6j+JU4MBhChEhL0qoQs2gUovq8L1Gl/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbkLqVgB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcdcBY4J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbkLqVgB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcdcBY4J"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PD3pFw3604230
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 15:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRvNhN6aJqezHdDB1q8lLVpWsKKH9R1S7sWbg6xeLHA=; b=KbkLqVgBQCn9UX49
	OLHYMmjCcWaGcIIsbVMeRlP898ANbz6f6wkWjXcISYbSVYgsmesgczF8SyM3F7YN
	L9KcGb4ys4tSaiUf73Cc22h/KSLRCH7InmpUR6f6qShfDDZVRqIFO4baSSkewjKp
	xC3BLH1i/iUXP+374Mtp/epohZVxEGhycSrRzVSAI3Oj6MMQGJNMeTxCOmsjgzUo
	+yhK2D9XzYXotoZMwi51GRhR8uMdY1Zdd5B52CFAcBiQRhD0W5xNaBWSlTeJZtpw
	4l3YzXSMFYmPP+9p+mSx7Gk47tkMzDWsIgZTxnY+9dMrwcs4MohauXhVEBLDPm3U
	s1MtkQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqge0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 15:05:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-366122e01fcso9451479a91.2
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779721523; x=1780326323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WRvNhN6aJqezHdDB1q8lLVpWsKKH9R1S7sWbg6xeLHA=;
        b=AcdcBY4JavGyFNfNdjS50s/AAJs93xCxdvdsjPZkwoH5oy40f+AYenaI+AwVRhL5e/
         8TeCRWwagxKoRz9SA366P63mv+GA4USLbsqfOHnja1uGDiHVrQM4SZrwPJftGlS6hXOy
         XODK19+pgmfu2oZ+m8TMGQ/L+Y06VzGMVsDTTL0YRy1+dLZgyrXZR6X5Re89s30WrkfZ
         Rmi8b3BA7TFxnayViQRirI8F5AJ7D5539S4vdQcAqKrRNxJjOdRyR3INpv6mafC86KVk
         m89Gajet8gtofKyGS4RKDRHdg8jGOFDUmhB5RGqluKZJEkchhQs0WUOuSq1G26nw0XT8
         2qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779721523; x=1780326323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRvNhN6aJqezHdDB1q8lLVpWsKKH9R1S7sWbg6xeLHA=;
        b=I6u8hc8fyyOjji/tq9Lay63pfEMMTMXi3PloJUiG6/aM7ZaGrnrB3/smQ2dol3W+7r
         +UrZsNlR00bS5AFZw/Nk3BS2VUYT2sa8SI5hxP3PxgEYUq8BTiUYiuLC9DNfC4Rx7QKf
         Gpm1i8gr4+SfXXN9oSjEMyh1wmFcskgYLM30ThMK9qMRjot3/dzENRlVWNIqot6xinnc
         caZaHKPar1W6obSPk4mX2z7Xxgs2Ls0GY+0DGXN0GvIBz6no2cN37jrqU5M9hqnwk3Cj
         HU868gN3oJN8HFKY57dNDYPk1iNrCsD3B4xgRp5vRlPfKIBqYIymt6JYFDMP3dbZ7drw
         sOmg==
X-Forwarded-Encrypted: i=1; AFNElJ/y2xXgPcvbd0dVL2ZR/4Bsfs23tCPjB5CSOsaB0hlDg9y1d7aneIIH8DM9pF2B/jtTjrqxSxVb1TM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi+vfTHcvDkMYdctazx/4WP5AyKj65kzoX11IoY4As5e4if4ON
	q7dfH3T9VtCJ6AeFemqOOVd99I4W1cuVfO4I4ezWtVymrt0WTjlV3v8WYTMhFvkI0VNNyK0CnZP
	18gBh1UlwkfImbTdgmjTDf8WWyqicv3ciaQUmybnQK3bLR+JsZ4l5vTTUmsETzmM=
X-Gm-Gg: Acq92OF6WZ58UwVOdz+m3igiFD9rCdpqBuIFkAHicJh0f8C+Ohr8k3wgWOllypTEZcT
	UGVBVN+ZqueQdI7KoKnMNG75ghCRjXpyWnP3xE3r1MgTbF45bI5FUYZabdH79nwNJWInERdec0Q
	4IFzsGnbAON2k8pysPN+u6uo/Rqhh2FaJignZj+Xc3kU0S91BFERkfgbMTrbTR+lVmHCD95vlqN
	vwdlTpZWHiUGisNZm5Bh28rC8X065kg+wXnFSr0V3yGLziyGQjfh61YGFH/J126e+HIYKKiCWqB
	5w6PGW8vbtEp1Q3d1xaKq8Dei54oRNsWCFDMqh2rQvMg4CeDfpY0nhMN3PyxOw4FR26zjtV4XrE
	C0swq9zFefrhWPrPfGIMdJoLBlGhfGy/0xrOCIko+zu2z3MbY4AwEZfvldX/zImhT
X-Received: by 2002:a17:90b:3f85:b0:369:73a:3266 with SMTP id 98e67ed59e1d1-36a67765ae5mr14177750a91.10.1779721523449;
        Mon, 25 May 2026 08:05:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:369:73a:3266 with SMTP id 98e67ed59e1d1-36a67765ae5mr14177701a91.10.1779721522796;
        Mon, 25 May 2026 08:05:22 -0700 (PDT)
Received: from [192.168.1.6] ([122.164.82.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c680110sm5197020a91.4.2026.05.25.08.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 08:05:22 -0700 (PDT)
Message-ID: <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
Date: Mon, 25 May 2026 20:35:16 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
 <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a146534 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=oxN+qIFH97EF7WOLwtTw/A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4ODDM3dy00CILyiZf4UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: aYnh7Y_8_LbIj4a0fk8Ksm9N7HVt6YUv
X-Proofpoint-ORIG-GUID: aYnh7Y_8_LbIj4a0fk8Ksm9N7HVt6YUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE1NCBTYWx0ZWRfX2jZv+7xjfiZU
 XbVAYDWAI0OmVH7j/HVJBsvvjlhSF+1UfLjwfOfb97L2SsiUaJRtjmBRMUaRvHxfTiq/dXB2/mw
 Btw9SiYNsj9nAAjuzMPqvoNJQfsI35dRzcsj3/Fpq9EcxLSh0lIJFyMjkw4L1xInMK6upn0TytL
 sm1APzaEHYqME3PzHRkirYk280ko9swMLyvBF03Oj90ZBCWm5RYavHf5g9UeyC744lN2zCqVK2i
 0u6siuM876TCQhzJrSBMKIh3lhTxjARlZo0poe0Cs2cCYeiv/9jmmPP8cgwbzFaLBnyt/fK5rJT
 aTyzjW0sKPvB/wIdp2/urDm2DD9wKp1XG3pPoKOxwQbWtvuLmbn56i6wH8HAEu86TGXgytJ6cdW
 GvKuTkG/fSjgMpta6j42/G2Pz2cir55kxyxLt2lHeYNWdLKftgmOluoBCEbEU3Gd6rplQN63XMT
 7E4mnWquBKd+wgC9DmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250154


On 5/25/2026 3:39 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy wrote:
>> Now that Linux has the consumer for the GPLL4, drop the
> what is the consumer? When was it added?

PCIe and USB are the major consumers, which got added with the below 
commits and landed in v6.16 and v6.14 respectively.

ab7f31a3830d ("arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller 
nodes")

113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")

While I was revisiting the code found that this flag is not removed. 
Hence I sent this.

Shall I reword the commit message as below for the next spin?

--

Since PCIe and USB are enabled and consume GPLL4, there is no need to
keep the CLK_IGNORE_UNUSED flag. Drop it.

--

>
>> CLK_INGORE_UNUSED flag.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
>>   1 file changed, 11 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
>> index 35af6ffeeb85..3ddd4b3aedea 100644
>> --- a/drivers/clk/qcom/gcc-ipq5424.c
>> +++ b/drivers/clk/qcom/gcc-ipq5424.c
>> @@ -139,17 +139,6 @@ static struct clk_alpha_pll gpll4 = {
>>   			.parent_data = &gcc_parent_data_xo,
>>   			.num_parents = 1,
>>   			.ops = &clk_alpha_pll_ops,
>> -			/*
>> -			 * There are no consumers for this GPLL in kernel yet,
>> -			 * (will be added soon), so the clock framework
>> -			 * disables this source. But some of the clocks
>> -			 * initialized by boot loaders uses this source. So we
>> -			 * need to keep this clock ON. Add the
>> -			 * CLK_IGNORE_UNUSED flag so the clock will not be
>> -			 * disabled. Once the consumer in kernel is added, we
>> -			 * can get rid of this flag.
>> -			 */
>> -			.flags = CLK_IGNORE_UNUSED,
>>   		},
>>   	},
>>   };
>>
>> ---
>> base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
>> change-id: 20260525-ipq5424_drop_clk_ignore_unused-90bf48733c6e
>>
>> Best regards,
>> --
>> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>
