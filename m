Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76433DA5B3
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177250; cv=none; b=O/SOeBhFOzi/kBs0ZY748D/0wWgApIyBOs6KcOLPj/mBucUyQu7ocQ3rV0VIy6DlF7lbrbDVF/Tlf9rEp8O9SBaYZEQj4LxCl6QK7ym1H1d10oojk+Q2wAB2W9oTm+JbJgKPyVCUn0jLyCOUh/KPCatj9viPhL/YmtzTvDjYv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177250; c=relaxed/simple;
	bh=D1vttMUOCxgS8k3W32i9Sy4wDCvNW5OarMF4qqZbhLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cD3ms/cPGeG1SvleroEN7N/nMvt/d/CvbzpoA+33ESlJA7DS3T7edNePtY7cqk3HHpwdsKMaiP71QKFBymwNtnI7/CB4L2WXOXQDhm8RJhIT93WF791KRa1t7DP+6JcZh/m3e7JEiuFrFmkxfL9pn2Eg0Afq3wC0VVJZxgyE1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sg/dl8Cf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ob+zodsg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sg/dl8Cf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ob+zodsg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBgO263545
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0xd9hfOGsaWtfUYWuk6OyywseKClLK713g5AG71WD0=; b=Sg/dl8CfWRHzEir6
	Y10RSfzRycsFABVnelDS+RhEAQICmo3HJEHuldz+Kr8uYkUWpXULpF3JAgWnbpIY
	W/3e/w6HOwFufeX3dNMRfXJY1i3qFs27VAi+6I6/pHmGOCLHY0QJNM7PPPY5PwGA
	nUik2Mizf4WCinriED39TvF+oW2VdAxQLHKD/TJox32eHOHNw3adKv7biPm6BXSx
	VCURM3tpA1Zxkul6JoqzHeTRTzbcYYhk3d0GqzIR6ynPm5vBMamn5MM8Hq1KZlae
	Pm5BALXcQklWg+kkHboNCxYxXAa2mzQLwRZdl/KJ+xIzq3NZqoXo9kzwBBZ2Sk+q
	ydJwsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uu4tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 11:27:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517bdeceb54so11539711cf.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 04:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177248; x=1781782048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0xd9hfOGsaWtfUYWuk6OyywseKClLK713g5AG71WD0=;
        b=Ob+zodsgDcsgxGgDbJZoH9Vl37Tkjvs6hsj2hMyTn+jgPF2KJe5n7fbc224jMU9Oez
         XVPSsoRhOFe/rHFNwirYJ0AMyA0xXTkSpEkLZDl2ExQHlpUHRKHTVPpbJqqDsGExmJfO
         EFWGLmikll97du2D/TJyBII5SolnEmoIAtN7G3LK1mFbwxvZoHjgrEfJbaonh1eQHFFs
         oKFCOJIQ1FW/V6ZIdYPX3ScPrwZG/v1+ddtD1zdulKCLf9KD3y4M1uQJx5Why/dybRNd
         Lls9M8JXcIp1xWic5jHH5lVcuy67nEUjkhG9nL2J+ZrohcvKI85EwpHo0x7bSJYOkkHz
         eJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177248; x=1781782048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0xd9hfOGsaWtfUYWuk6OyywseKClLK713g5AG71WD0=;
        b=AjIw0hcLdyOmmUF6Wcc61bfwO0EspG2juBleq6oEk+IJsEIMl2d7oXoBrkKIo3xEJU
         nLDPV0So/PYi1IztiSh1e9/grLaDR3bOlCgx9xS/elWO8GovLkNgxHbhP3qkiWOlW37q
         MdKpL5rHqgrbK6xnepNTm6xdmBx6SKoSfDNnojw3nGOzgIeDrO36I4TakCigWv9y5p07
         1yZ0EBjta7CKRyhlaQ5VT7MbHtMySoQhaXOKPWbIG4/sIpQUy8qNWn6Qlf2QmLxGMtu8
         4D5ja1K1qOrC2KuB2b29gparmiw4zMdwSbmIZE3p+B064D5IdpyADrQoSVVOJsb/d0Wt
         1VIw==
X-Forwarded-Encrypted: i=1; AFNElJ8ovPTvzd58SISCLK+bYn2bFVSBMcQ0r4imnxnq1J6EHQ1/2xhFh0YDVxZ2Fu7SQcDhFm2q0iWTCVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPt8k3jdd5yBwfMHhz5/wflQDpJcriOO66f0Egx5YA4/pL9dwO
	Lyh2w/stTCSKiF75law4JSMb02Cfa7epYqamoSjsTP3NFRytXvuzLlj2tqZU1u44X0fiC4MzEBg
	Wedkv7SyVjQDL2Dcjq9KmFCKhDn5hpd1WQssSWeOV4p6UDErLHAFNdbulZLE0SYU=
X-Gm-Gg: Acq92OHsgUNcs2cyVfCUv53guII/L+YtI3qMqjnoDlCfPwhM5LBA3cOrLYnI32oP/ob
	vF41CG3aCloIIcTE5rlGnaa/LFKQBuDomweJZMWjMQCpIpgMUxwvbXpxxkIAp0aa84KNQ34efpM
	c8U49qb/wX6XufY2bn4qNAnkhoXp4gX1zlFa52r/zkWGjdbhsJuw8vZh6QX0NW5KYld5lXooAso
	X2MJidx2gzIe3KUqv7TKbyBpNqzMkTLApN160GZk7bF1z6u1qjfLRbH88Itjm6nGKiC6AJBRZ6H
	9TcNE1jJdBVN3P9mnc+5tdab/j/onTBhFeMxvJHnR+MWDBdODZtDDEd+O6DnNJSGIAgQLuatHfv
	q0YjhFZWO7pnVZtK+i5OUwH2gNZxr9Er956BvYurTCSipFrd/U4KJMCJy
X-Received: by 2002:ac8:7f42:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-517ee2161c0mr24244691cf.5.1781177248085;
        Thu, 11 Jun 2026 04:27:28 -0700 (PDT)
X-Received: by 2002:ac8:7f42:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-517ee2161c0mr24244311cf.5.1781177247470;
        Thu, 11 Jun 2026 04:27:27 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfd4024058dsm7715966b.38.2026.06.11.04.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:27:26 -0700 (PDT)
Message-ID: <191c4b05-7d66-4338-8321-ebc593379f73@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:27:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a9ba1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3t_MHGgHUfuoA-dEAxsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNCBTYWx0ZWRfX+OmrLc5ktfEa
 WGL97EtU0D8xN16r90PPFf4TtoMNfbp05/4/Y0xGteTKnH4ZJzTzm+dZQ1GDJ/NxPiR1fIligeU
 +kzJKsUNaNdl9Z54PC+knYFVsZig1Es=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNCBTYWx0ZWRfXwuyzsZ6Y6ORV
 gONVnSEYNma2ynDBkEnC2xHg/u/mTMeKl8IJfmztgkaeR74gt+H5bCvmmZbHfPpe/x/6kFTeYVB
 pAbd3F6B7CO6FVNp7a0SQkUKL8vsKOPiWH2190fP552c2f4SVZNaJ78e1ZnBwb54IfMXiucH0fZ
 lquj2vNC5M5hNya8E0fU9lCB6nTCHTazRen9ls56A1qNNtr87mifJVMLF6bv8t5Ibw+37h/Wpnh
 IMFmO7rGzwLAUej8W/KoabBGWvK0N4VbR8VcwvYpmUF+Br3G8A8PrNf9sbcM/7pTc67qTaGniHn
 mJ0JrLZoTm3rB704vsISGK+9CnpoatZshuLhqfpNDobKVx2yloxvw1JMakXnztNRtUa2wWL9zwj
 UI/sxh8n7tJgs5jZzJqwQCIeM8M+lusux1oSqu6KhYjjNhDyEzcigN/DjAuf86p8/1GauVo3YXq
 dQlxOFG+qzXxjo2ffzA==
X-Proofpoint-GUID: cttgERcdooLI9HJ5mLa0pXpXop-_8SCq
X-Proofpoint-ORIG-GUID: cttgERcdooLI9HJ5mLa0pXpXop-_8SCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110114

On 6/5/26 1:26 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AUDIOCORECC) on Qualcomm
> Shikra SoC. The  AUDIOCORECC clocks and resets support differs based on
> Audio subsystem enablement. In the CQM variant, both clocks and resets
> are required as Audio is on APPS, while in the CQS variant only reset
> control is required since Audio is handled on Modem. Handle these
> requirements using variant specific compatibles.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_reset_map audio_core_cc_shikra_resets[] = {
> +	[AUDIO_CORE_CSR_RX_SWR_CGCR] = { 0x1c },
> +	[AUDIO_CORE_CSR_TX_SWR_CGCR] = { 0x30 },

So these are not "real resets", but for the sake of existing art, we
can keep pretending they are

bit 1 is HW_CTL (1->hw controlled) and bit 0 is taken into account only
if 1 is cleared

existing drivers toggle the HW_CTRL bit (meaning it's an
maybe-on/surely-on switch rather than off/on).. do we need to rectify
that somehow?

Konrad
