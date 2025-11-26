Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308322C158A
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142968; cv=none; b=XxaCmEV2T8ZwdYrBZed/d4vr/ETxYJ7dbjwJQK9u2Dd4SITx78O91Dznc0Sny7zzdXPfoklm/v1i4+iqbCvDGnl7eRZpaRke36pFypIiYDndOqItt1zlishJyK6EPB+t9ste1UGy1LbjRCedKTtHbMYSnvgFn/gLSEWBNGN/b3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142968; c=relaxed/simple;
	bh=MTvQXJUnjx7iXlFVgiEhTmrE/wtj+l3N1tkXre2aZGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAoqXWqXz7eM5xWcURWJph0K7MDJUZVNDg51CrNU5VQRN/vaS3Oo/9B3vJSPZxU80hnWdzWq523BYxhA4p2REWyZyX/4t0vTK8hZYE1icEDizMdunhavhswEejPMnk6TNyHQt4YZ6GGoV3RyduvgKmml4zs2yfN8Gd94AGX21FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwG6p1uU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nz7QEiRx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwG6p1uU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nz7QEiRx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6uspx1457050
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 07:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hSmMytZePYeJh7GyIYzpdBXF
	zz0XlHcC0M7p4x0FFVQ=; b=nwG6p1uUumWtSV52a8oFNHRSDQlrFGMAjrIU+KeT
	cSWGHdG/mYWm1/sl/Vxs3c6uY2UVQ2nrIr6MGyU2Ir64XmELzyUAnBrNXnSeOCKP
	hjeAvINBi3ZNiQ6JyfDBxx21gNTDUqIJDED/aY4cGNwjFhTwJe1PUHeJV/ZDKIII
	luLegjCDMYNxuY1qTZM71WT5gOHuq0Q/5MYGZ36ZJGgTE2MJQri4yVHbolC7K6/P
	Lizk35WsAAgdW6piWFpOFtLk43bo07GPZuxKucEk1VaKxF5wFx4JtaUhHtVcn4fk
	lgXIDxoyD24WDPAvVyAB+tXiT+8TnugdoUuvW0o4xQLsDw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvg3un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 07:42:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8823c1345c0so71284186d6.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 23:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764142965; x=1764747765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSmMytZePYeJh7GyIYzpdBXFzz0XlHcC0M7p4x0FFVQ=;
        b=Nz7QEiRx1UwSrZIWOi723HUnTcRCyHzqaLD/ENPjhRYBJ30P4rnmzf+fGSTCln+lMg
         dujQv1D7iKbu56UtEcKLdtTzmyOOeT8d1Uypuj/MXHBcwrhEvtEIOaOZteGYfv2Kng+f
         /3FHdbqQwu2SKjNTBC+dm6HVW3Ce8uekIx+E+OiyKDuHj0LFKJ4X2DSkJt7sQ7XIbtyT
         gVuoDH6yWWb043tbkoVtdNjeZoY6XgyHEPk35xeTjko2wr0/LW1u4dILgYKaR7kJaGC5
         eGQunkqG5B5o9eaz62+NOmSxwgxL5rUMTXkU0HEdqOc2Rd6+KIjuTWBHhnNE/i83wiTO
         gW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142965; x=1764747765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSmMytZePYeJh7GyIYzpdBXFzz0XlHcC0M7p4x0FFVQ=;
        b=W5vSfuArn1rPZKqlcdvym/m1glf3Op5tbcd/6wNyOf4SDOdrN7A1GGhj8rHuxMwZm8
         IYn37A41qNz4HwwcvkYKwnrJw8jXml33HIVqG/VEzyHX6tj5wWOrBf1hmF0E4EewZy7+
         /naYwVtthkd9YFUq8vXNhQ3jEmjCIwQtyhMVlBb2qBM4CkmNNklPjt51BUa9x2e+AZsN
         7v87AYVczeQYTOiGzmK8x9/gKSxmiTHxBKMit0g9LnDah1cfy3IEZpAxRTTxMT+m96Tu
         358eGr83sEMaNz+PTHXJaP3i2H1/qQtui/mlEQpVzgVoSQBaoF4L9A1nQhBDFs0dRlwr
         5WNg==
X-Forwarded-Encrypted: i=1; AJvYcCV3BJJY4H2Pd2XxYsziyUewzx8IOjJmSTnuo3fVJRmmj2Na4+kEOOQMl5LvnjuBG637aUJY9IM6+BE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqH/aw3aNDtx0z2uC112JkRzK5QyszJH2pUVceh/9tfJ7OOee5
	n4Vy4UKND44pkWRIjnvBBSQ+oIiFX0HN1fd1N+Wu/6GphPzlKGt7hV0wZ91J4VPtXk8SLBJAYFd
	v7Yl4nAMqWY+tqA7PZm+EjJ8pr/May3SxLEdwLUEUl6celHYSzIPWJ8Bi3JOKcN8=
X-Gm-Gg: ASbGncsxrEclmw6QrFSe4ZrDYjbqvKjb21c+3oos2L1Ru8y87IyXJ4LrpnDQcO2Xl1R
	JpqIVWajb+opMzsAPAQWW01bkU3UTLtsLeN13FHS66t+tl5LIiwdrl4ObEi3hxaBscb/1jlDUzI
	rAZc6Fvgb0JAlGscx6N1BsA8baKLjElkaehYV7UAMFLc6YcDzB0hPprGeIRmJGNrS3aKLH4e9x/
	o8m4SGentVjhlFr5tOCGZQLFwqM/10E5Bv02Eie9Rf/sfDxjtXq3A/kBgSoPO0c81eBU97+9eOS
	nt4XZLIg3ErS7IfO7Bkl5fk2E2J1kOFuJBXFD6o8B6vSbkU0Ssp+imm7Q9cuta+KcN2W8az2Qsm
	lEsqH3JN0yYuaxJOeN3ZlTOIQM2XZsxyyfjGwsBspDLFy7BhCmeJ169ET1NmOsz2AGTc0KIOqSe
	xXI+kDxc5bk7Vh+QIPsUYMNZ8=
X-Received: by 2002:a05:6214:4013:b0:879:6db9:148d with SMTP id 6a1803df08f44-8863aebaebfmr78895916d6.27.1764142965394;
        Tue, 25 Nov 2025 23:42:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGh4tssCs+1WRQwtr9pXm1Mg58jhurhNBu/7oeDZCBesIA3nCosUO1waEfZS9MB1P5XOidXDA==
X-Received: by 2002:a05:6214:4013:b0:879:6db9:148d with SMTP id 6a1803df08f44-8863aebaebfmr78895736d6.27.1764142964949;
        Tue, 25 Nov 2025 23:42:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecaesm5847146e87.59.2025.11.25.23.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 23:42:44 -0800 (PST)
Date: Wed, 26 Nov 2025 09:42:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
 shared_floor_ops
Message-ID: <z43yemdvybqltbdfwphacvclf6nrhaqafoloxmcsy6fhjhgpyn@6gtii3kl5mg4>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2MSBTYWx0ZWRfX7nioo9tCnfrQ
 zxNL97IFj/qQP0KYkHiSgw4NLsKX8U3dguFL2Ed7laEQZzJlOSCBoQIqqlqiwkP+tENQ59Z/azO
 t/qL+SwgSAHJXTv/FLDR2EoXYkzlbF4x+MoRo7KZODdaMulsYxm84LLiFwG85BfwinVc5cuI/Fh
 Q8AWyjGEagUb2e6MgyjTy6NwchG23S2iadvvDCOH9cuOls3EKPbqKdrXNJAik6+CE2l3gl1uEOf
 wCd+UdvTk72lj0mmMMRR9/P1sZ12nrk8aFplHb+mlQ9ySRpMUmssklVU0PBtFnAfX9OQE5/5BJO
 H8jTjizk7QfrGk78Gq/x0GyCylQMrMneuytFjDc6NofmpYFtRbm+MAgwPoz+lnWBcVmAu55e2l5
 bvwE1aKYBoC7GNxrL7NkITOC8FMLTg==
X-Proofpoint-GUID: bhM5IWuDf0H4IJrpQHG9VMAgCGC8F4gW
X-Proofpoint-ORIG-GUID: bhM5IWuDf0H4IJrpQHG9VMAgCGC8F4gW
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6926af75 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UjhpILRFXc9wA8WrZFMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260061

On Wed, Nov 26, 2025 at 09:45:51AM +0530, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
