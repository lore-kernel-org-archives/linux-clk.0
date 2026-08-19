Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B348CD48
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158118; cv=none; b=taKUPh34+2WTQETKecNUbPKYKPrVZ4mcWhfkokp9S222uBs+3gShaOvjiNz0z4GLFWGQt1Yw0BG5S3FgYqakfj+iRXllgN31Lbik2bSs9ZbLtcN8LrgahYmFz2gfnYdxob0Xldr/lpYU0RmW0AbOF+sluTnI7KedTT7Oe7t9Bmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158118; c=relaxed/simple;
	bh=K75iUPw1fuEkFxQ39hGr1Au+Fh5fQCRjYMdXKscWq7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHh5E+ahtnnDolQWWO7mWU8HCziJ9sycTPDOuxhmBkcaFTThKnB0+2dWv+JwrY+D1fVe+TQVTvuMMwwiZH1BrsSrB9CmW519BlJVPBvZ0CWesPbE4683Vov8OVMyEufbK0raIAHOP8Xer+SRY9c0zqWPuzFGBDyvR3oIur3wyRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNaO6Vdx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWhtr34c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNaO6Vdx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWhtr34c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbMSl067610
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/S5W4xJspS12ZMFcTe6mzG0avsUtxSWJKF/zJVFnH+Q=; b=FNaO6VdxXOO2aEJJ
	/NP805PMBlB3e9ETJcQP4u5suwVt75jsd1eOE3IQAfy0AW5uBCKJnY8J78JpznHx
	tQCXhjCCfXnXBzPrru6bpbhCbLpLVU5VNKsXsPjqaJ5Q5sjd++IOlDasxifxXUyB
	N86G8/CYOwsWjO29CFjuonW9SAKvKRaDiMr4w0Gy2t8t3AVx5tq5CCQEhs7oDj4P
	+xu7eE5fEpvHhlJ4pppg+4Oe0byiZ3MDq+x3b7PHQOPxneDxWh3W2ihQg0F3Peff
	CZRg2Y0l1qS6Q1WlhUxlKcVGRXD51W5Z25hB0X9yJ2r0F1fN6i3JxBKcxSg41oq2
	87YJuA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d0swx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7530aaa7212so55978137.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158115; x=1787762915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/S5W4xJspS12ZMFcTe6mzG0avsUtxSWJKF/zJVFnH+Q=;
        b=iWhtr34cTUPmNOqsHbGaYviYTX/K8RcXGSdhx+aqZdWPUXSFDcpGDuHlipK2GcoPvK
         Yz5mCdYkGYvej0+Zddpc4UrpjY0y3Ihb6XuIsz31eE896J4RZHGv3np4ifE+noMqUb5K
         k0v7QYRHblcGksUhuxm3klN8C7L7BTmtMO/AFp09xcaMLoD2+JRThSq0kDkJliQWGGJk
         CSENLvc2gdF6qKtXUubJgK/PiBlLDIkRuYf5ODsitZQJTGXUwqbMyqMrCkbuVtHuwQhc
         oRmE7HUl69xJpNwTIu1pTlyC3rEpz2guUGIdqMkbvgKsKq9LfnaxS7OYYnGrcXL3A8K+
         O5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158115; x=1787762915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/S5W4xJspS12ZMFcTe6mzG0avsUtxSWJKF/zJVFnH+Q=;
        b=UCXolxxzpAn825tvAOik3h9tEH8sc5nyK4rL3LssBjMW+lm8bLpcDyMPo5CgpeyGSb
         1MWY3Jj6KMctEVi4hfNOsBNM6l749z5NKA4rOPHDJvY4zWUsV3YkdfigdyKUE1j3pFZO
         KzxzYH6VIxPAkWwxkBE9f2HQRfcJknnw2ikCI5FRoGeNKkLs3Z2zkgBcu17HiS9A00Dc
         4rqoAGuvxkPRC++QExLezEo1oSSWPd9CuvozL/Rvx2qyz+E+aYt1tioeOyJUCSN5294+
         NDxqDchMXduAmqfzQdJpivbXtki99Cr3/e6ekpi64JgOA4dpZ7y1pSsEXDHeTwOwlP29
         U7PA==
X-Forwarded-Encrypted: i=1; AHgh+RpwjoRzD/rU5USAcgAaZ4JXWHETr+wWUVtugse+c5lGEzIz7FFxUx2HDJo9mosdICKHv08izfW1pOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/uOk3fYvHawtHd8Z96qz93k8Q0MpdHd68PdvPJmC/+kixExP
	44i9mW8CsfY/72oSE1O+Ooscb8RkINqLznF+Q2aPgcN/cjUPvSSO4TkGWILsZlwKGh59k3cFyRJ
	igQVZ7kRFsZE47i48w4TCTgMmfAKBucnUTKMZNTKPsbj5zrqeUNr6qXeLOJFNCuM=
X-Gm-Gg: AR+sD10HpUFSQJ8WgBxc84cYj6TFNvqgdYtD1ZpNpVyrMKZWErAXqgGgVr4LK4PW+lV
	3eOs1cdGJgoGlh0lhHTH8Fx0ViCFR+gSowHop5dpYSPO6uBJRq8mcy5Hvi+3JMqBexgjKQ88Woc
	SLEoD3vSfmon/urXr855nzvib0M6FAwuwTEf/X3DjfW9zVznLGy8faCeF2FhR5BGasoCt5qE/XK
	MvB1g2ks3HJ8nR7z03Lmc5BMYkn7XMG0lzlxngkPFtRFHok/GHBQL/JVlspiejtGe5Mn5/6cp+K
	MFO+8B4kXcSLb8dP551irq0xAPR9xTm+NkTkxzFtrf+vrIrbs00elO36Y9Qe5dh9CFQehuj+BU6
	iGPEIAvI6BIA86tgJvjvDHzNW
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591241137.0.1787158115570;
        Wed, 19 Aug 2026 09:48:35 -0700 (PDT)
X-Received: by 2002:a05:6102:404:b0:778:30ee:f44a with SMTP id ada2fe7eead31-77830eef735mr591229137.0.1787158115180;
        Wed, 19 Aug 2026 09:48:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:33 -0700 (PDT)
Message-ID: <66b60bc1-6fe1-45fc-a659-8bb68d70fc46@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] arm64: dts: qcom: sm8750: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-14-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-14-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX7fJ5z6Q3Kmuo
 WD2M0kJg5bvYQ6DcxdZEmbA75bVvE7tJu8+bZJ90hmoXp/LjtLN/CHF7HM/9D3/m/K/Q3jNJIq6
 WP7k/5gfGjkUz94VlidwCcB81c+RH+1o0BKkc2ASC9ahS2qnIrPCJreuZ8lAdK7QEzOezkABwSB
 7L7U3eNu+1gKBivszrPtwgGnGj8LCbekcKzuXmETx2tQ6F8fqgLLYuAd0jAY9OWWPTDxnM0UGUH
 xY/A9a77B+CWwGOBUOv+VdDwRObYCRf0SJfV2oBJVzBPTLbIhCyHY6mDoub7lvjdnOEi0QGO8pX
 7yOUwWDf1aUARezWrTA5cl2X8fwW9EDL54w1iquQnWDzvhuoWWxVke0KBW7z3VCl2otIXIyIFrg
 LTlIoicY+AmJG3ZCPTaoL7oji408ABUmgww95xy3di8Ac4nrPKLOC/IStn/NXP3Dl9nVS0HpAsl
 6QOA9ivOeM9FwQOdZRg==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a85de64 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: G0gUZqB3dVV9DHRiWXvf7-Nme4E_e0cV
X-Proofpoint-GUID: G0gUZqB3dVV9DHRiWXvf7-Nme4E_e0cV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX3qGza9p5frUy
 q8xb4mDzGbjjXAYYVCO/HWVKLhZ6lim59mNjWLkg7kTwIed5da2nqXxIbcQlYjkeUtuW0cq6vU1
 +PIKxA3650nGUGSNaO8t+shav5EEq/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
