Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21034CB8CA
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 11:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769221; cv=none; b=jydnrinb8Eudu+IBgIV7TWU3Mc0JuH4zNa6k3gMSPkVebR2XbpfavOm146ABoaH+8bNOguazZbs1a/GfiJuwimC3+l0TdHXXJ8cID2rpj4LLJNp9OZSm9PeD6TxHIDvKBrugV6yK2GtrtdhYZaIQyglOu828CH5fC1NuCWwY8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769221; c=relaxed/simple;
	bh=2cnELlXD+d8nHeJy2IMCMnOpquMq+7sdSSGzFyMc2Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7J8paaxgU0MpRvFp8mUiDX+0HgfavPdbUQDQ6KoSJUW+1N4vrSZS4L4l8afNUVFYpowxdlymGKqjXSePCYL5FLNTyabmu/d1/uwOlVAFr4nM+MucvxKzaQ8VGUBxireGxfHfJcztrxgFrOkji1W8V/LzKc/WLFTpHlF5hO+vlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmqBPQXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clkjEDvx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmqBPQXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clkjEDvx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7ajJ3547268
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 11:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=; b=SmqBPQXhbipmltUQ
	/awXWS2ERc58qQNMMm8atgOnp9iTfyegw67YPn2R1xEEG6alwJPjLCqD+3655j3X
	I1R6PAVArkc6vexEX7cpgp7tyJUw/JXWlhNJfB4SznF0sDeUQIcIdI7rrq7XJocb
	daeRe/DvchiGEEZfbNihWLBkgEzNZO/J7F6LRo+2lcx9PVrOGeojQG3Qvq6y2iwX
	ojWNPzIN4o682sIaAaxGoH8pAe6gJIC5Rpojm4nhZR13eFhktcRM27iZzmiRoNHH
	0Bi0u7d7TJXQnnkyQtfDQa9Gejjnbm5E499M78WbzhdK+pF1NF30Qw+xfNcApO0Q
	pGOljw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w141dc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 11:53:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d0caso102476785a.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790769213; x=1791374013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=;
        b=clkjEDvxuvPPSGisDjL5qaCxGyUGW7ne7JF/vqjPogH9E+ocSix1h1GQNTtN/mYWaW
         /5c5HAj7WB+cdkH5g8AdUD1rQWBTkekSq6Gtx+9fpRuGNA+My4ZrhZGI3ldnP5m/UKU8
         M5/NxSlkJmXhCDs3OCfrxWjFs8P0INGi+Cv5iQavaDUb/1ASDV9gRWTAe4q56Z2NSdbZ
         wz+Qv+fFwulR2DBPFJAyJP1Me6uPztQbQK3RoceMXnSmod499BtUoUOtymzSg4+dg2Zi
         ScA04rOyFoDw+A8uuvUDCJXvOW0KNwaiFX+sYUQwbeENbYZhaWrSYm9wXxxhizDVa611
         +C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769213; x=1791374013;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=;
        b=2z+jVlhUYwLjG0nNSU+133ChqvOFcpLHFKI/qVy54U+QtCbtBy4WN7bTpXfQH/Ya0f
         4BRB7vCqQQSjzjqj5jOBa4IHx4WM8MPP1fiXGyRc38YoM5j1IaCfxEB76kf/d2SUxxYJ
         qs5zL6TgWB8K+4LkNPyTCiOETULGhv/LD2J1VtL3Ai5MWnRbSrH5riIOtXSDZbpNJnrQ
         CPeTQNkFVM6Ck5y7U8tJwxTH0aio9FU5FCuZtXXChYZqYeyKwWIdpaFnqua8G7bQJrsN
         6NF1xGTg2AAqhKq3h0Xc1CSpqDWogbORy6ID78Qc6GlJj9OhVeqiJmEcq3WUrCfeR3L6
         +bUA==
X-Forwarded-Encrypted: i=1; AKwUvBzFuGUgfLUHCy3A9LpBUt5EHa6O/TH4V/Tu5I5FztQp2WmtJyPM9LMdF/9ic5agJxzsllOOzkQr7BY=@vger.kernel.org
X-Gm-Message-State: AFuF++kqDrn4ncVgXUZnHYfr8EJcVeJ4pEnyKx1Xr0wq92WP3IWLMjxf
	X3D9j3IizlrMzvcQYD6hv64q93unXeKR1Kv0X7mj35QaJnygfZiL7Xizd7XJymsj5iV9yKp1nNq
	eUIrCsKYZkn1dSfiNmhUcEGw+r4DnbDmx+dfY9LWHVCvuKTAwXim7VXbu5htpcmU=
X-Gm-Gg: AYBFou1BvAwqWWMeCq8n3qBNpYiOcNX72nP1q/apL+PvFZACxSzq9jHmq77PWYfw3V7
	9KmH+/bEGFAQipk7Uga4Tfg2VD9cMLTnxMCJhhu3Y4DG8Y7/9644BONPas+YAeWsgRj6vusU6J7
	BA2jnola6gK5y01spNzKUU12mMidt+1+9Am+fM4wLiZ8INlpsnD0ZP1KHoXpGL5CZkaQuFUQG8k
	4Sc8Y6CSRPvxwd1PJsXT95tRQIzmYWQFNRGWfUeTh43sgq5sPLEUfsObEWDsSRvTnwa/ZaS0AiT
	JgSJG7zqEF9bIFSB5CaVuJ5qiIARf01tDU1uSK+AXfzcsgWeq8beHMGk9KlqgRtNbvf8vH+Jk97
	Lpe8nBDztOeqcy/tDDHZ5vw==
X-Received: by 2002:a05:620a:6f0c:b0:939:48e9:51a1 with SMTP id af79cd13be357-93ca956cb77mr153882785a.2.1790769213516;
        Wed, 30 Sep 2026 04:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0c:b0:939:48e9:51a1 with SMTP id af79cd13be357-93ca956cb77mr153877785a.2.1790769212834;
        Wed, 30 Sep 2026 04:53:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9e8csm746673a12.2.2026.09.30.04.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:53:32 -0700 (PDT)
Message-ID: <bff27892-eb57-4c94-9c47-d641e64461a5@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:53:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
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
 <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX9kUHR5GwS5b1
 rL/+2/00fj8qq5un6TJa0Q+RRvbTQgcDNlWlx6OMP3Vck6jtiSleEMf2Fl1MnrabiQj/unQKXdy
 N2dTZpm4EARgYeHv6jbn7/Qe95hU8sA=
X-Proofpoint-GUID: foIvJfImFuxY7YbfNEA2AXgXEI_5FNsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXxHDUsOKQd08g
 yoZCcrRw10sJL48mueCffOd++53XS165aHgy7ZslKg1awhqLe15ONuNcuR0A6aM06axLiqSVKEq
 bxkaYUZ4ylYNEOu42Cu1RNT00zg4u9/sIU/FstQooPPEC45OB0bEbwFN7e001pLkMITP8DBjppC
 gNtNSjkuINHTFin1DE50mke+6Bgmelxkx/nmpiyM02GWL1DoUrkWQNj4mBImYzCqcRS40ClltsJ
 cEkvYfR3y/PH8wfVIr1Ztxpu/cXYvBCOCp0DQtAWeokq7w/pIQk+gIPvCc4DtIfSKbxfo4nxdhe
 ayzpZNmZh4VOxub34Jmc5sxXEYAAJmxqGmfq69BDlpEwIKmVJ5VpgtuHEI+tQnUKSq52ATXRevt
 qEFXEoejUZhcBn4+tvOxy3o9WX2/lnogQ1YGJeR4hpOzTkzFJClh+u+eLBR5FIZ3088jKboZM6q
 7CrFWmTZaBhD8u9Gl9A==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcf83e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hDswOLquOSrkhpMzeLUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: foIvJfImFuxY7YbfNEA2AXgXEI_5FNsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

On 9/25/26 10:46 AM, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
> +	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
> +	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xb0, 1 },
> +	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
> +	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300c, 1 },
> +	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301c, 1 },
> +};
> +
> +static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.name = "lpass-audio-csr",
> +	.max_register = 0x1000,

^ needs a bump 

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
