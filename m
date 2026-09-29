Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92615427E5
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702854; cv=none; b=eu9nBYtY/0wpgbp4suD+lnB7dLBkmuJcf+oYtOCdcyjBdiV5SXUpyLlEPpHCKJVFEFHn05WzRLIvjBxw6NO6IIzf51e2Tnn8Ok6l+SwEfmO6mTQcwPc/A591kTK7xYUtNLMdgG3eWbZpZOgUxb1PFzj6LVNjMq2sYSmTeE2J12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702854; c=relaxed/simple;
	bh=XAr0ib5BIPLtsY2IvBczHBGu8cAfEMxCkyCJpApDgVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D3WsJHtr8InqbzExPERHhjaq7tbxg9csLm9BbiiSnic9YNT7I6z7CeyEMq2QJHyIe86zIvY1bo9zNJh37xUz2zJ278toStgj7qzM8YhhCeANM/2OVG85Xx7LT/+ue27P1cJbiCoGVqDIvuGz8VAkZGOYSFB1G6S7G6/YLKOyEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0PhfIzm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSLUpAmL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0PhfIzm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSLUpAmL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw89u3301599
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 17:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3SUEE7AbKzsNjWqdW9tpkLCiHmZCXAa87H/nM0eXMM=; b=b0PhfIzmOk/QmqOk
	FVyf9GPr4FheKSIazX6ZpB5hFQNl6tKAh5GNR/d/ZVbzld3wLYDvfdGjOyQ3voKI
	XJfEGMIT36vPoGXzXRJFpyFaCryKIreS5dNbSqvqXRR1TsW+odAvrfpYModnZuhA
	dZDb6IvoP4Sc6Fk06dQRWW2Xbp5ITvRx3P4n94xXEaatFET1PQFBtZlq2xEvIpH/
	9XxzPTSFCkSyf4/AWpb1CxgjGQguInWfBvsNK5rYdhbQ5+kBbjEI7kXOh1lQPPzA
	NA6GdmQ7BdgKVKd9JLAKEPxGFoYWVT/utozk0x0IY+o1HAP93KM7G4qSUQdprqbB
	z1KXMg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx19jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 17:27:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so3203818a12.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 10:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790702851; x=1791307651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3SUEE7AbKzsNjWqdW9tpkLCiHmZCXAa87H/nM0eXMM=;
        b=hSLUpAmLTEPWOyEpQlvqwj9hsA+gcinZQBrmuwbQR5a7Y+7wTBNMKMZi2xvCu2HxaG
         tpJPpc/uXgBpWqWgg6nlsSgCubGksH89XUb9NFwKkbSpajUPVprb50tu2KQ3eihcm5hX
         ncYn8RzV2kCzp4lKl4LVx8N55qJUSh0W3OhG3IcpkT4BKqu3xl9R8BY6V0HcUlhhb8eD
         rbhV6oB3okQjRWVq5AEHJZcgGmf64T/Z/ior3VJGwqtZQI7tsUHL42vJdbXT/ptzx8eK
         MKO3CYV2NrAC14GXRKT3G7pWVj4FVDVzJA/Sps2u2pVowDPN27247f73hghiqDwYMH/G
         FUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702851; x=1791307651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3SUEE7AbKzsNjWqdW9tpkLCiHmZCXAa87H/nM0eXMM=;
        b=viNER6Rwju/A/LOzDCpR2EpgnKjzIF7R6U3pEicYG7X7tzEziqXXnzI8gfpQH4Dl90
         rbpzzCSmrGndlkb2wFIxuMDnUxIY9ZkHDMY83052OFaMhgiOm+3brSw091/Jg99msoh7
         qdi348wESByGJpKHgf8xnAxKp1QLlbzWWwqf/3rt7Uemp8+sCmSmnZMwVqKvDjCnYAg9
         Tq3Mu3JgTiR9o05Y3Bi/hw7H+7AE/EBLtV8ihm95TDhCN4eS6NSqgfpG+/axrNderusK
         coM5tf9JqUAvHY0BuIcWq7TgFlEvVH/tUum6pqIMf9eKDFllY07Uz/q8QW7UVZVUkB2h
         c0Fw==
X-Forwarded-Encrypted: i=1; AKwUvByZpN9jNQoTxhBhOsbsNF9MVmTaWAI7jgrk22Yg/AkLut2/019/jmgwRj969uqBMgKGu2BNqeF8fdk=@vger.kernel.org
X-Gm-Message-State: AFuF++nIMXdPmIarSus/hd9u96if4oBpiGSrDD/ebWWdPaNAlekpzsFK
	PZKY/NLTXeKwKUq21Ik7pDbHHVsbgoUHmEj2fS5XG/L/pr92V8g2irDNHsKPs6c95dTnjFn5Dtc
	k02Ib8PSrSiedoZzYbYhko2bMoNba+H/s+7OJiG83nLw7+MkyaMrHtjd0hSWjcng=
X-Gm-Gg: AYBFou0MjfJ/eg9OqThMf+O2RGdONc6WJ7mSvWxE/mPRKPuWOWrom3WK8DyBjcQQfTP
	o6hnfe8rOv+cXKBjBjWXq98D8gpbn3z1VhZKkNfKJxnxUmd92XivNwM9j+5CHrR1ryVuuDiLXya
	4tXujFC9B2DVtsegDrYHEEOIo/U+81JlWKY3VocOD+hJ8bGcBC+DDve+5aLAHNUJCBGswxF8wpd
	y7q3r78myZF0npArJAlkwGm1bGloQtLcDdWlPi9jItaagbQ1BHjcOuHMnPrZVV16Zj4Z+6CiD21
	jOoXkUHo/xgYBXjmXglLJNk9g5aLzVvymLF6RMaS0kdaFWpKeTO8TYtw3Oof6f0wm/H+5WBcHp2
	/ea1gH9Cj70YJf1FSov88NllxbQG6YLS5YQ9FXDT6fU8=
X-Received: by 2002:a05:6a21:398f:b0:3dd:85aa:d26a with SMTP id adf61e73a8af0-3de0e7f02e6mr14024937637.34.1790702851367;
        Tue, 29 Sep 2026 10:27:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:398f:b0:3dd:85aa:d26a with SMTP id adf61e73a8af0-3de0e7f02e6mr14024769637.34.1790702846060;
        Tue, 29 Sep 2026 10:27:26 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.83.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868c9d62afsm280619b3a.44.2026.09.29.10.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 10:27:25 -0700 (PDT)
Message-ID: <b77e8d79-fc90-4bf8-835e-23e84198a008@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 22:57:07 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 00/11] Add a few minor enhancements to the
 Qualcomm IPQ GCC drivers.
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <179065171028.2673486.10540547681271836423.b4-ty@b4>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <179065171028.2673486.10540547681271836423.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2OSBTYWx0ZWRfX410MNrcOiYis
 v/Ccrg/o/cMzMuJIKwHQ48EgZ4ycgkckbqm5Da/rrEkRGH6Zh+HwLf0ecd0LsLk/W3WRY/aeYCk
 mU7L0nh8tI1u5PV+SHion9USoO8FMc9nEKi+a/neG5BUX36VTf4qgOqG0kWu4rtG8y2MI0ikBUO
 ZGpsQljL6nxdGPNpewUjXZAAfwvaE2uAZzinRYi9+lMWLH+svvPvxmhVSLOeIIzg4LzR6AzGQK7
 pn9cYA3XmYP9SpfSZjpjyovqb5NKREjlb8q4n9mgCkWqv6DCCt8nWSugZYSaSthKCn9iw+r3jn+
 CkQWyCTobdWa7nyBziurh3lLTKL2JdgyUsTu1yM2ztnUJYSfSPjStHdJ3fkmhtZJWiULq93J/Ij
 wsxSF5q6tBRGaYrAHcS+1E1f5d93Wy0njwsib5+MQNs4RtT3qlrfUfGXEHQAOFRFJ8Gc8+1h1AM
 gFg0mZ7dAh+rImvIuqA==
X-Proofpoint-ORIG-GUID: 1YCqJjZyzxl5fG_-2fuFXqDlFHA9tQaj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2OSBTYWx0ZWRfX2og/nokmF423
 cm7gIJSFuw14LvpqjSUHrmHQ/wuddpDOqdsT/AwpoVC0dO6325pupMDwoGSIMlbzD/QuMYgbtgJ
 GZgoA31KgP3YOh/H7IFru2sxG1659jM=
X-Proofpoint-GUID: 1YCqJjZyzxl5fG_-2fuFXqDlFHA9tQaj
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbf504 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=1HAn/k65X8NeSyO5TsuCIQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NSf5Sc59ZZly-qZ_PXUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290069


On 9/29/2026 8:44 AM, Bjorn Andersson wrote:
> On Mon, 21 Sep 2026 11:49:33 +0530, Kathiravan Thirumoorthy wrote:
>> This series adds USB, NSS, and clock-related updates for several
>> Qualcomm IPQ SoCs, including:
>>
>>    - Configure the USB UTMI reference clock to 24 MHz on IPQ5018,
>>      IPQ5210, and IPQ5332 to fix USB enumeration issues.
>>    - Wire the USB3 PHY PIPE clocks to GCC on IPQ5424 and IPQ9574.
>>    - Add NSS MEMNOC clocks and corresponding clock and ICC IDs for
>>      IPQ5424.
>>    - Connect the IPQ5424 PPE clock to GCC and document the required
>>      clock input ordering.
>>    - Add UNIPHY XPCS reset definitions required for NSS support on
>>      IPQ5210.
>>    - Fix IPA-related typos in the IPQ5424 APSS clock driver.
>>
>> [...]
> Applied, thanks!
>
> [01/11] clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock
>          commit: 0fe2995196a5973e226f506c9ec705f0dccec82f
> [02/11] clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock
>          commit: 33e6a4864ddc4824f8a9505a97232b7879eb5528
> [03/11] clk: qcom: ipq5210: add 24MHz rate for USB UTMI clock
>          commit: 0336b65aef4721edbc01073dffdf9bc12673f0e5
> [04/11] arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE clock to GCC
>          commit: 117d8d40be1ded4f35f3252efa83607a7134d5e0

Thanks Bjorn. Patch 10/11 and 11/11 are independent of the IPQ5424 
dt-binding discussion. Since those patches are not bug fixes, added into 
the last part of the series. Can you pick those patches as well for v7.4?

>
> Best regards,
