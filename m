Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD393290C2
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687322; cv=none; b=IehkI5CaIJhscf75vW5ZY3jKbDFPr8oTxL9DofFSRqOBn7IEKCc5zaBQl0s9xZ3HqqXRh1apc2g0XasyFfU0OLonmdt8V7A5g3e5EQ2KIzz/eESWT7BtPLRh0K1dNCK2glbldk1Dl6MmkPXSD6+NNxKlPrMOvjoWpuIgXFvDCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687322; c=relaxed/simple;
	bh=T44oqDglFT2brXUrnem9uR4UxfUxX80vClTgF+SNPQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoBYWs/9e6m3+0jE1aUh2pvjPI0lXn1QrhbLI5JGfls0oUc7VgTGGKm1WOII5BAXNUcizicmjKazNLvyxdoOm6No8SUlzpXmCE9UIuBFM1Cun73q9iO0VCiUOnPBXRONLMITCdl7VLD/yFGMHnLMKBI04f4bAMxTRVRcKMPwKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EppeFHE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwomO17R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EppeFHE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwomO17R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CGwO3511232
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1g4RUwVoDGadx8Dgb0lvPCAM
	mLPPyqqKXJnPjQJ7Nfs=; b=EppeFHE2iAHrGqtlo5hNunF1eibsfiGVdwiLHYVw
	lCKYrEoT2YI6ww1bCLyTNgamJpgIzS9yYyducUKJD563lxZNGapQJ0nxFMv7B5Oe
	YkJdLeikm5dfOkqixj5OhbCwuWgxoAPqyxnP3gZr+yUTQCqQQmYP6fP95pW/pRKQ
	CJp3bsrocJw0AK/WXMostlDl0PsOafbyZ0dKY3CNerjI5LxOIAXlNdyXxAnSWFNg
	dMzlHR7G48ZBCeG1ZHw4vdi/HOrk48a2K5NX/JGsj0dASNxZd8Th22jXoOOLaodo
	fkZXmv0Giy5ROvxLtQVdlKjCc5+QcMBR1AzEvtDj1SNWjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsb2x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:28:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6dd278512so2650642a12.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 19:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784687318; x=1785292118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1g4RUwVoDGadx8Dgb0lvPCAMmLPPyqqKXJnPjQJ7Nfs=;
        b=OwomO17RVwC/ejD0DSn+ARHwYngpa/f0lE1/G6gdo5Afh8qgpMpyuiLc12R2t+nCHp
         C+PJSIvh3giGfaJbswgZ1djLYZmEmPz9N7dN4tLttvW+GpMuuytCKSRHjMsQ1SOJJOkT
         hmVeuoBYHKy1lNA64S0QCYBwKwR6TefwbDQXQ3Q36/QCtIPREH8c7HziJkwgEfNGghxy
         PfnJJ/6R05LEKrCWgnbEyAl9LRax6oX0w9BPVYDpWQjPWlCEz2diCHfeYcFwCSfszlVc
         +jIUZ0jpOlITnhvzw96S/SyTzPJA8Ol+u7akxK/oZ1VbbxlyRkAj94b2xwYqxXh/pzPU
         w5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687318; x=1785292118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1g4RUwVoDGadx8Dgb0lvPCAMmLPPyqqKXJnPjQJ7Nfs=;
        b=ccVQW46mHLyweR58sSvE4T/llbuwGij3XV/hw1Jwm3vh4vRs1zRNeCjvTuy3M1WMyf
         d6ZH33bg3LqXkJ8G6k1jHskr3xLbSR173amhIhCaMTvRJNvvbZeXw5V2aGh4deBScbFD
         6i1MXz+kOAxLgCgr4uptQs3edMvZcr6SdryQsmHJz+MprGyYzvK9UldTJnz6UxWNyC9z
         Z9xhKkQmcgrIRiZPsKXu0TUyIrHdmD/RfCSsQrfRPvY987cTJj7lkVanH3vpDPcLwFy0
         hthsB9aDOgrmqFY309Z0JFuUgZSXrSwFAeA26CPnA2G9SWkF60qqmbRlPhr3u3Mw8zM5
         1ifg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9N4vUvwwWU9c4W6sZy122ay8FGyoP810Zm/KSsOYxpj78f2Cu3qn04BtvRUxs5RB8aRM/Yfek7ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQg69mjARleGi7qlvWpg5U+luX7fY85wN3jW+uzAf4Z6IRysE8
	Cg8CxpW+sQo7sEs+YTouj5CmtD7FOXZBu8foCn1BbJT1qqfHD7YdDlf4e/nDqxQztqHCo0wP73h
	4VlclMqDWRiA92oMBAdooPohTc8TZJOqAUsnwEPDaQmu6Ow4yprtJIAQAakdem08=
X-Gm-Gg: AR+sD10Ktf4BQ2MlMSs9c/+AMT2vJ8N2gzk0h80hYe5r82Xk7Q0tEsu4WaXgcQZHQ61
	6nZAUNWJo8hMJZJ+w1SzWSZc8ucopt3IYTain4Q7jcVkvf+Nf7T74qoXFPIXwI9liMfI1YAv1w8
	NONrkGxhbeUWBNL1XoN5qLep/o6YZK1C/HrovYDaB0ini9F4q1TKaSv1b9lH0Bd79Oc9mHPKG6f
	DBJLJ3jLg57HxORFNf/LsPB0XgX0EFx6OSv01RhCxhR+m4mBcRQt7T++So+p8PI5Hq76fz7w6ak
	dFZMXJNWBeGStyvHEg6RhDikShStV/uqo35gVHwiLS67ocuq2wiWsCROK1vywrb9NVaKjgDabyC
	hOCeUKNC6QpxAxPp4wrl3vi10FoTUrP7huw8Kyg0g2Bs=
X-Received: by 2002:a05:6a21:1506:b0:3c3:81c2:fa47 with SMTP id adf61e73a8af0-3c3ad7a3880mr23203565637.12.1784687318108;
        Tue, 21 Jul 2026 19:28:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:1506:b0:3c3:81c2:fa47 with SMTP id adf61e73a8af0-3c3ad7a3880mr23203540637.12.1784687317673;
        Tue, 21 Jul 2026 19:28:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0ba0asm3188263eec.18.2026.07.21.19.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:28:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:28:30 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Document Nord display
 clock controller
Message-ID: <amAqzvpZtzK2B_HV@QCOM-aGQu4IUr3Y>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZxmPmnK2TIxSK8ItO8Oy4kNpF-7UcX08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMCBTYWx0ZWRfX5zoDBKGqxNoj
 fcPNI75yesONyE/CyPB13EeI837GkTI9U4InvhrHR7NuBzMvjEE9ut62rct8LdaAX/HGj53DCBx
 8FPMgqKmb3AknDHz/MbnUEEXj40LRSiAkPEPFJ8p8XP/YFXZtckA9Wd2eoLPk8N+eaSdRKwP6bY
 EVgQ6HVtoG8xjxoH6vif+c8BGzjeg+KCup05Q+FWjENNXHt8QRUCO16hu2vuNXLZJ7YPLc0NS6J
 xj6AXoDQsRgebMcTFNdg+kIlv0KwNm/zbWZOUAoTC0WNmPtXGpuidVBM99ZTVI4Hjan2HI1AC8y
 lnvvLInSJnXBd0unwFGdLMsots6bZNCOMXF43xbPMNnFusUjDg3+jFcJjctvngK7LX8TJVuHM65
 IXUSUdbcSHJr+uX6Nlfyc3jKqPuvnBNU6jQPLr64Ah2g0k097w01pA5Ao3Ni7UxhSDGqNAXZvdh
 5BHMipFAVRhroQj9jMQ==
X-Proofpoint-GUID: ZxmPmnK2TIxSK8ItO8Oy4kNpF-7UcX08
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMCBTYWx0ZWRfX7E7Bzjjp4bUM
 4V9K69isgnHoPUoE0hKWbiLFI8/SscuVRtVHwG0KCw5fptlUhQF/nl690GUezxELHyuq3cLP//p
 n/iZ3XRSd5Slye/0lUELl3K3i7UE3zM=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a602ad6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=m708LcHvpJNOmTCwX8EA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220020

On Tue, Jul 21, 2026 at 12:37:18PM +0530, Taniya Das wrote:
> Add Device Tree binding documentation for the display clock controller
> on the Qualcomm Nord SoC.
> 
> The Nord platform contains two instances of the display clock controller,
> DISPCC_0 and DISPCC_1. Update the bindings to include compatible strings
> for both instances.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
