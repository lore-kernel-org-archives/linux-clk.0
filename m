Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471539;
	b=0D3Xdx6z/S73YFdABkegslxYWZkT5O9+jS8JR/CAQErN/awWH3E+6IZBvbzla7UBCugu
	 HEYXn4QsXbUCHKL4lMHsW4PHJ85sXKeVV0VcEbO424siYocs15pfq8Rb7icVacV/GgMrv
	 gjeu8h4QLRIZFfL3Ot0aiH6OqGf7wtEw79ZqUVTAzvk8DTbefXvOjXmGQkQIt8XFhOg8d
	 IuPeRDu1LTIgS1yKqPXwemXnscyHR+PYPxAdyEi8CPW00mubOMl/qsBdj19xFTA3jkO4w
	 w8m5Fl56EPcmI4c20tYIXBi2tDOBLpd1RzVLuCnXRU0gKAz8B81dy0aPZ74CbyULfcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
	b=0LoxLdUJI654F2wOHlhHdJyAGqLLCwojAzer4VbQEVDaJH6/6+CQxK+ySwuDL+6HD4eQ
	 PzZTOgSGjxo6MbaI0aIDH3ssYE785769QoZKcIomrCjl9eMf+hOYZYqMM/8Sza1y6i0fX
	 kKFEeCOhW7tcukLpaH3+hO1v91J15bxnPBxPpTX5DoNjNpKeaRyT/OEXh+hrKPuHV//91
	 V8Y3TTy4r800/rnNKWMLgK/vt74ID2Cy+c5O8wFdJaNIX/l2ZUHCTC6Im10od5j/PgCtD
	 /xqzeTHLZgRSHIyu7ZbZMftkrFZo49ojqdOb0b9D2TvBPbyuCu+YdSU4g5P5IB18cAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oMYk/6eC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfIHwB8e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EC2606A321
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 22:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EC2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oMYk/6eC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FfIHwB8e
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANLGxIm3502802
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 22:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=; b=oMYk/6eCMHBpz52z
	pxjsUACx/yjdyR5Na3Y8lgC9d6C3rzIA3YPT+aq9bMLsCAaO2xsqUrCU72fK2Rpq
	ravGaf4kufhebKk+JywQbnhuzTodAk2WlM7uU0zo+pMG8nwpgONl/GZ936HeTWLD
	FXrxffHXbElvhoolh3X96ZOBorOZZNKD/vRx4eNmebmgR1MacomARN4CBT54ifi/
	7arjReUqUf+Jj9lQrS162Y/uq1Z9rbOrx13yEww+aNIguPai4M5UZ3WEdPLR6H1k
	upjPHIW0VuVeysy7hevmkjzZe51l4g8uvrtc/O9Qqt6yZJY6OP09JE2mBEVPnlbe
	zMAaIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nrnbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 22:05:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495a1f5e47so627465185a.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471537; x=1796076337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
        b=FfIHwB8eC45XW3nJK8rlR2hRjhfNi14xddoPI6f/Mdmcgp4CZ3zxepPn2/dEwquhUV
         plXJ9BTg4OjMDdNRAMGnTT3mqt+8cYblwgRVX/973o+8PlbPLgsWUwKS1TZUxMw8n2eD
         cNIKUTjNbzFgbfJpXhhahSSuW1P37Oguce0ZQoQp70RZQyG34kp7yjE8VErTLSho4diW
         rq9uenBaFSyL577DNgOCHdsBtyxKsTUeUdgLzYB88gh142IgCdM3LaM6NH0sAa7zIhFs
         gav1q4OxCvOeixqEX/YBmyNe3R4Tw28reWulRy61IDjZ2rvwpB+FQGPqizqUyVt8Gkoq
         L6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471537; x=1796076337;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Hwgz6UJp1yMR/zqjsLjAqDsdzMF2c0K1/Hbqb7QejY=;
        b=P4Sery5IoqQ7bwWeaQ2G0nE3KQ6VRCH8UdWBAE+chijgkEKIEfRqykOaaylG4HNoYy
         MO6cVVc/fUZBCQoRk2uZY/rAmDmHusVXR+rHFKngpY4nfEHl6Lcqv8Hp4zi4Qf8Hwi53
         xy95U705oiarPM5sJ0iUjibWte2zZgjxCRPCwxZnisch5iKnGiQH6rqBdlwEGzfMUbvn
         UFHjeKPU661yBc7srXn9UZL8yZZxAYHmxPz3klcq+BUTve2BD0/Az4NxnOqUt7qNNdSc
         BZlJmpkajqhvzs+RBkxrA9FCTUr0+O4kYDPjEVHhJL9lgWuo1u5w4aESZPlXuMBC0yzz
         s0kg==
X-Forwarded-Encrypted: i=1; AL+hErEbNNk2FZmwGzDs7NZSJCky0QebKKVfgxtIY988WMgSuXeTY1azubsCrJ88OXoKAjkpqEdYnNXx4wU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g6U+xdaByPaPwI7DZx2GdHp37lQUE+0VY9s/xgNSAHBT5FVFS
	FVC352CiQXqzxsl7TzaIQZw7Mgs/LuDXOVDTtVCNFz1fMWoarPxdaffYyIGC7JmFNSb30cDTDyA
	rlu5Z9SMjDlgJOa3YaF6OxYQLRfBZtTWIOBK91QX73dx2NkK4gVTJhylotYqqPsA=
X-Gm-Gg: AZFdTZcLjm/C2C5356UPawvw/IFEeowfAOwgH7INsdbp9hE2gUOXTf+xTk9+P6uS560
	zoA0wEd4+9sSDaneAic4w2aSrtGc9+MBhs+J2+rgW7i1J7b1kegT4khNAZwQcgBLcQQKvwphkSa
	TL7FLLNqnQtuCUC5rcpvk9qK4LWviEK3Q9vTlGs2p1DB9fz9oXv/5FVD5kxlmFUxZNfulegyJZ8
	aMOzrdDZxD476sihR2EGptkWSq5zn9rkHxYCxJZBaWeqXm+PtAcWnCRTuWuOoYCDIfG5nT5Z3RJ
	2wvyJ8hIS7ynK2ligL70KYUqOhh89EX1mqDf6z4C3H6OFvlMnqkiEb4X7tnWdoC2wDETrTIphUM
	vrxv6AeDun+0VkSU63iNlxoUkfRLi3swg4pXH8wvJtEVxulOBLZXhrwZBIm1ROBd9a83Fk86EGt
	A=
X-Received: by 2002:a05:620a:4495:b0:944:dbd:8253 with SMTP id af79cd13be357-949baa03d05mr2138289185a.59.1795471537423;
        Mon, 23 Nov 2026 14:05:37 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:944:dbd:8253 with SMTP id af79cd13be357-949baa03d05mr2138282885a.59.1795471536895;
        Mon, 23 Nov 2026 14:05:36 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm708892455e9.4.2026.11.23.14.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:05:35 -0800 (PST)
Message-ID: <b1c75c62-1b44-4ab4-8bc5-688762bcb8f9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:05:33 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfXy5DQgnzHhMrp
 MNu7On5Xu/+d9hPn1mWzyCKm9YU9ctJDzR8BIIZCgXcZhG9GmHsV8dpSPzSnT6LgMq8KzLI0JWc
 YWMQwEd85/iMMJuQ63NuxYCntmUXFd1LaX97XV7+S9iCNu3GMLXtpAbSfzF/LH2kJIE9M6CFyxa
 /sDlG4z2TdKTUxiIbhvHkuH9Op5m8+O9tbnQNI4AyKjn7MiWRUNYlM3L5vOJBQf2vxmPbWS6d0u
 AZXzJUF7ghOFv9muNXIaTvKn2sOfbC1emzZ+ozlARtq7dYDV9hOJoAJqJjyeDPp3Z9QkzXtylca
 ja2eXfcfsPX0giiCrMQPUOuLpDWrOos+EiKn/8cMZdzM5/bHkwcfQiOpStOQLlviu7QocoxYrjc
 oma7eLeL/ObaLQ2j61inezdhjNkadQbEzkE5URUW/kHjmDw5eqT/7656V5wFbLt8ee14uA1Oh1Y
 gdDQcY8KqX2hIltYHRg==
X-Proofpoint-GUID: 7xUsozJhqk8f5wINF9Bvp9IsH6McMaZu
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b04b8b2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c-T1lRSgfK_BPOqrbiAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7xUsozJhqk8f5wINF9Bvp9IsH6McMaZu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfXyFKYuttuxp/s
 aSCCfdoTnuXZIcxufwMCj6slWTf/olIbdwGDx2XM1lZrYp/nzOWm4btzU/2pDuP9qpMuojhP/bR
 jfijtinp6FY6C0KGpjy4yZuFNMXZpQU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230088

On 23/11/2026 14:34, Shawn Guo wrote:
> On Sun, Nov 22, 2026 at 06:46:21PM +0100, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
> 
> Same typo as in patch 1.
> 
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
>>
>> Driver have local copy of these defines, thus these can be dropped.
> 
> Nit: Drivers have local copies ...
> 

Thanks

Best regards,
Krzysztof
