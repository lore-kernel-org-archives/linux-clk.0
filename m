Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140E33A4503
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836600; cv=none; b=VzPvuEYAySRpZgbF/3mSz1FP2/hbvUg80wyqG0Qol0g+wdHy005I3ndBbqFX17jk8bEnIDuppHXjXusa5ufhqqBRcG5HfuUAmeyKUrFUV6uoYrM+91YRy9QaVojXlJ9jwLO1LXFaOnG6v+xbTCMiN9d/rYXwH5idfmdWvGuG4/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836600; c=relaxed/simple;
	bh=mj5HSvzKwu773ANUeuPZBe6aniUvoWWSP6E0fNeBdI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAbNLcCWcDv9cPnBHbbypkqkqGo/4y+qlKqEisDLYzqnHDt88U6EtzmLGX8Pt3I6Zm8BmEgPieHvqpfmEIbsU196jvrDIcAXUhhN+QFG02dlrLPEJSWybb4U2OV/bhxPv7FqR9LSq0QY0gvlM3bUOt27sSar9xLZuWAtuPOtByo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NpGZgy5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxwQ0o1l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NpGZgy5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxwQ0o1l"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAcgFB4148029
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k8QL0W9coEdW5TOsLL/sYcM2
	Lbjzn2rZrwMC8N0oE6g=; b=NpGZgy5olwpR3ToGAH9tR7QTuDD5bHXgMB22rXlv
	wnUF9zNZKF8PGdE4KZqZ9B8CL4jv2Gd+ZD1cnmA1Lr9OEQbLkjEx+aiDL5mIGEQn
	NZU2M2+ZWMEp6W2kGDjWipi/8dyl+IOmeFhT/1HzWEPXpEIb+VVvwwqChsDhEHyq
	S7zKbJwlWKZNqc4yrskzF64q8Rx4oEdptPiMG4CTOmfpjW6IfWxYqH3BBjeKPlYM
	aXkAdCiS44S3uUPHQVShuE0LEyQuS+ptEhCmAUXuRPHTdski88En1e3hD/3kl0We
	d5xYIBtArflt47BavcA3614E/9x4qw1eZx2cp4NjgfM2CQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgj0as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:56:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc75e79b97so7589702eec.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 08:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836597; x=1776441397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k8QL0W9coEdW5TOsLL/sYcM2Lbjzn2rZrwMC8N0oE6g=;
        b=hxwQ0o1l5hIJ6dJCPG39DnwAOQpnFzDhuDIs2HO0WEw4G3x6YldajUVbXuoXgFAqPJ
         SKpz/NWbTBHBNaqUc0pzoNd8Fy3CMZ6XXoyglaoWOi84nqMqr/fs38pzP3k4Bg3wM+W7
         jIYFvMvNx64TwmP7PRy/QNooRmHWoUitXyArRI/udrJ2eO2v1eSKLWL+YaQvASs0EGjM
         g+xst/us7Pl83TzdFx3NrUFoOu+7KdwvoWC5Ld6Kh0kVqbATRdJ/aJGjrbk8UJek1wbe
         jb5+ZqGr5VdiUR7+q/1441xhFAx5NYkwmU3/mgwIyPsWeKvG30Y1+8J8OiQgCZNpBLJu
         XSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836597; x=1776441397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8QL0W9coEdW5TOsLL/sYcM2Lbjzn2rZrwMC8N0oE6g=;
        b=mAnTbVUkjX5yNEMBfIjrQTUeQMA8UJENjqzOrjFVlicjZjI5LqpBeUqO3gIOiah5dy
         D1r554S/sWjK/XVDO4RKuwYdvdqwRMgoiQyTedBls29X+MgD+DktpJ7X/1oUaL4f4VfL
         LU0PhG94u/B0DhYmK7B8FDQamGcg9qetpOaEGwFkx12nGHHI53r/hmvta3np5CLIbU5+
         aneXUdmGH6lX8cdEIvkVOoSEXOBng2zrFvYmCwdxx99NzYD/3giySsBhu/nUJqOLt68J
         xkrXAj6vitLPojUVSc90Krjy2h7/KQIcFYS3uowFDL/1dtYyRjjhjeTgws4WMc+CPo2P
         Mmcg==
X-Forwarded-Encrypted: i=1; AJvYcCUzwKqGKIQj1srvo/RrMPI00hS9ajy/Uf+N7UR8vrvBxEEd3HroJ/14h0JT267WOhE6K2JPaWZaNOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMnk2iheJ3jBuOJKenI4klOyyLChb2C0D1vtpmTZq0Bjog8vlP
	TBwd4p3hvfPP1Voil3ktrqV1v8RgusBH8UZ/ZDgHRevDP7ZNFVuJuuRr6IomClSI30h5+R3e94G
	aYphEO8HUyp/d22Slnj+JZ387Sc0kIbeDGgabXBeEVvrm/DK2nGAM8FeQCvdQIlU=
X-Gm-Gg: AeBDieuMenZ7Aijfxx7ibowfCoW3Ghze4y4ikjmkV+rddGXZjiUq73kVyHew0WIP5v7
	rtuJDyqs6xRfOKhFoXdvygg/0vYweQEx4wy+FWBCJUmAJIBiCcUUIPUSECBX5aemufLwgs4p7BK
	3fzQUQb7d8JR0Js91h9gh9CSch5S3hDv10YBNTARgV0HgQlpgdGpi97rsw7AOG+VVnKZeoGKrr1
	JGiT5buAY/mgm7zIsh4a5OXcXCW1NvdxqJ46fIWCbcqqFzUldVy8WSyYEobqdgQkj1a1mbS2aIv
	Zpg8ZX+uRVAKfsrdMCUmahdV/HpF/xuPwFxwMs/3qZEYpstFBfYc42DMKTOtO1MuUPR0M+oq6o1
	Q8QDodO3E+WfnVfDyjb5GI/R+L6klXz4gWbdFsk13rNQTnoPWzdqVfEr9Oqmiz6OR0e+6rHM0OI
	c=
X-Received: by 2002:a05:7300:a194:b0:2d1:491f:41ee with SMTP id 5a478bee46e88-2d5877a7fafmr2198850eec.9.1775836596805;
        Fri, 10 Apr 2026 08:56:36 -0700 (PDT)
X-Received: by 2002:a05:7300:a194:b0:2d1:491f:41ee with SMTP id 5a478bee46e88-2d5877a7fafmr2198825eec.9.1775836596203;
        Fri, 10 Apr 2026 08:56:36 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde68bsm4817855eec.17.2026.04.10.08.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:56:35 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:56:34 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Message-ID: <adkdso29+7ecTsL+@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-4-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-4-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DvTrkqSHLocHPSVNJznC2K-lO96G1gKA
X-Proofpoint-GUID: DvTrkqSHLocHPSVNJznC2K-lO96G1gKA
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d91db5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JDKdR2D3zIFFAMo1GYoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX3fhhxyqQVSdv
 OYUfYAD6UlKfXHzkTr6oF9wEiZAgExuJPMbDG+c7LxHX2R6zBHRiHxHKivkeu0lJLrZfoiKNvs/
 KQ2nSxwmf6CYGRaQp09BDVXm1E/5fltTe+PMvllIFkNSIL5XlqIe8qv9KhYNI/Q+l+w8SGIxHRa
 qfCI/Iz9u3h6LOajFjj97ew+qdpRQVeMAedFI+hfNyGOsRuCAvJWYlkI59TVtYKsRHheiiEwgcJ
 8U/EVIAhEy1uYPVlHQDPAbCHop8HzidU6FUpgLHWhN+cS/kbFgX/9Mpql+fI2lgNv+cRJjbrd7j
 oTidUHL2XQXY9sQC7rJEwHqITO9xcMPoFZQPeghwM4YaW2HpaJkLF8n6oE1trUu2KaqzU8QMj5Z
 9QCEwzlKymKEpBL6U9dAvzO/7ST4t9OJ2TAUQKNVNvj4I14HVKIncWRojzVdb28B8om7hSR9uzO
 GBwOpGAbrcyAACRQ5Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:38PM -0700, Vivek Aknurwar wrote:
> Add RPMH clocks present in Qualcomm Hawi SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
