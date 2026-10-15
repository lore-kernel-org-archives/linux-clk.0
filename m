Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8852449E5FC
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048504; cv=none; b=CeFqswwzvh1IzIpGpt7KPmdLVushodPMktiCvbiGwmrXrIzADzMOpdCNnK9eifEW1TGsmbfZN9C4fVFudpktxm4fip6+O/k1en+zrPMClWmsiboAp3t3AhdCOEwx/+U0rCSwdDkFtXLFMy0SWrnAjOK7oFnL3Lmtg6QDd1wJgPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048504; c=relaxed/simple;
	bh=NTYhrykTWtTBp9V+M4bLcII7SFmdACoA2QijUmOeDlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0ukXhXF9+Ee93IluYecvX1Om0XSH71EZJVARHMWTCPa94SfdtCP9ewuIED7JCTZPi1MPpY46YbyN5f4E0I6AsYmXep2TP2EsJtoHzsSY9zluJX7W/AepNLG3SUnAGWAKpkgD3G3468ivu68+unE2TXzO0AHTakgr6qQ2L00Gzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbLa2p3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8fAuNUP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbLa2p3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8fAuNUP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F69sqV500312
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=; b=gbLa2p3tR0PkBx/H
	h0yrYWNT3kkBE2J1Db23/igRBTZRVn8k8s8scP5bWJ4KFX2qQz2TIsLbkSy98P2C
	MA8hCDJoXvjVMDD4Ckclhpx5DzerpfbX0mON+G2e25VUqZhLYLv7XlPLlHBOBUG/
	sjj+VKXVO1cE2kYPwzFvsBLO7IP21fbqLVKize0hRzRYmShSCvw8M++35dVUqG1d
	CjgJrpgLN9mb/UiB6A5/l1th91bu0mGLSfp1JRUvNUJCku3K+YkvEpuPIndYS5QQ
	JUanF3gBIOemujcUaYikbY1U1fB5uDr95rhGpga933xtkxJglHCSQ1znePghb2Rv
	FZ/MIg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf3qy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:14:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso1125592a91.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048495; x=1792653295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=;
        b=j8fAuNUPaKxfo+Ae6vLk3px33SiS67719bABoMzYQQbyzNcHiit335FHJcKFotiZMH
         NF/4bK7Th2ljwtulcE8Q697Q7w4Wu1T1vrRmQNc/qM0xEBmqJFsKLRaw4mDtbgnjhISs
         I5Y/TgAHj95ESofFah8Ov5QlH1gKPllnIRzVTZkVV5qFLiJZ28pXrutx+QYk043SJEVb
         FRl2Nd2TXcsr2MY60F9YFfsVUlA2q2zu4w+WcrBGg2P5birc7nBMJH37jSGoHhGoCw76
         8Rg/QMjBnSprB7oMxXej+ecJbS7APqAgD6vaxAFUORoKEGjK89oNeG0yIoxpOUmscbWN
         EwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048495; x=1792653295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeOD1A+VdtDO2QTZ6vSzekuRwWPEc6a77wmmq752bMs=;
        b=GhucT6F2JVLbG49AnTLjo7lBm6BqY+5YSSzAXIGbtN8+6CWcEpnqed4WDCcfbjB27R
         3JS1atbPvHh5ML0Za7ww71tCbmbQREX3sVPwSPhTs8RHgsF5qA0X8AqoCIfrYOmlYltk
         3FRJB/P83Zv0l+twrUPr6lESmA4C341Jc9KE+F/a6LUSr/cc6Y+XGdzTVR8kZ2T36nzt
         7gkzJ9b5pcxzxkZ2qob9SIc62rDJ2mnhZVPwVHu+fe/hihMKKew2EVGNLQ6ffIvKnPwy
         HP/waZsNF+l8XLNqH+wpm0XPb6L5DGpfsmbRUXm6IG2oMQfqBOLtK0wlzXTLFNt0yOfm
         Swtg==
X-Forwarded-Encrypted: i=1; AKwUvBwhyxdA+s3MjVMQYtumUHANYSkRj9sjdgYz/rvRM/+dcEJ/MbE4IHWRE5d+cAsjbm7EBF+n/wzmzQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK39bcxvmRtlHwW+ZP2SEzLEM5ifusNqFw3seR6QqHjhO9Gr13Q
	QUVkR0uNcaG9QMqKYeBNLXcaEcTrwHPqNVSs7nGVT7iuOkTl4JeO3yGvBiWWsj/K5/7Pm94BqPW
	kK00k4BY0M2fk1ImNmf+ROxXb7dicKe3g3d+O3x1vS1VQq/nb3fN4BEWTupOQziU=
X-Gm-Gg: AYBFou3FrvqLbtdUwfHbN+Ox/bAezZ/yKLOEs0Jc+0pc8sMb1i779oJvbKX2JRVFi/3
	POdD3SGJ5DadfihlLYc9O5dvBB8bsRshenQjzPAmoHrgKKwnQBUHdN2U/qEZijI5z1j7IFLc3Hn
	YfHO1nrZf2hUMpnAkHslQzhKj0mbKU8EdQ/Bq8aXYZO/83b0FcniJIL0bUBmnpQV6B5oIWkwuob
	9/WuoQ1Adk2Me2DyHUfKz6t2ZrOfT4zkTWSFvkw8VFVdN3FejXOpA6h5/2WVA1ks9O9nad+KeMk
	tpw5AJGmtrl+IBUxoyXN3Zr0L1v9JCBaESJlaR1zhQMNx0ZRUCNRS0lvpASxKEJhU2iCA5rQqAE
	zPqx1cU0wUGqPdJQEZye+LgSSef0=
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15605960a91.14.1792048494927;
        Thu, 15 Oct 2026 00:14:54 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a7:bf13:6007 with SMTP id 98e67ed59e1d1-3ab3a9128c8mr15605924a91.14.1792048494262;
        Thu, 15 Oct 2026 00:14:54 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3221300a91.10.2026.10.15.00.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:14:53 -0700 (PDT)
Message-ID: <84c2e489-05d0-4acd-a88c-ffbdcd111f67@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:44:43 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add gp_mn mux function for QCS8300,
 SA8775P and SC7280
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-3-1522662b6c53@oss.qualcomm.com>
 <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a516c0e2-0ac4-44fc-99f1-ef8dd051fc18@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX5bA8exFsdggZ
 Jw/kG54ACuI6x6NOMvy8+ovSYasNAUS6t+Fz8AGzcxPZcIeLYsN6WxcuxczCiE63hGR3Z8Mrky8
 deJ6RQ9Uf2pQq1SVqj+pOfTphiFOWVvV0VeqYUUSMD89duD7Y4x6xfnHQ/1uwNgaSC3LS5M8s6O
 Uo0gefHFHfsUyBh/8Q4Ym8oGlpANs/um9WOAas11x2EUDXWO0uk4JzW102tZA5f2C09W987bbZI
 WejTwOIzveCfyzcefeCZ9LH/imhjyYIPm8aq0qoizhfc5B2CZmJVp5qVxhTJuASddMH2ep2Vfcm
 COz4G9zwKwfgR7LaADv7qF63jR70txVmyAOlvADtgF3eUm6/JR6bpwEKPIlvYZHmu0QCw08JXRA
 6f0AW7IqJlxTI1PJDJszTORiTUuVhGTkRmf9IWprB6MoE/n3YYpv7LjXOtFXebc7UaX2VZp5oiy
 7EX886D9NVhsffuIx6Q==
X-Proofpoint-GUID: N4OW_3xtEvA9b6k1vkeTCDfFR1w3uRYl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX2fB0T+4xfuGx
 kMWIq7IDrYNzjNLpo359w1RZNL3mGl9dGHEGBQvI/dwIJSvshkMlWgQK/HGLqqie4zcybPdxmrT
 zKSeWFIIj+6SnMuPUcVBr1r+vCBa+7E=
X-Proofpoint-ORIG-GUID: N4OW_3xtEvA9b6k1vkeTCDfFR1w3uRYl
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad07d6f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xfIMX-YVTLGOWNOYmacA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028



On 6/9/2026 6:57 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add the gp_mn pin mux function to the TLMM pin controllers for the
>> QCS8300, SA8775P and SC7280 SoCs. This function exposes the GP M/N
>> divider clock output on a dedicated GPIO pin, allowing the clock signal
>> to be routed externally.
>>
>> - QCS8300: gpio32
>> - SA8775P: gpio35
>> - SC7280:  gpio60
> 
> With the changes split into separate commits for each platform:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Sure, will take care.

-- 
Thanks,
Taniya Das

