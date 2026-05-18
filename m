Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1331C3DDDAB
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099844; cv=none; b=S2epgxHIo378jCtDKvKepZmjh22aG+lmFns91yqoQq25pXOoWTVNedsubWE1Gzr9kVxLhhSvfLJhnFdtf+7agPtjQ7Gz2+nXzNLWZDK9Kf1LFVIUvdDo6ND+qhto82Y+av04VwLwzt3lIcIPx2jXSeMR1fUQvBRl9O5UAD0Vkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099844; c=relaxed/simple;
	bh=zej2Cpyl6kSQWSK0UynwC/MbemQJBK/YK0lG75EKZwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5A78wxgBD6+GSJsIjNs/L9fuwRNkNCnCYd3x5wLosexRHM+RhdZv7iPVhDOk/DLmfhGIP68xh1TLy0qzo8YKOPP2HQSfJbv5WrxL5KJec2cwPlRpygDlHBuSf4IopNldH+BzMYpUDq/JGSAkQKuYEHXq5hIIhs6xbpRiSdCkzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dv1s9rIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/AaEFTP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dv1s9rIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/AaEFTP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAGx8O3595488
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SA8886K6poJcpjofD22W11q9F+U2c/JpSKSwDMQIEm0=; b=Dv1s9rIX3+Tjr+2S
	TGEZDsVk9nR/3/xNb833XAcEk9IOGs84YjruEuDA8P1QN7uaV4WlzuPmH0kcuD+e
	2a9qOu8nAN1PhMLaHKT+4iDIMfuVh6qXa7y90Ukn0kuEEVnpMBs7xnNAan2gjkJQ
	/3eruFmAFjfdJoNOB2VlmPFmareCwU8+FnC5g/unGsXY+f3eyzx0gu5Hh3uMt+K2
	4kb6E4lPMqkiWEt14/OaaKJHYj3HJa77zy6HePr6kk5lvIlRyl3iBHCDVXx01LKl
	58BOzRM9DC/bW/dn/iEFiIotOiV56Awg18WDPUPtygNUsUS4+/ZbtqDs4TQUOJNC
	P8AZcg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qe04p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:24:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so16336175ad.0
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779099841; x=1779704641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SA8886K6poJcpjofD22W11q9F+U2c/JpSKSwDMQIEm0=;
        b=H/AaEFTPmtKqCYxPBwQu1EHCC4Z5VB7qXr1lTkXEoHQNXS6Qo3HknFPwV7EwpBayHx
         rg4YYxduxI+2J1JSJTP5v8xwpvj97RHsQNOQgeaO4g88uwAODrjypnsBuSXXIq+gx1Ds
         6lJ/eeoRvHkDhHwxP7XhLGLgWzxfJkzC2GXrEWy74g6rDbZ0ONvogtlQX3aU0To8gT/Y
         kmEy6tllNH5fvvJT8VqXpHggkvOSyYr/MZYBucuNWBLmqRYlWr2y6uB7B1FUzdFIc/xL
         tcBR7jrrCci6SLK9y48SZvlLuTaLAAU/ybUCuzvgUKwSOzfvwjrgbTx02npLfsjgVDh5
         O9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099841; x=1779704641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA8886K6poJcpjofD22W11q9F+U2c/JpSKSwDMQIEm0=;
        b=kdq2V3weBLA2dILlomUkrCXQiJm+rDwrKhLiG28TzSfFDftBpWqndFnbrA+QZ4lweq
         nhM3LePkv2fRougKz8CjO3+4vO+PybG3hs26Du5/NX13++H8jfjV7tHQrF2ec4lZmrdR
         PdPnaJCk+V46thlO7PNbMtnN1h0NdvCj4WPOSeUsRcjZ4vkP13ghqZfTMq8HNf+P0rB+
         /ddngSmWq2R0Lgw8aY8MMs1o0BIiGuJxR0He+76Ui80EHVoGYIVCXUK+y6lK26TXWNI7
         /GYjJ1lwm6dviSIeuXJpz21cyfIlIjPg6YclTf8tstGCqy67hPTqLiaRVxEra2K9KHWD
         s2Xg==
X-Forwarded-Encrypted: i=1; AFNElJ9CHTNjCB5YJf9m+wl3aqAgN4r82rfhKEtusMxO2uKzMv0l0X6lQDKLVYjK5y2CYnfUnnNg7NSuivs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM50gRpXBV3mSrUCdrLJmVSvAo1TE5CvfigGpw5IpPeVE5OXJX
	6UCPxWYooF91L4l6kETdEhgVUL84ZIovJsdxgXjP8hZ/lKJGMapN8UdmnGvVnb3SnzVtY+5994r
	yIFPhJhCtvTb4Nbzq4/WjA5Blmoio/IY+xWVPbA4b1o38mqKi0bWdiUp/x9zslQs=
X-Gm-Gg: Acq92OFkiazw+xi8UisKszR6RNF+4i8RSmB06LygGVlrJ3jzhvQCJaqB7YjG4UHlWhy
	zIcKnXR2lr7JABaQKzOA8UQZH7nntiRifhcYMiqtty+2TtBYDtMf9TKra3TphLyYwIudaie2rw9
	sWTjswUedRz3cD6ulLOsZSG4PdtEU630rolepDXfqWYflwh1SZfnaYJ5LVlVdw//eEoJU4IdRs5
	Ey6KOsOJjXQbDVqm5Ca/4pUeD0+fjUIXbudEmfNbRK3g5k+9G55Cd+p+4Z/+0EaEVuNSWtSZaRk
	LvByFnbFiUFxVZDTE94hrf1dNpKPnqY1WBu5oZtjW7usl3XEtfC+MJ1I8lFX2wRA/2eL6nD5CSY
	NP8mBsH0AetemTq9nSvtzcxW4mmXzamhYkk1fb76YWTA8TcN7gu7m
X-Received: by 2002:a17:903:987:b0:2ba:5a20:1d94 with SMTP id d9443c01a7336-2bd7e8459ddmr171304285ad.13.1779099841092;
        Mon, 18 May 2026 03:24:01 -0700 (PDT)
X-Received: by 2002:a17:903:987:b0:2ba:5a20:1d94 with SMTP id d9443c01a7336-2bd7e8459ddmr171304015ad.13.1779099840607;
        Mon, 18 May 2026 03:24:00 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d12e38dsm145269515ad.77.2026.05.18.03.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:24:00 -0700 (PDT)
Message-ID: <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:53:53 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: niyirWNIUc6k1apZ9JejywLf19eZa4oe
X-Proofpoint-GUID: niyirWNIUc6k1apZ9JejywLf19eZa4oe
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0ae8c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1leAgmdG7ggDTx2EHhMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMCBTYWx0ZWRfXz9octlnEGMqF
 oILFe6xJEH5wtg6cel31Wwtyv06YfAjZ9qeQQlevFWbcdqWoJeIFTgkUNEvvD1ZIpRF4GEGaaat
 SWpPmMf8df3aMMuXXHGu/bEw9O02i6GxeGhHfxi16rXHSPHg116TJ20RfnPWTD/IVTE0FaNWExt
 XnXLjpZQpmUfADr8WSVx9XrOwjikz3F3teCP2y3/hrdPNMbxr1DU/YFG49TII21VGxBgBMLLcZQ
 DDpoYiYPILp+f1yl67K8Lt/0jHS/QOpWyqQn0w15uPK79lLBB2allL/L5On5Mj8yAwmlKnVJOIV
 VaZX5KtYVpyd+lr4sgW37ZaaA8+WJLWLwqYDxNMgfMf3TYsWvhy1f9ZlCC6Z+yMtJlS5qZmoPji
 aPMXuUul3KSAPq9+BgIcA2SoIR44gSz1++s604FAjCJmIm10EkXZGjdyt44xjgHRXSWb6FsoKgM
 5/M8/fBs6Q0baIJ5hWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180100



On 5/18/2026 1:05 PM, Bryan O'Donoghue wrote:
> On 17/05/2026 18:33, Jagadeesh Kona wrote:
>> +/* 1200.0 MHz Configuration */
>> +static const struct alpha_pll_config cam_cc_pll0_config = {
>> +    .l = 0x3e,
>> +    .alpha = 0x8000,
>> +    .config_ctl_val = 0x25c400e7,
>> +    .config_ctl_hi_val = 0x0a8060e0,
>> +    .config_ctl_hi1_val = 0xf51dea20,
>> +    .user_ctl_val = 0x00008408,
>> +    .user_ctl_hi_val = 0x00000002,
>> +};
> 
> I'll again push back on these magic numbers.
> 
> At the very least you should be mentioning in the cover letter log why you _aren't_ making that change.
> 
> Just reposting and hoping it slips by the person making the comment isn't too cool.
> 
> Why can't qcom update the python? script that generates this code to enumerate fields instead of magic numbers here ?
> 
> I get you don't want to do it but, just ignoring the review feedback is no OK.
> 
> What gives ?
> 

Hi Bryan,

I haven't ignored your comments & already responded to your earlier comment on why the bit fields are not
defined. Most of these values are static settings we get from PLL HW team and we program them only once
as is during bootup and are never reused again anywhere from PLL code, so these bits are not defined.

Please find the earlier responses for your comments below:
https://lore.kernel.org/all/b92a2cbb-fe8d-4378-aa02-d91e2e4dfff4@oss.qualcomm.com/ 
https://lore.kernel.org/all/009ecdbb-2297-44eb-862d-233e3290691c@oss.qualcomm.com/

Thanks,
Jagadeesh
