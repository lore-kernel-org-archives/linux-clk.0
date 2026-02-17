Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB5435CBA1
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333683; cv=none; b=YIuVyX8kFxu2vlSmGtWL3cTAhz5i1vnFVQjiK8MYw0Un3WSAjMmsgm5YBXw4r9fBuPIJjPYTzwfW6to5bfyQPcvEX9r55d+y+CjBZnz6XfKn8a9AaaSq6dV641La4gcixGGPDDFpDbHu3pQYN1n+8YyEioAaR93gjp2lKgFYDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333683; c=relaxed/simple;
	bh=wL5VuiMiqYyh/wwnpJVu5jYTCmuIX0jo1WMK767HlLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QM4oHEjKjZ4nTpFW+4S7Oc5zkc/dd8aKNzTZe2Vdp4Zr8Lcr4JNlNcwniSLOYrwmWDXYCoKi1DFV0UvdjSa3zx2Vzq+OTrzvQEev7DOX0Ym5JUebOmsyMvPLWKBLLw8vHi2I467MITK0yXCXx2mFIZQH9YpWEeUpHyGDVs5fgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2fGN4Rk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYHUhW4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2fGN4Rk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYHUhW4+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBCSYZ910827
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5ADTz8P05lKTT/ohdOal7Q2OxWIqe1+w4fGM/g/gWw=; b=Y2fGN4RkiBYJKDwf
	MnSGehZf7bbloRchb695Nm0irew8uxxgpDhSn3f01W5vvsyKw53ohZUu9AmCzeNc
	cC2tnxOLd1ydycIHhIo6ICPq51od9OcK/yVxnYSc/KnsN1rnmho7CSvnYnje+RsZ
	rDFa4q5lxV71dEJrEwnsj6iLkCpfSCNZVh6hv+DZnMsaQMrJ+i6FHv8vDAumsD8s
	E5fhYhy0IXFcYRpIn2f0xxaSxIiXJzHNWFgPLLi4kiQ89AIEJtGXZE7onfOVMrFu
	CxQydh5+dYEqOjRZ5AoIY78KVhWpdjg/EWtVcRP+NReV5A18UwR6l6WEtZvZN9yj
	pb2JLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9tfev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:07:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so237550785a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 05:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333678; x=1771938478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f5ADTz8P05lKTT/ohdOal7Q2OxWIqe1+w4fGM/g/gWw=;
        b=VYHUhW4+fFt7Tm0TyqGdcvvJUrrb75XzdXsXfW6LnLo2+u56M1xjhaUjWTCpoXMJl9
         WpefzcmjlId+JCA4x1jpy4KCWGNJ9WBBKFTF6tm3M+zKDodWC0dx3bQ64y6jbHZ/6h8a
         kWY/QQIMTYqkfg8UU5+UTci+t/Npz2/ATsvfkwQ64CtpEtFVyVaHKwCbqjJ7STCO3X3i
         9EMfrB7zc8+If4CNMGrhta2A0uI5dJ+gPU9qgO4sxQC3wcsd7LvP1a0SkX11P+tC2pA0
         scv1lobxRGS9dgFDWjQTHBACbIsKnh8bNaMsp/ksyR0+A6m96bbPCwi2CjeKJ0GdW7xO
         FtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333678; x=1771938478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5ADTz8P05lKTT/ohdOal7Q2OxWIqe1+w4fGM/g/gWw=;
        b=OgsGLr+kQjYazJjlqmDVpgcjjOSDr/JaqmmSvFV+6qfInQt2LVoch6GRsSnqN8tQNt
         GpPR6ut52sGqkZhGzaFH8ErWk5Ik/yJTaRVt9m0xaxZbHOSUIEJGSN0W02ocBjqmGpjr
         73QGq4NKHNW+DvQEhWbOdyNzvSngW7qop0m7ygpGVFNMdBi0z9owTIzyD84v+qikvrfj
         XGMmklWImUJYMobdVgIJEfrhUBWrDQlqw0eaBVQNMQGnQag4vk+68dy2+wjcpyUsrDp8
         8pvM3yqkoQzkyTdp0BuXpqH1hUqDfNWOzTcRlgISPPKdY01/41KaKOVVl7BiyhIpou/l
         3Eyw==
X-Forwarded-Encrypted: i=1; AJvYcCXK6JgLQyGljoXawjKkYvLpPmpEgSywzs5do3DeH/jcsP9eHQ5+YSE/N3KYzwpCaFP5oUjjn/m45KI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9D7QUFj1GvgzOW9Q7xFTe3bDuvblWZ+CaZ9wmgm6piP7O6kx
	as2mcYgeDU+UdPmQfo1HGBxTiFHuCJJqA7jrQuTLsxH725nw3+L8/Y7FSCbE7/0GKzgK8KgwxWM
	O4CcBzii/8qIuH+ZobQRa4JnmnK+Mvj4QOVM4DUKnIuW071L8Z3w+mVWxBi5km2KpQwK6V00=
X-Gm-Gg: AZuq6aI/4RAT5Z2APISHJny/4GwB/6dEtCc8U6DoXSxYjvCvS6StdykS1+7oP15pjjv
	/KadEKGOZNrOIr+juLwNQ+RiFfeqyOxlvrt6NcIPxblBVTkz6V8ShL3mAllRp0cfV9ZEYpi+foH
	2O4P9gEGz6rElUDMxwHStRTbm/MQB/XWfArxG9E4VGgT5+hnTxcIddyyJE1Q4az7tYVzuxL8yB/
	NUynwvNMF/Zk3t6hrnyDq3A9Xfl6Dij8sRD7ySVieTM8ogEB/uW6J6ErY+fIFeQ0Be+j575NsK2
	FHQCOZSyLpqPK+gY3rKHXPt42TQqtZkaJH85wZWfnalB7Y1J8RNwmV0NwnWIbngRNSsFJYIzwUL
	HApjmo5zil50Mh3dcNoVguDx4PpwP2fHNOJr2PCi5xH5DHw4Xum6yZQItJo7gl2+CH38HK6L4Bf
	Mzr8o=
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1357955585a.4.1771333677948;
        Tue, 17 Feb 2026 05:07:57 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:8cb:1d7a:3f33 with SMTP id af79cd13be357-8cb4084bbe4mr1357950885a.4.1771333677349;
        Tue, 17 Feb 2026 05:07:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e356asm2383640a12.16.2026.02.17.05.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:07:56 -0800 (PST)
Message-ID: <bc36449a-c523-43b0-b2f6-fa8eff13a8e0@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:07:55 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: De-acronymize Glymur SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX4UT69a0vLIkA
 itqDYCPIdQy1/3TlOJ8Mdbiilk+MtcU/P33oSpOy6wPhbtnmQqkwN8SvwPaS9M/YFK9Yt/Xl+Ja
 xoQ+jBK23x55ENbslySB3kpA7++Zvof2cl87QeN00taOSFY5updzrwzzveB4CP3WB6eG6nbaNhd
 S0WzW02/SZa/Pj6ROet6sd4s82kgxjwSrZwMY9ZKiV/MQOOH9EiYnC4TygTy0m0uivapAZupLRM
 M92zwLkLUtoXgcUj6XZGtbKrGLq0JwJi3uygCOP0v3713yZy3YLmhOxpZl7hiHNKrnoNHB5oT7Z
 BP+CcNbpzOAeD7wqtPOchKBMn5v96gvSZ5ubcRwH1cWfQPVanUBr0ibGjoQrmwUPiahvy1iUXHW
 pokCccH+Yecr6Kt5DE/9U9YzcCT2nvSSijIsv99QQeQehB2aPA7Lio8pmH6jv6e8YUXLRGOJ0fL
 Qca6r8XcNz4hLL/gcCw==
X-Proofpoint-GUID: 9R8Dz-8uBT8IqJrk0r7CPUoZ7WiGh1F9
X-Proofpoint-ORIG-GUID: 9R8Dz-8uBT8IqJrk0r7CPUoZ7WiGh1F9
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=6994682e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106

On 2/17/26 2:00 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
