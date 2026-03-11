Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5032EEC0
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 05:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205401; cv=none; b=Is8TFn1X5W4CMPNm3utAag+Ax91D9AH4d4kXCkMB4/9+hVkXg/VliHbc0G1BflWfTSQeNWazXnxkDJQqSz/BAdSAuMHD/EkoUHWMZiHGfezz275ZI/VdGlq+XAh64MMO9tfpXReVo0eJvVjskbyHP/nnsoCrVcFcV99nDpJpOaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205401; c=relaxed/simple;
	bh=e8H0Xw+wh3kNLq/wPXj3gmYnFyaAHCTv7o59qJP51DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyr4obJJ4keisPIh5kr3vC+eO1HYh78Wn4jD5V8r+kJdnw8EPkbdg0XRlyq+zQhqHHqd0J6RB5nG6JuBcmfZQQm1wo4f6qXYYp4g1SR9qTfPxO9L0XFChtRvNWh9Xxfp4c4Ky7NVP89FAiOwkAeb9SkHfSp5wP8rTwRmq1/y1nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qdcld3cY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9WaLO6W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qdcld3cY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9WaLO6W"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2K1ii1572980
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 05:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0QC32ihlZ4NP7LPhxUY4DLpId8PCXDb46OZwe69QQY=; b=Qdcld3cYFEYTHWhI
	JGvF2z+AtXUDaIpXwbe4pIjSacdXGxt8mJ2b7lDYR9MsA8ldDZua78DDnycOaEoG
	aQn29Nun43M87IahQ3n9tdgcXa4tOJ9SelqK++RWONkwAzwakdE5d9/WYE1V9e5Y
	4t0DqQESN8H4aJ6KogrVL30wzidC1+d9SPXIBTTNqq4CoIYEFMqkN7fqfUkkChmZ
	En859WhxUnapLNyEOjisbxGWiBr478tF7hGyunWPi0yziZLubBuAa7g2cLl4tLNH
	rULbFApaiEOQ12acFOZB7Wtk6riUO5vxIWsEXkjC7mya4+3fMKQMWEG48rcMdNCR
	Y6++jA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgka08u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 05:03:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae65d5cc57so429165605ad.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 22:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773205396; x=1773810196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0QC32ihlZ4NP7LPhxUY4DLpId8PCXDb46OZwe69QQY=;
        b=X9WaLO6W/F4E+vIwuY1YOLZcl0zWfp2uOBcRf1bmFJ3W3twWyHsShsWE8+eV30cRRJ
         3//CU/tBoaeQ7rNiWWD83iOejwiUN3zqnyavyqlf0za/zbUAzXevXFrrelxo8le68apv
         gj9MfWL8cc9gnogN4ZK8wtOq8NwyFVUsoGJLsBdbVVCNFXVZYe5PrvnoS679yyExyrJU
         CW/g4iVnV4uPMuQaw7b3epXQygNl6RRfJndWENNIXBHeQ/5EVhJWgE5FbE2J0Yle6tgF
         DW4OEQINdP+jubm0WvwrjG4ldG4Q0x3kdQmQ7W8km+xfU0Oe1pLkemll6dHQY/ZoI4LQ
         Zjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205396; x=1773810196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0QC32ihlZ4NP7LPhxUY4DLpId8PCXDb46OZwe69QQY=;
        b=fRfUhSZMeF3+98M3pUFHvCkQQkifwRaOSQqzwmCiBi03WCHkXGlDddpKPmlIULTH1W
         L/5JR7lwAJyGQ+Jfz5MT1q/lQbPBzsjoRJgeuv16BiIchGcoQYd4h1S+ahEmw82Oqk1E
         l+lcD4KLGcxvwIfB3lD4H1aKKJkJBtYtSWZyQYqbRTVjkWxLKRqEwzzpCLAQzO2BL3Dd
         tbs7Vf0LYNNx4dXGRND4RbwYEiEiyo2YtX8PaNVoJeZGSXNbditNirg9gjlCfKNEbiwE
         QhbMPdYI71Z3cDyGYEOvFZyUQ/lO7sMN+4sgEulPX4ZKl5454GTIm+QldaAe7kTb7f7W
         hPLA==
X-Forwarded-Encrypted: i=1; AJvYcCWJM7RLUwMEutRhzhel2BtbxwJDM5AZzeaIYFR6YmH9HGRXhpaoRiQqQdyxSP4yf5+p7gKKja4Babg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4o4llsSD0SuMGoW1aAwIYBnmWh82GPDnSGjnted/0cixPctR
	etNF/sd8q4sHFgLx+o2UP78XL/h4Au/R1c/qm3wIy03bDj0PS0yKu4WOhxCna7lX4RL7neJ3WFL
	OtD4OREGa6+2q4RUYMSe2yp2wyoNTNZOEHwaTxpYDEkDU+M4QlbXbhKYQkaqkCLIwd2JYQI0=
X-Gm-Gg: ATEYQzxnjiwPoDW1ZFmSqaeXLZ0LfWHk5i7BqRFi1v5ioSiMsmDG/NQqZQfq7HyKXWD
	9LdocdOr3HBOlO1Rb6jiusjzCrnJuLEzrk5aMtcsTErli9kz9BuECjsvn8p0Z6CYdr91wKhVJs+
	6mRVStRd1qlAbHUD+rtcUVk+sZZrEq0p8/V5M2ZNMFFuOITD2nwA7LyvLyGjsoWpPuhnwjgghqJ
	pxCajfOVQ0dwnbfBDDjyN2eMvwXXiCKsR+fqB/9gRAHnukDpSZSb4F3fse7ErINqHjrW65jdU9t
	p9sgEm4qIIv3FjtxSDHHQglrG3tzNIhjhzjVTA/hLID9FuIFjQtuuJqRkR9cNK4xs/UvQorJ3Mq
	Jph4LTJVUJChFGPUofqQUF+ni/W3Lap1Z+rwI4QjiFE7h37tYtg==
X-Received: by 2002:a17:903:2f81:b0:2ae:5745:f0e9 with SMTP id d9443c01a7336-2aeae76fcf8mr14505035ad.3.1773205396523;
        Tue, 10 Mar 2026 22:03:16 -0700 (PDT)
X-Received: by 2002:a17:903:2f81:b0:2ae:5745:f0e9 with SMTP id d9443c01a7336-2aeae76fcf8mr14504805ad.3.1773205396085;
        Tue, 10 Mar 2026 22:03:16 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34de7bsm12095585ad.53.2026.03.10.22.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 22:03:15 -0700 (PDT)
Message-ID: <fa004f9c-3c5b-45b4-8ffe-28f665671fc0@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 10:33:09 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: abel.vesa@oss.qualcomm.com, ajit.pandey@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        imran.shaik@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com>
 <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dK4O6ghyf5kty_XPR3eL0groAGHg9KR5
X-Proofpoint-ORIG-GUID: dK4O6ghyf5kty_XPR3eL0groAGHg9KR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MCBTYWx0ZWRfXyup5asRXsq8g
 pvL3959rL594mhDOi2OZMhi24Hmq7AVoJeI7D9dSJyWc7JWLsUdrjK5Nq1fBLiqQj6j7MdskfFF
 CUTFahPhB9vIr4RLbROv6JgSzwEwb6nPJYU1F6Yw6y2bKgiVG112mJU7m3Kl6/jDXqty8JsYZcC
 SG654jzdMBSh/2MDIusk6ldQt58+7/bG+GedbrLLcTi575IbJ6CcH5Rr8CtBGlXI1V1UxUF5rzL
 7mXMidDgs/EbFkR7NqWxqrRiU/eX5MJCe7y2vsaY8juIufPazK2ts3eHgcq0sQXaZDnsAzMVv+w
 RDUEzaGz5Ql5sjW6z+X3BWMvHO6yTlgOdnLT/W39Lk2VbiRTP3vAfMsZLE6fU+lcftbF1VeZyYv
 atSSj6oWoVgdqRe54s+vv9R8FSR6+wb6NyAmQM7wLBxpur8cgsiZdYpcZ7m4uQzcN+Gsb9b9ji0
 bJjaPakCZAZ6hpOAEGA==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b0f795 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4HF9s9dolvseeuFZ7A0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110040



On 3/10/2026 7:02 PM, Konrad Dybcio wrote:
> On 3/9/26 11:27 AM, Pengyu Luo wrote:
>> On Thu, Mar 5, 2026 6:40 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
>>> is simply a separate block housing the GX GDSC) nodes, required to
>>> power up the graphics-related hardware.
>>>
>>> Make use of it by enabling the associated IOMMU as well. The GPU itself
>>> needs some more work and will be enabled later.
>>>
>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>>
>>
>> Hi Taniya and Konrad, GX GDSC stuck at 'on' on my device
>> the raw register values are
>>
>> 0x3d68024: 0x00000000
>> 0x3d68028: 0x00000000
> 
> These likely indicate that some clock or voltage rail is not accessible
> at the very moment you're reading them back
> 
> GPU support for 8750 is not yet upstream (and A830 is somewhat different
> vs the supported A840) - there may be something wrong in that sequence.
> 
> I heard it's in the works though, so you may be better off waiting a bit.
> 

I am checking internally if any required clock is getting turned off and
causing this.

-- 
Thanks,
Taniya Das

