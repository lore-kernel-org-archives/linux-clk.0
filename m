Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF34ABBC8
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718305; cv=none; b=IEeYCqFVVs4E5hwL3dgiRE3+4VBTWGOroiJVSSBNkKLe41oWsbzW1OktGAs3Z9HCdFTK3XA5SlPLDPeaoWNcVSyfsoaAYk+mnaUuURlEiqb+QpRqJ96PgICf8jFFnW9Zn7V7Hz8Zop6aH8OviPVq9Uro7DiYO06wx+s1w2flHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718305; c=relaxed/simple;
	bh=DZpCf3W7DYEFEAO5ppw8pHOndackIbF0C4IJ+5w6OPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dN11BEWJ9xfntWPrKXaT23qj1w/QsvG8LKBHCl4DpqUpIoD871MG5FfM9yQuYw+qHdF0rRvNdft1Qe/xUs9XRBM9h2HU8pxL9n1CrgLW1TEAfaayB8qmFxjGTB/EfcfQKcXfB4H3pBfayvT7ZM7xXL8Xff81+Zl/xvCKl95g9Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwZ+z8ii; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8hbN/pn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwZ+z8ii";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8hbN/pn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xrUu204093
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Xl2xxpLKuZ3XVWrJWvIPGXk
	jz6BT+vuek41WXdoj5c=; b=RwZ+z8iieRwrKdJ6HB2nBaKj2v9QEjr9vegvAOUC
	BKIYz7PXGgHdLoryAHGMnkNfObtRfSBEdpt/QGDNccFbZw1iubvO0kEnJMHt5mrn
	p/Rz+Xb31+S+W9+aeXyAdFuBDCJyke3niPa73efuibH+3/ieWxBX0e0ctAaL+0ZJ
	2ciXl1B7NbLevOOchM19EKQCl9tqBLCwTB7kL6FjQBnoazDRg41FlPjhjN+CMOjl
	iNWJ4YTqnPtUX0miOwSA2VLvn8HLWKV86iSsCKKoqhTIvWw23n78eU0uy29Ofw1K
	aGGE9FlxHDEBzYQHWGMPH2AeuaZ8SFZCNpUVJplyQllXsA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2rnse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:58:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8472ee1eso10457066d6.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718299; x=1790323099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Xl2xxpLKuZ3XVWrJWvIPGXkjz6BT+vuek41WXdoj5c=;
        b=C8hbN/pn8fWEQX4gpPFhIuL2pC4G5HbQTvFyA79ZGpg9jaIFxlD6TU6ytD6ydbwx5n
         gIn8EYiuDzSGwtrUZAqHDcbtE3A/zNWIB+neTnalsSLyZ3QAz3IlOKD0qmaz+9muNOpB
         YAxEN0pEBXT93da4W5ZmXLqYg2zgCSgXcR5H261CDabhZltMikqp1LK3Me0o4oFowNzh
         /DdzroWDm2NFvfhCifFbIjEa5PPISZYDPO/40elleRwzMYEtGO1ldHzCYJbtnD2xDYQo
         dG9fnV73CTJ9s11sgKJnG4s/p+TTKtdDqSFTIBfDDA7xu9zg0Ho5rLNicG011NzUUIdK
         HLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718299; x=1790323099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Xl2xxpLKuZ3XVWrJWvIPGXkjz6BT+vuek41WXdoj5c=;
        b=XAi8yFhRkryTLxdyPIDrrRtN8p01kRMxDn1PLeFjO3skW0BqQm/cMq24O/Zc4DGWlp
         O92s+YQ142E2ulHeyqGkfaQXfmDgLn942ZPvOzvbgpQXWISpKObA8aS1JFRcQ5wM5Omu
         Af1BDcPClQJ/CBqmOLYPaRxhQ0OfCsVrw2psgnje2+u/jcZ0LcRRUE3udIf9bp0STzPh
         GBEMxzrzLoKINbwe44cJ9QnKuOx2oEMXJX40FLXjs/+wL1A4wbbzFjUuWKIOcS6aQW1Y
         6Lrz/NPea+2LKtCWyoukKtMUvkIITLmBbAXdcyN38GstNtLBk4+JNTRzX/Hp16y6wEwY
         jvVw==
X-Forwarded-Encrypted: i=1; AKwUvBwBInLnSQkg9/8hkx4i4WtE+YPor6QWoyElSJ8yWH2e3IiEtxo4bC1/ErBZXWUPrfBDgQJFeYIZ3Og=@vger.kernel.org
X-Gm-Message-State: AFuF++m+THC+BBl4uftpclkhCovAGpHwrz6sUstoSVbMOyFv2MTH90nj
	+xo+ylEZabT66SW/i1NrQYXwPnBdxXJFBMyc9valWzblPzKDO27iPFfl46qdRSwFfArmO4knZx6
	7DSYZaC0qC+cXu+ve1IABLz/8AgSit4EfqBvcGZQwjhRtBuO/1g9g//ZFnZEDIpo=
X-Gm-Gg: AYBFou11e70OlJOxqnroulnEcei1p/9J9XKl6/jqyf3a3QwYIveLJvJzmumbuZN8KMu
	gIxhL8keEaQB3EgdgmG115HVBA9T71Pd3RIADDtqv3iPPmjYqPUSio6QMXCBcDQiPr4KwLXgH8a
	FpOW/UWUF/l4LuuRavx0CCIoM3+VC0WcrjG7N0JCsGQPbvXlAynotkr2j+OEt5dpzapCt6OI6X6
	ala81ObOqKpEcCawsX1wMd1A6tQISNzPPG0Z1W3/2rWCO8+V6buKo8Cc00VJmXO7VZ5DJSD7mOE
	CeaTVBZ1gu84SkNUhqWLxxdig3myxyq7e4zdfTH/WESCb639+fBvPb3vWNSdSgNldLA1BYjadNq
	MZ12+w/vQ/iNbMw==
X-Received: by 2002:a05:620a:44d4:b0:939:a45b:76ee with SMTP id af79cd13be357-93bdc70bf55mr230736185a.23.1789718298585;
        Fri, 18 Sep 2026 00:58:18 -0700 (PDT)
X-Received: by 2002:a05:620a:44d4:b0:939:a45b:76ee with SMTP id af79cd13be357-93bdc70bf55mr230734185a.23.1789718298021;
        Fri, 18 Sep 2026 00:58:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm36534535e9.3.2026.09.18.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:58:16 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:58:15 +0300
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
Subject: Re: [PATCH 1/3] clk: qcom: rcg2: Initialize shared floor clock state
Message-ID: <4uetjsqcm4ozt62lgj6crwjqxhtbikicccw37mkmxs5xkobvya@u5uhjl5zs4o2>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
 <20260917-topic-qc_clk_fixes-v1-1-5531cb00514b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-1-5531cb00514b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfXwrMjw5MpU8p6
 1TSwS5WMV36lbWrOVc4ML2W1A+tUWl81MeDj0wGdN0e1zfNy5+DiIpAn71H6LeqK69CMzlub01L
 xlu8ixEbXLWD+wg75Jh9ILCro05cWqc=
X-Proofpoint-GUID: kxXprcs2OPURD4r6vNAizf6DkYoUHE8T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfX7yC880vuJieI
 vMA1h8i9L7a5i2KbiYwHA/Cxzx+hGsK8QH/gpAFQ4HzQ9ayG1lrLCrZH64oE7AUh8VM8Cdvf9kE
 XsFWNoiBKkb1JfejS66Bu1Pnuc257CyhIyuIQy35LcMGHpfHyLDWblQlMI6VZhf/kazSB7Fsx3g
 FBhiPn0oHe1/1riD6R5HUtx2pfm3p34PnMCbWrHXhig+zbzt0x9/auj9wSV/ygqjIoHaoPBw2zL
 Eb/VKavNPDIuI/n/STPnmh4D+QqP3V/xQXNqfhhZFpgY3+m9Zg4oODsEiG3EV1tRgilqmhG86Cz
 r8RRRjHzy63uNEex+dxR810WmJsqn7IG5eO0l0W108YK4ONbBbb1ILeoO1I+ZgF+ERadwFGE7ur
 wiJDqE5uauSaQrdTJ/AfKzKoemIhSU2yZ+K3c7IwCfCHW1Q4l+eMp736n9lcD/MezlnwCWYZf1a
 zuhcattRjAZwho02u6Q==
X-Proofpoint-ORIG-GUID: kxXprcs2OPURD4r6vNAizf6DkYoUHE8T
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aacef1b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HK8F92NRLrjYxt8c1QAA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180107

On 26-09-17 11:06:53, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Shared floor RCGs use the cached parked_cfg whenever CCF considers the
> clock disabled. Unlike the other shared RCG variants, their ops do not
> initialize that cache, leaving it zeroed until the first disable or rate
> change. This can make registration report an undivided XO configuration
> instead of the boot-programmed parent and divider.
> 
> Initialize parked_cfg from CFG_REG without parking or otherwise changing
> the hardware. Propagate read failures so a clock with unknown initial
> state is not registered.
> 
> Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
