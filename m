Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D97C451980
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060409; cv=none; b=QbARN9vEX4Q304gGzE3dI9YhoShXstU2FP7umowKlw9JPP0SaDpVuSN1nOVvJJiPICe2AYCT1GLN5VzvEQg8eWcFKRdT9hJKccFHmsKX4zzizJQkb7hFd7ltx5UT+Rq51/Y9kO/q+1nWT7JRudhB5nNi9amy5srddQVv+hCJml0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060409; c=relaxed/simple;
	bh=kR0i2l9OdS85XhRg13B/Ph3oo+0mTzqC0tAoql6xBQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d91wJi0EDHwbTogxBjT5ko7ISvKn2HoxzhFrQsjrmgoP7VHGZxqUW2CN79TwJk6S5DfdU/2CUl786abNDEUK3a0B2r8JytLCXyIxnyDb2Bi3fUYf+AVEuoB29yyRGejfutRVRTxPKKa8KCmzTHfF5L5X0YcT1g8FlFysN4LZuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTQw9N5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHd5ZwpF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTQw9N5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHd5ZwpF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQdYO1976541
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eCY4pKiGRhamcV9wzHX9S3j8IK7dNAsjDICA3a/jg+Y=; b=kTQw9N5ju5wTN5P0
	dgGLsK1A5w5VGfwVFMHPnABPt9+dZF30hltGgktmHcy7iCdf8wMXUXCTs6v1YIcm
	qPmPkSFj/3ldd0FQ08XT0UBplJJSGO3jKrq1k5E1hrW1GOlDo7QL9lGGI37kUIo5
	m+VmG86hM9Ze9Qe1hOcUNPSgAEwjYrg2fW7jfjIdXf3vi/fWSA9zhpZohgH/HP6Y
	QKU/nTl4ww7ayj9oGd41C22sIQG03YYO43Z8FeoV2DNkLVcob0FLUUmQ4uYIvhfK
	Aeg7iFsCG/JIyBom3c63n7lBdKupUMy4umB6vtfF0KXQNi3xC8awGyBc4QXgmRBK
	RqV4Tg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn2vx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 13:40:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so1230571cf.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787060406; x=1787665206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCY4pKiGRhamcV9wzHX9S3j8IK7dNAsjDICA3a/jg+Y=;
        b=UHd5ZwpFZOycxnR8aOTDoqgYDMxBQDKrKYSeybmSmUSJJY+QrGrzvHMJNsDuzkGbiB
         VhXUH+KHT0oV/mQZBlbes83/o3OYYeg4OOvuP6XWrvuW1Iwx+Sn4fN6I5kTIlaU2PX0O
         rwDXqiDsjuyDaSt5XZS0GUjaBjyJYGU3r3oQ+rfgjj3EyFFVEejLwtPYjCTKNm82Kppm
         Chbt6QNeVahjpkxbWH+GzdVk3ShX+Lsnf7uMoeqEixiQdzZaew9AAKeubsr8b+YziV3r
         hvIjWLR4Rs3SgXEgDRzNWKn2UyohDb8GqljqfIeVoHBcLW/GPjMBSft/zKGhk/W/ghpz
         ccGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060406; x=1787665206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCY4pKiGRhamcV9wzHX9S3j8IK7dNAsjDICA3a/jg+Y=;
        b=fSkBiIrSa8r/dKBKGbH6oMzsRC47F2TtEiZfp6qyi0muBCqSQi3LLyPsa9SGvsZutL
         utnJRJJUe/QhwSANCr2FEexePDdAuOW9AifCIwcI3qP9l38+QJXrKEP6yMPezvj5HCbS
         lzUKcV+YsKdAfoy0tjzQyxp7nIPvMxXLusDrRjgU5LMv7+xkPdXC1VvlUEPhGnnjoKDK
         7Yn2BYK5n/wGJNYWot6nbz1suAWO4Q7tc6ylQpFamxuWhnBsamwq9L9sGzpgGnedjV4H
         ZlMbjHox0q23SHhG6FwgB9sE/9L+9HYVkLZtYjWalz9WwGPbNSBg2TqbCy7VrZBPilQg
         RGRw==
X-Forwarded-Encrypted: i=1; AHgh+Rqa4B45fxt2vYWGbDcD8QTFLFWfxlmHH1Ks2StQlt+EQn/X15MIdh3JxVaj2pF1x6G9IoV858kbSRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YysJwe4wTIQpt22bByAg6QvBBKnruQNVUD4vZps8ZYzvY0QKxBy
	C7wkbo4fbRJnOz5Z0iYxb74cRC7msHrbx6niJjp/MKLdTq8VETGTl6N/uDEv2ugsUhBUk2U6Svz
	1Y+yHy6LDXjBSVfIxZorLzUcyE5dfeWOksXOgig9d5a3dlUe0yHyvwzzq37Rl5jQ=
X-Gm-Gg: AR+sD12rFCYKdPZc6NNyrqwLYT6ef7O0o5D5BaMwJQ5LCKW5xkB/JtL4PyFX2GiEZnw
	2ZX4uzeLiLRf3wEWfYEvhd6RU0IfMKQmGt/p8ZVe9qH2KkKVgn+1QQMgl7jOnBrLcFjJpF7PJdh
	rVX/il/pkHlY1KXOKVBUThkGXADAY0KpRvtzvQXKko5/oeIUWu5GPBi2kJs5KtfmZZSymoRKCoT
	KCILmX7hVa4ww8N9N//zRbDJvs8TkuQbWO1lDLDWyrzg5h4LV3yudsAWy/3/eB6kRtNjf8YlLuo
	hIiHPrMwTMRXsxhSquPWC6FgvIYjxRG0NX2wcxLPo7n3dWmcv13/JvLlgngMkav9czMDdcVvaaY
	3wfDOsS3QKS72YDPBtLt5wxWs
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr224933981cf.1.1787060406219;
        Tue, 18 Aug 2026 06:40:06 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr224933231cf.1.1787060405409;
        Tue, 18 Aug 2026 06:40:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc68e2sm161035066b.60.2026.08.18.06.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:40:04 -0700 (PDT)
Message-ID: <22918a4b-f972-444e-bf2d-f3cb0549b8ce@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:40:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
To: Bjorn Andersson <andersson@kernel.org>,
        sarath.ganapathiraju@oss.qualcomm.com
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com>
 <20260806-master-20260805-sync-v5-1-0ff42e9b6431@oss.qualcomm.com>
 <ann0rJhd0T6x9iLG@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ann0rJhd0T6x9iLG@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vW4_EtYcD7XLLEr_CgHUWoL3EDWpP_X0
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a8460b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iMgLnehwJSa9vZC_7aAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: vW4_EtYcD7XLLEr_CgHUWoL3EDWpP_X0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfXz3Qg1qE3EbHO
 h+oP2U5iDGPEZG7+8irTFXkbIjVU8rRahB27AQuQ9Hfe0x5R2nTPWbgjiZFhnVEdUvKX2sG1Na8
 5OppppL9npR5LrCvCfTsvqH4ZRWZprsNs+3N7ZhYp5Y6DJazNunAAzFYDele28yvCnrWh7gUE46
 BGV0deKZGVXUyYsBWqZyJzOvOcvl2Npfpxea290vHoZ9blBib0dE03g/nULBnxHuPZ0AOT1tDyh
 xUgSBKGAVJQnKz+KcT7RIu4iQQrhEufRMxA1pNaWJ8/INF97d/OE1wA9yG/rO73wdVh2uVFqHpr
 TrByqU/J22VIaQbhEUdjlGauwW/xInVmsL3MFiP/fc5YBfZwqO5sGDNhZ/Ho49d2MRosNKEk6FU
 jPW+WNMnHXAbrjCPc2vrzobijV+FpnghlHdTw04FXpp6dgr/46Iq9q5OiGfTbQVeLHwvpAnFarm
 HrfUsTD4ZICKkroaZYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfX4OVAmOllRVFu
 dEh8GAgtiuN4evDLNSHwuRGjbvajl5PS4eSsUoBpklXW4RUzG/+oPYTCqdPF3/Fp53GFbnxhqIW
 Bqcexu4ngABdNSLbkbbxKVx9dlD1Zno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180100

On 8/10/26 6:01 PM, Bjorn Andersson wrote:
> On Thu, Aug 06, 2026 at 08:21:36PM +0530, Sarath Ganapathiraju via B4 Relay wrote:
>> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
>>
>> Add a binding for the Qualcomm LPASS VA CSR rate generator node that
>> exposes the lpass_heartbeat_pulse clock on hawi.

[...]

>> +examples:
>> +  - |
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      clock-controller@7eed000 {
>> +        compatible = "qcom,hawi-lpass-va-csr";
>> +        reg = <0x0 0x07eed000 0x0 0x14>;
> 
> The two 0x0 cells are just there in the normal dtsi because we need
> address- and size-cells of 2. But you don't need that in your example.
> 
> If you change this to <0x07eed000 0x14> you can drop the
> address/size-cells and the whole soc {} level from the example.
> 
> 
> That said, is this really a 20 byte large IP-block? Or is this part of
> some larger function? Will we have overlapping/conflicting mappings of
> this block?

I raised a similar concern, but it seems my concern was misunderstood

https://lore.kernel.org/linux-arm-msm/20260804110714.2951829-1-sarath.ganapathiraju@oss.qualcomm.com/

I think we should still cover the full register space

Konrad
