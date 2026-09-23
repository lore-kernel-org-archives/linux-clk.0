Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C0328B4B
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169829; cv=none; b=VwX+I9FkcsflsNdFOVSZTNGKQS2XiFQl5/dPqYuL1LkCq68UT5W11CJWVvXwgLs6XOJ6PV/SbMsRDsMu+qqtcagc1bfmp6RMu4jUxwscod2yDcHGgh+FHvM087O8s+yTcRSbI3azY4CjARn5fTKkg3T/wqWJjp9seUi5ivVhDk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169829; c=relaxed/simple;
	bh=vrbjCTtsJyzwtHuyaf91WcAhXyYix8svgAK1qoMzsKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frD0fYevtGsudzHql3wlmFljyZjwI5LPfX+Yi+DTtq+fkI+gkomHWZ1loFX/W4T3KdZdbCSsNMOfOPyaBoN9FtFbRMPoLwrOFnWRRe53Hzb+peHXBZnAVc9CSTFbho2xcn17huhaMZOp0An5TTc8ggBS/EMBiaCWi8EjThZRzxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJ/GfdNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFzUniUa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJ/GfdNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFzUniUa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbj3N3028271
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 13:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=; b=SJ/GfdNvpBe4wTkT
	S1mXf1SgvWRVx7plQgwMrWgIYlNvgoqCHBexV3CFDcics1ykZdqJp4GWOnIufIAu
	xzAllA8gYDUM26ua3NS2ayqtDWF3cHqXmNUoqbpjFP4fp5IAgFFo1+Y3UeyWQv+n
	HxA85LZLFSuojbNHlqKvUh7v9bvcD7sMG0WavXFhIKX5jKqgBhko+uZ9Y+Pf0JKH
	i4b+uPFGeWhBqT3QnKYqBWCxm6lWNVTJ9p91WjDICDILVUkGBpg1NoOW8d/b6psm
	a3WkcNZ7KP0o53mPbD+LQ33XoRoiFxSpzQn1SPsRB6/JzUbfKsgfjuRWCEANVgGg
	JtJY4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwas0rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 13:23:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-532ecee0d5cso1173581cf.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790169825; x=1790774625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=;
        b=KFzUniUaOQLhI/TMpgnijlKixE6TW0Mt7UrnrYubGwTP4oqT9HNB30mzlWp7QpsfWU
         l1G6mIW5K73tSFPNPRt6CkubtO0KmNH+SHBXp7446MVLnr4ZNUVJbuo4W1f9QknS4ulr
         w6nnEf2k3BKu+t3MMfYbRbPZHI2B9zFuhcn11HkcVm7qRDwTF2IGN1R2WcJS4iySfweB
         qhbmSrQ4M6BLpP3Uc+tAGEVf4h7yZwhMSXgpfHEabyP4Nle7WXR7t00HHiFYpppvn044
         0f5BpGCCqsoLkpu0srADWQ/IQc8haRlrBgLAcpJk00Mh15A1NrF2l4EWSumC1we+xrhA
         vRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169825; x=1790774625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ui/R75E8kUWbSRcH6Jr3UdntL2soM1PcUyFJ6Wtu9YY=;
        b=fPuKSMT33erQI6ZP1PtXHOEYJ+4kDAimj2QYccXe++A6sMsLzG9GBzDN0FMJqlrZ6D
         0gYKLa6xT/giT5mwdfo0eLMaX8LB+BTR7FJbJhnWyR5v3CgVZJX8abc4v3aY0yOVBLUI
         W4LX3yYbPRo3geVJRK8Q5gTw5U3vvazLRBEAG5cxpez9caeikSIOSh2BhlU6Paae4Bwi
         /r/svxiBASK/SOgwBfUzAFFFsZohqov4EaxbHPqzuJ8dulTdhOyym6My+Y7+tZ5XXBlB
         Cu0N3OjscOQp0J6ZCwyZAZbBX8hiaqJndUrWa5KPmGHr0BDB1P3Z6zUSmD2XP27NmAdh
         e7uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNr0nY6H3uOceiGZ+fHQG7jd2j7cqkgVNOhrDmRhKhpvnr2bpk/izhKYPMHnjAZEZRAodsTThPEMc=@vger.kernel.org
X-Gm-Message-State: AFuF++m6VoA2hfzP0w8Ljf6ct+fhHw/AooLy223XXYOFerLRdT8AIYqV
	F8QF7H4tNf7V4xSzQi+FQ9DVW6sCb2UBe88tHMRdE9f1vmXaWg9lEIcXnKDwX7IOXih8rGbgiZ5
	rgihWBezfKo8YaDqDhDRrp4f6IjxXw060xJirw0uww4142tSAPjTJ98AjbpdBJ0I=
X-Gm-Gg: AYBFou1Q8ovGPcYkRrraKL2Dl917JECA8BMCZi6qhcohzCpCBFrTHGJBNgpojccw754
	gD16RUol7tgmQLavWijHznxRumGk3gB4jnR5mhSAUDATHaqWc3pG9QgkhfFZIIGUq0UP0zJ+xcV
	MIoTGFX/x9a58pFWxQrmx4D26ydF+zPN8V7GHMhkVtq0NwMIjIB1aQXSHYRHrL4k/qVleuAhDXU
	42Je21TSEIsrbiLUn9LoBfyVjPlfLz7zVNfvq+5wkQGTbGEo8XHsn1H70BBgXOCTiNfOdT6QDJn
	tuYa6b34rZyu/pU0FrmXinFKewi2/f51ljn/ygMia2DTKGWziYIPN0XcLCb1u8+wAds2fnrQf6w
	eWSrioq5wYXuA2rvsZd3L8g==
X-Received: by 2002:a05:622a:60b:b0:52e:3991:84c8 with SMTP id d75a77b69052e-532eacc093bmr44926651cf.2.1790169824695;
        Wed, 23 Sep 2026 06:23:44 -0700 (PDT)
X-Received: by 2002:a05:622a:60b:b0:52e:3991:84c8 with SMTP id d75a77b69052e-532eacc093bmr44926131cf.2.1790169824160;
        Wed, 23 Sep 2026 06:23:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f5139e2sm7037091fa.26.2026.09.23.06.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:23:43 -0700 (PDT)
Message-ID: <a41366e9-2bd7-4a5c-bbc6-e5cc28acca0d@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:23:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: qcom: Add support for camera clock controller
 on Maili
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com>
 <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-maili_camcc-v3-2-2f8d739ac2d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX1955XWgZBY0x
 0DtyracYtjN/wgGe4ccr4AXmrzlEDIVTDpoAgqwt6x8p+pGBHbS2A8xQa2/a4qOm2vsdbKXY8F4
 /bEZKkJz7wmR8lehklBqA8MYkBKlmlg+bDasNUFiJkynDAQtquCjMX5ELlTlo8y7yxA3Mv89gN8
 PDjXgquk157rEvwGAeQFFBKdb4yxUN+1Au8ElgJXBr84djjd4T6cRm6AnGtDlc/O1KtQGZj3Vgl
 ai3mU08Kl4MOHNsGk5dDs8NPlBxy8lqBhBUVFGC3pDV9eh9jaz5qhdqz0rEWYwCOTUZB37pKrdW
 RJyrSZJEvrpG0cra/jnrljGUau6EKbErrFjR15qwkZRQhxnf5ALRdjlQqnnE3DZcYWg9aAPTX6R
 o/BldtEtrVZ95ldLFiBA0mY8qLY6sV1U0owc5rPx7Dlyh4hrHCdz8j+nUNEFaQWsmS2hVKI0rn/
 R9r76S/6CFMpPVFYbvQ==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3d2e1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3jvcJnBrcLkHgcWL8XUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2Y1-IZWyD-NNiFGi9S9HqvCpzrGFQtK9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MyBTYWx0ZWRfX2I4/WUZSaujL
 CgFR0n4PhNLZYIMZPXh9p2fpw0A+Bn5u76ZALC/UVkXqR5X585p7D4VGxgnszoxBY1dLoYIVtQK
 gpUNx3VZBREf2HK4n/7jHElOjtxj4tU=
X-Proofpoint-ORIG-GUID: 2Y1-IZWyD-NNiFGi9S9HqvCpzrGFQtK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230053

On 9/21/26 6:40 PM, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
