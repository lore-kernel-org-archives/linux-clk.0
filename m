Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422F84C4F54
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 11:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769382; cv=none; b=DW7+F6b/l5xZt/xMw02YAg1IgjDdBpgsaJVZdUaZmeis40E2C6i169K0umpx7rfgA6C//edVpipDGlFnG5DtavpgX8GTJr32s3rQ3hoYBJOAwL/uXJfKrpOzz09hZf/yQL56p+FUW7GvinL9TJTJqfU+Hk1sre3+s0QOYaKarlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769382; c=relaxed/simple;
	bh=WUjzBXyNP2FBcQWN4nnGoAcIDOaDJLOVTRfV4ctliNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l89f1+adOiqnMxoqw2ti1eRaQyak5ZuJKLTEBdPatPFwxeQuePwy+Iv0hcVnwSsXznO0PmKqG6D/lNMGcHx4QhlRvi5ZKnUT1Q/15hQGchZPMcUkthIzUz5DTGFN3X3wjL3f9OwzCeAyd2LISPcgLEEC1ux7sdYbYOY+zBY0f3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QowI8aTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVvDJ96h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QowI8aTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVvDJ96h"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7JLD3554799
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 11:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tLq83jBWXJ2WD+MHRxEd8SsRPqwrpOkDjgIpsc5DSJU=; b=QowI8aTVnk1aH9Og
	OcIY0+Owo6cvjriOsy2g++O+ewuS3tT0qnNstt11aR+UuJErd8idc8G8H5PWBLvo
	g9HrrH7K2K+Wpzo1oCws8kO7b1MzX9If9WV83wmqc3plGhN7X3fG1GFJhFxJMyId
	mbOrF304uKSvoL0bzcc5yGDc0d/yQCVX8GxuoG97eAZc3SyOYwL6nSQvQDaUDlcQ
	811kUcQssrEKJ1t9R7RVCS033z3GDX8NjSj7D6WeUY7DlKNbmjJj86MGvbMXhyRB
	Y57rIfdEPicC964pEVN5re+dhbtK7GErubGCkDGCvFuNVjr5Il99zETb1yvdizgR
	4INVlw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk8esf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 11:56:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91202bb99d1so7883336d6.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790769379; x=1791374179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLq83jBWXJ2WD+MHRxEd8SsRPqwrpOkDjgIpsc5DSJU=;
        b=fVvDJ96h0l7zlC3SfdwRsNDBF1dZZ+dZ7qs1n320Oo0lLq+das9ZtKpUsTMqlY/b8s
         qIS8hX22+ieTyLJddM5QPaQuZf3d4Yso4vFlj3Ct2p6MlqdEW3ObM/Bo0Jc22UcGEXQM
         quyPQ8yiGrOawQm8C67WARhKY9pcnRBu0Og1IQDetCZB1kAygseNXQLjfvnZXH/HI61e
         9ot5yAA9zQ+CjgrY15LBd5VvZjFAl1dVvidkJeMBjR3yNtys3yHSL/60o1s0kGaNmSSI
         DNjxzmUd+CwkrQC8HAqNuuyMjYECrLaBYk9XbMfUn7V8M1smco1iYVc4fv3jPC7QjffL
         nn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769379; x=1791374179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLq83jBWXJ2WD+MHRxEd8SsRPqwrpOkDjgIpsc5DSJU=;
        b=GROGz8hboFtSbOAlsAvqW5gOOdgJSJiGDrf9TQmZ0/8hiYPYWBr2GVORSrxyrAqIaC
         baOSeEbWaoa3glc81JsaK13ZfuX2fTJ9un7KvSBer21vmMZzmBqodL4PadpX2vUOkqol
         nhx0/1c3dXKsJq0i7HcPAyKmiNiuSADRoxCnaGPCSHo8dZTi6f6oUnBqMILIa+HNW3/x
         57J8XapCYHIDmVZefW/3JYsm80/V/ZJa9RXw05I/6REsFhMgrJ7u07a3I2n5J6elDy6B
         2gPV8a6EfOwaSn2QTnOlNtKysJ+XNZCA+vnhQnwj9kHz0dYytP7XfGpEYSeQZ2fg8UPt
         bG6g==
X-Forwarded-Encrypted: i=1; AKwUvBw0UoF/9ltWE+0kXod3FCFeC/BWN9EFbZlBicUYJj+EXIkCE5/C8J3K2vyf48nV6tTzD8LHNrx3eaY=@vger.kernel.org
X-Gm-Message-State: AFuF++nmdMrTT+MUMuh8vJgPBjy8CYCpufOIMSAWf171Lhx7t4aLnQOp
	bf4xesW2PLkifjZOly0uHhWCzz86UrQWHfZmQ9bNAI+xvP/CvgtGV09JkHk7xlBjbqGA6WU917z
	+rUpBAieVy0c7weCtW+Mk/VLTCoxIrBoIUIpdSjrPsWbxwmUOOFCVCA8+IOV48mlgpTLvUBw=
X-Gm-Gg: AYBFou3W6GgPKxtyKD19MC220SMhnrUKQjj1EJaykV+Jk+o6Qo0BIH+ON9DDbYtziYN
	qwf9dtuc6Y95j4kb8CeDBTKICtc7eQXn3MXVfzSc8HJBumo/JUYLCUY2CQe+XMPge6xnGjNi+7K
	VvQq2cpqfFDPmCjpqiVIoewXO48duCI/Wal02NwB50YB5WnqagIqIlP9xbY1zpTMaqpxJjn1vDq
	DIIp5lwdU2rbuebUEJvf4UO56arGevSpV1n0iB16+rcxkmszCCXdS3ZzNz+dVJzagwcQwNPUTJN
	SviWQgMFhLFFxKodEi/Q/2VuU5frNnY7jrYs256WOwGJLM4T9EuRhLMhht+ToIrylCO7gAy8vU4
	IdChTeAWgjQYUPz3i9n+B5w==
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr167964485a.4.1790769379361;
        Wed, 30 Sep 2026 04:56:19 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr167961785a.4.1790769378891;
        Wed, 30 Sep 2026 04:56:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae158989f1sm675333a12.34.2026.09.30.04.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:56:18 -0700 (PDT)
Message-ID: <3217e1a7-f463-4e7b-b213-91e59100dad7@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:56:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: Add lpass clock controller driver for
 Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RxbJCAx0UIfviLnYmUACHWgqEGNVcfQU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX1xWt/hwSF9wa
 B5dVyvrTNi9ASfW2Y4d8iK0DE/wE5P1vqVXVwFK1qGRY4eUqaW38cGlCUTw7FtB40QAfkuPgNV6
 Ix/EElXbudBPWWunNQfjx4Q4Nj7lcsOn1ZpWk0Bo20YalHZNNkv2rQLGeDQXcDg5XW4mwqZYkYa
 8zQ8dSGL2JgvcKeeSIjwCSuuBfqAlXNUQysysWveA1DDltQDBJDXE2PfgUhkarjpSDkysmgsjEb
 TOL8/g8UCpP+17Xxf08dAQozEeefme52QQu00LSyt12pUAr0UxZSnCKRqupqQ9BX8cClP5IGrVt
 mDaGF3Ws7frc6ED/b/fpCwD67Vg3ls+6cMEamEknviB4S7DFrRj43a8ToImBk5kasMosF1wNYK2
 wkJJGlCMp8DzFgmYWsB1W76izLjpmEZpV0/doXQpO9vjsN7wss3K+6sK0Z+NTiidblXMCt8gd/o
 BbW5j8D2t9Mum9PdH8A==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abcf8e4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=H9QmddT51QaNM9ltfMQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXwlIAYvs4t+OK
 34aZ+huiBqRkWbTzbk3FMC/VTfaBgiiWS9/Si9aYrsKF3p/tF009rtSZno443VdVDeZfCR+VlQ8
 V5HDU6UFsqJ0vv4PR35Lt4PGRgdNznI=
X-Proofpoint-ORIG-GUID: RxbJCAx0UIfviLnYmUACHWgqEGNVcfQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300047

On 9/25/26 10:46 AM, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on Glymur based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
> index 356625dce99e..eda13686850c 100644
> --- a/drivers/clk/qcom/lpasscc-glymur.c
> +++ b/drivers/clk/qcom/lpasscc-glymur.c
> @@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
>  	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
>  };
>  
> +static const struct qcom_reset_map lpasscc_glymur_resets[] = {
> +	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },

GPT says this register doesn't exist

Konrad
