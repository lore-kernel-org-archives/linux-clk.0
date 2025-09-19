Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0003191A8
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301268; cv=none; b=AyHsomAbsy//SoIdE60J43cQTB639k1kNIQ+xu5MQNSSbRpxkdRietBt5fysXs0JAWQ5JgF3yqzfflgb5LhHoEirpZXlox77NwZiM7gXAt8ukJHzNiXlXq7y6JGFW1S2Q0oJ5IJM/40opTy/rlrwr37X50q1gDNj/2unDTOXkMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301268; c=relaxed/simple;
	bh=Y7DKAZiT2YZkSJp2XiHhkr0pQT76qG9tSnaVyBpEkpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdRjIPUH/7/GbC0D4Lo3RQ14FshX3cjWvL1ybb2Rd7S7/BOwKLjzTyogOydJ+hEN7yfNMr9XmNA6q0BwGPTX0zok4OjuWP7Y4KvMoOD/4mpGYxxsGTsVv3PwCui9QF05PDn8abnbp7SDMs69vF5p0k9COuzWjS600Vr9Dtx8YDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkwbJwgr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkwbJwgr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JA4Oat007100
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfDFATVzLHxL3rjSBMcDlDZ8
	Gmp6IwIJVpR9vdm9I3I=; b=LkwbJwgr9Nasieem7nMvMqGZuqoKPJzLMKGtKtZi
	xoLeuGbUNfp9NSB6BFl63dMtv6IDP9XNObPSL7h2aqn25iKIsWammaMm6LkfCl3L
	mtenuHbSwyGmsvtkYAGIbjn5a70ogViaR7aGlTtTM9W1CXFce+n3Sj57X99FG3Y1
	A+S6AQCHpYkSxZIksL0VwX1LusPR+9ysUt2Xvbhw6z0p0UWVgpOiT7+3zHLshKDF
	+KlLiuOfEeVGX0dnfk5T/Me5FyWHnbVne25Y5SSjQfeAth6goPKf8lAxM0zpKL97
	uXy1G63RiY8WOwr3v8WaOR+Swn7kqBhGZhkOj09WCFV+6Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebewnsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 17:01:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b548745115so49275101cf.0
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 10:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758301264; x=1758906064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfDFATVzLHxL3rjSBMcDlDZ8Gmp6IwIJVpR9vdm9I3I=;
        b=XMcCKHDesnNummwbWhjT3W1dFU5W+ufBwOkuJHnJaZtOHm3FZ4/tlNOtin7n+D097S
         jpt4wFqtled8N3S+baJGqn4j0PKgCWkMmFN1rNVrUEZ7Tl0UChcZ1cLp4J11vGSRfmnk
         YAsGtuyOdSWlOhJDF0/M/N6tpVpX8hjHJ3irgmwfup7EIPLC8W9SVk9iIcOCnVzwY16g
         LP7BduRbn3eAvb5mdonQPZZE2B3QCvmcFfyGVzZHh/lnVz1N7GDlWlVTDotUrUW8P/Xh
         Z/6JS0cpIon3vB9dme+JEs88PSucNwU27DPn9YwkNCa3iDEHa/9L2PrECzNoAvll3OTi
         m1lg==
X-Forwarded-Encrypted: i=1; AJvYcCXxtmZCEYDlafYcq73Gji7gBlWcPfW1DBzTIJue5pIsc/RSc1zrVQ5MyPuMC8pjMQVQhk23f6+ui7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3KsCMZ/ZvjSVadE06vqT2Gv60ehpWNY8pYRNXWG0Kc/GhTlYx
	3EdoQCacmNEuqPW2+oAK5PYUQbEAgu+GSmrMj0hIahm3+QsVgpKsYGfBxSJlRv2yGiVRq+Zm1P8
	bkCVwT5aBqCHqFXMuyAhW+jcFM1D7ZbK0DwtlW2J+Mg1kQ8UmtIL9WBgu0r4WYjs=
X-Gm-Gg: ASbGncub3v+ia8t9cTswbAAC3xuO1z36BnLoIRMIW2k4Ed77//pc5uWrHA51SO9ehM6
	CbB286rZRZ/1DmUSDbdvtVNffQI1ArIhFPI/41pZsbuCkwEJ/YViPEeOcxnIuu/PB1uuO1tAJtn
	ytoZtkbZdSQlj0raUU0VZLwfc6zLBcAs/uiWzcdvVVhVmVsMqBqp59bDOKc+d3uWJ6MpbYpNSUp
	BPUHMbsJpPpFFkDlhkjokyaGOGXMu8NTb5NpQtuzHepliCyZpC1XRyLOGupBh6zRTmvrgph4wH+
	Jt0FX+2OTue1kFuAwXCbpSk/yNuzVr1fVM+I1qzog3eviVLc/qbA5VZaf1MJsrjY/OcB/TentYk
	CRFOGtuNZMJTZl/NVhD/EURWF4SDZTdJ0Ka8xXAvbPOdMcRdR9stv
X-Received: by 2002:a05:622a:1994:b0:4b7:9b0d:11ac with SMTP id d75a77b69052e-4bda971d81amr84082241cf.8.1758301264041;
        Fri, 19 Sep 2025 10:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGvIhD0JxWZnIagFrRbczAgFfT70uY1KVYP/SGm+8WArapSfq67kdLR7qEtf5eIC6XHqkQLg==
X-Received: by 2002:a05:622a:1994:b0:4b7:9b0d:11ac with SMTP id d75a77b69052e-4bda971d81amr84080841cf.8.1758301263027;
        Fri, 19 Sep 2025 10:01:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44a3dsm1523174e87.29.2025.09.19.10.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 10:01:02 -0700 (PDT)
Date: Fri, 19 Sep 2025 20:01:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Reidel <adrian@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        David Wronek <david@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/3] clk: qcom: dispcc-sm7150: Fix
 dispcc_mdss_pclk0_clk_src
Message-ID: <z6v7vi5kiudvfc7es5whzkfhn6c7ozhxw5u7onp66u7qd7utnx@cwit27ppu4c5>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
 <20250919-sm7150-dispcc-fixes-v1-3-308ad47c5fce@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-3-308ad47c5fce@mainlining.org>
X-Proofpoint-ORIG-GUID: xeCDfrTf23MZOoDFuMVhFxoCmj9Lhflx
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cd8c51 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=vcgiYtMqkSy1wNhQ1XQA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: xeCDfrTf23MZOoDFuMVhFxoCmj9Lhflx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX/2ZjJIKfUlvj
 oJCjNrqfOsL/6B/J338+tX4T5j6shDCKOqP/6xuZFsqcixTFgCBFlNY0A4v+zDPC4spX+F5CSC9
 EITRLL/vyRp1i6OUPAH2C6pYcKIgz+Jws3G8DIShztJ3aP2aINxCiY696OPJPKVQutUKXTkgFz1
 aj5MNDuCp4/AQ7s7ihRR5XNnA23v+RT5I9/6q5i7o8TBZzW/IB0tL41FhKu0OsUk/+aTRnnVt3z
 MOI5zvSUYGD2ri0Uls9iYWfreyz36tsXOPso3PfB6/+1Jm/qHbdYlQUkLtlgv8jomtGV9d4HvUI
 RngbqvGU9alipyDo1KHcAuk09X0gTfp1SHrmXGFdFf2UAtWlUrW+I9MKSlSDw145TAIZZzvfZ8O
 PUiaolkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

On Fri, Sep 19, 2025 at 02:34:32PM +0200, Jens Reidel wrote:
> Set CLK_OPS_PARENT_ENABLE to ensure the parent gets prepared and enabled
> when switching to it, fixing an "rcg didn't update its configuration"
> warning.
> 
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> ---
>  drivers/clk/qcom/dispcc-sm7150.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
