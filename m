Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344B53A5453
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718362; cv=none; b=e2zXK2+UNw96JIyJKN0jYnQsK1kCYYZCcU/9dLUj2jdfBusBkE1GwOwikckr2NvHYqmbvMyaE/9hwVWFWFScfk34v0ROWLstWe0asAu36SUyclXsZu5qln7sdtAPHpJGc9nZ9hDrkHztqef8gyp3KCclFtJjKB6JQRQtQ/cuDmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718362; c=relaxed/simple;
	bh=NoScTolTln6SzZFFnTSrBIYf0gOGmMfSl2RkO09h6Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQ8m/8Bv4gU6kqisKO0qLPu4x64qxg8/UmqvCs9q3xsMOjHmu11erNOqj86jdC5++zYT4w2bnLuqyQsltAN30y722eO/0s104GAjJO24ZmuubaY+KIMxINryS34NCVJtctZj/RVmUqQg0+v5fLapr1CbpuiXZMe+O+4khoDNHUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2QYcHcd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVWYK/Tx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2QYcHcd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVWYK/Tx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I608P53945078
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t9TcokNUvapNvs8MZupRzXGs
	/bjc65TFxkc8LMJv/4Y=; b=G2QYcHcdfzdJsDNzam9ju8Nuaa0OHX5cGR80I78+
	77f5hgXD5/ia9lkYW4ykRV2SeD/LKVJ4li+yjNk0f2jbkkx6sKliLjNjvENjmMt1
	kHM3TgGs68UAed2JklzjIRhjeztJHc2xPg6wsg8UcPztI0R05qCfYET+hC2vq0nk
	4x3MD1+Wjs9e5UlJgCpMAn666ZS0duxYroI8f0y4io8qQB5TkkrvTuXpIwA933ud
	2f6yoDx4AFoNXjhBD/YfaoSvUwJdJd8a7iKSA0F3jpqsvVHQLAm5we19BT9pWZMx
	1HYdNslj9or7mXZAaP2zj9s8S2hicQv04nVhOBIDJhyaug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt3va1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:59:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f925ba4eso115280885a.3
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718359; x=1790323159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9TcokNUvapNvs8MZupRzXGs/bjc65TFxkc8LMJv/4Y=;
        b=jVWYK/Txo4tFt3ZsSi/6REpxDgX/iSn2fYN251K8tBEpA6am9dijzE7vSJTh157akH
         yiAo5pZYk39h90prjKc9vovcx4lYd2Qvc/qDWVH7w/8y9fNedmHCHAwsNuCqhRNIp/08
         F/4lZDX3yIJ62vRlVNXmGBP+rm83GQ1vxBiCINTjm/xjtcU/hwT4ZzL2kPemDzc/ARbq
         L/iuA8P/6TF3H/i29TXmhtoqI33Waz7DFk5dHa0k8zggzEhUU4PZ8HZmhNjJyShpXVPc
         m2KdeGL/jI+AZTZAlBDoWy+lqZvBYr2hXl6W7GyLKj+W+SBpj0Ttr8iYmOBurHgm65RK
         +Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718359; x=1790323159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9TcokNUvapNvs8MZupRzXGs/bjc65TFxkc8LMJv/4Y=;
        b=wR8S8xjz5meYTcuxCDiOYsr9pUieyG1kPbZWPpY3zNnkgQ1TITYWsCKd80yTbtwZPc
         7Dk1q328HtUkBhPoHYyyyIPmMxRAec6bRb0zb5B3hgmFC/MEn7q3CBtfaL/VC8tagvBk
         E5x2I4dAy1tgxS+1p0jHQespJd1IuBqyC8euBWRA7wrijdESeSjpfszr+i2AFK7F9d1m
         1UBpDAbfKv4xboPblVDxP9fQ+EGm1KZMHyQZ3uEcvqvTcstUoIVdouojam5BdlRW4Cjr
         ad2Gx46TvfMiMWGCpukt33Gk2QfKUk+NUOw1JZjnBnUbHGSDRu95oRiDDsrfSZMVmU34
         9Hpw==
X-Forwarded-Encrypted: i=1; AKwUvByGizd+FqZEDZbxgRaKmd9LWYYemFG6LmwZJ1le2jcLE3msz8oYKddvEnpcg6jeki9ZlBzA6IPnPRc=@vger.kernel.org
X-Gm-Message-State: AFuF++lfHli6cojm9B/9HX/z5yY4N/xHuAjljPpaadC2WUIQ3Z5gGIdb
	iILhSvVcBvzfRrAcE1508asn5OBgEQyw8Ici0BJfyW3JISn4KYqi44l9JezpbkVyooZMNmMvVyh
	IlzR+1yAukJ683/Cu4hjoaoBA91dstxvsHbtILdVp6RgvQ32C/4HP0Fq/C1d/hjLSIjobsHc=
X-Gm-Gg: AYBFou1yMRan1ge2y+tzn4y8ynEOqSnoLV3L4tr5HtCIyRE+gcNbCut21E7vSl0cJof
	AjCYF/+UIf0kFVBjGPEPD/X+HBGe5Ucr52FIv3M7Ex4kifhHyo532T8jApq4NXiYOvDXUbsY35/
	/3rrRLNe2Q+jczXwHFIBAarTAj475aIN1kkCk2DFZnNGOnto7fB0SSytprHNFeKs3XH7aEGoapq
	8j/r0k4YeUNu6QrhWO24Bm5sV/gYLddiQjL5ghRtSg+0jktgNZmcYcBgR2BjzaGlUt0kpJ2b82i
	GFiDRf+/35SakVtqUcTJAc2yzkFbIlOJLHz4/vhImLgGc0sw2WO/fRrQvJ5/0SZtNv7uXmIuehR
	2anLoEGxKVdyf7bg=
X-Received: by 2002:a05:620a:468e:b0:939:13bf:e861 with SMTP id af79cd13be357-93bdc9fdc60mr232591785a.40.1789718358989;
        Fri, 18 Sep 2026 00:59:18 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:939:13bf:e861 with SMTP id af79cd13be357-93bdc9fdc60mr232589185a.40.1789718358463;
        Fri, 18 Sep 2026 00:59:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd216ec7sm132320955e9.8.2026.09.18.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:59:17 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:59:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Amit Nischal <quic_anischal@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] clk: qcom: rcg2: Clear force enable after rate
 failure
Message-ID: <fzcarbdkfwns5gaibjq6gvcrin4u4vbtglsm7jjkyke3k7baht@yadlibk2u3dv>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
 <20260917-topic-qc_clk_fixes-v1-3-5531cb00514b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-3-5531cb00514b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX0mRp1GUQRJzk
 3gBXk5KIFOWwHUbWekQIRvTLQ4a8CLZNyD6HGA4K/sWYYIuU9JZic6C/mYggHM61PsMzNjeIPs9
 X4wYC74jn3NKo0uf+YoKBEk/5yre1b15MbhOVnB45+JboqlLjN4KaiIIorDB8/OxNgzr29LFH33
 X7jTTxd5K5jTRDl6S5YsXYqKQldvz6J7kDTA/7BbkTfhg9EtfQpSTuqt5+k9Bap3tZ8j7mS4QCQ
 NpNdxsXvk1l7ymEYlysjhZ2S6s7amsO3VeC9tk/vXRqR7dTWcliiZy9mBPrfEsL7aoKK3uJ70Fl
 ALp4/8LjNlCmHn9lQmTrDdYFkWY6LfB/vaGFf51Q0zPWkRbNC6t4LFZxNkYkUMWtYfTw+m86H+T
 Hi+BSQh0qdKb2IY0Rqxb28YkZyQuxamc34nIx60r0d2tPX2ev9lBVz1ZsY0ENd1d351+0Bx7Dy7
 hBw1ADzNwTw67fpEA3Q==
X-Proofpoint-GUID: AZKQm3oujGpu62eujnkkV9y5SlotxsaZ
X-Proofpoint-ORIG-GUID: AZKQm3oujGpu62eujnkkV9y5SlotxsaZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX4R3USvWLASAk
 xrhgKybVa3Vl5n8vH6QxXPQdgMbFb6yH25SYIVAdo98aHlkRo5XKX8ODpo3PsJnElYxbnO41eBN
 i0RcMdJjetfanGFnmr9iL6kN5ktx6OI=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aacef57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yD9qS6Ighlce5qk2PfcA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180109

On 26-09-17 11:06:55, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Shared RCG rate changes assert force-enable before programming the new
> configuration. If programming fails, the function returns without
> clearing force-enable, leaving the root running while CCF can release
> temporary parent and resource references.
> 
> Attempt to clear force-enable on the configuration error path before
> returning the original programming error. This restores the same cleanup
> performed after a successful configuration while preserving the primary
> failure for callers.
> 
> Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source as needed")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
