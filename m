Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04F63C4562
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887429; cv=none; b=FGzpYLaKPGFfV8luUHZYi7EPEuDPjBUQWpMnDar5yCWtashkFu85qNVFg5SOqma0vPG2PKwrk1jveX67XlSHrZjHUUeA5ACHlkj6f2b6uA1jhwGxs5W7YQ8OSHJvSlepxB8uo0DAAOfaITAyH9xHSOrD3NHI5p8rskoVkkeu5js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887429; c=relaxed/simple;
	bh=rvno8wd7jIFL+izZKRCFp1lPzwOg8SuwP7osdX6UAjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tn1S+GI/Un8QtO837NeyR1b2yCOLIKt8zUKPBwPMwf9IqbzEgGredlWzKz8tiffd1d21AkAMvh8NZb96A7ZcSLt0qraeY0zTZBKQ5z3iIoO1QC+z6xzU1k9/G0ORy5SChoLSfjhnl+dlilpPJ2zsoiMX+ceSKa8F1QNBpPQOWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nMM+x7Pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7ah+/1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMM+x7Pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7ah+/1g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lJLi1992281
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/I25kvrhW/lOQjcfnoyjW5dmk57g1obJPOlNaDgkuI=; b=nMM+x7Pe9xUneoxq
	2osQ8FiWSOvihYZMin4BjJ3ydjqHeePs7JmERcqsKtsC1xV3U7JIVnZAK9aqpWFj
	7MiVDlXpRjYELBf8L6nUZibfYDrZo2LsKjNaMw+hYG4xWUDJ+wekjcCJeDz6Jw2T
	zPeJCyTtjvocaxIDp1fSaBN5gyiW5M8eyirKEB03HFb/NPXeuD+vfyZ1Snc9eT+t
	WcuAXutTbFSbs6KSRPqVUgR927d4XXSr81bWbRyjZzbJ6Hs0R/jt+OzdxW1VqNvj
	ma6741iP5RA+W4PddjQeUvbkUrdbHvTkA9uUZr968/JxorxYmDwP5IK6ZBK8pOXH
	H4lXKg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p518bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:03:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848474825ffso389885b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887426; x=1785492226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/I25kvrhW/lOQjcfnoyjW5dmk57g1obJPOlNaDgkuI=;
        b=h7ah+/1glPClToMtuechsmwFN+DsEQyJhqDTp64kWxjielW2AcIsqFkYJ6gg8gLick
         DBO4v479L8bBOfB9etengdnvkhdkKcdGI4PBgczqJfWi0CG6olbIuyR3L1uSJhnfA2yx
         Amgc0IrY0k62MWigAU8ipZMSASP+taTtX2Lz5zc9zKklUiovnLZ5iLfFPtseiPRVJIa5
         lsPV3AqNAv7mGQQ/zmdKfP7fmEaC+ry9BO4LHr/ROrnQb3G1CX+a1rRgA5z4d3jhenqW
         ErEw5yQmPz3qQUqHAAr/HlM+FjEGlrpfSp7o6H4kXhlGloR/Frh9blSx3WWN6m3ZYPgH
         RDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887426; x=1785492226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/I25kvrhW/lOQjcfnoyjW5dmk57g1obJPOlNaDgkuI=;
        b=U6LXtwNhr52roJD4o3OBHU6aNLA0lGfV/Jhn38yYd4cEhhoMuqdEz8cAw8t55hQzHc
         z7yOmwUlxOMAqanDMjBf/khe5ZuBCkohFTR79+i5wx28MJVXd/KYOyN03UAVVc+AgroA
         4lmQrYdHjREuoV7rs1nYbW1w7g2I/lRHztlZh9o27hzduEo3lltVGviydERJMnM/b5Xz
         wpDfbNzWR2M/dxcn4KWO5F32h/SN2PgHnsumpBVfOqSiP+Cc5bN7Mb5caMc2SPejNngy
         y+C2uLYErpRgV4fzJ+LrYonf07Rmx1ejMAek0Kihotqz+LSDSOyxLhG09u4RXsngZJ86
         OfVA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/5FBzpmj/uMmqoFZ8KBN9lMA6nQC8ls4kbMHQmgkRFuZEms+0WC8MLu3EbEJ+AWvI2U+mHiW0ExU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEjOoT6e4Hlo1WgOtWYImDktxjampCLzmcm7fqLDk4Fm25xZqa
	wYBwONEguq1qO5Yke4Di/YaixzENyxxj19Cetj1EtlVCm4dcM8SsJskuOOfBDmen2zQU4RiEP2j
	zfDuTA9LYOFBoHVjJWNSQ/3cYxiumimR2E66S8mrMj0c6U3YcpKbQS3yEe7P8wbQ=
X-Gm-Gg: AR+sD13F1re4fjhk2uUG/cPYUEjQpANmPaRMRK8yvzzwo+BU3HqDPV4hbvc7bgbH1J/
	UiMMPpNo4lBDbtUnvLP6COVSixQrTezegSpvfl4t5cA9Kqz5XA00s/JHvL58Lw46NGtqcZrhNAX
	idhst96EmZTcaXcUW4mQh/33SEkpl0wMZT6u0VhGWd5EhFtKVg75RbRdxsbDKrtBdatNuR1a+jy
	m+JccFy37P/mCkmHqsAWVgerAye0cmgz7K4k9oljyWI3Frmfh8wm8ZFhA1APMuWENkF+RoHfUSD
	n10x+wgdOuSTPVjxTUX1FefSbV7j3dbf1PvP5i/DaFLVthyoYW9MZupJf3UhnOTCWY8trIEMjz1
	MiN4ggEg27WkCrExXsoy8W1mVIIzP
X-Received: by 2002:a05:6a00:4f8e:b0:848:536f:4236 with SMTP id d2e1a72fcca58-84e2e87750amr6754043b3a.22.1784887425571;
        Fri, 24 Jul 2026 03:03:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f8e:b0:848:536f:4236 with SMTP id d2e1a72fcca58-84e2e87750amr6754011b3a.22.1784887425152;
        Fri, 24 Jul 2026 03:03:45 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237704sm4435633b3a.2.2026.07.24.03.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:03:44 -0700 (PDT)
Message-ID: <d34ff329-984e-4ced-b87f-f57863ff5d18@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:33:38 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
 <20260713-maili_initial_clock-v2-4-79548f0bb58f@oss.qualcomm.com>
 <bd067052-ea72-41f4-a665-2f54242d12a6@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <bd067052-ea72-41f4-a665-2f54242d12a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a633882 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ieeZjMSIhZrtWKQ3Hg8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: l31vRzgX3RaSqPlI_iTT30QFmgSckkPn
X-Proofpoint-ORIG-GUID: l31vRzgX3RaSqPlI_iTT30QFmgSckkPn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX1+zWNolNol1K
 UDKVdWpo1/jN6/UomcusDcMOtY1nfh1j9naan/cfJpxQ6adqzeCyEeg61hH356hdTogCDCCtjFT
 XvHSNd0P7wh8w8PLZzrN1cxnrEU1pRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX6QH4Swczph1m
 idKlpvOjSJZJuTCaWBhVMPL9kHRw5CjN7IBnGXj27J4MdH8SryozHSuMdZb3bjDCBEpD4HM+evx
 OSndKwXBu37jkYDvpUuDXwFp+GHO4BbSmK8xEM1+0E/zljN4K2qebQER08Qdzg58VowtqcWNP5X
 YwwAdVcX4qVgQaUaTznCTxuI7aZThaEepGSob6PbbxCh92tRPzegPrPytBFmuXHqtJYcpVspcVp
 uAH6KxAwVChsabucWR8HMx9RjGz+bI1ymrCwEWTaP2ZFjZC210Dm1Ht52S8RuXh8vsz316gHUAN
 pXaS67Qbptt9/n+vfIcnGA/4ttiMYQ/ZIWeSUpdrg1/1GC0WTKSiKbw6VwZQsB6RY03/O8mVCbf
 mrCrSmWid9v9gWERJKlFvPmGdB9d3EwNZqL5lXf5YgRm0nM4LoHVl/G++TsZpfGlp6B74Pk29I/
 D1F5WloMIHvDdasO6iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240091



On 7/17/2026 3:41 PM, Konrad Dybcio wrote:
> This is unnecessary/wrong, as desc->num_clks validates the index in
> qcom_cc_clk_hw_get().
> 
> Without this, we'd get an -EINVAL, with this we get a silent nullptr

Konrad, I'll update the comment to clarify the rationale behind this
requirement.

/* Maili has more clocks than Hawi. Ensure the array is appropriately
sized and assign the additional clocks in .probe() */

-- 
Thanks,
Taniya Das

