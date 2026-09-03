Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5884A6CEB
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440558; cv=none; b=E4twvYEPYlgZVJap7zNnmN0Poe51V+7UHO6BdiXMukJ4PKeLKz7v25wNreI1xZA5lEiXhGPCQkpxa1wtpyPFv6xxkrEn0RJnKkSyzPgtQJlYPBkdLUFUzzCNvco+ohnHoy2QjWN2Zgmr54G5Ogc7KC5EN5aNKIO4K2yNSdrbKpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440558; c=relaxed/simple;
	bh=iNUyMqHvX3S8pNMhywE3RHDU4buVV5PMKqGs2Ue0/Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rnt7dIFMFVspqLk3LacDHi0qnSCmhKBqui2RDT5eREykOHqKxbpWbwuW5YEGxqYNhIzquFFwFV7Vmh6iFUZLPTHfHlVjw+qvVWQkPRKvSWiFE6FTv3hdZAfa4pGiffHjcHB150/cWZfOlNPknmFoZXK0k1/++RWI0zZwbyeWOCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlDh2bxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRE+fxuY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlDh2bxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRE+fxuY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBSt3203946
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 13:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RxbC8SJCtxAxQqyfjLxRAGHc
	UklS+ixE7pJvZTRJkeY=; b=RlDh2bxk5UMrd5AiBM0FL2s52PEI6s7AW0Qkt2+R
	zSA1ZYIUxF9V+kJqiXMtnxZLxlrlfpmVDCakGrKTSvFv4EyDamM7GyVmikD1/XUU
	0HPi7b0br90hsaLxTj7siq8cvw7ef1zO7Ca7PhxnGYoIkV3VPh50QF8YM//5mKvv
	vpFH+k0Lxa1drxGBn6J8hzEuMp23vzb0JL/5vodB/hQ6eHxFIPEofGK+amUIjD/T
	YLO/AmaqScrdPyKn0pDH0JZOu+h6+wi8qibqb6Ke5CY9Qg0wN/i7i5ibFsPsk2mL
	y4xS8dgisaA/7Tpy8AzgYDEZnzPk/8+U+nBEYHWvzinLeg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d1111c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 13:02:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso471688137.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440548; x=1789045348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxbC8SJCtxAxQqyfjLxRAGHcUklS+ixE7pJvZTRJkeY=;
        b=WRE+fxuYIeR9/JXBMS8ElGrWamhd2K3snH8cNKxU6w6z+ky8jX1eUsAr0dRqWABF9K
         +AvRymAY9lNwQbVR3jXZJajDk3et0FkUCWExc/OeP/v5KOlVaGHJJ9vd3RocbjffvrJX
         vH8Ro0pwOiIC73u5BtEBY3qCdr320cjZhYuSdFZ3q5miJ/tX6pe2nW76P6fKxxT9Yu20
         vcRKH4C92TYuTW3hKAGFvLh7zVkvFsTCC4LIiXVIVBJHPlC+DhK3JDrzN0FJWU1Q5bcu
         Y45Vt2YNwl1moRUoXBNMA5YT0Lpx7ENd1ZP7NDtbH/hvKbr01+JUP0UjN5U9a9wRs66w
         vfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440548; x=1789045348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxbC8SJCtxAxQqyfjLxRAGHcUklS+ixE7pJvZTRJkeY=;
        b=HKzUoBT+2LcRNQbt4XqgNMbqbYrkTX1utUHrG1eGoFyPmVwzmGYZJFMvaDDpXkQ0f+
         sNA+1ofENyvuo/sQq7rYyjKsjMBz+WWmWquO3SfEDlQPzCWi0kbS0NlS6DMNueBisFJW
         J9ZMdPqage9fxO4s+1Lu60W5kBUHi8jXTllRndZ17f+5RZbaqu/TklODt7zPW3K0GDwn
         YS4xuL1WqqayFGR13HR7pTvE9o1vyaDQPn4iXGwH924olbZ13eh1PzyZb1pBiJB5i9CN
         g1V5vqi6vrPh/Mi/B2XbE5FjZ8c12wLCS3+jvYi8BA5ZzlDR0B4R+PW0HqKcFBAgLKjV
         2MYw==
X-Forwarded-Encrypted: i=1; AKwUvBwg7prKHTl70Mp0XodLgZz/md6DtyOxU/XFjomEqqhtT4Ey1Y1icfIYArEs8x06w8EDyABxpip5vy0=@vger.kernel.org
X-Gm-Message-State: AFuF++kXvL3r2tpO7MeOd/S6yLNYb/6y1k1SGnd1yuntTpK2NDWr2Odg
	Mtg7f+UvwuhpyVBebC5AMF0Sh9NGS84GyHVN422uw6tR1/bycjCBzT+74Bv89krExCrFNlbUxF3
	lJ0iM2vSktxD6P3K9FdToQcCLJmeHkXyy+jNaKxsm/w7WbaTdwkpwRrIC82KwuIw=
X-Gm-Gg: AYBFou0K1R+R6dSfxMcREzqe8wXnYHT4zK71aifjcqgqMq0gX3BqgNqT6/Q/K/sYo2L
	YXSeYrxyMTCEJX0e13BbPExTqTQ1dMki+O4NlZEOhKoJTABwmQMIAwk4NYf/7FYBhiRWoKTlJ9O
	veHtCRCDyEKdPCEKw1UlFY6RdlCcp13m2mFc52cbyWTOm/oTxXgwQW5Y9gXQPiAY3TDHNA0GyFR
	YIBACRrm5TCrokslWFKEmNznupbfsHiavtaGs3zZTohRRKcKp2X97Zon9UmBduu5QWMUpbD+Gc6
	YzBaP+i/iwLTe5SQ9zl3KqkSD+f/Hy9zYVPLFpo+6ebrdHnHYwEmOHtBhTFJVVUOODDY+7p1+E4
	t8f53ZXVO8ptyig==
X-Received: by 2002:a05:6102:3749:b0:784:4156:80e3 with SMTP id ada2fe7eead31-78a1f24853bmr3308854137.7.1788440548322;
        Thu, 03 Sep 2026 06:02:28 -0700 (PDT)
X-Received: by 2002:a05:6102:3749:b0:784:4156:80e3 with SMTP id ada2fe7eead31-78a1f24853bmr3308818137.7.1788440547636;
        Thu, 03 Sep 2026 06:02:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm68179745e9.7.2026.09.03.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:02:26 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:02:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Message-ID: <yfvkgixouxknoc24eg53wgluzh5jufx6hcodqx2hci73puqqab@fqkut4o2yktz>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXweYeUYKgWb42
 lKvP4m/ydAsAyD5bhgUUVeXKdEd7sc1oCRIKXKWfa3lykVntOBFrSlbeyv639uIZwAittQG+SPG
 DUY0IChTbIUnLB/P2rBscXQDE2+pugs/fksDjuwu1PlMmu5KY/z6TgtyrHoyM599YTs9enknud1
 uFxKpbh5/vpWfozNTDRPHczdQVI9sSgN9iZp5DP6vqyARcTlrKlB4fNGHXiIgokwdfKl1wFEtLx
 bpFpOPC0n73Eyox63vqAtfBU1SILVlJp9Njh0/ym5EXGsPJybBJj1IhnMERw2q+tre3wLfBvDlz
 PV1OxlJe+hEMUnaaCc2LYfIPbsOOHfX47NXcnTObIvIpWUr+Qp78AsfP/oBPAo6cOJfjYqNoF4j
 7uOcGSF3d5BfqEWwGvu4J29F1XqDJ5Bcymqs3fCVMIFTrVuJU0J7WCHmSrazLRIjeKbHopCmFOE
 lKrB1Z8mvFI/xM/nL6g==
X-Proofpoint-ORIG-GUID: FYfaXhxTv33IU-N3Mpbkv5onaeZZoLkw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX4RHncvmoARYE
 RNzFlP5M206a2bImUW4q/3IBhW5U75Q5ekQB6qAnRErc09kb7O1kpwtTUhjlVVnkI9wtP7B6em6
 fA3qBEtT9+bjWuvC/8MokmaMa6bkwnI=
X-Proofpoint-GUID: FYfaXhxTv33IU-N3Mpbkv5onaeZZoLkw
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a996fe5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=C_jcV2f4aFh2m0BU-kAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:11, Luo Jie wrote:
> Replace clk_hw_register_fixed_rate_parent_hw() with the managed
> devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
> clocks are automatically unregistered when the device is unbound.
> 
> Since all clocks in the driver are now registered via devm_ variants,
> the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
> 'unregister_fixed_clk' error-path loop are no longer needed and are
> removed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
