Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB2306496
	for <linux-clk@vger.kernel.org>; Wed,  5 Nov 2025 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334118; cv=none; b=nfEYHiM0yzDYLoC2dgYBrBUwXHOzqjkQxU+X0yBVpBw/A4nCmAqDzMEs8xKs1JhxtmQmqn4jDDxe8Hu7F1Zr9rL+L3eUx5J8K/d2/PuqjzeaCmKg/BijwvTnYFi5XLWdVj/N7WN8VWzq3OVvBAO2ghnU8YR73GF4h2FwXNqfpl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334118; c=relaxed/simple;
	bh=sWj4L7rhHobdbMJRSjrMT5uXvj/hcYdysU4hDlMLJY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLfb5EoWdkowelUk/cdJCsfyljCqWtTbDtg8oifuR+zHC2yeUc6yBTRKcCUm63xBN6aNYFQkVl/q/AfJFW7ZZ+DIEFDnlvVMnUqbHjlFGzqsyxLtxmRw2AK5sLhD2U0uv4qu+wIdb88pw9MBel8WPtdItzNKrpJ7ptWULBtS4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyq3fs5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DW5/wl66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyq3fs5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DW5/wl66"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58Uk593089789
	for <linux-clk@vger.kernel.org>; Wed, 5 Nov 2025 09:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNO1o1W8xxRWQs3VWl/BSPCCofHOJOL8K7pYPyBtsdU=; b=pyq3fs5k1EwmNBb5
	SbuQ9BBryy/yy9ZIvxAJphDY1eSrYrf+oSoBI9avapGUN5os6inBTFI/wCnp8y98
	2MP9eb927GxbjgM7O0uxDr2vP45rtEBfSFY9l916nPQbsGDUwK+XV/wbTP3U4Cc+
	/YvAKbLCW/DAriVdCDlZKR9ek6ju+r/3AyP3/efTcrJQayuLWvh48msqp9lr4m7v
	GjvsusTvrVM9b5emgMLacpZGBsHnhNFr7foyAPQyhSIOGGSZ585kUmkmFhgbdh4p
	bifEwdaZh6uOKMDY/nXfNJzORowqcyxfkPfnyv9WjLUXj88DREKdLO9kxPmYWDCu
	WqKoPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5e9t98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 05 Nov 2025 09:15:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1f633955cso41090685a.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Nov 2025 01:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762334114; x=1762938914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNO1o1W8xxRWQs3VWl/BSPCCofHOJOL8K7pYPyBtsdU=;
        b=DW5/wl66RuKMArp6/OzI4dcm93NEjOP6jGCP/CjndYxUtKbr1owW3RfqjdIAhdrgwM
         gMgMAQ7v+EDu8TolrxSq+qnUi5ooRb5DK2aG4Ulwc4OlPFb8OWi6zaCaZFEU3I+b4o2w
         pzRuUBGBhQmkYbRqnBGz6kR2kVyILzbHMEr5yii+FCOs+aojBAYAVvwI1+1cYo7KFFq6
         CCTSw5kxHpnyu5EujeiSZyrNU7wOvomvb4KSs2zWoennCOLnSDujxyj0AHDArjhXTOSp
         0bRjsL0JskF6WyAN3+APg1qxAqpG5Gz5dw+5kZfcNzEC86MBIme5AF86gWIKOps0t+N2
         sYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334114; x=1762938914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNO1o1W8xxRWQs3VWl/BSPCCofHOJOL8K7pYPyBtsdU=;
        b=F2o+qC7b1pJ7WMgnWJNW5TtMnrjRCpOzWzaB44H5rfL+q909A/O3iNJ0+qaCC3JIng
         g79F4dQzw99y0S0dkGrrCd/cERf7whum86kMa/gQjcsyL695klaUtUT02cWr1+xUOGAn
         N52YxuxP/PzLNsDsm1O/WPvpEDuFnegKIDIfHDa1jAiwH0Ip9Xu0LfzulE5T7rIk6+yx
         Ktr0CUYK/xyWChxvNULdBaGHPtVB7zmKAy9FJEAvrKe6NOiXCsxBcJnacHNje/e/iTC7
         wFbEtkdQNQ0QbTx97hXjNK2HLFIyzndL9y/QKPQ8oLiEmGpnVCSGkY4XuRAXCOtkgW1E
         09PA==
X-Forwarded-Encrypted: i=1; AJvYcCXMSVIr145SO75qQs3xTmamJHipg8eLFFNtEQvOjbRfKIHhNDL8nH3/QuY4OJeKUBeBzG7KaEozOuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9TGQp+Q19XRDPz6uxpi5xcwIMHKt5y85CjJbqCXjhsPboijsZ
	ZpIFqwrtaIMhu6ZhzlsitQGG7qrUuzhHR4hBhVmj/TJLusG2M4iiXZYbss5f1IAC1amlQYeMmCD
	e/vs1KJFSkAoN3Fe6wVmpZbeBJYQ2UVSt41ZxEf39J/i6JXiZQDV/OsQwRyLlgRQ=
X-Gm-Gg: ASbGnctXX3OCOlVwMNd5KHuJhayQlXr3wEwvjEqiofzb9BkCzEpwSSQ8Ddwz2QXYwz/
	WtoAdW5fBSGPmsxrO1G6rl9e1TxY2sSITvKac8dfrYrM11bxWyZXfASTb9vsmRMiWRUiqizVNTd
	GOpYWQVWz1xjTGGsfnk0nMx4CokY9Wtc1ZMEf7hqcJcZ+zMj5fC85qhS7qJL8O5gBtI0jHP+dw6
	Jpa0ADcJg8kCvPRzB28G3wAMStWFFbVUZeemkJTXogDvYOgCka3XllslioSbrX7wm2yVtU3/eLN
	4pSPebbZ2Am3bmF5wcOW8bkrEaHT0Gc6WtXQk8Li8kETt8cj5TMnXhM/P8VBd9QTbN6pbSKSWRS
	Z8Ivdh5NwiqliSKtc/zmaVwVptGzXnWeSNP3c41YXzdPjBwcFa91qH+ks
X-Received: by 2002:a05:622a:1b87:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ed725b2536mr21086261cf.10.1762334114400;
        Wed, 05 Nov 2025 01:15:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKCyR53MAEhxPCCJMTiIIV8STgK2JXLFsaUXOmOdyEzKsbeVODCnY7EWuvHFpinlf+crPkeA==
X-Received: by 2002:a05:622a:1b87:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4ed725b2536mr21085841cf.10.1762334113881;
        Wed, 05 Nov 2025 01:15:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640ed469107sm3508933a12.17.2025.11.05.01.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:15:13 -0800 (PST)
Message-ID: <cea360ef-dd73-4f6a-aacb-73a1119ae43d@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: remoteproc: qcom,sc8280xp-pas: Fix CDSP
 power desc
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251104-topic-8280_mxc-v1-0-df545af0ef94@oss.qualcomm.com>
 <20251104-topic-8280_mxc-v1-2-df545af0ef94@oss.qualcomm.com>
 <20251105-dramatic-denim-kangaroo-cef9ed@kuoka>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105-dramatic-denim-kangaroo-cef9ed@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eqOeh_6jiJlRCqCNFOfjOJJJII5Nu8IK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2OCBTYWx0ZWRfX6VXWNE8WZQKU
 1PALB0lYpZDp1j5P7Bx01GYGkHY+tdiRFhNnLXyKXBc507JvQy3Qfhbn42FsJz7afrLr855LC6v
 8a0nce5OJOk0nRnSYpQMnZCHnGJ0nbSsFYwNNVygDpOX1UPRI4NL2M/4MkVrSGCEGLpbjTO2sWb
 FeqHSd+mYzExX9c4cP5qlf1srRKG08xVhuig0GRdc0HyIhrvgHmUE1baoYBlrHvxlhvLA33KEq5
 n2ysV0q2AFRehERvsQ2raTNCO77PWcogO32jTU4lW5LW+KqtWmDZR0jNeNEo5H5UocfNWT/hneY
 CiiRsKHe/SeZYTtBZP2l+190MAuoVLAiLBKcmxPEX+yup0z+2K6ysZKgfhKkzXy42aQv2OJwPHw
 tbqsgf21J3t0InZxLnQlpP7uM5qOsg==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690b15a3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w53bJKq3yDHGtliSC18A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: eqOeh_6jiJlRCqCNFOfjOJJJII5Nu8IK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050068

On 11/5/25 10:14 AM, Krzysztof Kozlowski wrote:
> On Tue, Nov 04, 2025 at 08:31:07PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The power requirements for the CDSP instances on SC8280XP aren't fully
>> described, with only one of the three present. Fix that.
>>
>> Fixes: ee651cd1e944 ("dt-bindings: remoteproc: qcom: pas: Add sc8280xp adsp and nsp pair")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
>> index 96d53baf6e00..5dbda3a55047 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
>> @@ -91,9 +91,13 @@ allOf:
>>          power-domains:
>>            items:
>>              - description: NSP power domain
>> +            - description: CX power domain
>> +            - description: MXC power domain
>>          power-domain-names:
>>            items:
>>              - const: nsp
>> +            - const: cx
>> +            - const: mxc
> 
> Heh, so if this was described since beginning entire binding would fit
> 100% into qcom,sm8550-pas.yaml, instead having this now in different
> file because of different order. Not great. :(

Yeah I noticed the same.. It's probably not the last conversion like
that which will need to happen either..

Konrad
