Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053C81CAA62
	for <linux-clk@vger.kernel.org>; Sat, 28 Jun 2025 01:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075915; cv=none; b=djo9jE53A8+YeKGwhN7QbnFnkFAkkVkw+rTr/F8VI8IpEasgzdVWPJwusdZo3YjUIa48cb/wJKRSVYiCSMr843WzdX+rn9tvpo2eOruVk1P59qTs8vsD8Wl4cE7fOI8MoRRHBdSV96AlSMMslcUuumM1tpO4XslXFWv9o9dc+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075915; c=relaxed/simple;
	bh=pWpDZVpcpfLHx6uhsAoegGUK8ZMrlwyUKIRW3dlh0Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Urfd2hFbnxNqOM5UpZz1bHA3aMkcwuxzgjO+/rNbip1Y0qz0YG3izl2JETPV4GUMjYdydXOK9EQ3TCi3yoJ6OSsLSDMQJXKgxGozuH/CFpBWeYoPN0VcSgT7wmjOeW0FkaS60IhYUKFWs3jCTcmgoX/1PcgBtTUdqVmUQc94pag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYtymxzi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYtymxzi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DIiN028054
	for <linux-clk@vger.kernel.org>; Sat, 28 Jun 2025 01:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+pXUtk7h/e9fxB5NYEsdbDb8
	SFpEksY3oCoSMDT5xBU=; b=kYtymxziEtDPUR/DR06fq5P8BiGNvLLfHjXM4qzX
	oq4YCWrtuEIxDA+Rl7mt5CPBs0GWk7Bi3UIMFIDNdcNzREw/NCvFqwYluNHxOpcr
	+Z1I+3r48v3NY3SyuqMAby9eTl6GC9vX3hcN9FpuGSQmbdT02fm6Li8lrRLtQOiC
	StJt+vkddbFxPD0J0aimDPx4rD5iv4Skptrx0Nb0TglRt3yTGMT94hsONN9EUUGn
	gMJrL9WwHc8LA7EhvtpXoUGgX46VAC8Xk8fRU5s0+11J+zrG8i/QKVwrm6IDsEm/
	fHhITWO4azrHqNIMgElZiQfBApmFO3LwcAc4uEgGY5jugw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26jt6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 28 Jun 2025 01:58:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d413a10b4cso451980185a.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 18:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075911; x=1751680711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pXUtk7h/e9fxB5NYEsdbDb8SFpEksY3oCoSMDT5xBU=;
        b=KcIBfAtJUfq9Mr0TZSrSZl8go3dMbEIjKH49Ew/lGYFfdnKHvWO+N6uUxlY07jNq7p
         wkY8z+62dFtpXCt53AmxHXg9GwwSYDT/7urKaRbnYIj4q72NywbpCJtu8PeDsGoEBVk+
         JcHk0CQU0NtAnK1gZvw6XBa2aKvBNdXU+kSzmk5eKaca2aY8TDPcxLJYgjKAi6dzHy/7
         33fMTVns4ovl6HrzWAc5z3iV0nta9H3IHVQmlCluDxASnzRp/qUPWESfIKah98mzpjf/
         7YRQLxrNNrojPixbcjzdEhy6vI7fl8Jo44RCdcYahQEwUe3vid0TkoAlBjomo600UcqJ
         MBsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBEjb0yF82cU9yvxy0UaX2BtWlDiYVE7HxA6RgLCd6+7D+U7bp+tjI2YGuXd29XYlYbFog+NDQThM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3BuSSeKyFSk5LhW+vBRq/+2QGN3bY4tzfTM+xgT7VEQqJvOH
	9Ma+hRmml5xnoPbkYDM55F/WlBA6k49s0hJDvaAUp9pkoj15pWqm/u4nsmUTcfy70LHhODRL/qW
	7XwuaRiKC4BI/dGJgSMyfrfa6s6q5+yVVtowvsC+oS2qezeWh5vMXCimKCaM7FFI=
X-Gm-Gg: ASbGncuyXPVLVEzjL5SZDOZiGBme60TA6SAZKEoerEMOmqpDkGivMwHNHlKAAlcTJeq
	9E4r+oc2ARtMqDY1OKRZsQDk43lvwHEESIm9ldFuj3JELrYrIgUmRyjeDKiQlDLJFOxA8o5QI+R
	xD8DY+eVBvyYSiLPYLNkpRw+DuBhfFw4ROF1ibYjcoiv6xHdRKfjdcC8M/qwxuN6CxMiJoYjAKe
	tMjc2O3tCV5DK3zP6x7SbXj2/ULNMHZdTTJNiNXPd6EhptOlz50EDOzXELUysTTES5L5UF9T+J7
	laNEbk1M9Fe56b9lY4V8tKpR4SlzlqM5ATP9Ki4Hfvll0TjCnKBFwpjuZN4A9M908kqxHujlDRQ
	WKGL2qp4YBRaB9Guzw4mCwrb4NoZCN5vN13c=
X-Received: by 2002:a05:620a:1a08:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d443988efemr792723985a.39.1751075911018;
        Fri, 27 Jun 2025 18:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPx2U8tFKLDmMfH1PW9cHmmn8qdEgd47qN2RxSezRNQHmEDme59hKTrXVfH0mUq2+T6/o9WA==
X-Received: by 2002:a05:620a:1a08:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d443988efemr792721985a.39.1751075910633;
        Fri, 27 Jun 2025 18:58:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b95cdsm639619e87.130.2025.06.27.18.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:58:28 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:58:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] clk: qcom: rpmh: Define RPMH_IPA_CLK on QCS615
Message-ID: <i4l5dbqrs55e5ydrwpuxjigxsa7esevujhgwpl4qwsgx5sawmw@brcbhbqltlr6>
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-4-dc47596cde69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topic-qcs615_icc_ipa-v1-4-dc47596cde69@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX3OQiiBCeM5bt
 soZ6MQT84Z8iIdvQGCaZ6sHddWlerpZt6zmmB+2i5QEYudd3/NpsgYyyme4Bj7QqLA6GGNDhNN1
 NvbvlUoTPFFIQhrvHo7HC/GQpNj7Z3IdrTIvB5gOk4UiEDAjheHlgOAHInoyeH/8NwimE2HQv/X
 lwKxCyB/ycYnHqyAArV0iliWNEQC4mwFIRmoB7PyuYjbedd5Bj1r3VeQRYZeAzHJCZVf009+ljH
 xq30E14AdpUBewFyQwp/yLIIKpriv7g6mwndm9RF9tzqnH46q6+Hk9JZqLlKP1iFxx4fFlfcqbc
 lLhmVCQUDVosjLBmIyVIiOFCm8C4I8Muyl8SPiChwXzK+KIJHd1NQeQDQiKYqCT7Mu8yKldp9+B
 6v7GvZQO2B38PDq94hv8IfA680OsHltEVxpn7YyHn7vLkXZBjcPhARkhHsT9invYfW8yTXUp
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685f4c48 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=RBL-HKAeo4RFQYj-4a8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: luEFVMxo7qP2kFCl-2lH0K84orx9c0In
X-Proofpoint-ORIG-GUID: luEFVMxo7qP2kFCl-2lH0K84orx9c0In
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=789 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280013

On Fri, Jun 27, 2025 at 09:37:58PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This was previously (mis)represented in the interconnect driver, move
> the resource under the clk-rpmh driver control, just like we did for
> all platforms in the past, see e.g. Commit aa055bf158cd ("clk: qcom:
> rpmh: define IPA clocks where required")
> 
> Fixes: 42a1905a10d6 ("clk: qcom: rpmhcc: Add support for QCS615 Clocks")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
