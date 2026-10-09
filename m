Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC89538AC78
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 19:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572863; cv=none; b=F+lfBBhHouruAgnJ3FlL4y3uEYC9fvh35dcVu8aKSPGbFNPFQI7TINA/150qXFGhSMPWqKkBtcUy+sdr/2OqTfHee56/LW0YMuMFJGUuIpVQqS4eZRTmP+tIQ0Q2ntFOHs41XfoBaDpdxHKFRTdbPqt2uD50h0MCdYksBcBsaCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572863; c=relaxed/simple;
	bh=NUU/Ab+Zrm1E2zysy9bbgOAmEA6PP88zabVf0y7lA7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJq8ylt2CBaMBRmq8a2CZq+o8Xp9uJiuFx2PHfpeHoWKrRl4yDo2wj9xbX+YeLbW7trAPqoVHfmu1HQbxMl3+BMUXeJOeDJbJWu98+udxrhj/zeZ03X2qZV5JH+1AG0LyzV6BQ5jUoIk5JEEv5xnWR5Se8ILuJccIkeKQKlbDiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOURCnvk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Op6JGj0w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOURCnvk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Op6JGj0w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HbLKI1449638
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 19:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D4eG9FwHyQFv9GDgn+cGvZR8
	MKJ2fMxH9Tvyu7jW1Mk=; b=oOURCnvkAp/gI8i6J9LIF7KLI4nLfiEO+DY2Mi4d
	uFdBr019A2pMEl8mX0AtncolezHdo3iHEkb2Sfcq0TZUHB078EYmngIwPjI/gedT
	eXtmf70oekPbCLEJj99p8ggncws3NEPQgQ4fY4LbXqVTSiQY03+5xmUAAqeQa75k
	Y9ql8UuJNpu2HdN5dRXJCu5JGRWdhtSoptY5+mD2Nfebqfmkc/ERtbkN3NT6teAW
	Wafrm32CVIu17Lw//HNZNYNNaYw6tZiMNy5hMAEbTrlwsihfJBfSlGR2kxywbNJs
	f5C2YqYg6L6PdzO4uN/HpRzd73pQUxGwM0gx0GcBn2/GZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74tbgd65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 19:07:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso3934785a.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572860; x=1792177660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4eG9FwHyQFv9GDgn+cGvZR8MKJ2fMxH9Tvyu7jW1Mk=;
        b=Op6JGj0w09yYbqeHhyJwlZqUWh2tz99AN5mg4toZn8qJCqTmHTKlh9AxmHnLWYuEDA
         gOeekVS74BTNEPzIKyKB8Tsc/HsLDA/l8z3eyGLLDqoyV3noFB3pCfZtsD/VsNX1O2+h
         CWk/m1fnsCRLmvsAwhoi7+go/sychvwZcvMeIBaoe4Qti7LCkn2ETNBHOqoaEorbmqrQ
         U23UHGNDmPR5ZbMMDwg2UBNtYLFIf40fzjBfEsU/87o6/SViONcsW5f/mMErCDGUa7aF
         t7gsyjNDOlwEoLT5dzJl1hHNDu1fpuUbAtfAYfmBKwxKa+aiIfxBMBdTLoRhZuKJZ0WP
         U9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572860; x=1792177660;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4eG9FwHyQFv9GDgn+cGvZR8MKJ2fMxH9Tvyu7jW1Mk=;
        b=fwSxSs+aaCsDtlPGu+2Pih2rShN+jFYPFA4pAQJZM+lzE9LSr7s/L1A8wtJi706VIz
         sKvY6/aPQQKLH+EgkOOKF+R0rGWxqcFABxqNdKJi6fBUGsc/dLfm5GKLQLhA9/MxCGiX
         8p7m7yqinRfbxNuTDtU5J+nJjDriZwtRIfD0gfkS2fFQUHko7Ctuev4rvvADln+wd8jb
         0MXGlA/L0ROlFhB6yd3RfZ0HO6TT5obtpZNmPWCdGud79CvZlvHk38Srhryf0KL2zrSG
         N1rXOlIzdqaQg+TvAwjbPGuLuEqxg8oDP+QLP8/qitJKNKXJou+rgB1iyzTo3pBde6eR
         pS2Q==
X-Forwarded-Encrypted: i=1; AKwUvByk6pqvc0PGrPph3CW4Rxmt7JRVsGq0576myh4PPAZ7CTJhtpjmd2F731puLE4J8SBCJKwX2/SMF2w=@vger.kernel.org
X-Gm-Message-State: AFuF++kjapt6pFcIcDD8E2EOKa6SLIAwD9oS9apN5sXnsj4G9WgJi0wO
	xn4bMe/tV79GBjcvVMZUp1/+AvCsnEODrO+wIpaXV2t18S2ajgF62JeNLTxS3qpYPTl0WHgF0Bs
	IH8RvbfjYBULJTpTmjoeRH4F3BUiL/GOkf7n/KLTm2hsKlgeUYcfVrhhYs18fGiY=
X-Gm-Gg: AYBFou0OkIjUlKD3EzrmOUXzNxMWRiyXPV5SoDkV9htFdmimcC4z7jNdxcr9FvXpN8p
	VrkUyetOn6m+KFHdpKTYxVoaLHQTrZMHwmSia8jEtdW6H5fNpuRfjSyRYRX/eD7lU0V3DBDJIv9
	hYPsuxnIQbrHaYDJOFaMD8hpXSKFVbYcn3npUtn9Hrc9GK0bp/ajNQSudLVaTn7ikKScvcoHbZY
	KFjPmalKpIx3AiPoYbfClsAJ4gyJSfpwa6eqi+YAWB4qs05k+2FyrJRs6zZxoT2g0VzG+GAix1m
	l7dKjZcQa1fzcIwLN/T0G2ySThMneyimFMPGnHBHfFFpCwfKhckZzEB9q/5XJHWHi5kUUg1NNR9
	5Pht3ip5vXJ9FETk=
X-Received: by 2002:a05:620a:17a9:b0:93c:ba2a:6c1a with SMTP id af79cd13be357-93ebd271e32mr451542185a.61.1791572860077;
        Fri, 09 Oct 2026 12:07:40 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93c:ba2a:6c1a with SMTP id af79cd13be357-93ebd271e32mr451536285a.61.1791572859484;
        Fri, 09 Oct 2026 12:07:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm114363625e9.8.2026.10.09.12.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:07:37 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:07:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
Message-ID: <gp2xdq5eysazqsj62zbhv5rimzfrrd74ttzctojl4ol5oouejb@sesvousgwctu>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RcEFmFtv c=1 sm=1 tr=0 ts=6ac93b7c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfXwGE5Sab9vLtl
 FUHmlfLG7uRfBgkT/xR314CPikxJiE68l5+jpd9NzXhWmU+sBJea+McVH1D4hGVf6Y4HfGwGRaC
 frcg/0aO95dOcBLV7aTflVI8cYXs3be+WFAVFVz4ceztg6Dnoj3rQ1LRT2iVjBRWBtieK/70G31
 6OUKNppWkENVGR+abfZ2gmkbWFBDYbf+tz8kZoqd67uS3pw9RLVPhupxUxUIESBr9QY4AFNUYnC
 a8LtibpiShAXEzGUinQHZy2Y88w0+4wGAGo/OCVPsuxBly+lJep/lZveh+tBFF9NPanr61zFyCb
 d8Wz1uJ0MtlHeNsciZgvjW5XdnPKkvm4Wm5NnS2yC4J7wyE7DUVlVe8gWljS5cF98tmSEgBW9Xs
 JxzIdgENhSsR88ujN76BlVqBuwFb5ohsXiwbCPxIeppvXuybOji6h3Q1E2qkRiOzFgXi5NPKFSZ
 qLqxk1FPwPFjhW8Cg6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX8cXykNm2WMrZ
 KTK/XWPZJtVJCa93yqWJZvkqK4LaAGkBLbIzlNkMYSa2ozrY7pX2dYPjDNkijEhCb0+H4u9PIlK
 wZ5nyDmeWXfvRpn1otf4cNuuK5ISKVY=
X-Proofpoint-GUID: ftAzszRMbBR7FaJDKgtLu_TUNSMySt5h
X-Proofpoint-ORIG-GUID: ftAzszRMbBR7FaJDKgtLu_TUNSMySt5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-08 16:10:36, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Nord: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
> the NW GCC driver.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
