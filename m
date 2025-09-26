Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18E670823
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870401; cv=none; b=nx3s6/an0J6PyTYOwx3e4UIoBtSuCKBCMgTsW0adoh8uVKGW9TSHzpctoePwlBbwAU0sjhTA0cXsUKc099MK/nKEEWeRzAaXZLccyxlYV8GHOslP2yaziPcDjXyOgpcbM3CPN9mjFsn72DXI5jzkC4Zv+f9hCExRChe0+t12nfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870401; c=relaxed/simple;
	bh=PxIyYiPf4XBEPu58oCPBVQYBlGZTT3vIV7tjE0E41ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPPOVWVJpbuJlqHg7XF1M6ce/U8Oc7ESUqUa//Lg6iT4nwpr41aYethA16cniQ2kX9PKEV2l7oizPC5lKFEa2pJOF3ud34utyL2+jqiE/CeGkrvf7eiGq696sDu5HUNmmApHZvV3O2FOjgtBg1plb+kL9O27mOXf66k/fOON/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdeGhIFr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdeGhIFr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUmLD024922
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VfsAs5yiAxaYFB0ndDb5atfCwLOCQ2a0n9K8ajWXJTQ=; b=VdeGhIFrddl8aPhy
	qwsCpJ0VEXQf1zHy+ga7hXD6MLL/w6G4dRe6p7UminlE04zS6DC6yTcxT3v12YRE
	87lKfuGlSqUUy02HNh1b9G4IyIwdscIAjXsuWqZW//RycZpSMHjYyn+Adm1a9ofW
	TNuVzuUJrkO+h/lQjCmdCU2xwdrXxpEtP10ftclb0jcpQ9kZfnG2zGDWEPgq/I04
	hIKva8agjYhyqIUiiI3Weyi8f1JfymXvOdGaJ2hCQu0SWImyU/IlZrtRp1mqiZVQ
	SOyDWo6Ec5S4X2UXU1YJkHM3PqObcitwJ5t6NnzJPXMbbHo3JQUAjBQq1ObVCaIk
	8EQ9vA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34hrxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:06:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-268149e1c28so17796725ad.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 00:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870397; x=1759475197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfsAs5yiAxaYFB0ndDb5atfCwLOCQ2a0n9K8ajWXJTQ=;
        b=eF4e0XefLLW9N6djlLIIlJcM2WkSdy/DbhD92S1Yfrqn/qTw73p+k2i8FA4+rO69UP
         XjYsTdInaEFiExcxFiRSj/pdElpFgKnZRLJUd/rqrWQcVPnz+m9ZKjuS+pMiQyHiioh8
         uPMwau7a92sPomNCYSUGqOHM28i/uUdAiIxVkrBwerVQDGJJwyiN7FILdiqhHZv8pTpw
         dOnhYuVOUFC87asEyaKdjBPj8JDnCTqeOtpFip2QxT7Ne+1tOQkIXpaTrWozZLKnzgUl
         ZbNbqB/TdEgbOXJjeymHMKWJqopxp/ZuCJpGDoPQl2DS6TRe126aR8PTiEFof0PYrMk6
         GRmA==
X-Forwarded-Encrypted: i=1; AJvYcCUBTNtYildGopfyXvnoKh/doGXIQBCd8pYAM8SRaCR/TIAxR2c46QfWRMzd0iAzABpr5CB56iQ8R98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2tndMj5BEDG6bt2bh+2RPeIJq8sJTZgb5OszZqLGoEtWFdQ7
	tbU7pbxS32AXs+GNEMKpMXALUphWe8MbSN2fesk8sY+2W4hMqBQN9mp1Hbh79W57IjUFqbfh40J
	QUJF+2wxZ5yJDX12SB5KRagng4dqP4CMKR54M6hegpEVO/BmQohMGpN4v45IXI/c=
X-Gm-Gg: ASbGncu4t5xl/MAwpw4O49PZNgRQc1yLScYhTOcHxrSAAJeGzo598GJgFQEMJPo48Kv
	RfA0/1KqyuAYUsEj7lWS4J/ZObAxoNvtjOMXeoH0xFqYghjqC1mzQ2SEWs1tFJWhtVafkdAa7gG
	CDHuukT979StTXTr13alH92uRmrJZVJ1Mx3DAq+RsFcN9rzunpJuxz79TpphpxMwMUskpGOWx3L
	+LHTccK1arcb0Z2tNNA7hx5lfPOCjy2q29M5rQxkARRT10qDLNjK6CZPAhu6wTFScV+r7W615nw
	HmNFgmpLz69qKani7MiCoF6wpWS1AkozAr2ezU2eowaSvx/UBjeWa8w0KM8dJVkBOhcw
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id d9443c01a7336-27ed4a78d72mr67605255ad.59.1758870397175;
        Fri, 26 Sep 2025 00:06:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkrMZxqylZt6nJiE1ocYHpxscY4Q1brp546AbBdNAbAkmq0vd5XGrBNZjqUvbPQf9USLOYyw==
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id d9443c01a7336-27ed4a78d72mr67604775ad.59.1758870396700;
        Fri, 26 Sep 2025 00:06:36 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821desm45499775ad.91.2025.09.26.00.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:06:36 -0700 (PDT)
Message-ID: <5aa92e19-bb80-4628-baf8-887199ba2ec1@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:36:29 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfXzoYVfLJQHY5U
 5ud12tguE68abVijKA1COi4ozVo1nBPO9qv8vJ1w6SClWW4vXB+fHjLKg9vVuo2x7JanQ530U3f
 3pktWpkXsS1YGt4pAR2nqD/Exv4VSzvsg/6JqUqDhnImr/76P6u6kmx41i07cowULbH1qcQTuk2
 bTqbEpFoig3dyzHST1+YN1sWoKYt85YfWEcvDyIBJ2Uf1vEZ69ZfklCkfeXXhz7YW1rpiloY08y
 9rLvateRFZJb2B4Sb7fAwyFgE2Y6h645GRyyD78r2Qz5yF5ZPtg7RApkI0V9fWNAtbA9R1b6k6G
 qSK561b6pca/qRlY9rFxPKyvLk6mC9UEfJP2qBv5BGfn/SEQrA4NG/9q+udZxX2I5dZC+mRPplX
 hnF3E/Uu96CK1GPC2JTFiq6Mtxudaw==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d63b7e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0pmg7TuxG_D_0s_mfB8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: R2JPvkhxFEK_9XXTpX8RSivAxj4NDhvz
X-Proofpoint-GUID: R2JPvkhxFEK_9XXTpX8RSivAxj4NDhvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172



On 9/26/2025 2:50 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:56:43PM -0700, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
>> which now supports both MMCX and MXC power domains. Hence move SC8280XP
>> camcc from SM8450.
> 
> The commit message needs to be change to describe this change instead of
> the generic facts about SC8280XP and SM8450.
> 
>>

Sure, Dmitry, I will update it.

>> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> index c1e06f39431e..dbfcc399f10b 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -63,7 +63,6 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> -              - qcom,sc8280xp-camcc
>>                - qcom,sm8450-camcc
>>                - qcom,sm8550-camcc
>>      then:
>>
>> -- 
>> 2.25.1
>>
> 

-- 
Thanks,
Taniya Das

