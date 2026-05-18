Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19C83F9F26
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105881; cv=none; b=htHPabUIIPmIBqp1wm+O0pkhcMqBS4GR8ukmZAzOvs2fwUvPrSmvUIeE7uUmYIQx1JqopOMo9U4Y5HUf8fiMkbj4Jf7vLY+offYNvwRY6EcEX3w8LTFZUs64jbHItYPWU2c2SPkM4Ns5wP8PybXuYQoa/IiSxz6pZ3wsOBBu1Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105881; c=relaxed/simple;
	bh=4OQcLQXCWrBfLkb+LzcpyGtTv6JtzYhLoEkqGB/nYnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mf4DHFfR4lT+sZQI7TBZiQqrkZgYZk16zZKRCmtXLqNAtMjtCwsvwZMqsbc07A3myiHR/kQGBR3SXSbbhgkqMkmT5RF7QGVa9g0rUl/y8HQKsZuwI9XtArffNH8y3U0EcR0QMB3A/i1KcAxnqCuiKAFr/vmc+S79riUoSOVeTwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WrZoMgek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7zrgimi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WrZoMgek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X7zrgimi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAoruu2083092
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 12:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RHtxg/E3v9Gqvx9cN4dY7ENu
	Y5kw8ynAHB6Lqh/VAds=; b=WrZoMgek3WUBGedZBnuVRgNfIpfxNJTS5eBAXZZF
	5AvlJiuhQMZbkD96jgH1vyWhEjZry60/TEa1iuFC6v6RW7CjNU1WGG5UlDm4+Cl7
	jkuHnxHxFq2KaIk3u0LPs2adZNxUYdfHOMtT7ZcKW/1ibiAD5ZLwawlE4b2dQlB7
	8Rczr612xDH++KHHWau7GUT2vpPmdgTmGCrkVBLzcQtVbnSEYNvC04Y9chzEWF9D
	KJTtWAXotFArmNc3wkyfFc+WoG/J99HDFqwtU5bY9RUUWYfh8ZgprjWWe0R4PQXF
	F/EboIeYo3d6z34erwmXTtQ3CpKrLSRmwN9FVzlwbBgEzg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81ch89rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 12:04:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575242b4308so5767989e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779105878; x=1779710678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHtxg/E3v9Gqvx9cN4dY7ENuY5kw8ynAHB6Lqh/VAds=;
        b=X7zrgimiEePgbRfelGCTUC+psuV8lS+OtG5Ofc5+rRWQwITX2V0ZJE5jvJV43KOyE3
         siMQf4UJZ6DIzRsKiZK5yTaSMxiYTPB2T/tfXYaZ56Fg+mBU//GBoe5MDJ2dQzWRGrF/
         4q88AxprEKAicmC/K8AQwQLX8oGoxSPJAklozMJj9OMjYbHxULCip+FZJSEYgpDYUZ7i
         gO4sKw1LcP0SxUWBmn3Dv06YmWw/bprejWZPO+QQUoFNat0rUjwZkf4RYn0b3wxyBQYr
         ZL7xG4eMerEyqIUuo50csXAv7PdWfOE7NiJXdpkKclI1cL36Wty88hCrHHGA2SlyVP2d
         t1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779105878; x=1779710678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHtxg/E3v9Gqvx9cN4dY7ENuY5kw8ynAHB6Lqh/VAds=;
        b=fW3tlm6toWhRgiSV7ItUxnJvi8a2ZSvS7G9ouvPv9V01eBCuGI08MkBgFKNPcGCMdA
         gPMdTjdTcvO+QspsPZ5F6jcYiGBDJqYpG19+L5Uck8wCfcfLCjGBzwGPqGZasc8JKp5d
         keOLZvo/xtvcF/Jt5NZFNSzTw2i4EZm1nxWu9T87F+nFuLA0SOV7L8YaufBONub0CCZ1
         OU7v32evTyW/t7HM0V4RDTIaA4EZuaVw181lSpeugJjc79l33bzdoKtT8t3F1mbnEgCK
         8/gMcvQ4vvOtdjWSfsEIABMh2t0/WAPG2zTBY4IRb1KCz6KObyYoS/r+K2mG0n9aH0Ho
         nQ3A==
X-Forwarded-Encrypted: i=1; AFNElJ9Wlx5dPSPwS/PUy/JUHLpwsExRjfJuS+fCxhspZ04DKkarLDQ/TiLCjyPjG++4fIyQrvyXeNOOBwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpsT/MHTBlLFXHc9sWFr+6Bd7JwaLJs0Ci+1Ckuu61/UM+UFFh
	qWoXmYYXjbgGcaZsj9SZD+j0tQuAGhBdV6UhpT9Rt08UGw8P1HRv4tTbD9pd3u8w8rrHpNP0VJH
	EH1v7Jc1KlK2MS769MNdQINKpgT7Pm9ny66xgXNA1sE77lygqhKP5s3+r/FofRgf24Md+jSE=
X-Gm-Gg: Acq92OGEL7tpQ+80fGKnbX+wxXeFAOE6bJmAdXbXIpStFM6pjTYLzKLsk+INlt0i1U2
	CTqgmFjL3Q7hZl97dODLD+MzJXp0084t9+wNO0sCY28u+gGEpbDy0sSVswN0mo4uXg20dFOBcew
	bpL7OCyF4FkAHGzXt2lc7VhcTgMiNt3tDyNhurKh+TPGyOCX4m7khq9EggBmBvzhN+FRekfoqOP
	mfJnq+Bdjg6iVuzOxjH9TyrVfauZXN76jQVyMPqz1iA+4vo54sexVJ+dbEGn98wumGbabStjX+U
	UuOeS6EA/VDNtl8Qy6Ny9fM5+vokvqupmuxfJnNz6+mQbgU0CWxYjqkgDXwU1OmCGobSp1xMMLR
	EPtxRFnBLdiaVg+i6t6OS5ePyDYyfFBJk1dL4l8UOcDq4++iKebSGy8GtKwuJuzovVFbtPFXvmJ
	Ma/U0c1WFmFY31kHe2utEDJle6qrODjt7YC8g=
X-Received: by 2002:a05:6122:3287:b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-5760be34515mr8478656e0c.2.1779105878218;
        Mon, 18 May 2026 05:04:38 -0700 (PDT)
X-Received: by 2002:a05:6122:3287:b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-5760be34515mr8478609e0c.2.1779105877801;
        Mon, 18 May 2026 05:04:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a755sm3264575e87.34.2026.05.18.05.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:04:36 -0700 (PDT)
Date: Mon, 18 May 2026 15:04:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency
 for everybody
Message-ID: <x7v2wra6pbtxpt6t4dty4fpo5of7clt7ul2ptw6c2rpeojwbvz@xselcvmgyrsu>
References: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
 <cbf66c6f-9418-41bc-9d0b-f1af0fe89485@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbf66c6f-9418-41bc-9d0b-f1af0fe89485@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a4MAM0SF c=1 sm=1 tr=0 ts=6a0b0056 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Emq6NeHw9dlhMvRVmBsA:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExNyBTYWx0ZWRfX2b7hGvi5kF/x
 esff9U2YRwB02WPTujN4/16m8EHqv0ALZQV95omgApQxFlXaLr8JfKrSij9DsK+/6LrnK+nyVwz
 akZ24kPYfsieCyHsJ/ej3ngkPZOPYSYPdicTcCsI68cZdxrKcW93in0uDm5fYRtvhBApMWX4Ff8
 MtE2i76QLXB1Olr98Vt/oEtpAtgg7iD3jlSzuVMpk7wiJ9Gnw5tTxprmSLC36AZbWezKjV656oA
 4dPywPSA8Vq7SaBvxe0IQBmvkCwBMtfEGo0nfVpeyi4MqzRzx30Zpron4Aqy8VbA3SDnGbOEalG
 Tv1BmnK7kDawvFNjA2Z5uMDNGlu/N9u8e/Ozkgm1topKLEwK2DYsW+/wV0Z3SW8prGZX/yDI8QR
 VGLMpKJpeD7Ixrp3fQMO03v7aIyvKoyZ5VJk1/71OgAmXqXiNP36gaJD+cYDyM5V+xOe0ZHnRyU
 suvvhkcGtq0w4EuLFpw==
X-Proofpoint-ORIG-GUID: RUZwLuNBoJZip-QNFZJHSabfqSgCrz8j
X-Proofpoint-GUID: RUZwLuNBoJZip-QNFZJHSabfqSgCrz8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180117

On Mon, May 18, 2026 at 11:22:06AM +0200, Konrad Dybcio wrote:
> On 5/17/26 8:51 PM, Dmitry Baryshkov wrote:
> > Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
> > clocks into the interconnect providers. Stop inferring this dependency
> > on everybody and set it only when required. As a safety measure, make
> > sure that the coresponding clock description fields are not available if
> > corresponding Kconfig option isn't enabled.
> 
> I think this should be a 'depends on' instead, if you like having
> PCIe/USB

I'm not sure I follow. The INTERCONNECT_CLK will be selected for the
platforms which use it to control NoCs.

-- 
With best wishes
Dmitry
