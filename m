Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A4471242
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937252; cv=none; b=ILUHy4rTU1c7i1p292A1nICEv4gbtydfYojul7QvOVanFA2yVAtkbAVjB5WVPyO4NwZUl4kQIJ4S9UGdTT3S+K/oNXzt2ISsrNAq3C6j5awDEEdBvtO7Jyp5oU1pU3xam4DcBpKSskAX48ok6j57kXHGGRy8DSmgj/MzDxksRdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937252; c=relaxed/simple;
	bh=mZV44nn4ngFZNqTon3O3La6WgZZYCSFlv9FE1f9Sne4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XY20doACbtyeTLOS4Ez0VRa2PmSuH0eNFTT0AppRFntyDV5QVL4pjXJqJAzIg81EDFPB/lBBQDf9sVB6bnAYc8As32wxPF9bx0wgQjRNSI6XN7YVlKxUyCnKIQNcykELGJGV5wn2C+e+kueDFL4iraZG7vxh6Qdkc8ac2PY57hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb5Z+i3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/YVnToX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb5Z+i3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/YVnToX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvMlJ2581893
	for <linux-clk@vger.kernel.org>; Wed, 5 Aug 2026 13:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eRaaf8WWSnJ1pmJ6tVvHl8GB
	o2gEGBic1A3WOSTflrU=; b=bb5Z+i3W9LxD2gtcbI0Xp4V1WRwGvLQOj89+DDjx
	tqDxJDFv1usDy1PKaDcWxK0NTW9rrZhZ9MGk7gfYxvDsaTp5YGcfq/dJy44AYBGG
	MurxaBPmLsSZCB/AjmSYQBRX5AG0Ig2vA0nvFSzfoLv+HG0VNQXIbg56azfimcDG
	OXaTt0s2jPTifWrzYakSIu+NxlOgD4huL3ZpeOqCJ7Nk5YUz2QV61Q4BOGU/VjMe
	oR2wrf/BbzK9iEkxec2BoFPwRU/pQ9TNwAAIom+do36OmtOhkKQmP1mp0KL/IqHj
	fDZU6/Lcxd9t8Q3n0cgwoy2mWfA/hSi9O9LbwNx9pl0JmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv1qg98p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 13:40:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07f25de2so8089661cf.3
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937250; x=1786542050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRaaf8WWSnJ1pmJ6tVvHl8GBo2gEGBic1A3WOSTflrU=;
        b=J/YVnToXofAepNJdhQEpq8NNsPq8NPARsYSyZ7zTV20IJ3Bwr/Uhxh8jJOCq2h0FLP
         +OcFkbnlIlB1GbdNuw1p4K4YOAdhICqZ3kY2DRMkRx8eVIbOpsjqYua4vmbzJCWKx5et
         u2VNa8VYumSgWu2I9JuLCEy4wvfP/qI8ZcCi1giLG5diYMzXAiz00SQt4VygBVpIQGGd
         E+HbmfNvLYGl0v7z+mlUqqlGIeINxTRRYeVepqNtd0/lZfRaMnZlntUsw+2rmZz7p4Jt
         dE2687o3q0SILK2D9dWD3yBEloAxvLgiooeXlK86C4SFeg2Yhgsl8qMkkL6ZSYVEwgZq
         Y2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937250; x=1786542050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRaaf8WWSnJ1pmJ6tVvHl8GBo2gEGBic1A3WOSTflrU=;
        b=qPuKdFYyS3Y9dE9Q+tYUDefnSYxByQ0biS14F9kPyeq6qnoEerSZAOm09lg05hQ0Lx
         IP7RTs5D2KA1B3hDOLpilR1jAoRrRZ8XfrBj/UFsXhBSRM7ZJ2xj45bDUMRZV9arscj3
         9BE2ihS/qMZEuYz5wSSxiJ1QPqpUzMJCwzd5s7O7eYL93R7+Jbwujptv+c8GiT+LlG/u
         S/NXOXfpSMnOeC1UpWX/qeJw0hAcxEtMa408AYbPdCj2bP4vgUnpuDKnjFnSfltG3ROT
         1elIBpOq79pUEa33dFp001H2AfSrv8i6iTnVNCtwJznNgo3TGozzEmZ36uwJqNKv2vOj
         zD+A==
X-Forwarded-Encrypted: i=1; AHgh+RrJ9Wt69qSMZ54/00AY5LkCZIJ4tkf3CsnqUw0J5/xpxv+w8zSn51DQo/t512YK6UhginLaXxuoykE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24tbEYGo4kzFRebHboFIKPSy60o/ozXyunAYkjeh61K7Pwt01
	AHeAHYdY+zpB0Ae0/LvIEAs9a3uigqh1D8zdV4Pbe1bnzYH+6rwhh39DHSWhIOSGgEWrqM5hfWe
	eyxhCatqKuq/EmqGJ4SatKZwIBGpGQU3FgHzhVB5kWx41nsi8pSW0zOmqO3C4evM=
X-Gm-Gg: AR+sD13Ilf/x4H8cgbWvZQVZNxCEHwnDB81c+MOzz15SH/wX9RtJRprw5YNJ+9bHTfs
	x+rtOTl2dNQ2sIOwhnpU+vLUI+Ib+Gwp8TAGwnuaZfPi39OP7h6bGEx/zYlDQoG2Hkap9aI5i3S
	C+kJw51iGl2Tj2t7LwAi29IT6UqV+QbF1nt97ZBAchXgenQ/ZuAIalo+Sc2Zk72MsO2Kkeyl0Nd
	9ECxRO01QmXl/eLBKVLEzmrcPXoHsvlwqZaIOJUnO4gzCU1C8ixydxBZrCJ/+RnUEMU5k+GUxSq
	SY0dMpgDKGFHgZviUrPs8KifAZrH+CqBNbTF2+C4A04t8CypKd+/tjn5yznlfEGMjB4m/qslX7x
	NbQhqFCKnqkhkMg==
X-Received: by 2002:a05:622a:4c6:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-52ce5ff0c31mr60112301cf.15.1785937249682;
        Wed, 05 Aug 2026 06:40:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4c6:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-52ce5ff0c31mr60111231cf.15.1785937248955;
        Wed, 05 Aug 2026 06:40:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e04db3asm105570255e9.15.2026.08.05.06.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:40:48 -0700 (PDT)
Date: Wed, 5 Aug 2026 16:40:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 08/10] clk: qcom: gpucc: Add GPU Clock Controller
 driver for Eliza
Message-ID: <2dtrfcquy2z5ukybd5xgo4e5cojyvnvzxvfdeuitpatkgjc5s5@xxpc537ho5hp>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-8-39067760dc3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-8-39067760dc3c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I+hVgtgg c=1 sm=1 tr=0 ts=6a733d62 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=whjPl3NbLinN2m9j5McA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Ori4K7VH0xrX75UTLULIuT-Emdh5QQCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMCBTYWx0ZWRfX9dMqqbl6dy9g
 p/GfjEcGADjRhZ3uoil+FxPCnK6khyM9AqdsKiZ2H7f6k4YhT5SLYC7XsKm8/U/sXV2m5L5pD+c
 bOvjs7DkXtdBNrsxmBgkCqn+3rV10VlzO/iWvXNTnPH8t0x5JJwqftPO+zkWa/80ZHsOlsOFj8K
 qECodBujwO5sXqkMAhXumVDoEkouY1oDcwpCHkVXMBkXr7b2Bgdh0L0tsiqUPUIfhVl2UbgbKRN
 jzhIYchFR9LtnshcOyU9FNzM7vk0DGwweY6liNyay5Kk/LNcWY9jeOp6QFruvgZt8zG9SaZ4bL+
 0vjPbPeHOKbt6p9/3A5ZYDUekenjFQ+hI+GH3xq66bZiVAvSgfp0uyg43rBwWUT4KKabqtZIa+j
 24Ze1MhUk/YRsxmmYqhPgL8GTmqpRC+mtmqXeyKisG/MnJ38kKDgYcsO+zjgK3fZRKxfnw9Lvzr
 RGYsK3zwBdiGbb3zC7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMCBTYWx0ZWRfX4E9pF3ETwfws
 FQjxnacuhjKcrwpJb1pDlOdy5JNp10MCE/JqAcRvcH+knoc3VaSP/JFeyx5Fl1AWDCRhxXAYNL2
 gSQqOGE+Kz4s2uihoK9EuLJIjFFgZ+c=
X-Proofpoint-GUID: Ori4K7VH0xrX75UTLULIuT-Emdh5QQCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050110

On 26-08-04 23:20:21, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
