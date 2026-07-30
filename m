Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4615F418A43
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411157; cv=none; b=ZNE0Qzy/DXV+14iYaTI4HhrhTCeV7edpbHUP6Vn/lFzTCg5PM4VbbF85MT6kAXSJhdz2THtpx91u5sioLJmiJXvy8AmjUvIw0+Nppy5AuldoG/Hl9U6OsgljyePGTbBaNcAdjZ0Wte9/gdCvuA0Z9Rs8iZby+/S8rBWXZc2ejsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411157; c=relaxed/simple;
	bh=N9Ohv6rcdNYwhoH7sgF7IMFqPbPWZ8UU9+WoZm0Q1PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qy9UFkUgLv5xXlqupt+KtpdLxOKTDvgA8nZaEyciGT0Or3EujpQ8WMVRHxMuwOd0lgxLmlJdqYR6IYVA0sAXY1PkUSXVAaEl5jxiCtpJT6gCmkjjktEnDoGJa0P4LrTScE18Hx8f1H0pLwcgR/C+srQNeTWfa8ma5QBtXRRN6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+s+ANf/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGUZPEme; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+s+ANf/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGUZPEme"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBWZG71145306
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 11:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mU3S2KFyCM2FJ/zPY3ZKd6sbQzwi2C1DPhH/yC8ntBg=; b=f+s+ANf/k1s576D5
	LIvfUa17zlcR+dIgzS72oMwvXrvZK/6kAyystl+icmj6yqXfoDgYJ4hhVBueI04C
	q/IfrBUiivE6c4nFF3cr4iDoZSJre2Yv/K7EIb6joVU11XY/e2aHGrgvP1hVu5hJ
	uxMIXlVyLlpBlxT4e8VtbEkekWNcNV/Mmcnzp/f2Jn7iSiKwdXiD3iZaNfu9kG/B
	0WsaOZJVEfcMiR+wrg5BeyBZ99WUHD+miL5e5bj/qlpqCBXRQJ58F9d9ANjSDiGC
	FvQBzIP8FXC/pZfjKz/vrTdEvQTkD81QxM5wl6aQZ0O/IwK335oRaY0X20cPx2jB
	Xq3A8A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5tvr021-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 11:32:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so2726751cf.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 04:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785411154; x=1786015954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mU3S2KFyCM2FJ/zPY3ZKd6sbQzwi2C1DPhH/yC8ntBg=;
        b=AGUZPEmeqOidzVYwivVxxuJYks1pGvvAqWZtHi2CevuFbyRDRKAu7AX17qI+G+7Cg+
         5D+JgWg36mKgcoVEd3fU+3nZ2Jg5napIysRDZc6qL0Cx/DbWyv1ebIc4HlnBYRXGJgJ9
         kVW01KTqvB9CJ/GDctxAdHVDcGFMBKiin3x68fdxY8NvqHCbhyNe6Ti1TBHd8hphrOjA
         fVwx/LWFE46O5aFaY9h5xUWigCErzNzNOmTzb1EiAO3I80hxvAK5RlBjlsyKGipo3Z1+
         0rQWduBvHvLDd4ui5CoBtHihXw7fIXQo0NrzaYAEZGLRVQE/+GnxmZ1nHnsV9JcticMb
         BhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411154; x=1786015954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mU3S2KFyCM2FJ/zPY3ZKd6sbQzwi2C1DPhH/yC8ntBg=;
        b=o1g63fSRzZcY57HrkSE+8BUb6HZb38ly9JtZux0wD/0v8WJSO/54cywcnRBzwDdDl4
         T2jtRqWcH/Vw6ZWt4vgEl1cG1d+fMy2vD1aCgHysYmnD0gw6fa7HpdPFfkn1sMuA+ZJ5
         pgfYuIc+BhvrVnz21uEcmBHKnHrlwDC+RqJ1cFH4kXyGnfBB3ueKuOsSTs6+cH9FTfj8
         0B2Z9rk5LnvfBHE5D7Ot3Ju5hv379jxGNARWkap5i/MNJfMEXwPPKUbxfB/8i+X7YYf+
         Ss7TK9x4LRPpzrsTIOElDnOW5TQe3L43uI6SORopwNdL71ynqpR/VPvBSo4XGprunsvE
         lCLw==
X-Forwarded-Encrypted: i=1; AHgh+Rqup1ZUGlCzTKs5o6I8YhfA3oXj7VHUk42Kv64DHmBTvbtLWKElx9EaNf6fEk0doE1CUQbSLZRrHGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUjNtmcDJWo1ls1l1BHgWNGkAq9bSz4P1ND8lbq+mxmE+YBpHV
	s2yAk05g78EASQHgFmuCQWBl5WMw8vj5J2dU2v6Fd5tafZcbzy7lPyBHEI7uVRv5CLQ43gKeFiL
	1hxZhBu1gZk7r0aVYGyw6oqbvTknbOwf3p+1L52lyxMMJunCMr7vnU+yuwRANK24=
X-Gm-Gg: AR+sD1064vpU4DT0uwqe/fMTKGiPWCOuJ8tsN0yg8xUcdD0trBJ6F4Of7FRQcvWIMId
	ketg5pFlJGI39D+dmsOAH5wn/JZFWHWzWjvXbSMIMlqp+Nb5QBWWSXPfFOXihtJtHkUlNPiSVB8
	BmThDGh55G72jdNb72bNk5YFVgux5uqSao7+PNDeEpo2Uoy5w/sMMqv+0cgkMRTlB0GccvxeiQb
	utRm4992epZvK7mHJ/R3OV2exWkdXb0/NCkzOfYtRwoOWsLbovKF4ESxmBh7PLyBjxaEVHa4w13
	dEecH2Vy9ouiNRS6Ohhui9rlsN29P9WT3CYRWPHmENyvdrrgDkl0h7ZVQT+9a+37HmeRBpL5DCQ
	PR/73qyRlW2wWuU72+U6h2lZV
X-Received: by 2002:a05:622a:6d01:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b386944b1mr27789281cf.3.1785411154217;
        Thu, 30 Jul 2026 04:32:34 -0700 (PDT)
X-Received: by 2002:a05:622a:6d01:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b386944b1mr27789051cf.3.1785411153808;
        Thu, 30 Jul 2026 04:32:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa857c8e1sm59328866b.19.2026.07.30.04.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:32:32 -0700 (PDT)
Message-ID: <3da755bd-ab8c-4d2f-b7b0-6cd7eeb4808a@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:32:28 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix test_ctl_hi field for DEFAULT_EVO PLLs
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Iskren Chernev <me@iskren.info>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260729-pll-test-ctrl-fixup-v1-1-246d79589380@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-pll-test-ctrl-fixup-v1-1-246d79589380@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfXz6g/SB0K+OSC
 M1baAqq0yMjFN6/8YXwgInkW4Vt2Ir3uVkT1T10Rux6oZBosxk1xcAM7NGTpume8UQQKVUnPYl0
 eHcgOaSDJ6U55nvfZsbB0XmjrV7WVTA=
X-Proofpoint-ORIG-GUID: FVopZ1aeBKpVUET3zcYuXNJC3l06_vZ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4NiBTYWx0ZWRfX0E0n3/YcPlsM
 WwjOvpfZO9W8jd67XdT+d43svlJMa4aeJIMA6SRPkfj0X90y4wcq+cHVnKThHRiwOfg8QPamGD2
 x5qOO9wRh4LkormF5HurgVskv9ywxBi/KkgNSi8XjnDhYlDDYMcqDcD/4C/04UbAas4GqPn23J1
 noG5HcC80mfORQJUAl+rZKQsOFZJbgM1KJQDJxH4qNbixx6PNGXiWuNMWaWg3A0zLMCyoCjQSKo
 teXLYk6WIguefhbBIBF9aiEr6PsSVGwPS5FvaMVzGA1gt1CUy6Y1C204mOfygbF7unbjGYjS6bG
 aSdERzC0HsIHmwWfHsr/03QhkoA90fqUuXOFT/CFsbysW3e1OgZNPBhudGX8UoOm3vBVjDAO0xz
 mvTx1P+hli4GJ+7VjBj6ohccWRJPH/gTbs2TF5z4GaqZbVj7all8esCzRvJurJacUtg9GHivKn+
 raaVCXU76kyDE6FAFWQ==
X-Authority-Analysis: v=2.4 cv=ULPt2ify c=1 sm=1 tr=0 ts=6a6b3653 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HWpFVbl4Vm_CWwIzw78A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: FVopZ1aeBKpVUET3zcYuXNJC3l06_vZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300086

On 7/29/26 5:23 PM, Imran Shaik wrote:
> CLK_ALPHA_PLL_TYPE_DEFAULT_EVO type PLLs do not have the PLL_TEST_CTL_U1
> register, so clk_alpha_pll_configure() does not program test_ctl_hi1_val
> for this PLL type.
> 
> The GCC PLL configurations for QCM2290, Shikra and SM6115 wrongly use
> test_ctl_hi1_val instead of test_ctl_hi_val, deviating from the hardware
> recommended settings. Fix them to use test_ctl_hi_val.
> 
> Fixes: 496d1a13d405 ("clk: qcom: Add Global Clock Controller driver for QCM2290")
> Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
> Fixes: e88c533d8a2a ("clk: qcom: gcc-sm6115: Add missing PLL config properties")
> Cc: stable@vger.kernel.org
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
