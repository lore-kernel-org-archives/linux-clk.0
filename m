Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D508495AF5
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589638; cv=none; b=k4S97c2L7C6pHiLJ75v7pYfQg59RceFUbOBLFzNN59YUeHH2oJJRpG+YWBML/iFqY8nftgL6Brt6Jeur+CtNIAHO5ASWdC5BdG99gHxIll8SJOh+CwfdyGQDcjCFNz8R7pS+120zlqiDF6NpAq0cual3GGFXdv5Cji92ovzMLxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589638; c=relaxed/simple;
	bh=+kKJYvjXri7s6v6L5H5Wt8m/tVO6Oh5w8G3Nmn49fT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kogtcy3uWDvy+5kgpDw8IReX0RMT8LQ9/nji6fEPL7XEJYj9MRoooPwNOJ3W1Md6vS8wcqE6xOhnY65OWqHTRgWkjPkljRd2dXajQLMWfc2zW+PA6bdfGsO0VUqK31zLTyjwve1AwBNC1a5+9XiP2GbcOnqAWFQzFQ5ZFGKkrH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CC/R4dIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUPN9GiI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CC/R4dIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUPN9GiI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MKpt1446720
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 10:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=; b=CC/R4dIT36Ts/kmZ
	aFPJgXKkgMzASCZhR5udAfQQ8X4ejWDXhP2P47BCFmpHSBNkTGcXbyO6HSH0uglG
	zy4O2tee9jDsrmf+K0mW46ib21o6fMHg+h+NNwQcQyKtu5Vhv7fGymDm2Gy4tEjy
	uctOwm5uePi88dcHwRpUHMsKl7vg1n7V4fIU+kVqeYBfRGtxutV2PBjiS/YHffNF
	W9EGai6olRns8mVXACRbOKtDxHOKJYcus7w41wMLQA10xWITFgIE95+eoQdaQhRG
	TVivCNufXCOerQ+L0VkfJXswykf8UNbB3p6re2HpVLM6NXOdQP81AyyxJe4ILMOI
	7DKWdw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkr5p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 10:00:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91578e96164so16622826d6.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 03:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790589633; x=1791194433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=;
        b=PUPN9GiI7aErzdhx2cMisKHii24E047puXA/m90S1lPMzLlEA4pKyF5euZjQxwpMdk
         2BaxQzKP3/df6Z7SDbUoK9kvn8piJnaEeGgazqiYtAbwXtrDMoKnt7BM7BkMm6klwdHj
         dbk5zra774TQJsoZoJUraZFUVtSb/MnvgtWx+Il7CZEJ8XANoW+oCeYgznJVCAbs0UnB
         8bCVkV5fn1UcosHQvhjnAafi3zmb2cwsMZ8c9abmcHSAoSTPG4l0TuasTcH1BDx4c5PO
         zirZ1GfGb1A0lk7SKHmqjhXCMuDRmyNa51VjFFMLNXepy0vq0B8Pnx6FktxYNg6Oa5y9
         4pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589633; x=1791194433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=;
        b=cXVLm5F4lSadSp5bVh6WDLjGu/9AkX3lRDmWC5jWD4ewRTZvRL5Mfu83bTQp9qvwVV
         k6T1RzpvQOqurS3a5Us5q/KI/7FkURbWnsBCAbXWkAqb80MvvOSxKq3rGLcEYDmZjDPm
         mlyiF4+B+uR436j96IbEuAZHWSr4RM/t7hr3oP1TElSDRBXNccnoRZjf51BLTGc9xzDc
         IxxIzq831WWB6Psma5FLxYTljJoMYJFdhIxiOwoV0twI6L7vuodUC+j9rRTaeSLH3wB3
         ZlBJeYfsIPnsecMsTuR62w6wqjr9tIb8rTqGb8UND339gXXgE6TGjOCwzX6gmsWPM3s8
         e6Yw==
X-Forwarded-Encrypted: i=1; AKwUvByyDg5lVGOrou9slhdimjIsVVixaKT/FOi1T5heLI3+n3qCq7wxwO+nSWn+JDSh0aROTEhIc0AJmFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJHDHqhs41Nek4IQ0AFVzS6/4w45vaMT6ztLMtEJHqhpIRch7L
	0lvnQetQsp3Nxkfo7/Xmfj7ih+WS0s1YCIZtnpqnApz8PQFo9ixIjJOBEtMTpUdtyQfYCkUpx7g
	oZs0mAUYN21IvR5UVre8xWNAV3IUAQXxg+VkWIecUzj/uTnQNekSAUiVx3WvAdio=
X-Gm-Gg: AYBFou1ZGB+rrS7yPnnIpNdf0/Z4Upb0uuJYZ4ylfRb7+noRjssLq3OOE5ByHhWWrCY
	Zq9NW1gBQNcir9ClhmEkvrJnerbYdYusu2C5GWjUL+7ufnlHMUKSQQSxRH58aGK7J6S4wIQ2WlY
	5iiQ5LKHE1R8dP+uRaiWvlBTNmgewaVoSk5Wjcrm39Zf6bJU7BtpdGa1+cCy8UUHQ7DpF/5BJfT
	SVJDGA5SuIbRAys0a2CPRL74yhAidcxNqnagaCjibTeMdJkSqcb6W8OLxqkBTMl25ZHRI9pchcY
	QgN554kB6l7Ehr4nhUVTjdFqkmXmtBj4rzfCU1Dxe6LjCfpj/LnKwNj72sAw8EfdSVbe8VVJIt0
	+mCkoYcVjf2A=
X-Received: by 2002:a05:6214:1ccf:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-9177e2bde26mr4360866d6.21.1790589631544;
        Mon, 28 Sep 2026 03:00:31 -0700 (PDT)
X-Received: by 2002:a05:6214:1ccf:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-9177e2bde26mr4359726d6.21.1790589630615;
        Mon, 28 Sep 2026 03:00:30 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-915e7afe81asm21547916d6.6.2026.09.28.03.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:00:30 -0700 (PDT)
Message-ID: <b095b037-ae76-4b0e-b73e-241e6d638764@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:00:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset
 controller for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260928-nonchalant-mindful-goldfish-910c9e@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260928-nonchalant-mindful-goldfish-910c9e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX42pjogIspEzJ
 awWfGgpZhugjg4DuL6N+BKJv6oM/LUO3poR3FqsDsdzaE1ZOmRonNZxTN4GWgu4/HypNp6ZDuPT
 eZWIiSOCZNjbNCAl2whODuXW4PLgiFfEaQAEuSa0naPtcBJopIuvX8PjRL98R8W1RJJ3MckbHyT
 vD184IdRAsfpvgJQQvqm4xifC3pVG/2IK/Im2ppNFLsZ3U3VZ47pLw/tbEv70p+d8dnrQAS6FXS
 cY7GE8UWLi6YpKEBEl3EXaSXGoVDxQdAVd1GM6IDHhpfzvd22kyCs5lft6YLO0cS1OMN7ejmyrk
 WAE1iL++0OXrgYyPkcYdJRMR19NGjngKg/qKhf7d/m3zbizUTnUN39HvB8FoN8URsUSGlQYJDw1
 iFsgxgrXrBJXrNpav82k5uPmEO1z3YKo0E1d/bUFFfaqC/y22ThCGR/WTaEp3EmfkfVkmrkDilX
 gMEWgBTIqf6lvPJwwzA==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba3ac1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ffBAxg_qJ57NiJVD2GMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: kE4InIcSkJ2PhR29a-bcHWpEV75dn9ab
X-Proofpoint-ORIG-GUID: kE4InIcSkJ2PhR29a-bcHWpEV75dn9ab
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfXzXAI0Bgb13uZ
 mxEH9H+bk7RafAQ4b2TUnYXNfNGDJtZmyHHExu4PZ0s5MX68NBBWc4tGi5s0ze8Lz45txG6AJVl
 OGur2GKGBixXxaK/Zo3o9VGg/T48fYI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280039

On 9/28/26 10:59 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 07:44:22PM +0100, Srinivas Kandagatla wrote:
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm LPASS core and audio clock control module provides the clocks,
>> +  and reset on Glymur.
>> +
>> +  See also:
>> +    include/dt-bindings/clock/qcom,glymur-lpasscc.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-lpassaudiocc
> 
> Binding looks exactly the same as qcom,sc8280xp-lpasscc.yaml. Just add
> the compatible to the enum there, no need for a new file. Less code to
> maintain, less possible mistakes.
> 
Yes, I was thinking of doing the same.
> Separate header file for clock IDs is fine, though.
> 
Ack, Will do that in v2.

--srini
> Best regards,
> Krzysztof
> 

