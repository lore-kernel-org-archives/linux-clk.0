Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B151481679
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912134; cv=none; b=id55Dgiu6USqcAY3LmmYUdkjIf2KR70jtW65W0gjJDnnbZABJUQoa7B6bLW20OnWyrQ4WVhsLjuY0CTPTUEI07mRtJJ3Mc0NhYQL6OX5TeIBeF/C5yXmHiaOQXly070XAkxR9q/++bNNhA+HHsz3G9heoSUdXDyfNrSIZE8uvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912134; c=relaxed/simple;
	bh=fC6o33yVMtcIYR9TGEh2aBJOZuz3UTNnUSTzAlE4OAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3EPbCAknWiO65GgUqi6AOFA/2DCyD0E4fQmXy9cjkGkLZq2UBusTLysEaCTfyUYQi++lZhJTp9qX9Lb4MnD+/vd+z4F4OsAEwAQTxv678Jiy0AW9QVojXHRf6Mz4eoTM5q61rOo0Tdej2cFP3yaa9xipV71uAThkXY0gLPKpXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb8ZsrfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mb3MRnSS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb8ZsrfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mb3MRnSS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661DL7ck1080274
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 13:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EtLGdtoQuRHwGrQtERVgenV97LkHCFN0PODLn7CO1Q=; b=pb8ZsrfQ4g1e5br5
	/GWLrG34NMoDh8m7JyLzyPmPcO0D641l3uzdS9TZCUuIWVSv9bdJ0m6VrDZbv946
	FwF0J2RiXr1BrptUz0SNmKELGXRPX18v2k6Xb6lXp6SBhaxuHo3V67bey+B/tTEq
	+1egNH66jSwUyxPkmgnBA+mQ9mC76/3MXID/rRREh+c9NJVEu57FzT075wcOxIk+
	t5x6TQfQKzG2ytsfHVV7+J9xMZtkJM/uR2KV2CrR0084UmNOcHiWgyAH/PsdqyrQ
	/vrQKRCKL11Ixxvoken/SIDiP2w+XQyBlBBqDyHHhXQxSR8B+LnX/Q9YSGvnpxDu
	q5zPRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0806w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 13:22:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6b97afe7so11190685a.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912130; x=1783516930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EtLGdtoQuRHwGrQtERVgenV97LkHCFN0PODLn7CO1Q=;
        b=Mb3MRnSSZnyANNeis4SfC3lWlMaX3YVdLC1vedItZEK4ILlMjPyaXVNUveKl2o3x7d
         H8SRnHhcOS+N9Bsd1NNKqUtqi0+y4euQ1hQpXUy4e469nB/bp3N3gBtYPc7jVHnvElwO
         hzyAYzyxWvsqY9bqo5H5kUZ1I5Ii+9zwO+qPRmOKTx6mEDGv0a/PiHdHJAE4DzzgWmus
         JNbs8o+ChRG+//UrxNetnYmOEBFciz8Ix0cHQESTgioUXDfxLHKVVIgBsgd2X6iRywG6
         G+GvMX6DBnhhC2vnalCWEq671IGvYn4H1teYg7iBTc7tzLW0pCJrLJsHsmiJdD6g0TB7
         DCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912130; x=1783516930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EtLGdtoQuRHwGrQtERVgenV97LkHCFN0PODLn7CO1Q=;
        b=MgueYT9eUb7pE12M5nf8u0e0hTnyNvAy54ukohcZuvDL3UCUGWw6GiEy4AQ52lYsYD
         6nExtNuBwO2NwbyePX6wnbhHXDYaNjG07zMPRO0Xq/IKXEKAy1Yuewd5SB+/SOIfk4Bf
         mPA2FCr39sjRWgNeSJ9DUS4GP/Zs+ZXGILXR0NpTENWDdFPGy0S3qH5FcEykxwWMkcD8
         JGMs73WAl0MNfuu4L/Go+DbWVsKI8XGoC1B/zQUemiMXIsRm9RsarnfCCrBGQyQjPIhO
         oIkrg5PFRzlRO80VbjoVl1PxMeyavGVkR6bFx1pn9wmciIDTna84bjc85aa+N03UDAe5
         SYIA==
X-Forwarded-Encrypted: i=1; AFNElJ/vz3TD0HgfcDWor4DDnog9ijzicy3mcHrczR1v9E9b1pT3aC7MOVSdldMzI3UbHhbZ4Vz3KmTw4VE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zmlaoYVb+vi0B1VyL1HNCwT/fwifPXXdU/JY6zTATXGjsOML
	sYKarVgdwxsOlSQylCxqUzjRwdQocdbNL9lJ4yPTwfvRgF2hMBpbbe/k3RrG3cDcZooc54AkbBj
	aBbCMBr/Mo3UaQlu9lbuM1zPeZQAnhKt/HM22Jc97t3xCVPqQSXNr+dwDIJTYjWA=
X-Gm-Gg: AfdE7ckBW3IGbupGnfaWspCXrRMn7/cQ96vbxEQSxxIf/Qq05Ahjflsiktm31DYhg2j
	10U1oGcPcYgWOxhc86BKw8mgKRueVORRcEmSzmxIJ2A3Y0EVaKUR/jBREoRZxw42tsj2hJHPew5
	CeCuzAWTH4Qmh8KDqOOVSoKaeN60/yXpn2LzNn3N9y0ihg7yj2LPwx2KI3o0W8cHpsNvQaMeLVP
	+oprITnCAZjiXlvzI3LlMojOq5ScxUdx08nZCOlDuFJvETygmtvMSeZOMeOuJUQAXxjLP0LgIvC
	yJyBqlDz4kEr/t0p1mzb5mewb88xbgQ/Qgp/YmkhZiEeVvDnPUbL4d7vHVaVy0Dnh6NW7CNXa3w
	634SRzNXSToISuy/5qonwZryv9mZIETKXMmQ=
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr13436191cf.1.1782912130393;
        Wed, 01 Jul 2026 06:22:10 -0700 (PDT)
X-Received: by 2002:a05:622a:58b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c26a560f2mr13435061cf.1.1782912129446;
        Wed, 01 Jul 2026 06:22:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288dbf4b4sm274203066b.28.2026.07.01.06.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:22:08 -0700 (PDT)
Message-ID: <2d0d3df1-31ae-439e-9970-f7d3f589754b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:22:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as
 critical
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-1-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-1-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a451483 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=te8iVueUN0VzZH6eLK0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: k5z5KJ2mCgOWuXlVZsgEvLpQwZ47lmPz
X-Proofpoint-GUID: k5z5KJ2mCgOWuXlVZsgEvLpQwZ47lmPz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOSBTYWx0ZWRfXxSA6tCfPqGPn
 xDjdVWKe2/PTeXjbh6fHY7qIkjz4axpdqu0AGys3EgRkcnf/s5RFOmmL8ldqU7ElPd9rCLNew75
 2w/LznD/MU9cMuUZxTBKb8RiRggyW2HjibNbwBbOmK9dYqm5w98S2s+Y3hKD7kTinK8QxWhokug
 TtasIGQsR8PbUzoFDHJfLpfe7/1LXCjnIdcEz9W6+NStNyaBcvsrROXsKow57M/QEmDaxFcBOcz
 Zvp5LXJvC6MchWntoGKkxeV4nur0g3nj7EGNigweh1WYEvcBaacoc3/HbjPKp4Y77KkzwNN7sWP
 QBuOi5Yhy68G8dJ6FporMqIPWAX1fdheUc3qkSUQXlIMr/ea0zugRdAvEartQU+zcdzczFNyYir
 EUwms3Xhah5hOkRklVPfencCyrJ8VcrE2Wr1i0tC6rXAOHbGO8xKHedBTdHBOdNgAa0iKLnGsFO
 6b/hx6pn3SuTanOvjWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOSBTYWx0ZWRfX9mcHrrumI+vp
 mOKGPpxyBM0/G1i/XIaHGM5QyOeiXeqKis/2571jgSIgGnkHYwVN0ZJWaERfWbVTRJoAmLQfgGo
 OoTTZfxvTtcD3XZTkvBqmKzQmcVo2OY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010139

On 6/23/26 12:54 PM, Taniya Das wrote:
> The PCIe link AHB and XO clocks must remain enabled for proper
> operation. Representing them as clk_branch instances allows them
> to be gated, which is undesirable.
> 
> Remove their clk_branch definitions and register their CBCRs as
> critical clocks instead so they remain enabled.
> 
> This matches the handling of similar always-on clocks in other
> Qualcomm clock drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
