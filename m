Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DF61A5B90
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416502; cv=none; b=cnowiwst8mSQuHswrE02OJPY/+7zxth8LjpAhIpv8uBonFrimXXlBH6k9snVLhBIv5j0gCmB/Uj0rj53R4QpSDPgzvGULOM4yz0NHB/LFoBodxUMWhRqDC/dZzMtdP36Ah5eb70bWkrbCdLYiyl15h+kk9LMZ3LINsb6ob0hI4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416502; c=relaxed/simple;
	bh=k62o+ay2M0IbQRNfbp10YC+dWMBh5vmDDp0amjZHXxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDklMgcL7Qp2H40dBNaUGnAQHgpLpaVLWT7fCuUbZ6ehNe33tH/2OCq0fqMUUAayU+HAxPWdDymgXm/zVrQHhmJo30weckwHLpNnGKioRnrN7jYtin26v7YL7ENgBY34TLNpImTU1JNGbFpaPWwXwwwplxCftHUa/TZ94vRti3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mhe/JN8p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mhe/JN8p"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NANeR1016970
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ch6JIJp6fDzsw1vuIJ2eZ7S5
	WCWU4GzfWZUvcdjbWkA=; b=Mhe/JN8pCtR+E92A8mMd4EhXFKMkh2kZiPy+dN0q
	Mt0QhakfGp0lFBe5ucWHN9RoxBj7DMIYf2b9je+98CsBB7qHlVV8+GCtTX5TPivh
	25f9FZ6nTPnG5fGN1gjA7fugN1lsoo/LZe61BL3aUyckyq5zeuZ4afmCO11lgeIT
	wQpKADPDvbsWamqduJw0k41OZdiXrFVtMZJZr8Gk5E1kJdiQLRpfPT5Sdbh6w6dW
	EHrQNryfSL6ukFxcGoNw97aNpQSlMK3LVTxpUfFrqHU52WvrzcMqlJSR56q+Kkv2
	hCT7Gyvu6nSAJ6FBlyr7eKNBj5LHMzSU+njlPslSKdomrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j9wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:54:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0b0cf53f3so959597885a.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 06:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416499; x=1746021299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch6JIJp6fDzsw1vuIJ2eZ7S5WCWU4GzfWZUvcdjbWkA=;
        b=oBAUTIl9UxCqMn3qPalUrzzyQcvZGs8gh1ZucutrHidfMcQFlKUDXzSddiRffMDMVJ
         tSwXEI/DBaE5Y4HEpehVNz9x/YplTEht7viND8N4LM3LEAzww3K8n8fbyJePNspXTLOL
         QXxghi+LymbEn0C48ooxN5YmnG4nXwzb0t6wqwP4OlxcS2ivYbRGyTurZtMfMJk00HQp
         VhnRD94v9Gt32YRI69GDTrbOQRuxKHF4X6aTPpYteBtX+KDaw2oOfXPRPtwfVnbioPh8
         aqSNj+4lyGXfPbUNd21Obec7yqJ6+R0Uqc13q8RIjcHbD1nf9tBBBCwzg1tD69veoqZ/
         lDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfWWQqdgT+G3t0sLxcm9bVsBHyTe5rBlp4QvnSAPPbXRAnfGDuo+7gwR+i/nxh47cE1+QaqXGPjV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYlM4OYgJKjj7W4uteuDVppW04DQKy4tV1vXhzOg2IsMiZhder
	fJZfidA7vBRE7RSmd8SYxKrz5jAIg8grHzGBTytpcrP1Cw1hjbFFMjpdFB8dZeiQ6XXe1RNaAuu
	PoUUb/VdyeZWtp00ekk+47beFxXZl1RVrE8i/0kTYf/Z81c065+11csQgQfA=
X-Gm-Gg: ASbGnctbZ9n1wVTeEDrMs+l1OUJ9g6Wf8vVQ1IORKtyAy1Q4EpiLH5Wo+H7uGM8cuIm
	N5EpNVBButg6bsMTSfvPnhHBKRcklXEd7ufVibAhARoi2qKBstw6AcGROospGU6O6VCob7ZsZ5n
	BAE7j6u83eNpxmgkFMqpy4FljpH15FnakJsozZfy4K8GeG+qX+lnujv3J+HzyX5f9pR4YSjqoty
	0CF9p+R/CJVZy2VLCmC4406Ll+6M4uWCE/2cHJW6sgKKcLE3QOdKaxl+jJdYLThMUEunHXSIvLP
	cT0laEpQaeA/LeXbjSOytyBtX1+zDAPpO+4it+ZuvsoWN11wFekHPRJhQGDo2MVdYvWf2hhPtKs
	=
X-Received: by 2002:a05:620a:1a1f:b0:7c5:642f:b22c with SMTP id af79cd13be357-7c927f99563mr2964405585a.20.1745416499203;
        Wed, 23 Apr 2025 06:54:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCYGAKdZu53by47MDLIJhd7FQhQZJw0CY/lsfFM4Rh7noGH96BnMs9HrnTEVjA/8jZt7RYLA==
X-Received: by 2002:a05:620a:1a1f:b0:7c5:642f:b22c with SMTP id af79cd13be357-7c927f99563mr2964401385a.20.1745416498738;
        Wed, 23 Apr 2025 06:54:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907844f3sm18420431fa.38.2025.04.23.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:54:58 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:54:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: camcc-sc8180x: Add SC8180X camera clock
 controller driver
Message-ID: <xlueboano26kjqkukhdmealdkzdpxdde57w6v5r4rjegydce35@i3e77s54t6yt>
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-sc8180x-camcc-support-v1-2-691614d13f06@quicinc.com>
X-Proofpoint-ORIG-GUID: WIoWrnLA8oSqW0LJZTEdV51mP4BPqa0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NyBTYWx0ZWRfX+nubwNLpj5JE SJyao/9MXa5FlIDnCMsXAJxOEomH+bAmwEWRWLl375d4lBXX86S6EK5L3yyT1gY8C2TzSHDGKHS 0WwrrMpLXJwewWThxich6Bz7rYj2vKq6wV94BGE3/U+f2cjbHbu8933jTikj3Z1mB1wTzSDEVoB
 CNlkJ/YcEKLwdBaJs5G+xpJY7q7oXZRmjrANU/MubtuKex+lTOw0fiQKmNmL8GQXfCxr15ovg2Y QZg35CWfzLfXj7dGGjb3Zrqk491Y+8zGfOaIa0UWzXIV0xF88YwpqXBu1K/m0kPP/wt7w1Zv9Wb YHyTW2EDuXaqnL6McFeztOBPcSILah2hRAouE5Fl/VmlvgGFjm5icN7/uaQ6rfq4OXRSv/nswi9
 0qBvdFJkrLBP0H5rGDPkMRKYNlJAQnKHtFUZlZeb+5x581u+KZtS4SXJe3FN/Z9wkv0MtNOT
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6808f133 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TIlaLBFy8nvcEV5Zc5gA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WIoWrnLA8oSqW0LJZTEdV51mP4BPqa0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=869 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230097

On Tue, Apr 22, 2025 at 11:12:11AM +0530, Satya Priya Kakitapalli wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig         |   10 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/camcc-sc8180x.c | 2896 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2907 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
