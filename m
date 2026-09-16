Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A028506F
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 04:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532226; cv=none; b=Upj4bIM+EtPTUG1JLqBt4J4F3fdvVKTZgAEjHEYmse2Dt4eq6+bukMNYT/zMjt+fXvjzPwNP0QoVGEEb8CKchZ0XLv8KDAeXtPL2yARe7GQ6jtXFQ75H9Ds9fbyQIQ1zb2TATyM7ekAu5fXmfF9mNQ5OnDwXXGxclmVW208iSAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532226; c=relaxed/simple;
	bh=QEmS7gtQJV8lPegcQMTne5W34bluBivKSixSide/zvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5ZRhaO/ChsFSvxI8+aMmfOT4Lr3CRZrdxZqV/a6c1ZG0Em/gjSn4Yd+x2RhqnfqxBGA70tTgAUQxoXD9LyUcBI2+V/LgJvosunvI6iMz84Y/tqNgmcEmlmE+6aXiOOu6/Uku8v1PXrne0XM8olzRiL0cif2ReOSSFuC/a2GPM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibWvfTpO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTWF8jfZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibWvfTpO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTWF8jfZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYYo1840343
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 04:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWpVeKnOVisrvOzrWemV8ElUFW/G4gO+jtiKlrfdLr4=; b=ibWvfTpOLf7VQIj2
	zX0JLLIiGXmsdo5vGSLYOJOMMpoP/S0f3JtlJ8IxMIgfTKWyPNxFuGp0C811i35L
	eh1nJtMZHD8i7sSEOdD+Z1z6rjCL8wONDxwTBTV6gmJu9ILwJXzqei6/+2HbaMYV
	Y8/vueiEwJzrycVzmGE/oaD57UlNJ8COf4W1fBd8du4OWq51aVWnCywjgWsDcPUI
	L0PhI2Or7mJpEE0TTFO3scYqEo7vZsEr/3oZvp8W4J/8cVgg+vT4p0nx4U92NzTE
	f0pWYxvuoJaa1AMG5isKvUQxIy+OTMhvOVySQxCrhUDLnWTcipsBf/FjUqjtgTBY
	EWzTOA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdyw98gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 04:17:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a0dc7f26cso7996461b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 21:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789532223; x=1790137023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWpVeKnOVisrvOzrWemV8ElUFW/G4gO+jtiKlrfdLr4=;
        b=WTWF8jfZEMRlL3znDp5lSSuDVXlbiyZODo8ZOhRkrdOHcDN3Vghw9+KX5bY6eIenHr
         HTESwquN9zbPhXYG3iQNA3Tw/P/1Lp75tEct+HLNIkmBwx35gtDYMtH4piFAi0m9s20U
         Da3XB089u7j1l2FR4/pDZRzTH9cJ//lKZeFCqcJxV8TrdSYlU/G2Rpfq+M5NMyXPK9ca
         yAimptIdzKMq3bo+UjMITqSPKWUFrLbEiF7aAhh3QBE1LP+E0ysatyiNo7O9BfLiGgft
         dFzqAD5sdJ0lUUOoov31xdNTYDMgQ5I+ql8mP4fq9YbErDaFiwPN3xQnXeVXyY0i3g8f
         THfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532223; x=1790137023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWpVeKnOVisrvOzrWemV8ElUFW/G4gO+jtiKlrfdLr4=;
        b=b1wsSf9gZvCFerQIDqHLm5Ze15nmv1EqYMejZCdSObmHsceW0Q3msaQmHiqTEW2G7U
         4ardmJmjZr/6r9oEHCFQGMQDr+NmwrPvPmHVMr10In0hm7pUPEwu0hTXHOgtEoXW+M5Z
         8KdVpz4STVNse4golXPKO0DxHGnojA4kdsnqomGOrcHEqyCG3oD8QzVTOTfsB+o5MR1b
         QutjhJ+y7u3imoEV0B1g/dxUeLyMxxp8meIoIAPMwuRqEt3dcnPsllMPkrUIqaxtH0gg
         yACHWLkvO3uin8qC/q5+1A0tOVjtGtssY1RAWohxHJFlIWQxcUCVQ4WAyENV9h8jhokT
         Is2g==
X-Forwarded-Encrypted: i=1; AKwUvByVhG6mriFabY7f3Oa77syWqNWRLyBF+fFxUAWjDWQfR/6Vko4G9MWWzL9PZR322zKLEzVkBXwbU1o=@vger.kernel.org
X-Gm-Message-State: AFuF++nSluXNbY+tXy+Vh478zgDewl/TSAvAD1AMeaKE1EQYmrzQAN8z
	2+9y32QZmVbROsrAQd/pQzBSl+pNBztTpIMVrYFdAfQ27zcKZQb1TGo/Y0gahCBMfHA3CTN4JWq
	1zWl/g29VD94gTXJBfv3tk+X7Wkpgaga+OVqrtX8xcmqHCZ9nHdESHGwl7ppxihzqX4j3dWo=
X-Gm-Gg: AYBFou2iiaU1s6GREGT+IVI4ObDyT2BDA74FaIPIqIPhrYvf55qi1I0LXlr1CKuozW2
	uX1syfjUt9HjiskfMNDtPyDej31njjCntNWe56U8s9ViqNqyRUM42AzWNwURLro+xjsy9nIVnZd
	PsdEhrgx7XCSt2xfVzsNRmAV4is0HTG8C71xvCZhFqKTtgx05zCDLvsTVFOrjvMnIH1k8AAYVHl
	572xPu8NA+Wav/rOoSqDS8TX52VtnLhpc6q7BW3KB/nT0mFqAvENV1IZSQw5yUNr+Eq8278ubFD
	wuN8Q4So5NrOZ0UvH2IHQi7f8jhtAMYeoD5OLUTBAByMJLOsEMHxx9MGvHOOUiYOYsryYX1x+vv
	fHxSzNTRXhVm9gUEN44vrk7QyO+o=
X-Received: by 2002:a05:6a21:4c81:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3dd5f3c1abcmr2875701637.2.1789532223504;
        Tue, 15 Sep 2026 21:17:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c81:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3dd5f3c1abcmr2875642637.2.1789532223009;
        Tue, 15 Sep 2026 21:17:03 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm3901657eec.28.2026.09.15.21.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 21:17:02 -0700 (PDT)
Message-ID: <3e4949cc-4703-44de-ab86-867051ddc2b2@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:46:56 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PWTRHmK6A9O797wdhf1UGKxxRQ5Rtib0
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa1840 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dHuaQup7kaPGrqMl_VAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA1MiBTYWx0ZWRfXygekCYASEoAQ
 owrn5d7YGQQzedRzx5PVVvSuDtT7L6ybmFYCKJes1dnKnuRMgaiRZfHz5aPHEFO+c82jVCaK13X
 U9cMV42nZrzQme/tw/9KPqz7Es9yQ/vtnenlMXkVy/qs7YhfcqsSD4dxAK8H2kakS0AAdoQIdtm
 vIRrJmgQEFfR9d3qOvycw7MEkhTKOxV2GJ1a8EQHMzbVONP7rq5ZzmBmMdjYh4EOlNC3LMVRyYj
 qYjeF0M8L8MGWloMuBakv2C/b3EO+D0/KxHS0NhVx8Mc1TWxhEVvOlczggM4FABzc7i6cIRz350
 5reSjgnvRuD331jWEaq5nyA43P6fOeRT637FTOPCxsOFl94R8PTUP3pBM15bPcQvjcbcXBwo/t3
 DrmjPrQE9iHuDuur4XiT5LY0igTym+2TWN5GNbyBExE8hVez7iXdizBkoxzu0Px9saSBn/w50Xi
 /nKwCXgLy87vargV/UQ==
X-Proofpoint-ORIG-GUID: PWTRHmK6A9O797wdhf1UGKxxRQ5Rtib0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA1MiBTYWx0ZWRfXws0xkLqfuPW7
 PILwSR0NzOII/nyrGvG5wIMhNVj1LtH65LA0RikUNgH64fzuXT6Yehmj/eqgpp2ikEF8nIhLfFM
 Ft6xzjHchN9m7gCzdUlQm619BJC2zCI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160052



On 9/15/2026 5:37 PM, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index ec8700b6186d8d6dd1911b7a33f086805770284a..3db81c709729b547f288eb10d4aa5dcf63d9e951 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das

