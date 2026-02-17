Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EE92D948D
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314816; cv=none; b=ryVR9flfw9ImY17SZYZj+xdsfz6igtJR+RtI5n/Aqg6F3kbTcVA3cPQUhmjr2bewfimHIr0AAZ6RkL4mYE/nfXDBmgIa8ABKI8xp0YDzvP7VaqNIRH1SYWTeQJ5cOK+1b61TUOG3RjnQfd+2t7EGB71qrrONSGCv1xixP6B7dB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314816; c=relaxed/simple;
	bh=u10W0dZQkXKK92GV/cpGKMrlxzSLCDLg8iUDPQNa+Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiqmi6wcTnOAuX1N2olAfKzvuVWAmPgW4tzPHUsVI4mEXRHfyI5vSxk0ihyEuKrncE/bTsGadMFvEBg8a4QjWbQGNncl4jJ8R/nwl4HhA3lJhh9VIVPaBW+yQTQlM7LK7VhEWl/NVi6+x+ck9G7pducOp/WLkzCJTOz2f14xcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh/DgkVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLV2MubH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh/DgkVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLV2MubH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H6PNOR3392901
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HlyIZEog6J3u33MMe7AFXbsT
	oOYrvaz+iKp7UgWrFA0=; b=kh/DgkVMfTUv94MQxfiFtIZvNho6Sio2iEoAmdwt
	p9wU7zr1g7ZzxgGBXfXYlLjq3TPOM3hJ8D/b9aSchRwQxwjF3e1rthYMJutvF2vt
	EDvweYnq4avWV8HWeNz8wQPR0a6rjvhP/Gy9m78DqnJoDvhWhNwFPzf6cYjloITR
	WlRrIBZZkeKKGf1mPDdDqAGO1R0Pv4FdvTQ5K3zENBUVBmxKAovlQVsrsCZtT5Zr
	ZFCsnc5h5NmVAks3u2iFAGJ/DgN8EtQRvlauC9OFjC1wQ0CdmcrOqwmQf4/WAy8u
	PQcuvuH07hVls331ZoxcCkHIK7kDNjmeAsIsWRdN9UFYdw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5kh9r9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:53:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896fa0fcf27so364332806d6.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 23:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314813; x=1771919613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HlyIZEog6J3u33MMe7AFXbsToOYrvaz+iKp7UgWrFA0=;
        b=hLV2MubHHGNpXXu0NdTusfSivPpCktMv8rbTF220RlT835/K5Yu1fwg9a+mrD74jZv
         T8CRJiofPZtUm60Lhx3aFVqbIVB8R5DGRcRDuL6IsCPViuj6zQXv8aockljC6Z2fmROl
         TqBP2BIsIQeDpmOcxNbHtoe54iFbR67ax8zAhbk667R5HiWtytcycbEvJj/CE4MictVs
         wBP/IlDFdCO8xubx4Mfs3db29+0/iH493bbZmJ/AQoJLVyCx7RhqoFeliyn0GzP1aVib
         jfe+O2v4rzXxq4x7DJ6U/fDgUh3vCQsuxlS7KcUp5u2qGjyMpc3tNZIGitKlFSPcIPQZ
         GcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314813; x=1771919613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlyIZEog6J3u33MMe7AFXbsToOYrvaz+iKp7UgWrFA0=;
        b=CKBFiPEtmk/Vs2eD37sR2k5J4wVFH42v0w7P4o+vypGvM9s3iBZz+9uCuRvMM0w7e+
         E1QGPQzI9BPdsEWtG9ivmtMFFZA7LTWsR1+qjVnKyIqXVKP24U6ZgvM5el1D4ZKlgMSX
         ER43v4RZdHiBMVPRNhLxpUdpy9fUIT8oVXa7Vm4iO1uvl8TOIDdAeS04mU+p9axeuyiC
         qj/Kf32eBLZOiam7Pkdu55ftIYICOiiHlXHnBKrGfiwl7wWw0x7KeHxMw2xqI9A8MBlW
         Czzlk8K4v/1DmVtMDtKrvFEKIxlRLRuEdIspItPJckr2i0onz4ik5NbaugYBGQxLbLtX
         y2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXQzOgyrD7U8ikBAbH9yEFpFk6yYuRhAlLa+O2SEuaLdC/g0DC5JcqUexomdpohQ3lCcA0HqtfxOkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkFpQAAHjSlC8x72+oZkqA72rLCG0a9hRpYfubPYvUD9aT6ch8
	V6n0bU634i9RIHB7Z8EEtBBecNlWxLy6Zt9HT16XSxoHx2DVs+TuabDk3jLb9/JaC02tKcFa9Y9
	8eGpivb/AbnHpoZFFlruEOLVCW0cg9K6I1kyabmx0BHlrwqtCtQUM+tOXljOLhWg=
X-Gm-Gg: AZuq6aIFp0fl6g6QP8BSEdkuFmx0a/AvxIttsEpwNugm2b1u0oPkviE0ceY9GstAwaI
	nDARDfcNE01fLOLZO2S28KiGeI2/EeDefTvlPUPs6v+ES7ukKDXzBqXVGET7GsYhIRC7zqvBaSF
	PpNjZouEUU7hpb0meqkCQm84yxHCRr2yrzIHQHU7CfFVHNfusnG5KkRNnaI0PxPxHkayWXjWNxz
	4DmSt6A3XhnafhkLcs/heQMvA/2FoVpsGGUDn6FNAmNx4gDk59BxvrpQvUsJTt8EocU4Kybvjqo
	EdOr9wT7XPHAHADJRAISDVqECykdhYD8c8axYKi73b4nJUeEwOhugOhDefeehFgpVzGPF3j+Osg
	27EJQzs8jsuZ6KXJJ1vjEvmswOr2GZyE0Wmwu
X-Received: by 2002:a05:620a:1728:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb4225fdb1mr1520261685a.2.1771314813338;
        Mon, 16 Feb 2026 23:53:33 -0800 (PST)
X-Received: by 2002:a05:620a:1728:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb4225fdb1mr1520259285a.2.1771314812848;
        Mon, 16 Feb 2026 23:53:32 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29866948f8f.33.2026.02.16.23.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:53:30 -0800 (PST)
Date: Tue, 17 Feb 2026 09:53:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: kernel test robot <lkp@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <ckfybgx4suqpm2hjkm3zgdssxh4rmy4dxxjy35yqarg2ybu6fk@fl77gdnzvnhy>
References: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
 <202602171002.SP54PXRC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602171002.SP54PXRC-lkp@intel.com>
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=69941e7e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=gSbDSvPH9l2sfEXJlosA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: gnJh_pG3DyRTqNU3CNQc7kGdrMeRpvFd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX6xMT0pySAsNO
 WjP+qk3C/W1sMLrIPfW5/CEICQi22I5iUXkIukY6WLX5V7Lov2d1g2GbfDQefYbX07X29RBB6/9
 v1HwQGQBpwMk9iHTBwEhde++0Pq3mdrjLeWlWKqmeNn4Z9j4AhXKU5lXqnKEI+ETlGpLBmlFtbB
 xvHuuj5r/tOj0CYs+YUpHmJov5YKDaE6oSK7XeNPYWdG+ldtW5XpT3TEi7phbQq23EiQI220ltS
 P58yfbxWuq7k/dx12HtHyYQhiEilwKozVq9MH48UnCfucccarHt+xGwrxKDEhPGeTWOJpkSefEf
 kidizQ/1iYhS4Nmk19yq/jy9jeHSKUjAmEuf8nyRPL3+s3vsacsnipVva0UfRhx6uvn6cgjr9GP
 oA6DG9NP9QYeRXHeYJaKRkdTpYtwN+WuSVN/ml0P28TFUecpBhFEQlUEkEbiS5rp2ciAVw85YAf
 qp5ceVGWKVpSoVi/v/A==
X-Proofpoint-ORIG-GUID: gnJh_pG3DyRTqNU3CNQc7kGdrMeRpvFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064

On 26-02-17 10:31:45, kernel test robot wrote:
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
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602171002.SP54PXRC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/qcom/tcsrcc-eliza.c:126:3: error: use of undeclared identifier 'TCSR_HDMI_CLKREF_EN'
>      126 |         [TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
>          |          ^
> >> drivers/clk/qcom/tcsrcc-eliza.c:128:3: error: use of undeclared identifier 'TCSR_PCIE_1_CLKREF_EN'
>      128 |         [TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
>          |          ^
> >> drivers/clk/qcom/tcsrcc-eliza.c:145:14: error: invalid application of 'sizeof' to an incomplete type 'struct clk_regmap *[]'
>      145 |         .num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                                ^~~~~
>    3 errors generated.

Fixed in v4.
