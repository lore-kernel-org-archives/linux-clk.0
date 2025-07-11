Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD23121CC5D
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236114; cv=none; b=VU7SuAPATqx17d2pVoxM/RolvJq2xjKql/ugnV4j3UVyNzlJQBkzn5is9Y7gQyd3ULTd0KkGl+n6LRnjNNop+AlDVSmTQoXvMpwt8ZJF1qGblJ93I4cWcbh64p5gGkC2VTUpjf9noyYTg/gjNJ2RABg2gqpzV3OWL2Oa7fUtAbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236114; c=relaxed/simple;
	bh=Xjn5ySGEMA9LsrxbMTZ6SdqT5i31QukUV4A0p1xnku8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJHZ4O9bQzjcjdhyazKoEPFyL5N0KJAENf+aKQA4hTazD8Br5+XWBAE4SO2+dlCvF4NJk9k59mAAsgBy7nBraFzbddNgR769fkbQi7YuD94bZ8YSshmKAce5dkMUEMpb9mc/q/7jlB7gjQ9E602g7GOU4qpIP5qNBziL2t9kU0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6k/UOfc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6k/UOfc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBCWaK007995
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WmSJVa8+LyzMZ7AuALMmZArLhe9+Oxn8lyjPgHFxns=; b=g6k/UOfch29P5CwI
	pqtIbwhQNYh5wJ/FG+d5qTLMv3uOF9J4rZS8PlXlw4ARvQYZ96QHgm3DQFKi2uAz
	v8rd+pwUwbnPMKXl/IyIel8uZh8YOw2CcTn9SZQMGQyQleDmkft5vZE2lYuss0/N
	0HZWFHax5VC52ZJguWDzh5L/tBw9jOjjEMpR5Lieo0mOqKVvvdSTNqTuckwroswg
	MvPwRtZeg1AAEOXG92f9aU+B5xtiRvfVbzo2fVY5JIr+qidvo+E3IboRLrDrEVtX
	3H8NO0Ot3lxVFcNUvMbC+TThfLfawJliw6yrbBHTNGmVZCRiUyfBfZX1oqLCpCda
	FmRWPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg8gj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:15:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dff19eab5fso10430085a.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752236110; x=1752840910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WmSJVa8+LyzMZ7AuALMmZArLhe9+Oxn8lyjPgHFxns=;
        b=cQa+Itg+N6iZgD0HBQNncFgVmT0EKjIN+pXKuMfNj/efHKeD7VbBQnwQzNitct7UhN
         X8Pg0xxOiOgyrgsECb2ot4DIKWUVgZG7lIaMwEodoNsfzqHXvYs7SslNS1bvYAbChFhA
         KhnDJpILWrEB0zRf/WIphU4j20NTtGGhuR1fxyiK+ulWkab11lEXOE4YeOmRy0Kh06eb
         J5bpBZx1QFSjUmzVhbSkH3FwHXxSjoRWwBXcfH/Am7Du5NcWh0+4ww98R4TNzD78CX/Z
         vqqVWu1Cmq52dMyIpO+cMDVl1gmW8jp9K7chIHxbI6A1o5ic65id/rtrostOg29e+J3G
         Lcwg==
X-Forwarded-Encrypted: i=1; AJvYcCXdsVaZBBxtyxOSE55yDwHiNfSBP/oCejNNjCtFOEGZevr+oDiFV2WDRL5J+XicYJbSFU2pHM6Iy9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZNJ9NqmPZe9H3ugTPux7elxKqwriS6wVJnrUl3LFquEbgPz7
	AvT06k2LW9UWj3AeMUFgn4PGjJUfNeHsZcVxahwqqJUYJvwwLxq8oDP31zVfs/q7maTcp47FLpB
	Fvayf2bl0cjdpYWiKMZwRyK7X8KH+087IkXSSCv2J328fgYpn/WGV1GXIQDeS0Ug=
X-Gm-Gg: ASbGnct+xkWUAlo1D7t871bFScJGmyttoSJr9vOTo5RRoS5RSuNnbGvK5tt7f21+K08
	2F5lUa70hovGfQkViWU90as1QXi02KuNecjkLS117Kgbi87r0HMkHw3JqNdhyDMCyonP5s3aK5Q
	kPPdxgOHFCw3/HOIRVNJY5Cn5ki2eDbiUhR6FPPWd267Xa7FLlJmuppti5s8narCWSrNFX9IKbS
	J/iMtYfdI9Qk8lz9IV9hychnc8tpvlGQ+2mhLvJg4S8hAIobN/qupzv0kG9rsi7QAhKfBNgtHG1
	CrZBqtkuQ0z0tAepUA28MNTTQbsfpphVchHoDGZOVe9g2YHskGnwdF94p5C7wmTcQpJ/pTOC14A
	OWRZANqIgUlPITU0j60iL
X-Received: by 2002:a05:620a:438c:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7de989b3079mr130013785a.4.1752236110203;
        Fri, 11 Jul 2025 05:15:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9IlpHxAb7R4TrzGfVeGwtAC/FU5V/+FMIw/QGwRVWYeM3sTSRsEHYiAI4QhJLyZVlXQj3Zg==
X-Received: by 2002:a05:620a:438c:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7de989b3079mr130003685a.4.1752236108508;
        Fri, 11 Jul 2025 05:15:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82964f5sm293248466b.143.2025.07.11.05.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:15:07 -0700 (PDT)
Message-ID: <93082ccd-40d2-4a6b-a526-c118c1730a45@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:15:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: ipq9574: Rename NSS CC
 source clocks to drop rate
To: Rob Herring <robh@kernel.org>, Luo Jie <quic_luoj@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-5-f149dc461212@quicinc.com>
 <20250710225412.GA25762-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710225412.GA25762-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=6871004f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=icw32r7lKnDoEl_Wh00A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: hJgpdKAv2A-MSxCsB2Gef71nK9z_nt5f
X-Proofpoint-GUID: hJgpdKAv2A-MSxCsB2Gef71nK9z_nt5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NiBTYWx0ZWRfX38Pxmb1EYruy
 V/7+xJF3180WObZFcARyl6Ag92QRE5AxihlOjCp/luMLSQlAUnGIPCCPOtW/86XEOQNrGGwcYW6
 D5g7ix08gdvNg3h2rDHuFGRQtUVXH05or4oU8ssBg2D9+iqOjkaIMPPM8VQ0+YRUite5hNTc6UT
 fcK2mB2beCxes7fNw3r7cNQNc9SUbCf+PG2Fs3PquseiLbcd8vA7RNjx2O3/O2N7q34OsVkBAym
 /T54GYzQHtJxTjsukS9Oa1KuX90+00K7nH6PfKMirspJ25HrEVWwAn+k8ld9EhOzqu11b7V/GJF
 T2BAKMErIxRfUSYUZNswuUhSbc6nrAQj+0DTL4vTlLFZ/hiCFPPMkQzJ0ts82L7tG4vt8ELwsxi
 cER2gNVv2uDioRo3+BFKlGmJDxHBWLSz8dilQr/qLiAkAfnl4OMuypBkJbbn7qtSNB84/7QN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110086

On 7/11/25 12:54 AM, Rob Herring wrote:
> On Thu, Jul 10, 2025 at 08:28:13PM +0800, Luo Jie wrote:
>> Drop the clock rate suffix from the NSS Clock Controller clock names for
>> PPE and NSS clocks. A generic name allows for easier extension of support
>> to additional SoCs that utilize same hardware design.
> 
> This is an ABI change. You must state that here and provide a reason the 
> change is okay (assuming it is). Otherwise, you are stuck with the name 
> even if not optimal.

The reason here seems to be simplifying the YAML.. which is not a good
reason really..

I would instead suggest keeping the clocks list as-is for ipq9574 (this
existing case), whereas improving it for any new additions

Konrad
