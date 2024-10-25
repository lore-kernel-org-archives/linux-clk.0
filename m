Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD420BB3C
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729880637; cv=none; b=ZaFltjlhleNgfujzb4Z/xXveKFMvjkDp0gmySqrz2bOkrv8X+8sFbJf/FL7vcrU1WXrFCA0JMqu7Gv5bWHeiQ0Tpp20Qj4d8ECQgcYIk+MRNM4mlK7b29ymHKhLZuVintlH3X0ytAZZBbeRYVfedAVEzUUXSlulDYp/NdCSHZ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729880637; c=relaxed/simple;
	bh=VuYfXZbXysbh25PQ4lYW3IZ7zhG5XyHxt5bS/C5tDKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWWcdPwyj12YW4Y01IHG5ny1FgGkabYI4MZcaa6WRgBOVTEDP655Bers+uq4VN0rsoWAVW3icE44XC+zo+E2aIXFNVcHYKJ3PIec9ddl/58FXg5E3yrZVRHtQp+Du4A7hULQRa8ywtWhBXFfz+PNRoShOkLEjXJ7Sf4kG0LicEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8sYcjM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8sYcjM5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBZivs004997
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 18:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3beKkZbEARnsxmifHxpb705DaWvn5ZgjjjVxCqTJTSg=; b=M8sYcjM5fJ/jXa2z
	9hxff1l46aHfnI/W+Mr2KY9mftX8xgo5eNNgN96IsRINun8ARviRaQgCSuyPNUe0
	RhRaWtmamCJnvlnalhZXxqtD6o7UNMALV5ud2S0K1tf1jxk6iRXOJ7lRHvoTyAJe
	B6B7CjIeO6VFYpFRHA6Ghg4Lp+Lh3k2Ax1l/mgbMk+UW/E1Ornf30Hv4/fZ3Rkph
	Iql3/GpSHEnIs/kLP3IRmzNtv/1mEo/lDcRd7CsNVCoB8N87zpokOFKevse+JmKC
	iKgFCPSlLfmmk2DH74SLwxmDWWodkXDJXN+EusRrDFFXXcSmkGtEKABmhzLBcSkD
	/n0sZA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em68a2bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 18:23:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-4a47e84e2b3so50385137.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 11:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880632; x=1730485432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3beKkZbEARnsxmifHxpb705DaWvn5ZgjjjVxCqTJTSg=;
        b=sQhqMUFnGA52mxFJDqprHpDYQw1oxDcMcI0wrBsUAXIlgkFfhmjjTUbiYO7yJRu8wh
         NQwFevY00FjOFcXO4+e8vVbA0NaJuv10I9GzpdMz/bs63jTXtXOBChVMefT37ZKza1Q9
         dIZmW7GePl631PNmSDmmvylLRug0R1NLGFgSDbl91+H5ArVyah6hmx0nQhVk0AanWSOg
         UVy32qWGT2p1u14onajvpNNzJRjMpaDGdRMch0P+Pk1PzgfscvOztmQRkNuwSMsKunVh
         xjxm4hN7tTSUrYmeTSmo/buPRM1XRCSb6BFAop8Nk1TCX3WYjAWf5rEyD7DuTS+13Haq
         q5VA==
X-Forwarded-Encrypted: i=1; AJvYcCWLv2uYNV2ubtYEcpih4GPDUZUVZ8WRzAi101yr8yo4B+zzZW5AlGWsR6yGDd1t/UeUXUvyyR4qVl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXXzMAD/NBMPY7QIEDYPYLtxi4BbEvtOea7Kd8KQ05n8kf8CxX
	RrjnOITh6jFspjEniqKi1X3H9iPohwETTE0xOMmPYgavBTaD7tj1LvbB3V+37KHyuQCDRnQdfgb
	6+lmJqmubHjbioi8LgtLJ4r2guUXkpmP/QpJj18H40JVMkA8bN97K8y7xh7g=
X-Received: by 2002:a05:6102:1610:b0:4a4:7928:6381 with SMTP id ada2fe7eead31-4a8cfb2cbb1mr246631137.2.1729880632481;
        Fri, 25 Oct 2024 11:23:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/EV2cJbkJddZttFd9z9JB9kp8Bb/TyAtZgttyKQ7XAZIMKzi2FFIjhsg3QqvsnRbaODGO+A==
X-Received: by 2002:a05:6102:1610:b0:4a4:7928:6381 with SMTP id ada2fe7eead31-4a8cfb2cbb1mr246611137.2.1729880632106;
        Fri, 25 Oct 2024 11:23:52 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a0834d9sm95176766b.190.2024.10.25.11.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:23:51 -0700 (PDT)
Message-ID: <9761224a-08e7-498a-a052-adca6bc405e4@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:23:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] clk: qcom: add support for GCC on SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kalpak Kawadkar <quic_kkawadka@quicinc.com>
References: <20241025-sar2130p-clocks-v3-0-48f1842fd156@linaro.org>
 <20241025-sar2130p-clocks-v3-8-48f1842fd156@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241025-sar2130p-clocks-v3-8-48f1842fd156@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vXdpE_6HoggM8RkmVylcGrvh84Rq9zRE
X-Proofpoint-GUID: vXdpE_6HoggM8RkmVylcGrvh84Rq9zRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=632 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250140

On 25.10.2024 5:03 PM, Dmitry Baryshkov wrote:
> Add driver for the Global Clock Controller as present on the Qualcomm
> SAR2130P platform. This is based on the msm-5.10 tree, tag
> KERNEL.PLATFORM.1.0.r4-00400-NEO.0.
> 
> Co-developed-by: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> Signed-off-by: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
