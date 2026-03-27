Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B3039658E
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614335; cv=none; b=tb2bE3Eu/Zy3HU1oVpBHx1LT2rbDLUmi8Z48N6govr2P13mLHYbOZIBzo6rsqmVNkGF9muhyk0ZXMMRbm5XorVcnTLsT5ycuRxC1oUHj4zE7ESkX7TzkUvxHwN2hd7ycy4vHdkFGKKl4o3xjHYTh34LAMKUCJpnAtwXd9amXt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614335; c=relaxed/simple;
	bh=cJYXum6MxylGt6d8OEGYQB6VHofL/77zcDfl09y6BIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUrSr5Qo0DjFWG1C1NcaqWuSG0sQlhupl8T/cfFSGjFsh3n+JseGeVixWhcU9t8Hy7osu5YDLS5l9pBGJQnroBYWjzE1/p9WLvga84dWt+0KHD7pMWxbyqtXmffyESSN+ASgt489BQosb9Ju3HzZtzIGkvAa5wC78oyQ0GbQgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNQhgU31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAyQsqju; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNQhgU31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAyQsqju"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wG5q2538644
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZJUaWKKLy7fIGvhQ1mOhekag/nz1OSDsdqdjemihQY=; b=LNQhgU31cE0h27yQ
	tSSoqkdrmG4QU1Ab4SIpzHj8eRrzgxEjiEeZLEWy1FEIadKyEAfZHrAi/SXovz1w
	LRQPOC3Z4eLms/mFGhHVoDjptEFvlxa5L7KwH2UCKOCPP2njPyYFaJ2tW59ahIWT
	976WgL4SiksrCnEz98A/dTu8H6hV+wQyD2dhrKWVf/WbvDuRVNYVSwP5UO38Djsw
	4xwSz9BIXJk83ji9qDntErGczzAUZ+CgocYlvLV4Jxf4qKXf9IJo8XhrfAX+Owce
	IoyENFVc4FXkFYkdXNaLf5/3VlLV+bDK/kJlTeCyWhc9r+Cor7RIQ1U06n0TuFyy
	y8K/7w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883kx6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:25:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cbcb48003so7437626d6.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774614332; x=1775219132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZJUaWKKLy7fIGvhQ1mOhekag/nz1OSDsdqdjemihQY=;
        b=EAyQsqjuZZib19LtNbivWZflkP32kwWmcH2WGnsXWAFYVxvB7U47889GS4kyrA9NSq
         AWCrZ6cQsrDNvUj1W9oeDh9chYl10wWAAqrZCrXig4GTxSQG66odz4CvkJJ5UQTSWmFG
         yqlxrn/Sv4GZpY98TgKHkNsT3Wtu8QZtPT8sYBU5VkMBboSRwgwB7kb5VCfTQokJxOQz
         P4bAGRZDzBzY7jb89qb0o9JTUV/pdzz+7t0+2wOO6tSs2nEmLvujWhiAj+aLhVPKnu/s
         C4E2+vsvK1BiOBKvHy1cw4w2bgLO/VxfWT0SeGlckOI60/vgVXHMARsmRbQnBNYi4JTC
         f83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774614332; x=1775219132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZJUaWKKLy7fIGvhQ1mOhekag/nz1OSDsdqdjemihQY=;
        b=EcBIzSb7iGZw5nvEppFjEb7a/I1ankv2Ah/e17fMyx412K0xfrIqjtVsHOGon/XyVu
         W2hJQeKs4zD4gWvneypH4xGjC0ZM9QhY9dwQTNu2ChAC6vf7a7JdhLbuSS9u1IX4j5Q/
         lrBoqJHxN3uHmA9/3J7ILCI/1ZB4tnf8pPGPKbmKyqpIbFD4ppd/s6XA4scvnIBxLP4o
         oWFCkvU5/XOmMHFMonWUgQcnORZYmhdXsbzHaJzRiyDhu40+0WhET9jpJlNQk8s9aFxD
         ZfJvY4NnAjGEXqiVI2Z9kqrYV0IsjTr9qNSbLeY8+Jqzxr4qYQBw4OLtXCqApjL1AE2N
         diwA==
X-Forwarded-Encrypted: i=1; AJvYcCVro+GMcJq7YZumhCCi5i6WQMwImLkf/SLnNBiQLDel0zc8d5mFCBFyVt5Ow8V/N28DBpUqRJWwm6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn97EHBWf3nu3z4NSsTlScA2bmOUZq9mXNSuGHmURLbDDN5pEC
	771C/mBUDhLa+hKkBqw8LFsc0rbX1DmUKv4JlA36FfR2/J+WSFcQP9leru2heklW61brxE/RQ7j
	l9j9ffGuVqvItzkXdCpC6KJAIWLpoPg3r8HQxaQ6WAnIsdweUJrUTbcyK2YOKBz0=
X-Gm-Gg: ATEYQzxhmVR/sLmf5zeGmIzQsEFX483bm0k0oThsnhD5x76FlWRpSCdtcBwh2mqHcd/
	8zKTyJm405LidEs48eNuHoxEHTM14dBCgHJ9x8sJ7CeDzbY4JA5K5YCk4wWiWLsWIVp3HxFd6yL
	joEMYA6L3xI98RoO/sOEJr1sdKb3qzyjznluygONN40UU7olLM2/kGse/m7t7IRQQoXy8GSIEmZ
	aF7AJc9qHGVO0U8BGp4Y3zBs3ObEfKZSj9KkLhqi7pwh0HJxk3+hnb+LNiPEFInoPz8ErBn+wgZ
	m3k93OZgymDp8PUNUGeG0hlxLLEsHT2MtaUDZaom4Gf332bnAzOnvPRrk2gfeOVcGKl1BUT4pew
	Tx0K4hcJNM2PLpO6WMCfAtcAesP/jyUxDZDJvt1dKzdffiTgiQM5BTCLhIERPVgl2ojd0ULX/hN
	4dUCo=
X-Received: by 2002:ad4:5f09:0:b0:89c:d5f4:7b2c with SMTP id 6a1803df08f44-89ce8e419femr22492386d6.5.1774614332004;
        Fri, 27 Mar 2026 05:25:32 -0700 (PDT)
X-Received: by 2002:ad4:5f09:0:b0:89c:d5f4:7b2c with SMTP id 6a1803df08f44-89ce8e419femr22491826d6.5.1774614331461;
        Fri, 27 Mar 2026 05:25:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b200206c3sm245110466b.0.2026.03.27.05.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:25:30 -0700 (PDT)
Message-ID: <de024120-a67c-4f4e-aeb3-29fa26b76678@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:25:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D7m_EgIbKyi7kqofx7lt2dkh-HOQWmlD
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c6773d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hvCAL5AnRklPZhNa95gA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: D7m_EgIbKyi7kqofx7lt2dkh-HOQWmlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NCBTYWx0ZWRfXw/SxTCtTIUeZ
 3Gp0otiztjXeF4oCQ7hc8RgKw1UAz+IDOzMFjTlil1moh7vW1tB0A0m7Y11AhhT/rwpldRBDGqu
 9iY4mqzkznXLkMWgsGcmOvyBOXugtHP6LFy9SMY5TBY4TJYSX+io90SDde4YaaL512WCrWQynV/
 meZ08TaDDno3rxusvWyqQQkbAgsIyxoSxTR9sRpDMQehufiLJTA8w5MQBSx/eT/Ro1b4MiIcvmI
 7YMkCgY2Ig4/9PzBw/1fG+mZyFu7Q7OKaP7aHnw/Oon0NYfWmAlrVIwelHNnvJO01IRi4WtOQHJ
 t1jEEQ93vCRny0Vu0MBpVKsXy4DkB9DpYBl95XAVY43GD/fZ8CPcIv5u2YKF7WfoU9V1DD8/6wu
 J3Zm6zDdFAhxPo77vnZ+rdmZHhWsfLjclsdc7HdtJL0AzCzhvUq2IMI0yz++Uxg/m/ad5lymz+g
 Bxgeo9lxbxRcAA6qVxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270084

On 3/27/26 1:13 PM, Abel Vesa wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
