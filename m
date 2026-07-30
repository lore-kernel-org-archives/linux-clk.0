Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51800376483
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 02:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379029; cv=none; b=AqW4nqVbXYUQcX9F0Cb1o+dq+kVUJl/NzhGUC0w4jdIZ5kSOy73kxsS3zAN5bE/hrpN+2FZOcnVI9WVV7o3tPfmih1a95R6fcxBsHzDQUp3VPUk9CXIl+flraTP2q0jt11pbrJXrZMmpKhwWBHJl7y+Mn3PV0YMgwRfDvybOdwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379029; c=relaxed/simple;
	bh=1wvYYim4BFjr9PE91ImljAZEZZAWRf8BD/w6yIwirCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNu7kz3n7A8cnPk8DyUGN22ugFxa/cfD7lOFnnBN00WVF4FnSySuTfAZKYq+V7ELD4SW7aNxJ7Kyfg2LBoLhv4bnHYKTo9A/2ll2BoFuFfEm7GbiSeXfyniyPBRA06T+sUh6dgJvJ2np2okcFngNxRn3ZnoMh4++0yG8S3Clhks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmpKOp9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzWMZHt3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmpKOp9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzWMZHt3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U2ZtI53613438
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 02:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v3NHmMxjLFkSdOoYQTyAkfV3
	Ov5wVWEEbb1JjezyfMM=; b=NmpKOp9mxQux4zBlAMSQjrzbzgfeeYgzrR4lc9so
	/hn0yPbSiVYlaJe5Ftd10rijWMi70anCMjD1Z1tt1fJbF9k2oB3J35rh+Obxw/Kc
	ncY+vgsTfM91q46PbMbOXrUxPUvQx0j+YuVMMOq01xHNhFCYotsM2elH0Xw53HNW
	/zuqMdy24omk/+APlOoYDabJpSruyM7RD6JvAaMPMrrkmlIYXCDtWt69Ua3IZPFe
	SbGiaMwdm2V+u1NRtkI+rPSldO5Iswh+LBejTEsxiqiLXHlJs9PIA/hMouWF9uPK
	ZrD9SZWbNcV03V3mKaXxUCS6iKnqcEsUuOk2imS7j2cB9A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqwygr05k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 02:37:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so2276252a12.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 19:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785379024; x=1785983824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v3NHmMxjLFkSdOoYQTyAkfV3Ov5wVWEEbb1JjezyfMM=;
        b=IzWMZHt3Hi2AllYcsz5NYzMM/OqVNdwC83WI9xKs+QvQwdzP7e9ZpDRPAD8VtOrk2Q
         MNXeH77leTP/1FRytO3qag1azFFStw+VQ5ST8jIbR0GUmUzdj+6Hcp0e1YruhVCzBsOa
         QIWASJAiBYn3wp6/j25dq5ehlq9l4t92f/oxkOlaVKngRCcDonuuKd/tym1fTJ4Sipgb
         8JDm4qEWb7LqmL4tyOldTH51lsZhNQgUOymEHNZQXdMdnVbTLv5juBVzOHUyx2iXdFF7
         N704EywiymUSDAG8NXFSoJGlz64nhWDkOMdky+dIkDCzYPtQfevq926V9HBtT1ehhUBp
         Kzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379024; x=1785983824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3NHmMxjLFkSdOoYQTyAkfV3Ov5wVWEEbb1JjezyfMM=;
        b=fPuMdGVRWhy5XNrGYGK0xup/FgMWVsWgRUwDiIjtKiRorRxCaRbHDHNyJtgrdHbe3n
         WiqEKJvXnGwM22BOSOZndhY1r9DYhAnqPveWc+KGCfHtVzooax6aSNRSd3/ZrpDyUmlF
         PEFfJXZFuC//VKeMnQFC2GJc0MjIYDaPj4nUujI7xJy6V8N8opul8zf52dq1ccOztIpj
         N/T0MlBPe0fQAyncdLZFZzTTKW3IVFWWGZoNAv4xovJeLxsAWV5oWzWs7/jLMWXwzz87
         IH6jbNaaiyqptGA9jJj9ARLRq3aAcbDR7oNHZ/xC3YHhmD4RNJaGpvKCiShMEnU4uSP8
         mguQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQO/rmQUggL8PCJwdUvid3P+XP5wQdxeyvTxh4qGxvcSjboxzN7cPzAPAT6eX4u/+r/URZ6UDowxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYyf/LSJrGmTSAOMDTiURGmEEn4GBSC7J7LgO7B6SQyqkhFrdj
	Nf2d5Q2cotOXwztm3Qew7KX/I0sP2FDzxLf7cgIjMDlevaH23s3aT65iDNGQwnaGU1rxlO5bglZ
	jOJr1FDGuJc7HKJ4cQYWfDsWSqI2Mu2FEpn5s+MRVNimElfxHIoTku2+rkOn0GUI=
X-Gm-Gg: AR+sD12nf60xZifVHWe3GeZiME13H8bd72tMQCmj1M4CMEB03qEgYoa9l3e7aMXdI5N
	gEBx57E2iWhbSytIGhBRXO1BnqPqGYjPIlb08H8lDUltIISac3395v37eap+G9hMohlUllVN4qj
	pnhK7qJGo3GLS9mDRg3dDr9xNk1FvZbJO+q5aMQ12jYFV20G3THz+Dcqgh2ltpnmvzQBrv5ziSj
	A0L7cWl1pkeDGJ3Yoi2Fq+xFAWfyywfOSR8bKPtp1ryQudfZTnmUG14IxikdsmRdwGfiZcnxlqx
	VglsGv4Fm57WzaCKQZYWRdIOfXo6F/E/d/lIUHcTZrUoM5MIzVwVlchP4hY+O93UyeBE6CzaK+V
	puWKzhXvhL1lLYNVoIHtRuMfdnrqpNnu+3072x+Y2iEA=
X-Received: by 2002:a05:6a21:7014:b0:3c3:7ac4:dac7 with SMTP id adf61e73a8af0-3c9008d2545mr623833637.45.1785379023636;
        Wed, 29 Jul 2026 19:37:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:7014:b0:3c3:7ac4:dac7 with SMTP id adf61e73a8af0-3c9008d2545mr623817637.45.1785379023277;
        Wed, 29 Jul 2026 19:37:03 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm16691889eec.14.2026.07.29.19.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:37:02 -0700 (PDT)
Date: Thu, 30 Jul 2026 10:36:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe
 clocks
Message-ID: <amq4yNrdA4Oe1IOS@QCOM-aGQu4IUr3Y>
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
 <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-1-e4f583633356@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: o5zKIsggrAlWL3-doq0GLWdqbtEfrdq9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxNCBTYWx0ZWRfX2kbxmj/rItMh
 zV2/TLxu9jI7v+ldQgMPwNZmC+tgcP9BQ6fMpQpPg9me505QdxrOAIMThvvtlfz6QCl0vhP8mXU
 l4ArrFPLLI33Q5dUwinkXOezRpwxqo8=
X-Authority-Analysis: v=2.4 cv=aoKCzyZV c=1 sm=1 tr=0 ts=6a6ab8d0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-NgSUSuva62yS0YON0wA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxNCBTYWx0ZWRfX31TcBZDEE7PR
 hXW+R+vpu05F/9MOU0dZWO31LKV7t3Q3EznSmkWohbUioKfqjV/XT5ubeASIKYvrwfeEqxSdsGp
 5GgoH+bYn2sUEQ6R4xJLRk9D2jF55WHn8Fg01r7lWCOY1r6NL2IfuSxGaqO2KX8W85N5q9kgD1H
 fV4BSsYOzjLXM5LEVgdJZeGw0fR/TA1U5HAwqRWcuCctmcBPv05F6A3ISN1is+Qd52DR/q8nHyC
 P8dGxyA7H0RFBf5P4RzYs9tNHViRtmWrGAdD++1ZHmw7aCYHno8C4o9KtXpnRLyTQ3bpRdwkrsj
 le6YwhFnT8GnaF/MvtUQwrNdF9DpPsoFaPme1wR+BLuDF48ah8nxmHUZr7YFs8l58kYHN5gRZo6
 YWBnyDsglpzvM4kQREsnruO/GQQEY3pZHSl9AEOA7ki34y9YxcA/wOj1ZYe8JYYg5t2Be8426Mr
 h1qs5pUU5RVGn/k5vqw==
X-Proofpoint-GUID: o5zKIsggrAlWL3-doq0GLWdqbtEfrdq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300014

On Thu, Jul 16, 2026 at 04:29:11PM +0530, Taniya Das wrote:
> The PCIe and USB3 pipe clocks on Nord are sourced from their
> respective PHYs. The halt bit for these branches does not toggle
> reliably when the PHY is powered down or not yet brought up, so
> polling for it with BRANCH_HALT_VOTED can spuriously time out.
> 
> Switch these pipe clock branches to BRANCH_HALT_SKIP, matching the
> convention used for PHY-sourced pipe clocks elsewhere in the Qualcomm
> clock drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

For USB3,

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
