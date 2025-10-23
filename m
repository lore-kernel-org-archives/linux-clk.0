Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76B30146C
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208948; cv=none; b=Qkhr3li+5bw0D1eYnSPD8mwe1qxsPROqO8y5MDNfUXvahG6G1wIlvFTGWVYPG8cIAiEk27zJjJ1c7kEwaSUSgD8YdIe48kVtxG7UlqwXjksDR+Q2cYdh+3gYZa/na/dIrwt0QzhK9ioY0RNdoQ8cQkzZIvp24EYBECIwRmEKjeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208948; c=relaxed/simple;
	bh=fjw+6ZDF1PL5GDq3q972gH89f6sufYhNm0JI5qAyHJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrG1yFEy1cmjJq62qaw4TztAxcj/R2FpmWyXRzVABLFxSnMIlgsd7NhExKwBHfljXNzMzEuI/h2tB6d8iQlOXU0PAQG+sNvxvWebkQkjV5oUPsLQZnVUCkjVG5LwPwoycrxIa1NYG7saEbTu+rnSNitJOEhGTU9dZv5b83Ce3IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQRrXgc6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQRrXgc6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7tk9i022116
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 08:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofYX3HjRKgU33R+lakZyIrCWXfnZSj60qZrS5ZoOf3I=; b=WQRrXgc6kEvZndPz
	v6shTzHq7v1GyEeMcW7DUeVMdqHbf9ElamHkXy7wc/OYu3c/IFwd84d151HngCzs
	Cm6yw4jqRbUWTaCBvziHW686f7oyCdS33p4LYc2KxeNnj5cWXNFg6eErI0AGBsut
	xyJOyoSaVJd38nLBFnlYPYCDQZUOhv2AG72eyc08RP2+oz6JTeqbhUCRntUfrM4A
	sisf5Bp+k18FeKipSKKBdYFxYVhEorKAD0m9bsdpajEorBpt/9lk7xgl/ChPx8vj
	8p2Sc0UYalFqwJqt/AXwgI50LuGXkgsTleB6aS/4GEYT5hqHNmeRubXPT3KvADfu
	At1zTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhmxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 08:42:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62ebb4e7c7so447819a12.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 01:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208945; x=1761813745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ofYX3HjRKgU33R+lakZyIrCWXfnZSj60qZrS5ZoOf3I=;
        b=YcH8Hp3aCCQwekmmEVaTjZJIDgMizMIMD+iXg2b9pEr5i/4T8RrjgmBPkCECm4ML9v
         mKgLPzs8D79g+Rog8PI5asnTVwNrDrXCZMI4hKrX4Q7Jx9857wEe3W5FEUL5suNfWDd8
         5bzAPwQGJuXPXyddBO2md06Tq3y74ywzC+miN2SxVipXDryWpXsW+gmicqzhs2MsHRRh
         3ELaUoN8xEXYsxpFp5oYuBTb8Af4gm/vdQZ+lF7uu+2cjfvJumJ2URGgtYJ+ihWR4xbo
         ieDkP+NY6UmCBr6o+yzsKY6r7WI+emQrBRfjXQzMKFugldeDhRVlldtdgBhShNxx/frO
         x9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVvHho2ZZnPCQ6xT1L5ewuiylWHAql6D1U/wPyVwoU8zB5KibSkYdLg0SEUoMZOWz6C2lUoHrLCcg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4pElAlf4eifLCQhr0KVn2z20nasdx30QnyE7UTtl9AugmKaQu
	n0BEFs8Hk6fNfd1XzFpYGm5+jF8YL9FiRH1BIsL0b19wQkMa+lrEbZzwAkoNnqir/WN3VmCcP/d
	qgOkygtEzizYb76m6Ewbel//RS936Xbb74Dyj4+SY2gRZ9WDWqo94jaJ1CA+EjaQ=
X-Gm-Gg: ASbGncvYGPYozEM8gFRlSI/h7Pvb7J6gTZqdY4F66uk0xfK/Rt0UHElX5UGalN2vk07
	bcHpqE4uHuzYveVBhFn26BkyIBhOprdbeA8C0WbnFBH7BzYz+F8AfT9SZ+HpHJZ4kB5odfUN1YL
	LFUGCTAA9X6CxAwZ9yAyTlmKQbkkY555wN7o71pRUTP03a4p+xAyYyvnr9y664YPyR7Ythuclzq
	uzMgxVf3Wh0DncWm3eqlj3Ofb1oBoqd56HhCWOnW6iZHx1gYGa2AvM9yQ6WuvtPOtUvn4uF84As
	c9M8D7AcGeDxWfQ3kFUVotUZRW+5Yn4ihArqNLdQoj4ziLYdWG32vzDT4+OwSg9M1AX8tfCSDT8
	v+lPp+dCb+0wbYbc9gE2mRTudPFI=
X-Received: by 2002:a05:6a21:3988:b0:2b7:e136:1f30 with SMTP id adf61e73a8af0-33c626aecb4mr2160459637.55.1761208944786;
        Thu, 23 Oct 2025 01:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2rBCLzjTPJc/nY65doA/UHQAoORgCvBAhguw9qkE0tE9g8A0pq4eU8cfSTj3QkVtEG+RGhA==
X-Received: by 2002:a05:6a21:3988:b0:2b7:e136:1f30 with SMTP id adf61e73a8af0-33c626aecb4mr2160417637.55.1761208944214;
        Thu, 23 Oct 2025 01:42:24 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2247a7f1sm5037500a91.14.2025.10.23.01.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:42:23 -0700 (PDT)
Message-ID: <703cfc97-ff4b-47f5-9f14-fb3ea4f68f7a@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:12:18 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Add support for Clock controllers for Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <hy3dcra2izm3elcrmvmsyfeht6e4bhzqzy35ooqywve2c2htfg@24hpt2nn6um5>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <hy3dcra2izm3elcrmvmsyfeht6e4bhzqzy35ooqywve2c2htfg@24hpt2nn6um5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX0uyrTvNpCb6T
 zhRzZv8IW4HN62yhdt2/PQ8pzlsJoWYPpKJKRzmgxrXR61Lv3aovsLeMoO7HnYl0cjiqff+805s
 mRlO4n3IViN6Yf7+SOdhDEBRWVCfhIgD4C2XXKp/EAH4CdIviDrYky+B09VFBcU9S9GObNfH5pi
 5YRPakJrJKs89QoRMGsCDKdxlBvneyi3Msugbuphwv3aTWwtDQWgxh5N+612r30MQ/rhZpYH8wD
 1B9mf3wMK5cwwFmg5DKkxIuuF+EvK7ibNCmlgj+HdglASqwOZjp7B5lvinY+Sh7c9f7S61VYfIy
 9EjU/vRYo9scZWXmHsNugJx03D2/ZW765O7eLyOAaekcmHTwjwmWRexzeeRJ/5zbU9c0S9/oaG/
 VrfZpheGDx3t2wW9CDnHsP/oMiU67Q==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9ea71 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=M_Sh8l_qeD7bdTgo-sgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 6N7KjH-qB0W-16O4NsMK7rtERNp8WxxJ
X-Proofpoint-ORIG-GUID: 6N7KjH-qB0W-16O4NsMK7rtERNp8WxxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168



On 10/23/2025 3:23 AM, Bjorn Andersson wrote:
> On Wed, Sep 24, 2025 at 03:58:52PM -0700, Jingyi Wang wrote:
>> Add support for Global clock controller(GCC), TCSR and the RPMH clock
>> controller for the Qualcomm Kaanapali SoC. And update the PLL support.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>> Taniya Das (9):
>>       dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Kaanapali
>>       dt-bindings: clock: qcom: Document the Kaanapali TCSR Clock Controller
>>       dt-bindings: clock: qcom: Add Kaanapali Global clock controller
>>       clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
>>       clk: qcom: Update TCSR clock driver for Kaanapali
>>       clk: qcom: Add support for Global clock controller on Kaanapali
>>       clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
>>       clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
>>       clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
> 
> The series adds rpmh, tcsr and global clock controllers, and then it
> adds support for cal_l and two new PLL types.
> 

This ordering I will fix in the next patch.

> I assumed that meant that the order of the patches was wrong, but I
> can't find anything in this series that depend on these 3 last patches.
> 

These were originally part of the Multimedia clock series and got
introduced after Jingyi mentioned they need to be moved to this series.
I can update the order of the patches to RPMHCC, TCSRCC, PLL code
changes and then the GCC clock controller if that seems okay for these
patches, please suggest.

> They seems to just add dead code?
> 
> Regards,
> Bjorn
> 
>>
>>  .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
>>  .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    8 +-
>>  drivers/clk/qcom/Kconfig                           |    9 +
>>  drivers/clk/qcom/Makefile                          |    1 +
>>  drivers/clk/qcom/clk-alpha-pll.c                   |   20 +-
>>  drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
>>  drivers/clk/qcom/clk-rpmh.c                        |   39 +
>>  drivers/clk/qcom/gcc-kaanapali.c                   | 3541 ++++++++++++++++++++
>>  drivers/clk/qcom/tcsrcc-sm8750.c                   |   34 +-
>>  include/dt-bindings/clock/qcom,kaanapali-gcc.h     |  241 ++
>>  11 files changed, 3897 insertions(+), 5 deletions(-)
>> ---
>> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
>> change-id: 20250917-knp-clk-c60d94492863
>>
>> Best regards,
>> -- 
>> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>

-- 
Thanks,
Taniya Das

