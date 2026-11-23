Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447357;
	b=cRM6gdLo1EXMLNOvBLZGFh1BtRJWgeuZLXWu6Mk23Lj5V0jYFohqjlQdxqmUIjaRhy/D
	 r/7wIckCeAeo1Yfa3X1PsmDolR+R9B5Zf+rGLutslOqwAZ/swpFu5U045G7VwqovVhBxR
	 tEAzFDkhhJUjZWzS6zRvXOZaqON3qvIDwplj00fdfi8OU3oUtfphebIXjqIg9xHe5LS3I
	 hl8P55bbAF4FjqjelGn2xF92C6u8+dXMswJjlL6vG08xClgv8f8GGETYLWfbT9E1uukTq
	 2SuSIyDKCKBBDvKXFuUR3cRG8LgXRPjmcoGzzxrH5C+8lq0AKqU0sonIpIG0UmvSDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
	b=k2R099clM83lUG9ddzQcU+qZIxJethcYorPzPlgXWjnmhMIO7woTeSQPr7/uQjEABqc2
	 IbkFCLmVnv1pHQMHzR9jpNtg0+whYs4qqstia0YWNLAssHdWol53fPGUqVGLukEjcka8D
	 AC9TkeYA/zVMq+6OkRSS+d21GdCmPE09DmwSg62ZTqx8UGVw+2MqKSvlhwdkf7O54iFLZ
	 jFWRblAtIkr/5GEM3lZWtrhy3RHg8uq/aFK4cjgLL1+DXa6zbzZ3hSpKP5zezhLpEpOil
	 05frjY5tMXLI1o8avOg9+EMO5/g/oY1feGm9DeurZLbLNtvBwpOxgScKl01R0te2CVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hGlKNPG/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs0Qpren;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DF5606A31F
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5DF5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGlKNPG/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs0Qpren
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKtqh3329289
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=; b=hGlKNPG/fxzm3rld
	gNryU850G1nqO933oknVTgPAvtA4pSrWcdSaZXW/reONdtMatxVdc+s/x9VNbi+W
	7NHeqx0AeA/hlEPBrScxqHg98CKOl63zCsTd2NUjjknfyy8iS3qTXpk9NbhdBrol
	c/m6r8pFhlMPxaPhiRKw1XwM/4fKyxfe0vMyc7WDZSkeaC0AT3SaJ/sJIxbK+lca
	OeNqvpHPTMwXSRkmrEBOnbciyKxDZiw/hEF6d8Ykkz1CGy2zfk1RcVf371SG4q+h
	NsgzTbs7/XiIsTwmz2Evn6XQUdcoFLfsdWnrM/3HyXEMI61nuwPA5Iv8Gc8YUSpL
	HlHhSA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2282-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 15:22:36 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0e878f574so52437087b3.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447355; x=1796052155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
        b=gs0Qpren4ffJsyB2nZppF82qZJzrUnjUzmbjW77wKv5psLmJTToUlwmuSC3XmE+C7l
         QGSxGSaxhSa1dm1gTVHHZErNIyqbLQrbPZNQGxXW2SLy8zyfGjxsTqpqn9+mYbOMD8Fy
         TWbDZIypyUERbDM+RIgH8doteHgQSgFD/0XE/0/Zi6lMac7QKAL9YVlO8+eRo/CDFMCI
         12zRzE564lYrOWVgcfOofurUA7Cuyu1zz+SXt7XxC382JNsbDNi5SPqeOSxB51zKvAVt
         dHCuv3fs/FmW0jc09eYapOIYkKzbEJHAiyHPHWg2DtIV9op614CtLZ4v7fR8/NrSbHpK
         ccFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447355; x=1796052155;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJep1EZYgFGiWXkeo6ciUdVlkRDBN0EXmJY+ZapNUro=;
        b=d7CP4cBksBKJBn5+H1Eadh3Wu+rW96SGd9+S1DKgSs1ZGs+nHr2zWHYcHj53BzOVei
         2O8xEK4vlSDw4X5Ce/u1SAI9gE7VZkH4fybdrOAQE4TDAm/FXjIuhnCRCEB/kI1Y973e
         f4Y7c52zMynPpNzXx0IdwBdlsL8GEJ8itU/ZZSFvAmvC8jGGYFCf+y0hqT2mE8Ksm22m
         Otg42Qy3oFu7roJNgLVdD5cx0CJBtg28TI/EpjdVMPfqkZbduFLeeC4TB3JilRfPC9YO
         u+/tCK0GcPRIiWVb1GeN5fMs71jtxKL7OpIJSjdq587WxZrqXr723FnXFm0OyoUixhyK
         NBKA==
X-Forwarded-Encrypted: i=1; AL+hErFVea43GHF4wNh2aIef96X1/ttCSATeOrVt1DdtPke1a2GjCOIusNy8IVP9++2qd1lcprL8Cs03xx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9pKjoCZw9e97DgFUB3FNm+If8UgPKbCRxIfxEVaFZx/Fq3kpP
	Ey5o6CYMuqrbi/Iypi7WFQ2lcJ8smLl6MXZMd7J80FvAWyR7/1kBqPTyZU8LEFDPVZ+cgADp01u
	weC+oHIS1KY86RLHWnl1U1NLU1V74q5tJxETcJ3gTNx1SwHmgV3iT/PoaNjvfLn8=
X-Gm-Gg: AZFdTZcwhLSKBXS3sATepTtz2W3CJi+7fZJmS5Hj2JVpCeHG1koJanpobdek1CMUiGR
	AQDBw0hyNHUdL7TGH6uJELFzMsKfe2xf/2ctM3wAgKG9454addGIBi/blg84txC1xMq5Fn4lv3x
	DqwIGqr9eg2GgMBBGYhjmAOVNNEwt9c7tK/RpsTdRg138I/L5QfcqlIZYwlKHaW3hHbtSJfmVm+
	/nI1vGhS33jeYP8FaH/9YO6G/lTVxxmmB81nLHb+HyztOECL8BLKR551IqeYompOCkiW70Co9d6
	MZAdeUpd6inYZ4mtm7DVm7DOb7kr86sbRi8706+eE4m3TV2gvtAiomg4UfLdjExnmGoBuLWzwSE
	yBdfF3iZRFZy4IXPmEUB8Qve+l0zvTCqrdBBjw1H8Z6XV48LdjahSirnFibI4MC5P5qqjFAWhqy
	c=
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr47795497b3.6.1795447355080;
        Mon, 23 Nov 2026 07:22:35 -0800 (PST)
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr47795207b3.6.1795447354440;
        Mon, 23 Nov 2026 07:22:34 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm22927144f8f.51.2026.11.23.07.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:33 -0800 (PST)
Message-ID: <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:31 +0100
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: idPEFAsxFyHiQHUYVoHdx_3se3UDj86H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX3QVJz74bq61D
 wN0GgzN+Gtu1Uf/y97N8SWlZQlN6GExYZil0fJECbVGXFmMP05BAwgtgpk4EgJR92J/BZhVj49s
 mFrSBIiIHDwe3egGR0yzika21iHDZhegGmpjtSONEcZ4JJQzqdAMY6dMB1R4UF7aFBCp+PqAiUv
 SscVdfCvGwX1RU+7dy8WNJjQnKFr0a94ZAP7CN5TxSU6oIV28Q2IuxtIe0zLxXdrDQ2i73ohnoh
 7liFua1g1+1X1c3DKYcYjyDjTphMOEY3QNRkTiBRrZlBTKSyi+39/OGV0ZYxiivWzCVajJWE0Dm
 o102sDd/MpQdXUCrNUMIDnG2eeqdXZ0fGNyRX2F0CbrCFnSJxexDePbCNjU/Qmrq7G+mcDUHTmp
 LKqXHHLHPG8emO3s07nHPcKyLWVTcD6MCUeOobsR59clzyHQJBBI/XcaQuLA9QC8Kifil9vzalC
 r5qy7owEIUgYHWe/lZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX9zKyUZIucfKg
 ocggy4r9s6DqCeqVcYyDngV4OclOh51zaj+6/QeYh8A8UFF5GZXFXGrzokDy8TT4jvZkotVg1so
 3pHUw/jP8tAIHPQqDBoEYJo4z9WCtPA=
X-Proofpoint-GUID: idPEFAsxFyHiQHUYVoHdx_3se3UDj86H
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045a3c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SaS78iIXIhQ6CdhXs3EA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 23/11/2026 16:17, Konrad Dybcio wrote:
> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
>>
>> Driver have local copy of these defines, thus these can be dropped.
>> This has no impact on in-tree ABI, but any outside users would be
>> affected.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> I think we can move it altogether, to prevent a situation where one has

We cannot move all, because some are actual ABI. I could try to leave
these ones only, but that's a bit too much work, IMO, that's why I cut
everything at ~450 value of ID.


> to take time out of their day to analyze which one of these is right..
> 
> To me, this is the same case as e.g. glymur-ipcc.h where the values are
> some foreign constants that are specifically NOT bindings



Best regards,
Krzysztof
