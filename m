Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D234214F
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 06:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773384964; cv=none; b=eJrpYJ1x9t0G1zoBMNpDIVdSN2PVTJBfjAkZpVNqgO52q+VMUrtaFaSmn/p45+jjP9A81wyKYSLwhuhpEA6hty/YeQIC5BmIFahf8E+AkY1CE9kcX45ug/Qt+yNExe0thEYlYtaPNVwFZHvLwyQ3SrT051TKuOWSwgpk+O4NbUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773384964; c=relaxed/simple;
	bh=uF95rIddmYlrMzYa9Kf3n/hva62Lji7bAUf8s7PNsYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKX+P8jovE+mp4rD90Pgo1HBX7PSAvgttQvHXfJr2hda8vGNppCRFrbR4HVr4HVy1/yFSGfZEYhucS0/T+25m8zuJPZNgG12riqDMtCYu7h83JVmyuGHvMW3XkhTmOQo33LLxeNvXyWOKOJW/c04nYOFfGV45A8CmOlNb+FzIaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eL6cErav; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agrBEDao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eL6cErav";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agrBEDao"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tbLR1176353
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 06:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPZfbfumfeK3hXgzqvEDf1QRNXOajCPeUAJoFy2K1fM=; b=eL6cEravUWJWbYEV
	VbW+jlgiN3+63IntwGwDr3LN2mB4Vkc0EiP6+MUO2h4/alASxQCagXzp4tiNK7Ya
	9ReVk9MPCCUKIZ1H0G37dqwrJ0HdLa0JwoCCZi3wtIjt7aLPEoq0rcWms4Yc0zQm
	QpkINSixvQ7R6BD59yxF98NFm/5HrQZGu2mpAQSQoCwFd8OTxCYqBgsEGbPvCrz4
	bXMEg+jemy0PRhU11qXhGbNcYqqA6T3KojQtL7AylzjmkRGUDD5uCARFE+i+lRTB
	QlAiig/bcfO0au9Ot2SQJcu1dCuecEnpA1/bqpr+trx1p3clrKlvrwmHC9Tjy5IL
	UpjWbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqc9s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 06:56:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aecd4f7ca1so5121915ad.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 23:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773384962; x=1773989762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPZfbfumfeK3hXgzqvEDf1QRNXOajCPeUAJoFy2K1fM=;
        b=agrBEDaobD8iInpIavWXRC3SR7Mcp/mEaX0Z+fAVLpjqbADsUGspwVjCu3GOcf51M/
         ZmtO95Bb8BKlXjrzWCplT2Up5NMMA6JooevEU/jHnukqOpBpTbqwb8DT7Wj7Uhj7+L1J
         dmSy759NxjcUGckSmQfNdXb9Pz88KcI3KEmTzJ6rX0S8fDmJYYA+9l3T0fXQaf+PEqYE
         P/Exoos4e4a5HNqDYyM1HY+2B0QXdFP8bGtRTxeTrR2Fwep1dq5BVy8SjY6zmW7PBMX2
         oTghkgL9dWhrFkRK78MrH7TnK72ig+XvIZi+HrWCv3nA+FqEouQCWis2pt27GxCOXs2C
         fnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773384962; x=1773989762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPZfbfumfeK3hXgzqvEDf1QRNXOajCPeUAJoFy2K1fM=;
        b=KEe0jz96OlrrfYgTQBfFA43HO3VKgQ4LFlnnUItplRWt8s2u3i91/9fWsfSa07epgS
         dYpVDPacXv8lGGUoNvt8uxApvDRK5adr0ONMe3RJfkcrpPfVISsZ+SGN7po1I6v7r4Hf
         +iP4kmf8u4xnK5csht6lU3QJ0b6mmPO/suMQqABaqyEmFFCNRi3VSI8rCx9/sR+dSGQK
         FSu6YKo2xCzi5uwfW5FwmlSkEcQifiESUasjW8xaGA7wayWGnm1hhVsE2UNuhb59/8f8
         zRnS+Yzrn7vvH+HsISqCEDfYh+pMxjKdHqv7trKSvv3B5x5gHGaVoRQumUpehjllkF9H
         yZcA==
X-Forwarded-Encrypted: i=1; AJvYcCUq5LrnxVDnR6qunynvgDgGXLYDhR9wUMT8QaZ2OIjwr66hVzt5XovExW3BSro7WM8wiRhmcxkks1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTOR+1k4Ri0sW/yDYThaNV1wC/yjRSgFeolhbytvZUgCeZGiy5
	TTsdrDO0nzxqIZUUH0rKQ00zLwICvJy+zmqvwIUw7g0gK2z23YNMhjQvFETYO5BpUBt3IqRuP7c
	D9aILXLM+BQD73Clmc3dr2o4OWoRDsRivsTwBEGStAFn/taKJ8X/44zvHznOJq5c=
X-Gm-Gg: ATEYQzwSyJ+fNghZCXQSC8kBhJOhiE2PudLg50+JlP85Sbs2G9j9iKfoKWsHghv6x1Y
	/BZCWMMk2gFx5BgiKScCS0QZUuPJec3CgTpq+5+CIof7ZHHBvSjSXQfI4LkR+NYvP8MBKktxfpj
	nenDueMJ/PvIW3uotjCOcpU7UZ24I0SX9kdJSjNQHeGGdZIFx7VcF+pRdhkd4RpXsD97mqg9Blb
	0A5OEeUA86mFyBSgdpl8K1DcqPIQQdgP9fc0AwXcI4J19ziEFwbWgD0czJ8d89fIMysDP4zHdsO
	lDkeh59j/RsSIRNamKJNHojvGBi/KZhTuU7zZGv2kokfAerEVKY6HSmjjFRn67NfwkxTbCs16Le
	yPX101vSpvKouWltr3yQjAebtNfevew+a+doqkWLwlV2TINaMrb145gOBAWX9phxE8Q==
X-Received: by 2002:a17:903:2b04:b0:2ae:ceb0:d5f0 with SMTP id d9443c01a7336-2aeceb0daeemr10380225ad.47.1773384961684;
        Thu, 12 Mar 2026 23:56:01 -0700 (PDT)
X-Received: by 2002:a17:903:2b04:b0:2ae:ceb0:d5f0 with SMTP id d9443c01a7336-2aeceb0daeemr10380035ad.47.1773384961198;
        Thu, 12 Mar 2026 23:56:01 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed9cdsm11279715ad.60.2026.03.12.23.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 23:56:00 -0700 (PDT)
Message-ID: <0a8996ac-a9ea-4c47-ae44-246d8ec93b4c@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:25:54 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Add minimal boot support for Qualcomm IPQ5210
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <CAD++jL=P+0nY3yVM9MCrRfG5xLtg=R6Xgpi1xrbzzLPD-Y8KKQ@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jL=P+0nY3yVM9MCrRfG5xLtg=R6Xgpi1xrbzzLPD-Y8KKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4fSrHfI6XxaQXj4qhyeHYo1-gPtuMVhy
X-Proofpoint-GUID: 4fSrHfI6XxaQXj4qhyeHYo1-gPtuMVhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1MyBTYWx0ZWRfX5d4QOf175cmZ
 H+wyN/yZy4oGht2rpo6NbrQhynp3tZ/ZxcYA9XJV2JEjTHjXp0XaD6ZpLQhMsceiUF4DpyqSa8O
 H8fFJUsHcsMwsPKJ3Fzwv5LFlabTkxfdAaGHa861IOzsWvZrBhjSHdKg6KvTzDMn5W2lhaJn+ZH
 1uYweg3Bi3uCvozl+NWZZ8/gHEJ5zrpHz4y327gsZcUw8+ETdKNuHf6hnCdbtqxAIZOu1r/yeqm
 gTJc6hxF/3yfpzs9dq3jhYC4LNJFuKw5VkGwvdl/MNRIxutV1tG60vg+ZxTzAoR5RYwT3L5c0CD
 9DJOgBYtTLN52kXbVUBLqMMtWs1TG3CT1MaTH+0KeDuy4DTzvHO9LNKLSa8DHlY3yIoV2KUmjOk
 wje3sRQLYRFCa25gkznIgeiOi1ztmmyzoQzCWCkXnOOWN//kUjIp1cvTr164mfO8Rpzrdsh1VyD
 /Rr9JUJGKFSdhTl3R4A==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b3b502 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TA_BZAN9T5C4Y3A0SdkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130053


On 3/11/2026 6:31 PM, Linus Walleij wrote:
> Hi Kathiravan,
>
> thanks for your patches!
>
> On Wed, Mar 11, 2026 at 10:45 AM Kathiravan Thirumoorthy
> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
>>        dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
>>        pinctrl: qcom: Introduce IPQ5210 TLMM driver
> Can you send these two separately?
>
> It seems I can just apply them to the pinctrl tree after review,
> no dependency on the other patches, right?


Thanks, Linus. Dmitry has reviewed the driver. Should I wait for the DT 
maintainers to review the binding, and once it is reviewed, send it 
separately, or would you prefer that I send it now?


>
> Yours,
> Linus Walleij
