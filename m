Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E665134CF
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314833; cv=none; b=nmC0B7XpPKm1qcjuDiVeeNNmcZ6gVxSZbwDGZmDQY5/5FPhxnaGPIxIDTnbU6RzAr8/O+wMTBb9MT4wvyRpFPNbmDKvXr6qWpmoLkyrjvP8VEsjA1A851mW9/H5ZcX/cfYC75KEZ0IwWv3ZrL6eHxGW/wxsWfo/4/miVCRkxGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314833; c=relaxed/simple;
	bh=vIRc+aGvC5spoZAU1zWkxPmqhURGVoAgXdHZHqwpr+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihIGi35oJtxQeehpFFvx5rgLLm/FM36eGzagMOHd9HBR3NFDleS20qFdro/1M1517+t13ASVALLkSupAC9SU/l28wnqRg8CM3lLT0fx6mXucLSdBNbQ5B3A8Bk7uK1Q4g0crjWQ/SFpWpHjeclByGWvFiUlKk58UTgvmGEBK+HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eoNd65aD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfRJcshw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eoNd65aD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfRJcshw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GJOLSi2802100
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0zFHBuXbo6RN12Rzb8ZHK7Cw
	J5slf+7BRiCC/hFamtk=; b=eoNd65aDGeAuINBgoJaRrOVog2I+dd6gNnflstqW
	puYPiivriWUKatj4Qt+LFpvBQIFQOj588O5kyLxuGjsHzojVn37gur3L1haE/wtD
	NLZXkcLS48RniFbBjTR5qsQ8kfha4OEvTu/cLD4RKCiCmGCInJoMTsqZY4YxVJp3
	1zR0/DHjqVz9wgAbBKWBKY+1/jewFb/DMXmfFEnm6YVNB+at7tsENEtWnLl0RwxU
	AOB8ZD5HU70sTsdOlOsyDxe/Alau5f1U/EE6wja8USre/RmcrIXLcf0DfruP01/c
	xet/YCIA/oiIOZdj74se1kRDJfhBBHIUCDaMxXB1HZCnGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujn3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:53:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c882774f0dso2434906085a.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314831; x=1771919631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0zFHBuXbo6RN12Rzb8ZHK7CwJ5slf+7BRiCC/hFamtk=;
        b=OfRJcshwzBFXN+v3MUbTkBSx07+tFG1xDnMgGlK8S4owyiyKPOXNQR+JxZ/59xvSE7
         +zy85GmCKRGscZ3g3r//iqqqllXkrS0lEH9CJh7xtnbrAV8T3jNkgghzj2b2k5wRz/Zq
         5hx7QJQV+rbfESTfkTQ8cmPGkQLMFvSmDMmEzgwMWP38yvNSmsRIJmdqG/7s9hk05I6Y
         wBHgau4Hv/NupqbZMW0kzQ4K0cAxS1Wu6PNqs4ayyosoCmAJQpM15U7Qo+WSK4pCucAc
         Oj21aVNmgItqpA5eECaiQ64ojGxyVzYgsSFnHj+4XGLbBhDVDOynzeJ1/nbgvf0qmTx0
         Nf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314831; x=1771919631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zFHBuXbo6RN12Rzb8ZHK7CwJ5slf+7BRiCC/hFamtk=;
        b=KYhAy5FxNsXuLt7HmkL51m6X3isKxz7KMM1HPqneVZQe05Dy95X3hNWF2r47A/kmFz
         wFVPJWBRFQvjOHJaajClnbI1aumrsud+lM06COsaQkUk9JqfFXlhxYFEB72Esba8+L0M
         yPm5auQnJNeIOxnvRfn1NEEOYnJDiA9y2ZrQ5Pki33DyJQNh0KPrv3j5tRRfV0WH8OEd
         T3Xk/wUq5E11VxDNYW1Yy7M6wYA3cuYIwOQ+jlNYNkSSZMSKyzQdVB48zrISxBNGAZqt
         K2aMWxIHf7CdybeK+qQbLgtmGViR7eAMQXnce8FhqZn61ptNXP58iX6D1hHrDQlV0+8f
         t4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3bThtVFNOEr5soF/NXKOUdZLTt21l9yLW8l6nvsfluNrKNsLeS+Pv1839aXB3TZn0IDRwlToLgpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTaA9DaGnRIq8CeOU7cZCdejZFAonbF355xZY19hv/JHepZfK
	kqHHnEIAQ6zLb3vOVCOJFobpaqJjxyXgG+Rqm9U5hKrJnGtS4YZ/DWq04WzSbS1D31bDeOTXhss
	GjjjKY6s4Ho6JvLClpSeL57L1gmoV/ZQb6ts5kkDdAJqoCUing/VyuXP44QHhNh0=
X-Gm-Gg: AZuq6aJ5SJvHWEi9u5jM8epBFWU6FAJz0TA5ocwKh9rewy3A+PAd4TlYW5Q+EPvoxUH
	TkgYYYipyIeCOiDMWr8ZLNr0wux+S50PP1VAwAelhyS+aIoPNWtIqZ57B+pz7/1GLj4WQUEYilW
	VBKKlWGYRLjIGgAt0wnX1YlademKZNd+bZBtoxrGOV6DiLTsGBSkKrkq6dZrvF3cZYZ6leUG2ec
	+1GfPr+kBlYdUpJ/JOEswcSfkM3PClsbrnMZtIl8IQaIoPINEl7ft+PnJYRcVvKJzpCtuJ4OYBM
	TcsMlyLWwFrdM3bnAdMH6d81cV+I0DhyFBVSVJafgu57qIsH6pepVe5J3jB8JasA6s+mr46jQ0r
	6GidyeDxQmc9HvdHg8Iyph2Y7q7kBFjdgQ9ty
X-Received: by 2002:a05:620a:1a23:b0:8c2:e8b3:7c3a with SMTP id af79cd13be357-8cb4c039d26mr1344997085a.87.1771314830847;
        Mon, 16 Feb 2026 23:53:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a23:b0:8c2:e8b3:7c3a with SMTP id af79cd13be357-8cb4c039d26mr1344994785a.87.1771314830354;
        Mon, 16 Feb 2026 23:53:50 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad0166sm33350255f8f.35.2026.02.16.23.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:53:49 -0800 (PST)
Date: Tue, 17 Feb 2026 09:53:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: kernel test robot <lkp@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <iifc6qoejdk5bohdqdy2qqsi5bm2w2vo5hwvinju3kxhzvadsa@6sblw2k2w5en>
References: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
 <202602171020.eP0Y69zD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602171020.eP0Y69zD-lkp@intel.com>
X-Proofpoint-GUID: XGMyAZ0yIg1OjCJDU-vxpClY92xWizzV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX4yYdQrYJb0+1
 yeBD9ASuPluQZXa+0U4KWVjQmCk4gEosTZiZYiGeM8YmUoTgnwts7dn0910F8TXBj2iVZk9jFsz
 DSwPdCzObUZNC6nYhI3t03jclMNcMrNM3QuENTA6CvM/DENv0kmc4ccajb7sjnDEAkIv8iNYqKb
 17d3BnJA27lfQaSFBuq/CtuSE6ScjE7xGCEF4znN6NpKKOFv2vzAKqrU82GRnugcRbPgXOr/2er
 qyq6++07zChSX2jiCqMIFgHppIMxRQKb3vFfWSiFdOGumET4zFUhaoogiH7SbCwZIZDs95Xjeme
 C3dqrt+kN7GnL+AYA9iihzgGRxqGQqrnRfHoTLOQgb9EVFQoPSAunG+MW4WGRkvM8EBAoppD8d5
 wRTryrhrRdQ/XasKRkGCHj46xYdn9ept3/XwWEtvYpjNn4Nbn67Caj0ZXSnG6t0jtWrccOC9bAZ
 Z4l4gVBviaF3LimkCAA==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69941e8f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=gSbDSvPH9l2sfEXJlosA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: XGMyAZ0yIg1OjCJDU-vxpClY92xWizzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064

On 26-02-17 10:10:16, kernel test robot wrote:
> Hi Abel,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 635c467cc14ebdffab3f77610217c1dacaf88e8c]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-clock-qcom-document-the-Eliza-Global-Clock-Controller/20260216-215148
> base:   635c467cc14ebdffab3f77610217c1dacaf88e8c
> patch link:    https://lore.kernel.org/r/20260216-eliza-clocks-v3-6-8afc5a7e3a98%40oss.qualcomm.com
> patch subject: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171020.eP0Y69zD-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171020.eP0Y69zD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602171020.eP0Y69zD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/qcom/tcsrcc-eliza.c:126:10: error: 'TCSR_HDMI_CLKREF_EN' undeclared here (not in a function); did you mean 'TCSR_UFS_CLKREF_EN'?
>      126 |         [TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
>          |          ^~~~~~~~~~~~~~~~~~~
>          |          TCSR_UFS_CLKREF_EN
> >> drivers/clk/qcom/tcsrcc-eliza.c:126:10: error: array index in initializer not of integer type
>    drivers/clk/qcom/tcsrcc-eliza.c:126:10: note: (near initialization for 'tcsr_cc_eliza_clocks')
>    drivers/clk/qcom/tcsrcc-eliza.c:127:35: warning: initialized field overwritten [-Woverride-init]
>      127 |         [TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
>          |                                   ^
>    drivers/clk/qcom/tcsrcc-eliza.c:127:35: note: (near initialization for 'tcsr_cc_eliza_clocks[0]')
> >> drivers/clk/qcom/tcsrcc-eliza.c:128:10: error: 'TCSR_PCIE_1_CLKREF_EN' undeclared here (not in a function); did you mean 'TCSR_PCIE_0_CLKREF_EN'?
>      128 |         [TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
>          |          ^~~~~~~~~~~~~~~~~~~~~
>          |          TCSR_PCIE_0_CLKREF_EN
>    drivers/clk/qcom/tcsrcc-eliza.c:128:10: error: array index in initializer not of integer type
>    drivers/clk/qcom/tcsrcc-eliza.c:128:10: note: (near initialization for 'tcsr_cc_eliza_clocks')
>    drivers/clk/qcom/tcsrcc-eliza.c:129:32: warning: initialized field overwritten [-Woverride-init]
>      129 |         [TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
>          |                                ^
>    drivers/clk/qcom/tcsrcc-eliza.c:129:32: note: (near initialization for 'tcsr_cc_eliza_clocks[1]')

Fixed in v4.
