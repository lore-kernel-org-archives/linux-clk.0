Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771273;
	b=ZSvU00O/kTxEFEcsN2KwGTqOShP83VdrypvC/5L/e1wkXUikQmhr2xeEadn1S0WYw9cD
	 XrFXcp3TfpeurpzyfpHd3suqDguJsFV0Iki7jZcdn4MULXGocas8PFm98JzGFcaIe1tTB
	 RCK6P8r1RX6WEhmkJnBHkTIifk3e8OYtvYyzLFwBXOObBsbPlfCzJnxzCbUWgwMIdRapK
	 m6WPmnY12tRPHpjUM8opGQ1S5lzJ253MZJyccuxHpt605ebkajTR7jRxRdtMbxptnac9F
	 w4SZkT7BkQOTD2xWCKrN93JfE81oeHJG6KuuJ4gxByBMcxypNJ98nlpmKb/zebf6djQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
	b=lYZTJ8nZbFu4gBTUlv3KQIpgeJESyB4BjiHDO/oN4eyv7mpVAI2lvMWr1vGA5xRBgFXh
	 zWlj4T2lpSeGFUur5VYcwDaTUUZ6A/j5cFwTyAZHkk8S7eIztUWLQP4spjiD3kLqyJoP7
	 c4PyfrTe6A/uuSyRrdOjHsCQ3v6bph/GCQWGdUHkLO9lCClE5dqK6elLBEJv7m/ND4y5u
	 WK5N/I+WvIRWZ2h4HG/UuG8VZStuCwzH05vvzPdCXFdJlqiU6hppmA1A8SaaNyKDBWi3a
	 obZfM19ZChySlvWjVdwvcNuBgQ5FU2txbpce9YVD7HFnIOpw4jSVVveu/6cbaIGJA1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2eT4WID;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmIeleTM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80792606A324
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 09:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80792606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2eT4WID;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmIeleTM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GQd92188037
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 09:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=; b=D2eT4WIDJ1W9AyvF
	iqDjQTZkazX7hjX5tvxXGGUQwOODekepDblkgQKW8sHjN//bLgfVAg3Z97vTS2sA
	LCtaFSK3zELURNRphpjw+L45D7aCVQBNVc3hkdkaF/0nuhcNMzrQ2j6CnXUCso3X
	A1wq7SIr9JXJntAlDUanesYofwhjSrWrqQRvBaZUdF4JPO6E25y/Q22+fM5OLLZg
	Ss7I8bwy5+2ADToMXku4bM7L1CYTszhhnJoqLXOJYLv5BJ9j4hRTIUhHTMEnseLo
	wbUo15deJ5qpVIvaZGpbphIm1xqEmmszpS8r3hWAdJIvjUpLJdBgFbv17XMpjaEc
	2dRLiw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh8nph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 09:21:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55d3ad11f50so9813421cf.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 01:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771271; x=1796376071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
        b=RmIeleTMV22FW6ke2EZjVjsuG+B6c24ZqlvL8uFK+RPDoQIzddBOky3U095Q7nrqwd
         zLtCcdcchYbm5mDfg9Tg+uCbGk0HgC2GW1Hex5XgUOiv5Vbu6mlTINUT6XRR9mEvj54B
         ePJAux0Efvte4iNudklB3ahkt7o0OcdjvI2OVY8hUOiq6vpD7sfh10ayytSwQpMjdkqw
         pHk5I8h4hs2gbyWkBbuqKmU8TT+2LUDr5KmOBIgBINBBfG34kD/ccnOBTbje3l0a8Zu+
         rwidaB6g2N2gvDGNlUWbkkA1fZHVf2PB63hBA0xFtzSsRQAZKnzdhNbIAD74rRHD/CmN
         Mraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771271; x=1796376071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
        b=Xe6UlQQW9fq3/H/vN6m+IxwMTmMP9XuSVxYt1kSEHbIszs2UQhzA/0x5rQfohCOo3K
         bQ5ZuCwIT+JREKcQM3I0nS6FU2V21DTty+ezIyUHW/1Rud19Ej2VCs3Ct+/WRq5B2PXA
         HE5Eibk0XKAEc6imVQi3LbWqIlCfShakptAIXO1Gt7ti5mMztT3CVIE10X9MA221SQXS
         6bpPC+zspqFRVglw0KqDb8Uh2y2rTexOTuCU2JjLWgsqKSA4Ibpnp429lP+DjC7Jgk46
         nvKy03Ou12zB7kfIgx1HYxdN7kuxhNrIGFxWVCpvAEHAHuLwShJcxuQt7KmR0cKtK5Cy
         3hpQ==
X-Forwarded-Encrypted: i=1; AL+hErFPUJ8+AqsUzMKuNLjo362K33XDzl6Fs01Cgle/kavNRTUycJ9IvesfTKp736gWeE5ybnPlz4lYMnI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H6BFgZ/SZKxzdUjBrJp7E8vuNWOdgbgtvYJBXfcGLFK3QLUvG
	rZ2X/Ap6ma1HnvkfFLptNFOGIFwcA4mCOW7+4qX09qElCVNFR+UjuHo1ZHL5CaavSx8KnU1WU1u
	0JnLhZqXTh55NsVItdPtncHYDVCKTjac3RZBFWWbTAp1ZEOwq5bWBuQhds2k2lZc=
X-Gm-Gg: AZFdTZds3t16I1bwdqufF5bhMU0xMPmm5p1XnGfpkGkNdNYkvmPLWeAsqsYEOkznzIo
	shzNir4rhQ6v5ibgbBAOW1SYUBcHfYZd3Vwwoe7QOTKbSphD/k5z/mbo3A96OdZpbgUBI61hiqu
	4XJJSPQpq6z2s1mBNX1h6WPG5JndlX338IgQSe3VBTblrzGO3L4+h9Sc2l3tHB0h5tCegs5IbG8
	mnZUh2VJArSJWdzDbabcjTfPkRuwGe93KRnHl/f6G2FeHNDNZ9MaZH0KJeaEcGYBb0pVXfdxhD/
	3EVZXHIKoyCLFH4D+bSDaEMpZH20Bf+04hFkSf8k0GhVB5oLx3FHSMn/6u/5KIxvNVlLVA0qdcA
	yV7K+EZk4HMl4Ajbm3KMSJhLJJTEN2y/8MRTmqNGOmW8Q1kkt0Wq+UMOd1i/RY0vjn4zJfFU=
X-Received: by 2002:a05:620a:8f0e:b0:949:95d6:4038 with SMTP id af79cd13be357-949bab34d21mr3663492485a.5.1795771270750;
        Fri, 27 Nov 2026 01:21:10 -0800 (PST)
X-Received: by 2002:a05:620a:8f0e:b0:949:95d6:4038 with SMTP id af79cd13be357-949bab34d21mr3663489085a.5.1795771270296;
        Fri, 27 Nov 2026 01:21:10 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm820746966b.82.2026.11.27.01.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:21:09 -0800 (PST)
Message-ID: <59c63049-8996-4b07-b3b9-928c810f928c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:21:06 +0100
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
Subject: Re: [PATCH v3 4/4] clk: qcom: rpmh: Add Netrani clock resources
To: SignKirigami <prcups@krgm.moe>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
 <20261125-netrani-clock-v3-v3-4-9b19d320f422@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-netrani-clock-v3-v3-4-9b19d320f422@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX6X6sA4x4MP2y
 PZKogEbHJfwzY1Kg3g+OkeZBD8FerOLTLB6BN6gz3LrT6Fh6T5BrhlBbZN0fzwzvhB+VzSEDyIe
 pg7LaE61bdEOuYeP6ZC0eWJ5zsYJ9MU=
X-Proofpoint-GUID: HT-0cJ-4V69aShZ6Yz7XvIxvHn7eJC6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX5p5sHzvdoHP/
 9hOkBYb3DhLp7Xo6iOdoVtBMzDGd8/IfPbY2CCkBHQmgntVhcO5S6hF9SQ9gxzHC3FXDEQ2HbEw
 rJW1zjAD+U7yVtp0i6ggWjHD247CiF3lM8lKUYVPPAw6BOsCZkajt6zx5RqslkWQyqHO+B0nw6C
 M1X5XnwqTSiRUWBnE3cYLgJsFbWPpVu2UobR5vJnqckP7LWHRfZWCxlxDOmhOwvwdKfDKEbo8fX
 kr894vRERg3ouCMX0HAqQSKkcBWvTSsTBLg0qzMX0xnOHkBTROdJo9vtMv5HQa/gRgd6lUp7W4V
 8ZnGxCSI7oha0sf6FEh9n1ZO7slq7+FaPrxqTbpjWRBKkYw1XANcMgoTnJ5Az/tZ8u2j05BVBoI
 FBpZds2847VppuTZ1tWspdufIG6zmZO4cUSvPJpZA6J66z2O7WDFNTRKDp+GJM58G5lszaEyX0/
 F0G9HyzX4GcXUw2IefQ==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b094b87 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4CYXjMiqXY9n0OJUL2UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: HT-0cJ-4V69aShZ6Yz7XvIxvHn7eJC6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270037

On 11/25/26 1:59 PM, SignKirigami wrote:
> Describe the Netrani XO, line/broadband, RF and IPA resource clocks.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
