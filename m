Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9C35AC24
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343283; cv=none; b=VbEFGkgD9RqNDaz+QSjnFnBZ7eyI2BILrD6ZQTMkj14E7cfUL2wO/5NOr2Hl6LeosJbsqwyjrWD8B/jvEURcG5xO+m0zsqmngQY9fan/7ABgfLGdIAz86XQu2rKghTxehUuhJdGtXSk4M9PlXZMpjenP1hJyU8vbJG5pdupwdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343283; c=relaxed/simple;
	bh=hTyksoAcTNb+Y+CUq/HdPXZw0RuoUg+1Sz1/5923wdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcQyfVPaHV49V0aEXHCdU9T7WFy/YJ2mBZTgIT9SGWp4XlQ4lguRtSUvRru3kDSCtQN6fjN1ouB7Men7MtNMaW8T2RFAcb4Bt97nbY7bRegOoJMtjuAQd0sG4SRTnI/ZDnuDt6gqjjpnhraoZJx5txl29YeCdeHRAjDj7PRt9+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COIsu9Xa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7UMZ0oB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COIsu9Xa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7UMZ0oB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxHRg174778
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 13:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMLDfi/38WU63gwPqnNOo6bky+/JGzTsu6cGlW5UfBw=; b=COIsu9Xa1aol72kf
	XoyJCmc1ttvay6wZVGWAQ7Md/XVirBORzuGdoOSEXoqeDNcNlNWMlxWOaN9ERKeZ
	ix6eI6qVTwLPwIh3PtAlqXyyd6C7ZtEm4SbLAcuQBPoUxS/Tstixlbi+BSi+Trdd
	U00+wzfE8AO8qIkENvvuv4HCZrt58et5tjEHbVvEkcBRvzYeJneME9cNVxbjhUHn
	6Vyh0HdOlKwPJfhdzOeNsCqavSFzWtHZHehdTIkEmBlA/2WQkC8ccO4Ky1Jxg5g+
	bs3UuoRSP0DPfAHxa/zLd+SAt2mShE1giznTBT+kBdmAdaWrV7PW62+Ex0ssZSKW
	9q7Fjw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxsck8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:08:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso104206137.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343281; x=1783948081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMLDfi/38WU63gwPqnNOo6bky+/JGzTsu6cGlW5UfBw=;
        b=L7UMZ0oB3mFs5tPIHIeybH6dyCYBvmpN+zXNPtzT4Jh7aaUjH6ZoaWgimxkhrWnuvY
         AAUDWinJPuVmeS6jIRfkQDR+XEx/rc/E60JosyjWYM1uSYs1YNZ/ho+ASx9xQuURGGrk
         3qhCrpeFMEZXvGR+iY5NVqT7UxxTZyVQ3W8lAIWNKfjgJaF+gkmR2lFJeNiKPnTICNGL
         6x+JYwMPrRkk+O40i4HrG13719YJ8ke+/Scztxs/BVcOHc4Og5NxtydzwXKSTSaTueFU
         1vt3qCoNING2aoldaQURjzYpxibw2k3gxNe6YegcHMHxvrHLjQ68XSS/HNm40LtVhNIu
         iMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343281; x=1783948081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMLDfi/38WU63gwPqnNOo6bky+/JGzTsu6cGlW5UfBw=;
        b=Dwn9KvTGJ+J74rJT5V+Ay2gOw4eFlzBdfYCmClmm+pUqicMyNmwh7xjPXpTDlxHdME
         bXv3QaE94acgAZGfRRT8jw1m1uWPODC/PZw9fogJcgaRItL1aKzvqRvjBPnRCesRrodI
         llubz0NK9Yb5UwiM5FbbzuMKPKW5O3lO1BHoQrBy5iSCEzWttjCkqUXhMEGrdCNSO3Kg
         c0QRQPNY6rfQthNAYwnBkI/w7wY8LRiTSd+QiUehLsYgosSJYC9jAztVNvZmmwSNTD08
         RO5wzq7Op5u2B6xGJ92ULSSl7JZIYJTZ461dsaS+++hkVp/VqR8PHUfJL+Tr8r8QKy1W
         /ZEw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2dognvFN8zYUTlKU8WmlbZtq0QPG/0a+cckijuNDe7GiDOoYukhgeJYNThsK1LUwI06FhPUb01Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBdMjtSWXloUJokk/kpAp/lYuzz3lkai7z05e0H9YgNyY7maqH
	Of8WIj5CwopxLarlW9q6eTatP+E94v/AAmYFUGyyTcjp4Og3z8Sjj0ZiQtomWUYViWxPt9XsC66
	0GPwBm9km4+W4ceTM1kwDOIS/oM4ZYq06yGbb4wZmmJdvzCcPIVCfWWhy+4IB6HI=
X-Gm-Gg: AfdE7clqy458x8a7osbKfUDozX96T5m2vey38cPTy1gm0i+Hs27dXTXKrFmfpJK8I6v
	FC6w7uCYf6jS2vl3HJMYv1Lyd1KXHvWISMGkvsl7Y95u8Z8WFuUxfPz4m9SrdaBkGZbtHt+1B0w
	9YcYELfoK9911bFOwHxW8qqVhyAwLMElc5PzvMzmJoCjArm/gv3ID+HeQr0iYIlhzVL2RBJEpIH
	4XrBTv1JPDbqhu3/Qy5Hwk0l+mHTL8rP3t/qq7MTw5IUYCwpJjpVSeR+nw7vq3Tf30dsBSdKKeO
	MFKlxvHV+EqPunvgF1fIpsnatSWVAj8iBLotZUr4fT1n79ZfohG8CGH0jCrjqsGyhnoy2towfRt
	RT2cGFh6rmXaU85brtkvXAayKONrk9pdQTbA=
X-Received: by 2002:a05:6102:54a8:b0:72f:6669:286a with SMTP id ada2fe7eead31-741f6b17aafmr1576128137.2.1783343280550;
        Mon, 06 Jul 2026 06:08:00 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:72f:6669:286a with SMTP id ada2fe7eead31-741f6b17aafmr1576108137.2.1783343280126;
        Mon, 06 Jul 2026 06:08:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091cb3sm757536666b.22.2026.07.06.06.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:07:59 -0700 (PDT)
Message-ID: <1abf5f75-730e-42bd-b2fb-950a6c6c2763@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:07:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: camcc: Add support for camera clock
 controller for Nord
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6GfedNDj6EOJMpKGNYvRrK13tQFql2QJ
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4ba8b1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7Mhvcmd6cMb-wOCvpSkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfXxj46gF4tD0mT
 WPZAw/MBn3PLGKAwxORbnvPp/aPOewYY8yYt48Butnx87wrkMhOaOeestbkCTuALzTfPWoSUp8z
 guRSSCQKMvfZ9IIEBbNICQA4D5ZHJNE=
X-Proofpoint-GUID: 6GfedNDj6EOJMpKGNYvRrK13tQFql2QJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfXx2Mod0qpJLmn
 Uc/wtgkuQXhlwPEvhzNClXeVKxRs8SUARpsuFVIb43KcqqC3dNCLkHGdmxsvI6Mg+daNCH/JWHJ
 ad8kRCVaZMcuZtGxSUFLJGl++sfJBG6VTXToGPEfOuuoTScENq1PujGyW0EQIjPWziKLen3M3u8
 Fg+Nc5nlJoZBTy7kot0kGB5E7JBLDogrOMaXwdMbnsQ6620F3zFDUEXLwDhnZFwJVExLEtTQyeB
 ABNTmJkiwTOB3KX2LGPILl6KQzlS48FGhTHE9BDtIvC1Uw+unyqahiMnNhnSwvd80bgXaeJ0zgM
 OtCnFu91kbCsH5zRov3SZMQYw96ndFUnjbyPVYFbY37Y9lnPMMmHqd2ZyD2GyefMUDXWnrGxJLB
 jPMzuZ0fd9pR42zPQCmmmqK5qwePe3Yu6Twv9RTrRa8RAn+W4hxZOXAIkZdLAmjmaTNNeHJaFJR
 mxHHkSAZI8v327MzFkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060133

On 7/6/26 10:57 AM, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Nord
> platform for camera SW drivers to request for these clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
