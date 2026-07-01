Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E723F1654
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895877; cv=none; b=I1JQsCUOqKCvu1BrJ19WXX4dcjI/1xJwHBLAv83pUjE4RrBIOdh/A45AtvYI7FeEqYppjRhgaVMddArjbMpsdD+j2dX789j0+lOUPmgOY8hMsU6E1UHjIzeSxoY4ZtbzTnzKmR2nzDUf+uER3xjTw82JDDiOBFSyD28Ace48AaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895877; c=relaxed/simple;
	bh=/6Hbmv+j5VVz2Qew1mwOKDUOPfWnD5Hc/1yxo36gb+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSI5gfynDEs/XDPy9on/B20OpCX2dWJqKI9b9WgAjaNcdJdv9DXtOv6S96VLi3BAttX75Vcn5+hLO4hEtY234+ufuAiqzVUe/IAEeSy/+QqUmlyTXjVptb9dH9goWx3no5jY5r2DNq8YWsrBcea13pDWzD3ptkW5zykemtna6Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnK8ycWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVHFiA0w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnK8ycWK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVHFiA0w"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618Fs6t479234
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 08:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qkyYKJBBJfOgR8NQFS/rnAqFlPZoKot/SYiMkB+EmI=; b=PnK8ycWKXte09IQw
	jrfNKEQ7sygq33L2R9J0L+A1wzdEq8TFqZ0HWzG8KRzyX/sKoIIIxlfBpxDUOdTm
	RFUNAhaw3/Vyv9sbkgGIZr1Ykaq18LO5lnRJLPieDEteTfdxw/3Kop3f9iPGYzpd
	q2Ou0DxmSH0SdWpgMDS7KUXcvVM+0RLI1HEDSkFBxMXO0XQuXCx5bPOiiM3MA9po
	IQggs7kCJhca8/9pIT7tbgSxLjuWbEZ1o7KcLiY4TZtvUrbwM6bBRGFzfou630EX
	2NxKIhBpkdu8Ueapo94RaRggB9qc3wNYMVFHymOE1KptwAPGklBuWDpYhdazK/Qm
	CAp9lQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tgjn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 08:51:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f150e7d40eso1125276d6.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895874; x=1783500674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qkyYKJBBJfOgR8NQFS/rnAqFlPZoKot/SYiMkB+EmI=;
        b=aVHFiA0woSw1PBe1YpTiFbQTv7AK+TfS4pyE/mPQiqooFHKfOw5OyRReF/e51A0OcE
         jk9BhEVgvKsFPRWq56abLhVydxDtZrTaIuCKE5F4+ooBYS3jJcDlndVGKW17cmPiQa+X
         l2V1g1VLoQgavbcUkPqVIXOeIB5xDGvIwiujeX8CapTamZvwQT+USFq7YdgLu+w746Pm
         Ml5xOTvBjmQGRAq3OPGbNJ3cYtMVVdV0hDQ/H4EyGtS0DyVxc9MXpOdtw9wFhRWX5Qv3
         dLsXlbKfV6lY8RZKaWI5VxXK77bX7WxJS8dnyal6FxELGHM5pGlyQITvRsDZWsdkogdj
         1RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895874; x=1783500674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qkyYKJBBJfOgR8NQFS/rnAqFlPZoKot/SYiMkB+EmI=;
        b=o7e5gGioK2Cg6/qtRESYCifZCh1+BZVT+ZPZ15zKOEd/PNOfsPZIMc7Xq30s0FZw5k
         fnbiuBfO1sRnHR/HNuSJNFetLHxFoiNRo0KMPWrauQoePiL/NMc6uW0xEBNKV2dLb7jO
         2vl2VeI6jqgmLNKU3xyK/vDdtMURl7UGcI8pU5Wjc/g0/xan3HO4ybE/vvuWQz/igRIz
         ovCFzT96hUIVomGC3u332VaJZwf0zjNomz2ux2HJFip4FDBKRyQiJavqk+tbC6gauKjT
         Tvt1Ovi1JUiMsGN9q6c3gKCLEx0gwnqfGj9YuWrVxMCa1JXrQUC81lJHpdOyNWgfgwJo
         4iRg==
X-Forwarded-Encrypted: i=1; AHgh+RqgQbHtuPGfimymgqFZogl5GTxztLQNx5LQ+sRHTAQThPBUk7VtidBSyLeyYvo1qbAd/GmIBMNln1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7o3BWBqUlbdut6jqsIf64rfbfNKfePsCiFFXNe9MDzgeMjGgd
	EOEgU0Fe5fLnQD2sgg3WhcKByB+/lh09M8gc0wybNQidJf1N5aZB4ln5yFRED7hqDWZjAQ0Vb++
	bP/p1q4Kcdmie3x7ujbMz8ad0eB1aQ8cXQ7o1cBhwV5sYLXdRtNeoeFpg/BzoYg8=
X-Gm-Gg: AfdE7ckvTxLdQNe2odVzgpfLzbyH+99rbfHTAUVr05e37YsQedDpiFZ5aGIhlelrkyV
	JA8RYmZrjYMSSgZDYkUcdvfxxXhQI9IpoiSOTDfnHe3AtLha/Eq7L3b2YQ/lpJLp+NYd3zmmC63
	4NmBXF0w/Ee6EAhj2X9YyMTP5BekQQdy/e+LfZKDcCO2Jbim8sJjlAdYXLu2BlSjX6vSwbVlwqD
	zobytOekLMdVd+O3KhJvSy1mLFleQC8tUwaM+AefOEupMduVrSWhWGoCv/IpkOvC3ggyPkZThHi
	JqCm+azNUt7vQw5NrU4BF/7y1/wQ5zZWtrzBm1lb6A7tqjVChQoE7jQRXmNQjvKAWxnDEHBjJ47
	whT3BO4BSvxCl1W9NEFCP3cNc+GHOu3ysRiw=
X-Received: by 2002:a05:6214:5005:b0:8f2:7e8d:eed9 with SMTP id 6a1803df08f44-8f3c94d80f5mr4647796d6.9.1782895874015;
        Wed, 01 Jul 2026 01:51:14 -0700 (PDT)
X-Received: by 2002:a05:6214:5005:b0:8f2:7e8d:eed9 with SMTP id 6a1803df08f44-8f3c94d80f5mr4647586d6.9.1782895873602;
        Wed, 01 Jul 2026 01:51:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6988270903fsm1829565a12.11.2026.07.01.01.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 01:51:12 -0700 (PDT)
Message-ID: <8d9b045d-edf1-47e2-bc46-202686cc680b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 10:51:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Don't use all caps for Glymur GPUCC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B6HONDPn-CJopMUevWEwyKs9HvKEXNru
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfXyHy7kwqxttQ4
 jnQdAp1zO8z/kN54papxW5E0u+mMfjSDfi8DcDlgEOFnz65vhMIslg3VS0KnpoSmCE7owEKuzW8
 WtODTW7f1n7ErmwVghnF/rq6OFoeTgg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfX0iTb2oLajMzm
 /VkIpt14LEwoCtq3jRMlyNm5G3rvnVC85QEZb/BfUl8YHC+rqqKs9HRCWvC5GOnvpHoc5j0yptV
 QXNO0ImiMIEg0h2vL2tVo1vzmVZZq5egqjKTvV+p/LQcPToMgOQLHRywzwtpovRvALFtm3xN98P
 oZbIFAaU9Tp4zWIQ+b+3N7ZILV6co08BUI7jtw+4Ro166yXoODwQoku/BKCkJcYYj8Tg5agaUpt
 cnAeFDbR5apMvF6OH4rQRaU+/5158JrKh/lOM2UMp/+sitb9MMbMhAAbbcqACPp/v5UxkKf8w4u
 tvzzZnMkrzAJqAW6+tqwxHc/M1j45VUMJPwUqC43zIuifwawIN2mzHn6uLqQeJ2I52bPKeZX+uy
 Me0TerHlbsC1+/u+Jzb3YmZ9hg8O/+tqpQekK/p1ArzQNjUg0cGIxbZXybXZCX/T62n1/ug27FT
 8jJBzEonPChf69t+XCA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a44d502 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=XN7p8K0ll9WvaQOQMdIA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: B6HONDPn-CJopMUevWEwyKs9HvKEXNru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010090

On 7/1/26 8:19 AM, Luca Weiss wrote:
> All other Glymur driver use "Glymur" and not all caps "GLYMUR". Align
> the prompt and help text.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
