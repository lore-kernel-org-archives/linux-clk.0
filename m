Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201536;
	b=tqoQVVD1CZe1p7tEXznF55jX9gxV4jiKq+Dre0dBA03h8P7/W57Sp8+rcBAEPontjtk+
	 nmb9DSntak7VWR4L4ys+/Rm0acbDQmMuFHTJZDtCfNW81gT7FiQRhgs3rcq5pZ3UyQ2sn
	 SmIpj5PYS3hmH/mGqV4/dzOwMt5NNYrJbFR1KX/MopcA34Ywo7P83waRVuorGMIq9V7LX
	 6Z/oKMiUSeZqU9WuiNoh0ZduajmoAx7dTpEuw1Qqx5eN39z6S/WEIzeLnvCuecMkif3wn
	 1/m/9YXoTpbA0U9WEIR6zendQyoMCae+ZpVmV2scocK8jNvBu/+uk0zJXybS3wgNFsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5dw6X5L/ty0+ycNiG4u9zRpL/2FUMzoeQTvBpaFK47Y=;
	b=d/NYWr6SQVhdYVnRPgRvf69fz+cvl83ZFV64bl7Q0keULscu+v9ZiQ+KdDAKVyim1+QZ
	 fo38aVF7uva3vXD4fD81hK7O1/Y86UqfnqUCVfFpAK2ltmx+wtnHmEvSdqMO9qdrEKegG
	 i4LJIp8ZIlFvG264JQQNt6RPIu7C+q/WAAcX7onvc2E/blxhz/X3f7mdGN8nf7aEx8qeH
	 CeWi4PyVgl4bDcH0RNkq9Wy9SOMmGnXkZRfakZj07lRtZtPQRKxiJttvtWVujdjDDdTOX
	 MbnaSBltWlOWtnRv8gQNQwqQOHa/vu3AS0Di71T2QtV/dpX0QrJ9JprCMdaY7d0jUsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxxoOkAg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DISU0S2i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408C0606A330
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408C0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxxoOkAg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DISU0S2i
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAjT01517021
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5dw6X5L/ty0+ycNiG4u9zRpL
	/2FUMzoeQTvBpaFK47Y=; b=gxxoOkAgvYgEftnhw2pgzvkiYD4Uhg8U61y/qrLr
	1AbXFIelKKeuJojqLKw4GNM9ICYpSA0qVmD0e4B0TCsuPbChkGZViTj9rKMymemO
	68ShMAPHSz1A7RmQRJEY4FCqoRkKJ8VDXe92XchE6SICW3Y+zWsaICr3TyU+UfKA
	v7BeJcZUdSs/U7jdV7UYeCxNnsBXQnmUJk8/LoKhdgWaMhxoh5naxUVTkwcdhcdS
	vqqbCZgrjNBjdFxzdV6js4DW06AzENY0zovkLQIadT6YBxpyiMwfU8YY+5aJ+mi5
	fFwJLzyzD6ANoSe0IhQzl4XoxL1uwFlpk0VjYe+bCMdPwQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhwa52k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:32:14 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf586522d4so672599137.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201533; x=1793806333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dw6X5L/ty0+ycNiG4u9zRpL/2FUMzoeQTvBpaFK47Y=;
        b=DISU0S2iUL5DucVtYKgbi/ak+21KT7Oi49eBKx5WpStF5j/n0h9Msiw3WdAC0rconx
         GRIYPpPun+EuP/rSJ43VWs3yeeAIGJvxsPeZ7tdyEZfhq616JemZMAlTvK10Dn3CXYD0
         sMbkV8Ek2IKXR2+qyqnpSLNiYDUkNUp4ZqF7bwefm/5YSAjn7U+jnI+1TbyfUxTRLFJ0
         Y8zl4uZNmIoxNx2/2/kE3HqJr6PzKJ1hsMhwkOeV6sxvEN8Pz/jDsxFS384g5yiu7FsW
         DTRN7sT6TvXuCh35oFXzcSBtxDT3OytweyhjZ1g6aQCBOFHCedGtmY9ljLkhBsWdH1zd
         Pxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201533; x=1793806333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dw6X5L/ty0+ycNiG4u9zRpL/2FUMzoeQTvBpaFK47Y=;
        b=Lcud89i7j1bK6Z/VsFdHH0Nc2BPU4MpY+LW61cDyy+Z3i3NVl8KRD6NcNWHdMvXD/e
         pzFPnuwFonVgEpIFuNkNxEt7mzGNcZJTRdFRupfhjUUt6h5oV6exml4ibQT8HDTVpCNb
         aDfylc7hrS+wVYfaXY7bmc92krzIm5CSdaPL0uo0G+CE6OO2dD4mIzyok7pvlloAM78d
         sdL6TP0Z1FV7vrN5HHGJjWUqzJsOlhTLrS3jAZjERsPJd6QhomJ8FveUFSVmMLXGrkWh
         o+E91GxRcVGeDoCu/qU4bxs5wkCsSSozaVmQXkYA5jI2wAKL3ON6RCRBex12JXwHtQR7
         ApuA==
X-Forwarded-Encrypted: i=1; AKwUvBylO+WDwiTPu8TyyR9tve0dIeqxctEZVcECCYQcLnlNhWGwxQ4qvf8oyekgPH4rynnAMjSFpNugxx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYINE+yIJpdqcUbCkaXG1hRsLOkHXOCFZ80bR6agsRbV3jjjwYfW
	GrbWV88W+bMGsQroee/+YK36cCYmbfKDUyDS0aHS/N9BQbzl7sLG6aj8NIKsnbvUwnaml9+L/lE
	W0wgz3I/APmqidA5habVxZVPR6VEhRkLohnPSlUnCnhQKX9xx1Xzn37Pl+Pn1tAc=
X-Gm-Gg: AYBFou2wIOiDWkW60O/U/56uJ9X2JSf5WmIy9H9eASV4t0UYI9E5Nr/wFwIYsjhNUpS
	mZuchc26iF6ULbONbvbzhIjt3pecYoQF4oyW/UFWud+8NkNMisEovDcZe3fYvCGEnKiaBPLl5ZV
	HvEiPdcEO0VS/5Nxl2JXpOjPGAh+dMwyAQSU4OyyTDBt+RvaxrADSGH8nfoeOEpBK6LjHxptIKY
	/W0/GCRaX/SQ00nymiE2LGBs8hE5TJZ75IO3QCYsnUylyUUUKu+cB2VI2wC5Zr3EbuVR0Xw6QDz
	n881/XBqTxRrmM78MlO1shqpA4f08zGPN+Mab2oOT5IpKDy9WEPgaNrhFwBK3oaFr3iH/tGtotN
	fGcNh5m3+vpCbwj1HjQM3hI6x3p1+3LqS0NcW/xlAPGnwvXHAqO5gxmQ3LOuvQqeVQA==
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d03a47e768mr1432374137.18.1793201533189;
        Wed, 28 Oct 2026 08:32:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5244:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d03a47e768mr1432303137.18.1793201532446;
        Wed, 28 Oct 2026 08:32:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm195145e9.7.2026.10.28.08.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:32:09 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:32:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
Message-ID: <bl3vrhszm2aicw4bfr3v6mewh7dghwpiverpylif6njbqwnjd3@hxqtrtt7cjyh>
References: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
X-Proofpoint-GUID: eY8PwVqFhc8eDhuhZ6liG_GxAA2AokSW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX5q90yxnt+vg/
 lUHw0i4tR1UAGaDXQBLQQQmojNJDTxbtBoDxLuI/2On45K2cGAV74NSot9/fyS+jM5kR0n3XDuV
 fG4vHQmB1EfINdEldjtiV2RPc5kXjA4=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae2157e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t_aS6gOLZcFuiPoz8KgA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: eY8PwVqFhc8eDhuhZ6liG_GxAA2AokSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX5j+gae0Oe5qk
 euUfXYWsiduWGDKZhLG/+B6FYFiRjeQPPufG5M/jy1LwVDZLffoP3ouXhy2NuMp/dCLn09nEWm3
 /5tUiJZHhO71EXeHqHj0AhVzhMSFyeWe9GM/gaTKafRS09hWS+6saFSOiIcdENBCAJtKYZ7FsB1
 8QHo8yyXrMHwdAIncflETaVMXPaWr1FlYE555fPbmc1SYsFdXehvt22LAPobzio6J0kVqINjeY4
 f8nqzPq7AHFfCyeTnfOvLMTGKRkdPfmtWEK09O5QSqYfVtV+Eo9+GlQBDXPvzYLCCqjrQZtbUYV
 Fg6EY7TZSrO1C0sfFu95lM0OW0qdVLtz1JEZ8yfaEbW9ObkEg1721ZfAhJcx1tHJTWAMNatHw9P
 OsCD7v71yh24SO5dVrPa2HG54LqeOvDY+nyeBwFE5XaW+fUkPO7kNxwgk8eZxK+Sp3UA/AiNOXG
 Sv3yKRvZjnDl6h3TAUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 15:05:32, Taniya Das wrote:
> The PCIe GDSCs can be shared with other masters and should use the APCS
> collapse-vote register when updating the power state.
> 
> This is also needed to disable power domains that boot firmware enabled
> through the vote register.
> 
> Describe the collapse-vote register and mask for every PCIe and PCIe PHY
> GDSC.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
