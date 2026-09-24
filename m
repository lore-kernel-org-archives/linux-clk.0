Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E583C443A9D
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240771; cv=none; b=dHtRxk7UI30j74xOJYH5jUxv8KCzvklLK7kh9izzdhGPQjXQPLs41eOVEMhEKx2dyLP1iaNDHKCxvgmobdxfwaV3+z81qcqqVl4KYCOIbB/J8HchBIj3sBLysrKR44n/jN2S1goass35CnvkIQx+bPprGakIDCIMsYjTvz2/B70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240771; c=relaxed/simple;
	bh=poW0PZ5zk0x1aS6ZoUJFhJMAlVCA0awRCniF7sN81mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udVhMIj5nCFM/z1FmRcA1wK+vwBjaooYbpVGV+Qx5vDj4ullN9xxTzKpP5belteATQR8FNO9IhNwSaVVrEWbpMUSNiHDFwsmeXGM0UzLlNCS1D3vSwHuJyFDrW8HKiqQy6IxOjaqI5lpD/9jMDwGVnH959WxImXtjWJ+JoJ3Grs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTkDYGRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnjUKK/m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTkDYGRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnjUKK/m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5ePLR1898879
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KZsUTsJlAuxATif6ogT+hS2X
	xr5/AGSAeT5fyF5OwXg=; b=PTkDYGRG4BI+pslPifUZbOe64td8IeHDTsLiS4qe
	llE5Tqv0ElgQ7n0ZJrJFsnOp8p/zzaKC7znWFI7TBfu/19UNhNxW3o8nBattTZhA
	MtgHYjji6URRqk6dQrSuxW2ZBoxS+I414jmtH9+KCfyfcPwR9J11OMIQr7cXWs+p
	hVF6Tx2iZ5gA9yvKcBfC+rLoR/smfgL+RLjMo4m/SF40WZAbTZMU//xmkhBS48+A
	dClHZ3lh9gaCzTOLMmMBKFYXnGBlNgOAPYLO//fJSkt1pKzrs9y3zZYMhHvN5uYG
	MQtkpXyC5zVQDZ+KpOWo/umG1M5Wdu8mh3uSYucAr78sNw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb64t4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 09:06:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3282d5302ffso750645eec.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240767; x=1790845567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZsUTsJlAuxATif6ogT+hS2Xxr5/AGSAeT5fyF5OwXg=;
        b=XnjUKK/mKiwtpZ3mGNnoJkeMlpY5dcoguBWn1HJDtJci13RnNQGGstiqWElBnSJZwV
         vAPVyjsTyw+8Oauv+QZgGyPgLVOonkFB0mnBof+JUEfyT2rMCjWJA3AWA8pT2pT4ZlK4
         xWvxQ8P3/LOni9byiz0eT4MlT8sHoUrljXpBOD+mequ27/tPykJ6dgLUNodXR6AYTwNK
         B+kdEPaKd2EHwT4jKKxllbi2k/z3tfwvfeHWIgayK1dsP7rtHEEEWCFMZJbk7K/2PjHv
         ZLxmMK4X9jLu9P9bYpM4sQb2aWkNXviOCmA8AVmwANIsdoLown7pdncMWSZx0J9hHv2P
         Lm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240767; x=1790845567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZsUTsJlAuxATif6ogT+hS2Xxr5/AGSAeT5fyF5OwXg=;
        b=IWCBKx9kHX1+8e/2AnPIZuAE+qOJ08KthXqn7LpDaojb687MaZ6ajvyKVDZzsIh71E
         /7iUP0Gt1VQi/mQoyn6Ei89lxbC27qafwRJow8WZrRAgKrd5vEn5/6RKsGS31uxoj8oL
         P6vlQlwbl3lhfM+cLh3QwkXgdquzT29o25vVwrTIupGMa7+j0ZiIDG6nJaiFTAmK7n8u
         7WqmtZ8K3blYtSQZGINyuAuNpDarIU8cTRAIMwEcUMm7QnigqUzOQOW9SPM0Ii8WpvVx
         0Fjmbd6iRhrwkiWvAhdXqOt6AWId3l2vOBaxDD1qOxsss/bFvQSWnRVz5A8/4dr0E16S
         Jh5g==
X-Forwarded-Encrypted: i=1; AKwUvBy84STYMZem2YN4j+/sWvlywp2vIQcnjoHsxlMAIG553hWPyBSd/2rvhmlPAiiYca+3QQd1OVhDVaM=@vger.kernel.org
X-Gm-Message-State: AFuF++lddmSWzBd1+/1u84ztUFaWlexVxFjSHMNLMj7Nxsea/Uq02UMm
	xQrn5P7t6FN2hXhST/KcsSzdr3aQnUdrSsafbOhLu045bGi1ReEVX+LaKucuJiSXcYwY77OBsWB
	cLcncphjx8H3M3pQzq5iXZuCOTaSro1s++5Er8gzgLJxDgjFwhYIcYAPEvPAby1Y=
X-Gm-Gg: AYBFou3bh06aPCJSyKSMd4NCtwwgcmuvlmpe+uzFkqXtRbx5S0XGfySe8Pn76qUhDRZ
	/r1hZZnl3awmT1jgscwH23F9p6N8iGCJHwj97q/CEv7J8wQvA8ralUytWBhKNKcGFbxO+DxWru3
	oR2ckolIH4zBwTSczIdK7FMe231sxOBfBsltXu27hQbfb/QBhB16mU0wtOCU5mYLTHfuMj0HKOf
	6fW3fGEL7jWSsu9ptPi11x0+3wip7K7t2rbHASSThs+1xuzPVBTfcGPtU9kQ1Evu1S1eIQdDk8B
	4q22RJbYnjzp2AEluqLqvvGRwgI2WZ1bEHm/w04LpPrMwaLJ2wDGOQ5YjQ8UiehbErnUF3Tq9VV
	j97D+/8Bk76IhMiWjtlQ4lLM2GfTS7NghVXOGSLv9+w==
X-Received: by 2002:a05:693c:4144:10b0:33f:ddda:6076 with SMTP id 5a478bee46e88-340039b21d8mr1392672eec.6.1790240767420;
        Thu, 24 Sep 2026 02:06:07 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:10b0:33f:ddda:6076 with SMTP id 5a478bee46e88-340039b21d8mr1392540eec.6.1790240763930;
        Thu, 24 Sep 2026 02:06:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e90ec54d8sm12602799eec.0.2026.09.24.02.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:03 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:05:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Message-ID: <arTn9HKZGNSUxt0j@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
X-Proofpoint-GUID: xONZ4Zuw9Zcn652nFtII3O8xzWyvJ3O2
X-Proofpoint-ORIG-GUID: xONZ4Zuw9Zcn652nFtII3O8xzWyvJ3O2
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab4e800 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=geveDRkZF6hWoGEvibMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX322R/OfDrQlH
 C4z3GnqZk0c4cjyw2+5GuYuATmXRPUmB5C8SLMbVHEzpWu7T2HAu2m64MVRulAagyFxk1D0pplX
 JHvHpcxTe2NSX27fiDI7G2a9DJX/x7A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzOCBTYWx0ZWRfX/URf8og00L3w
 pdpWql5wyI5yQmDsauh9ThI54dFEvpTHVDEkmVnxUlhVCY1CT+ehj9GdjFLYjPgKQL1adHcVDSM
 WVs2qyjXWTRtqlQ4NlXFbCe6nsXfIv+w5a4S9aRKvlHe6xVPjnIBQccW0/xCBnSWQqabk4DnH1u
 4xF6O+pE+rX6GvmO+/T77yJWMT/o74ABMYLDM6olFbkCMnSFupXSigQGCXuGwLYsCyqBeh+ZdHD
 lN2coxBw2aXog2OEDZYB1fQutx3QHYRbpZf2tUI+vJem8y3Mok4fk0vZVFJ1krbfJLOdT8G2hlX
 uxxjz02GRjnfMFnBLpPCcAQErJV3Oeffhahf5/X4049ukhcu8ShZjxPdhIA0qw3ib7Rj77mmtFp
 fZsy5VDZWl/1oq204SpBKKe5fxom56L6T9ZkWWNLC2w4Fo6ghAzsOyP3WYI70R/8BBumhZLnxhC
 us58/oMgrfGB6DySWvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240038

On Thu, Sep 24, 2026 at 12:51:33AM +0530, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
