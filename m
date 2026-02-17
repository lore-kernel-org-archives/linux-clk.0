Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713E325700
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333237; cv=none; b=TdS9Qy+F+30VnptpVd6uh+zpScKkEqW1DLYnQBCKR5I+dH++SqlpA+uzdqjnOqaVKMcX1JAvkwEvvfJmSqQsJUNV1iKuXQNarbcNPASWP5HAMjwuNg8RvdFZ2wlEQu62X0/sKOQMJ6bVj6Ypif4wn/Lw3tWOfBCN4j5IRBGgMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333237; c=relaxed/simple;
	bh=38zneP+037Vy7Mbk+7KlLjFuG+3hjob8r72QOd9MDa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pTJLvT/e/dsWNZOIHaG0K9y4doBfDe8eqGI0BX/A0FFb8ZOL9Y1rF7LaBO01RODxZ9gAyT5GurAcz9ieMXyq3/TtCes8fzqKYw0h++Na2HlyFqn4JEJHCT/B9aSKT4PCQDujywNvgUb/ihPoCOK7qc+DlIgLQFqJOdlGDE8TQjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYrVuSbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QS4VC7Kx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYrVuSbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QS4VC7Kx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBqW5Q919268
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=; b=lYrVuSbrApOLwhCz
	UhDNBwK4CmZi3q98P0SI/cQJyJ9Nh+Q4c3gd8E6ujSRIYDqS1uuyt2d5nV1L2pXu
	mm5UG9uDq6ELDFB8CXb9Jej4KbmPemT+/dG+qL3JdheAAVYjX33VUae1mSP4nvKg
	5S9HobjJ5liRuUHVuqFy/GG2nM7yQBZUOMuvQfzDP0p6yvFQvTxEg7bFTHl7XOS/
	4ufJ6+iBRW5/aMwyhhQ62CzwpE3Zxh1Ix/bKxwyBJkVoV/hBOQfyq+FDy79Fpkhq
	DkXy8nGlQBChooCoIDXqvxCWm5SPPRuzesMib8cK22EqB0vgpUcKSAdt/IIrkKn4
	IyjPng==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82eg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-897193937baso31973506d6.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 05:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333234; x=1771938034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=;
        b=QS4VC7KxyAtWWL38fHpN5f6DgMMZuLcemME1QZBaxFcPcrPgtZ5hrvtsJCrjSYvMme
         fupybgd0Bs9Lut3P4g1JdeSvLlX2sMNoKWKz/Fevz04+dDTCoLHKJWdy1wjS+i7mnWsE
         fd6YlDKsrv0FDdkdpNgT1Kwc0YXdAg5A7MgGZWL0ZccWGB3+ZV2JnCdFnwqgoRyBsH07
         DXOftZmm4RMQB2H/365uazXG3GmpTuI7bAP6kMeZZvcB3zdcadCC0b/1NV2Z94c27yF1
         mdzYRaKvImkK/NFoM1JxDJZBBaPjV26MqNysdGb8Erf5B9trusMtZgNhneSxnn+ToZDz
         nUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333234; x=1771938034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=;
        b=wgKqAJvMhMNneNJn8iPqyJZJsCQRwCrqTB7rmm8p7Nw06aRydxsRn/qzU3YDRpoPZW
         hJbDDldCMg1rMbKSbSyt6UPiFjS/WiThefeJYgqOyTQbEllD+0iS/INscWMIcfppjV0x
         BxVd9w7nld6JVOnUvneCS0S5sI0N3o/ApcBXVSHzvSnM9EJzJXLu22Rc67IhwPffg9s9
         GeE2FaPmntf0azhIqvLq3wzgJlDh1WKs//O+fEG2Fa80+FLH/PZ8g8RknNFyRvljid4I
         lceWK8M93G0oHwjhLPOrQ6cnwdzchdwnRop75VgmbNMrYRtMh2QZOYZxBO/messu1Gsp
         AbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjld0PTHy0xZ8s/HUqbQQtKB2LtFMoT9OjNriuWu4a3EMQaNKivUHsXYjH+skVdv3M58ua/V2t2nA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHt9Bu5JUk5fAJlX8xQgctQ6jDTZtzuvIZwapuyug2I1/5mTdo
	/4gCnfRUsqd6yKXN2HauHLeUvlbkhohHmweK8L6ubNVkeseKb1Fk+SOlcMkYBbZfnf+HrYtHGyO
	rH+YH90GGZWu1lpzJafcdPEZzo7pLDdTGJfIc+GEcxSQ7524rIHUxILnh23vKlyk=
X-Gm-Gg: AZuq6aIU1svKWxAt/zthNtdEjsYsw4kDngFgK0QN2iAqfknVQjAMOwFkMpWIAN6IH7b
	mfMGvMJ87rP8O3dRvU86kbDbeLp0kFEYJyisVJB2radS/0qhMRwR4UOQMEaz8uoNtLABrqbeiL1
	MhmhVIDMQc0Jw/JrW9/LMljnutEAc85akor1f/klduWcAXIZqKQWIgiIyZdc9JK9tyl3+JEA/8O
	0VhkpxwMJwhckT4d5q51MLU5B+oyjG+K+PW33PA4D6xvzDKf2G0mplvr+i1RlJfoX/nUGwoIejv
	SUlnTAN37g+fRfv4cAhuIhlS9Bb2fHCRFD8QVTWgfyk5JqoER0nyIQdyxXeApxcy3BQ2dCS99/v
	BcsAA1GvTpgi5Wsf69StE3zvSAPEVQI40U6pat8x+/QAMmB9sGwl371NvSQTEiDemauEO7rapS2
	WatOQ=
X-Received: by 2002:a05:6214:4f03:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-897347ce6f2mr139776156d6.5.1771333234620;
        Tue, 17 Feb 2026 05:00:34 -0800 (PST)
X-Received: by 2002:a05:6214:4f03:b0:896:f9ed:be98 with SMTP id 6a1803df08f44-897347ce6f2mr139775526d6.5.1771333234128;
        Tue, 17 Feb 2026 05:00:34 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76b2580sm345885466b.64.2026.02.17.05.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:00:33 -0800 (PST)
Message-ID: <45683e0f-a49c-4da2-9be6-a79623fe12c5@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:00:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: interconnect: qcom,glymur-rpmh:
 De-acronymize SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260217125819.281209-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217125819.281209-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69946673 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX/1ln2Phd6yfF
 78/q+XIVPyAe3Is/atwh8Bl05vaBoPFZukbWZ8PfJRoBCxl+hfsgTUvIDw7JLEmeyLDUlIdvrbC
 v1fAbujoO/Ja/sS6UYKpb1CuKBaDLrNycfbvvPJuwhNzMTYbEw9VnFOJRdc8FIAlvjstdvYOIkT
 xfeOfciZqsFzr0utGeFzEbiWgrFcAF4yj1iwsHjnY+GSM4Rgbb6R6sIqzAJh/po4KJ6yL4BeAmX
 s4lVQlePGKIEYhER6sc9pC2k91eSsCDGYDkGMDJzTbUUgNveyj9fv3xd6Y8oKh4jbjlmulleGcW
 dlHQ2ht8ZjMc2YzV0p3Qo2KLhWh8Ysgwv0yZruHKzRawv/JnO/rOHdxKXpMm+3SYvclxXxIjp1c
 OHSzL3K2wBxXKXfXQIWVUj2ERRXYcIRP+UfQp8dqrFyDYBBvTn0QAp1uIDj2+qiUSFx/9skwEF7
 kBuD26pXYWOZGb3s/NA==
X-Proofpoint-GUID: RTVioHHH-CT6oDh72vqCI6e4RJw_bXQ_
X-Proofpoint-ORIG-GUID: RTVioHHH-CT6oDh72vqCI6e4RJw_bXQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170106

On 2/17/26 1:58 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
