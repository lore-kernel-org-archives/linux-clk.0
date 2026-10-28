Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192331;
	b=Z9UO6vZkV+LQ9hzdvutAsFeeJdDXuLL3Q8SDFN/C7hMDHVXzBhMjvpDgeV2S6axADBdJ
	 L+6be9UKUT8LuE1txZt5b+DhQ1pqNND4WzGEiNqtHw6xGUtzuP5ICN4pvN+/8plrbDOMk
	 JFR4WdGuX3ZxfZ7Ovz0t17zXcN61nFmhP/mD45FEYof30XsZkSXf7kBKq07KVyhchnXZQ
	 pn2ltYfzAxeY/w1Gp2Lxi5SajgK/BI8FmFVySjIOQb/hRZROAA33yYSqW+YFcti0hQ3SS
	 oUpTpgrrAspTJjAeeZXX7F/7fVKlaEFHciy55ZfehrWkwPalRjrbUo5a4FY4VhjfkTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=;
	b=ofMMAO9hBXhHyf7r6Irx2xSp2uI23a2d3wGJzSlRQW5rXugSZrMLQXrwYx0/pHM1LweZ
	 9arGxNHcBTWyyclzDHvRv3fAFiFOSCaGhFCIIFG2J5EH4jxT42xg6Add8VLlX5JY8E3dZ
	 /6Iatgdg4QuCZdsaXTKmFDuK/T7WS0UY8yz+roqIYfuBjmgnsynU4PEelo4uGIwauhinb
	 iF/HW41r16RR066ouA63h21iWcdCDU5zkeoKYybF0KME/DUvEM6ztoA0pQX+voFPIwAtz
	 uDKpOzOjgAYR/HgvYgHa5sJ7aNfTYK82FUYxOuTKFAhPbWXG9cEvTjdlfwI+3LbK59w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oq8ULE75;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIYDkh45;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A86606A31D
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 12:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A86606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oq8ULE75;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIYDkh45
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2NV994545
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 12:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=; b=Oq8ULE75Gcg3exfC
	6U+Zi+fxge98zTgHrKQJGltM0At4YS1kOwUduX4ot2nTU4Ax9wPC7+QwOfnB6mCc
	HRYHNEi8TJs1smjDbYt+BWwTPmYVExpk4QH0YrVfUJFH4aDKYzUfeMsi6snXwTd5
	0nw6p/djbHn05Dq7FoGIa1BlElhlwodV2ea7ItrKZ2I8OK54k0+8CMTlTQ0OLRNm
	DdmUzeuJbzXbqsRi1D5L7swvxd6UXpIrqd64qYG1rjqMKNPT8UFRITJ87l88zrIk
	Ol6RhJXeYao0ms5R9q3K1Kmn0+vZGhV8eyJnDiQbozHXkPMFauMPyIw38jPJ+L12
	5bLIsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt4sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 12:58:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso14648285a.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192329; x=1793797129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=;
        b=AIYDkh45J88Zy7n72stG802I+YSHhqvGJjKH8D7/olbp9F73Lt0F2VJT3OOi/i0FoI
         a3O+b7LNomDV27lORCTV4ye4RDVcHwyiTSFfFe3ycTwL1IvOBHSugczPaOgbdOVfHWZ9
         hYMqUqXbT3p/zxDeQUl7kJYWixc8HBlr5BDrIM2OVBxgYOhs88FR1/3s0sdrtSb9Ot98
         QtWpisExA0pKdlAsPEMmemUQvztouZvgj3H4+YTTEnf4XE0Aw8xYQ+nj8VH5N+ZLpd6d
         UwnbyPizO5Cs3Bh1UxPM69TNx9cIqg3gb/iJX0KO1WhjVJQO04Lx9B4cnJm/GS53TJRe
         ITHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192329; x=1793797129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=50yXasG1rK3Yih4I8BA352afkn1vVFs6oRSImNw3Dm0=;
        b=H08e+84gbFpzUCfEIiPO2f5q84By5BBoayqXI+Lo+f8x/JA5teNM44xj4XpSShmNgz
         lBd6EzOEcCEwVfeKYHGhoSmZx/+/I/9ArP+r1xgp2tM74wRDnCe72YwoeZvOAlqhnt4F
         674LP01+HsbtAXaUpN2PvAoGj3mN6sOQUceMnf1ieZBtFIwuFgwDMrL+/EkqL0Ew+YUl
         17OQHkBn1Oli2trjRws29WPAJUesODUR4J9SjIkKc4QuQq7ASvVx+j4JESCbmGpCcLVQ
         DDeVImabRCYyEiA7IFOXPiec2M2qJU94A8JXa21o6c6eKBppmK5BYJKPmvpCLWBCUz0a
         WlUA==
X-Forwarded-Encrypted: i=1; AKwUvBxCsWcXJ6hpWRZ4s4BUikyoneX6g2HD03Jo/0Q82aAlfHiQuxIb2EEoQbWxWUR1Q7UaSYmwZGTpHdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz3zVldvD1fvVliDW2hOKOsNTQNEZxbSkdP8NCGRz+xmCJdW8+
	qWVzmeFGY2fJ2m8BJBdEgE5n7m6twymTNrrG/if9g0A+0FE8RlYkYb150NhBKYKkoWxDZiYPkI0
	kyDoKFlNK3Y9bmp3yrzorxdGNZR4/Osiro8ga4MaB8jNlvA8oU26hqQXbKzrM+jQ=
X-Gm-Gg: AYBFou1HWjA8Ejfwh8rahzJiUAUTOb9m6pXWBYs5e1AA0TrvnVKm2lOA8nGwd/y7hCq
	haCBEqSy/mZuJDd9yIHJctR9b8PJHxjEJVgg7D1++PuPj7saamv702Zz8RQEFEZtvdpkDStX3qD
	ZacF+uP/Y+VmwRQ3ajCJUm1mYKSaby2/bQhQdGXidVeA4zA1bsRveay8qFlHgqoE8JwlTwArCdC
	/nMJ9bcPO/LxHOuDMzUQRUNyVyqCSXDilCWMUvYCC5SG7c1tTZB4I9oRvZcez8DNdy3x60jKOo4
	9dOBpbQktgZ8v3NbElHryE6YJ+0gykmR/AamS59Wbl82uLPQYDZnnCXUb2A7LsOB8aEtiK+0gzK
	LOxfdvRbbwe7m6TIfjXF1oOVILK4lTiNPw08YkbqIyJly0nSPijt3PKaqvHJ7gADuOkQ1E5M=
X-Received: by 2002:a05:620a:871c:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-94408a74b23mr306447285a.3.1793192328843;
        Wed, 28 Oct 2026 05:58:48 -0700 (PDT)
X-Received: by 2002:a05:620a:871c:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-94408a74b23mr306441085a.3.1793192328193;
        Wed, 28 Oct 2026 05:58:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm599765166b.67.2026.10.28.05.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:58:47 -0700 (PDT)
Message-ID: <3bd30903-5284-4bcc-b740-19635ec9bb71@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:58:45 +0100
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
Subject: Re: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 18c5Aa6RHIyEWlPtBAaJgtk2D5YH0tYr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX87O3MNmVM5mQ
 HD8JqHDJ0QWisXCpOejiuVeuWXFRXsX4IOLQcnB1ccZPgPWhaykxt6wqGMrygneqEpen1Og4Tp+
 Mj7RDBI0GPrKqP8UndV56fmFQSQiaUw=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1f189 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0I5sxNIOA4Q0ZI3ESucA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 18c5Aa6RHIyEWlPtBAaJgtk2D5YH0tYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX1i2sbUIi/GmV
 0HsA1v+x232V+QDCmGOaPPqReLy15ddg02E/90INoCc4ma3o+X1E70G/K9wjILMBDHpgeT4V8/f
 OpxQtgFpY4ezAzyJ9reKrkw+KsXF2S7gRJ+K9cQrRVxcLDlmynj/YqyF2FI29pAyxzk/lenBnFS
 xON15S/DzQcXPxyAQMyzZsx3HCDJZ50SnFkTl1V/G+DtN46q14+VFva/wv4SeiH5vQze9uqXFRA
 hW72hGwWeerGYth/TElC3U05Q4fTSuS79sksnzO26dlurTyQMFGq0tsoTNgNhnIyQBYcMyjinLJ
 H/lC3t6QD6z1BBm8EOl9yjyAIawtQ2OUbnX080sTNZ+YwqJcilh1jKbyTB+sSJvHO9kESZs1YoH
 LLY5Ql0AqPBhY+PUa/oPIvNrrxICzZ/KPOKUr3ra0K8ETw28EhJ41401QnesIwKPLH03LwMCzRn
 +0jZU6zqk+OfcF9v9rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051

On 10/28/26 10:35 AM, Taniya Das wrote:
> The PCIe GDSCs can be shared with other masters and should use the APCS
> collapse-vote register when updating the power state.
> 
> This is also needed to disable power domains that boot firmware enabled
> through the vote register.
> 
> Describe the collapse-vote register and mask for every PCIe and PCIe PHY
> GDSC.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
