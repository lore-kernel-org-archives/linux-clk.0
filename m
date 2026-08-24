Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF2B3F0ABB
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562687; cv=none; b=UqzmCtjTCjIbSP6FSRZyGqfC78F9ushFEm1oyVOaMmIJ/A0zAl+5FRyQosI3X4JiFogX2z5dj4UtpfoO41KQ763+VA7O+LOgq8SYJSr0xqCviv4KOw9AED3MJ9tPk+T4xBe74+K+WU9RQ44doNAaFpeF4p8V7bYG9yNAs0MvaVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562687; c=relaxed/simple;
	bh=g0dFoOoOVkLQ9cnrGuwvqmwMtmuK/m38bMawr/UsO4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fiJls9cs4ijUpv2prEQ+Sv8wjaEfYFPRzrzugm1J4eU4Iq2PIV7P6/w9AmqQRixv9rC9c7Vtvik9YnQPL5tXUHboofZLn/zcjASWZgAU7eHaFFGP9qNYEOlFbgBT+vdxZh/2TLRiCm8I8aevpVVnXhCXLhg+hDSx3RON43qK4LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaYVUmNC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvTzEd5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaYVUmNC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvTzEd5u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99fBp2549333
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvC1jL3A4W1dPjMTfsToSXZ8V8KQjAtj9niANMBIZp8=; b=iaYVUmNCqcLDebGP
	ipwIrHMOOqCojuznR4LJz5oa3/Sq6NPMpRhVof+RFp9XRXwEPAxTcdEk3yVtbcW5
	rlUwaEd4p7OQqliua7K+JVMSV+hmljHnz5hF4cVWRwSobql8yqNmVbIotQs//hyU
	MHQ/eWlB1cZ28CUAvoECWiJjwkRivFGWn1Wr6gDnTuHzV/tQEfC5Qtd6npeNQz4l
	/1PjYFAoCHA82kFljVPQTM7dE+7MNPt7nV6UbzA2evbZmaganAqoViz0AW/x/ugm
	NwLeQzwhJI8M41+edMAksiwTl0t4mrHe7Cnq/hJIHHELl+EwzDrpzbvNmPHLhL4S
	Zw7a7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hv23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 09:11:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d57d17d6cso6889751cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 02:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562683; x=1788167483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvC1jL3A4W1dPjMTfsToSXZ8V8KQjAtj9niANMBIZp8=;
        b=cvTzEd5uJg1jNG14v/zB8BSijDelh69Y1u96UTDzALml1uDwY5Ep82BlB81T8t8vWr
         mv+mudDhnhWqPSJXixnSQZ3mPhKp2J6oxjLIvyR7R+XvHQ8ae96OQ/iAgAZl4udSZVuv
         IjDMf/ZlNTt5upJJDdkJqzjKtaSjGHZjqs3/tGde/w7PWr3GuEjKZ5Zdd9Bj2Z6n3h5v
         RH8WouFaOjeq+057e93Zn4yvxr8N2Skq12BrGCMhxHj380UoWAlYdi51MGJWK3bu7mRp
         vYkZqCHidtkPFEOldZKPmf76SSp5c9wnj0SrnLcEyVUAUH9NicwIuo+j/gBtRy6W1Exz
         KLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562683; x=1788167483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvC1jL3A4W1dPjMTfsToSXZ8V8KQjAtj9niANMBIZp8=;
        b=Ve0ZWKmikGOpxUkoUhX+zRjCEVXIYukaMbSg/zjojEmtjzXLeAhFowEkRFMelOxBR6
         AxgKVsdf3fsWYso5qOcHHqElj/RJ/+7zEm71o+aCSB4Szu/17irw1ENFf2u6A5boHpHt
         YwZiRbQJzCk+ZMiHaLLAuQV5UTgiA6Ykzs0awAOxjx+33t/4N0w1ph1iJBHVh4St2xxa
         ODnjNIUJYyl8YAMYAxKvrwL1qGAyo73KWm3hUecR/7hJLmAoKQgjhHYr5Ob0AfCBd/q6
         bNcoyF1TNaVl2s1yufnw9GV2gPReB4dNy6tFZ5QzBsNyH00A7iGXMBJsFhu/Hj8lOIFA
         BIRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxXnCV+R5fXHIQq06etSb6tsQ2IyuERojrjR4SsyZ4nIFi8o0AICJpDKJc0nuUJnmy4s5L1gLgu7k=@vger.kernel.org
X-Gm-Message-State: AFuF++ngUnatn3HKjXduPsYAY4v/qKrdK0auXQLAVizSQeP7ySqUI6RM
	RjNHWMUpNL60sBTfkixMusn5dJ9eouWlTKnRWxbLpHlvJWWh04iRdaXjoFRO6EhPIxfMd3B7oA7
	i4jgcJRC7K31NRBfDbKqaBif/FM/sY0gUT0m6ul4xqHtGp74GhMwtXAF198mTXAM=
X-Gm-Gg: AR+sD122tZV9HzzVJWi3Uh0qMb6KcSzs1swp2Q4XXiQBPvbkJgiHuiLwTCW+fjx7pcN
	P/TGgJxSX0B9xH9ZLbeCmKH64FbEcHBeZxnyByZ+J6WpVuHLjZSzSqmlL6tnedVICQamYECBB65
	zjs5vU7H8K3vIFuoUKBqbo02R9y07D84Y6fDaym1ghHt1RfUSt/6OXsPCHxpNIuPglFVRa2WD1B
	qfgNSMJEcxwVeJVxHhfspopUrjErXQA+orsQ8kswHynP8sc44rGu0E6xwMkLOuG05waBoQ6xQsu
	NBkLgBYRHLoRzBIEKLcZBXZcMFgYWoFnjft9RlpiFRFYgggOOshyqVYXkGHJEu9pjIHEElIlV6f
	n5tqntDNP+PEAW78LMeJ2mY8P
X-Received: by 2002:a05:622a:1448:b0:52d:9a83:4187 with SMTP id d75a77b69052e-52df5492008mr180666691cf.0.1787562683510;
        Mon, 24 Aug 2026 02:11:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:52d:9a83:4187 with SMTP id d75a77b69052e-52df5492008mr180666351cf.0.1787562682994;
        Mon, 24 Aug 2026 02:11:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967459aesm1117153366b.48.2026.08.24.02.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:11:22 -0700 (PDT)
Message-ID: <f065ddd7-a04e-424b-92bb-24435f1803b2@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:11:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
 <20260819152545.3934-7-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819152545.3934-7-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c0abc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oRK5wSY2C-ChLMD65FwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX7HN8rLfk0+VE
 LbGoRpUAXLbAqWqWKm4nkC3vCOO4ZpmRRZkDVMqvxXWzbw4WNoXZowMIp0T2fFJ9kjycpAmV4ic
 e5JIOM5i/Gk7xvKxNPyyN0+gK97fwYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX3sNmTwcD2Lbz
 piV+EZJw10GcMox7UFAByPsXBOOXNJ1qCcJxDbUBYdhtTkH+rLUW1tC9zxo9kMbqzYMSAeNNJ08
 BN8q8vmO0t/8tdnLVL3vD81YHGaU4Z+eyKQ7VmKs4zN8PG39XuwF9al1t9k8HJEAXGragSmet+T
 EtSJbg6osi2JdRGIg6RFpP23yq6TN77sbmh516i1RITeRE++/IRlsA5yF10RZMz3nBJKg85IJyN
 75mxN5dR//+rNovc8cXgicECTkmMowcqRwtKGzyOypbZ491NYAvsL/cg0mKx4gvOOcdBHbOgPAT
 EV7RruwGyfY41tvHvcxklWV1eWhFxSAsHRVPznySy9793xq+vqN9oBnZDuafmcRzze52sg7rs2n
 vIBPm/py3VJqJVuPZJpaAZ+0Xgp5D+Ixmoxmt0Ksyjt8Od8mRh985i+klPSxsxI8hNfFIXXY+3x
 17/WdeKnScyoyaWfchA==
X-Proofpoint-ORIG-GUID: ZFvD0Znku6ubSqnwM8qK-kt0c6e01uL6
X-Proofpoint-GUID: ZFvD0Znku6ubSqnwM8qK-kt0c6e01uL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240079

On 8/19/26 5:25 PM, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
