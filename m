Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460792;
	b=UDom8XB9cIcKwg/MVZgz2hb66f5RW+3uujZi17DoKPlI1bA9QQDDBEoJfWpFO1A+PzuP
	 vTxVQ4v3zXnILRR9dbbbG++G+ReDbHmJGUAdaSoLtgeEVatXi2dXFQ4IbMzxi5CsmPD7u
	 j8u5IiOI4iQV5F7kUm45AjLcjsUNc6vAsv9IFPxRzlp/IeTojJKKm0R6wTbMltC9u+Aht
	 x+9bGVN/062S4YgCudYqBzdSD/Ly7PMABGGGOfrNGkqD+Vt9fp49Qyd1EfzygM4/xtVOe
	 QUoTJcS9C4uWPEi3MqnwlOodacDNcww3Y1M/Cu+x0SwNkud/Dz3PDyprng7bu2Gex3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
	b=vtv5BbPUDiXTkIfv/jVVSicnpCSPT4K7jhjUJr2uQTnDJqoFCsqFtwCtLye7uLp8Wuzn
	 rKUIeKiFk2jkEL9D+hBVqT9aFvdTi/UPMcJV2YfJx2bdXpH843Nm4txdDHPRqXdNru3/m
	 SzKphEJYbIBovNtuxM74+oTUyLvSzfiJkdjnWDfJENAPw9WVnn63OJPYa8fUm2axQowOj
	 hWXGl98WgOjOnRoxdyR1hS78S2jWGJ8K785kSgYfImtNbZ5oHo8Q6jBPXh2pikGc5E9Te
	 hmWjjgi/rZghZ9oKLhuslQB+Y5O1FJSP7bLdL2x2UeEmQHalVQ2+BRaKJoikdfBDBnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V2Ndm5ps;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlsspv7T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E935606A31A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E935606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V2Ndm5ps;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlsspv7T
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGmbu3730185
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=; b=V2Ndm5pst2LttLdd
	m2l7dKji3WsB65MiKKrgjJi5XWBNT1IORbR5UcCrn8c8eDP4lw5+ToHAWveqUXy0
	923iq++6EIIRIFA7wcpqYjkGsJCqT7TDW/HLA9qUqCIOrJ49uwZN2FVju96mb+rL
	AIXjyZkyxLZFvWP/kXHZtesVtPfPKmATb0wtix74YW7lemI4ofh9QDVg6wxtSat8
	nop23RGxiP97gPh4l1nT8aO77dXsEFrSgThlUo4HXyulqXZAsjokaPaunJQo6FQj
	53phjBBd2Pz84kVSK+Mic7LBnAE/wrPw6GkxilHkjjnVqTYPjeVzm7aOhoiqBwWP
	npA7YQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd327g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecdc7807f4so135897e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795460790; x=1796065590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
        b=jlsspv7T/rnV6gJHWwM2AYbxAGAwKfPeYhFnWXxWXdATDKtm9HUgg6QkLNjMf5s31v
         Tv9HE8Ier3lqfhUSA9LJHyDjRNtHhtADMuAHhntVMEOzplIoLh6lYjVcnEoS4mnKSV5b
         mjQ6Sda403fd86OhqclG406qP3J9WsCkDLtuqs8Wsz4rU6x4Yst7QmVghALlzRapTWn4
         xIzI/zMxMp1P8YnZZFK2A9KZg0VdHrz+U0PqdvXgyjU+luoji0vsz152H91Pi+ba3nrV
         GLSLZlCW5S1VGz3iQLfVItw5q+0TbAeipCOj/rhpiyd0c2kWmubspMgWb558y314RAk+
         nShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460790; x=1796065590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
        b=iMsBg3PiMivHhTlhO4JC7bA7Au3eppKpJMZGj7wt04E/NN/hopJoA+dNv5Bnu0myNW
         qSBiQSPx93wo7UL9ITIbB9qvzD+QtGccYWo4crVp4syJq78XVkzVB3/nUnAFAxB/Pg0Q
         EMbFu6H3A8T1ImFq5L8b6fJ/0G+nq/fioQUu4rz1zTq2YS3zv2BYvliNDXilG+CD+3uG
         VwexyrXkPjP3AZyB605TiFtBtYy4OXOEVdXDc1nNEIAeSL3mS66xU1TymOl6m03uysQK
         0YiTw6aWJIS7dM/1xD5rQ+fhvx/0ru+OV/OoqioapOyZgouYgM+vPd2emkaFzxTSLCYD
         Q2eQ==
X-Forwarded-Encrypted: i=1; AL+hErFj5QOMz+h6mwUgry9lAp75X7qtqC/eb3+2ya4yFh9CkHvd1heYPnlNKDZOLCJ2d/OLpewlwZdXB+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MEMwx/XGxYAtu5KFESUTMMzIbUS7Dv+y0GmegQkW9TknEujqR
	nIc1fxPuz9bOVu5SccEHZG2WLXY1hO85zoiVe7Gwuvxh0QmYeGQBr1CO2Ov/Md3o72WEmrpfKG3
	g+kRbjU+PRpilwSBXH37K6ZDTwO/z/ZrD9sv9MmaoZtN+Kqw15pf4690qfIChEYI=
X-Gm-Gg: AZFdTZft95AcGTHsQF8T6YKwGwf6Ntp0ToBrjAvOh+qffVRf78CRiIlykwpbdRthP7C
	LNoFFt91EapDTYYrjH17cTHJqu3SqEDjFcy+JkGAkNdSGSGnlrF6qbkJhWbaJziFWOIfy9qhDsk
	7jYXQaVfdLQ2hwFsHZeiO9QKNFH3BxCGGuR3zUhJUi93BbDwWeCeTQTh+0babjQuRZaNCvsI5Ax
	FOSphUyug+m67GjtZ0jHjo7ajUlxQKswgLh4AJGV3acMFTO2h+yranB1tW6dkuh0LapZbsPLkBp
	cOXQxqPmUR7eHie5sD8xclLz/MMJEoBpAQ+dTPw7WdUB57RoPEa2o6kSqJIU7F1sTCMjUimGv5o
	uLzyZt/QeecOqftsdw/8fBhuwpZuH5DZV9rUzqDEcAKGndN/LRvkB+oaGXOGDFL3vxPelsC8=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr7041954e0c.3.1795460790165;
        Mon, 23 Nov 2026 11:06:30 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr7041913e0c.3.1795460789779;
        Mon, 23 Nov 2026 11:06:29 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm3651400a12.30.2026.11.23.11.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:06:29 -0800 (PST)
Message-ID: <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 20:06:26 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LLZZXAjUC_jLbY3IKTbJ0LZqQtvutmWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX7PFhVhCWotdv
 VOsFTYxjhyd+7orIW54YcC0eDiUM+i4Adx+yv9oz28Kop75qn3Ggq/++R2uWgfOJGdreHAxcgo6
 bXxrTzM+e+1u3/7DmqerjIWxX0UoWJEyX+qXvwrmMak42lSoOPIiDFdYHYENN9m8cUsIdHMas2o
 TY+6BPRds5jF5kRMznTKIMPULAQxvDA08ScTt5kLlgowad0mJbM7mYs3G83Ey7fmYbtYpMumR+l
 DZ/qDc6omfqfO9/XmNo4RdEQVHZLFH1yUIcGvHHipv+MXKmmne25D/ZVw8YGPGwyhkPmnlOHPBY
 7khbmhdbXU/iZWoE1zUjTXGVKX1InqpRBVSXUATL9BAscatdeCi2A+PlfdrAC/IkD1p2M2nNqfT
 pUJaGmMV+9sCz5cy2IrzFqdVnuB+nkZoGdZo/IR0yH6ibkzD0O3Ru/mpLw3NRYk5J+Gwdlf8oRc
 jLozEY/08xFKVLLEIsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX25ERJZtZK/JD
 onuz59LaLJSMkxAsU7WvR5udB9GyXy3QV089wiJTMflUt9peuRan6b7ylsXcqz/HDWSWICtdRKx
 00UXl73c8rE6UMWrdM7H6YLHUIIMnYg=
X-Proofpoint-GUID: LLZZXAjUC_jLbY3IKTbJ0LZqQtvutmWu
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b048eb7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=09P9ZdklQj12kDAbNyMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:17, Konrad Dybcio wrote:
>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>> currently used only in the socinfo.c driver.  There should no and there
>>> is no in-tree DTS user of these, so none of these constants are really
>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>> that part matches the concept behind DT bindings.
>>>
>>> Driver have local copy of these defines, thus these can be dropped.
>>> This has no impact on in-tree ABI, but any outside users would be
>>> affected.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> I think we can move it altogether, to prevent a situation where one has
> 
> We cannot move all, because some are actual ABI. I could try to leave
> these ones only, but that's a bit too much work, IMO, that's why I cut
> everything at ~450 value of ID.

If you mean ABI as in "used in DTS", I don't think that's quite ABI
(again, looking at the glymur-ipcc.h case)

Konrad
