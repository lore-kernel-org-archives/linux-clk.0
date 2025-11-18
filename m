Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4DE286A7
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 04:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440238; cv=none; b=RyPxqJkItgviAPWY1M67ctpg5nV1UX0BNb+nhX2NIl5CLuPzSsECeTFbXdauRaXIZeX+3+NM4tuJlvrUJ5L7jFcFU2oR3wy2icbucsr6WuEs4lWB2PkH+VJWmmmcXyClQCmWZj554V3OHriMrIjpwuCNCfvT0tpI9NaWQREyWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440238; c=relaxed/simple;
	bh=yzw1GrdzJcigm0aCYVCGwl4m+lgHhKqz9BpKYqT/T1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBNYmgZNyYWUejkt65iLTUpqrPrCdUdqHfQW+p0SJuCJXlW3YgQ1TGALt+1SqiHHKqa2hl9CaIT/c1cH+wMFZ7kiQqU2qmd6E5gRZ505FxnUvB1+hlyx542tFUxaM0bfLtqhxIL9wUx8Suz8odXdjBEOUMuIwqBcDqgKW0AxIEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZ/OZPBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP/OFhHY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZ/OZPBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP/OFhHY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHI4WAO3572694
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 04:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RQJR728JMNm7YLg1MFMI4UGwy687LvMd3MTimSmFaQI=; b=VZ/OZPBbxboNnyhN
	6Y82o4Vx2GDZrsPrtep0WIIDeZ+zQ4K3xPvEfuH3eQWNYyOp9ggVv40hb6hdBMMG
	TvpdHGoXr2vrPplWc0IWqv/5tFikfb6AXs2+5UEOqj+fjuoINBzi2GweRw+yOfpb
	CQbDwsLiNTmX0sSzosRYp26tr1XlA2wfxGQgEQCcN/50RLNO8d6wTAlhA8MkRqza
	NUCsAJ0MWRk85QOjvoYkjcHFgd9iE5gqEQgIVjqzPJL/ymQR4YPDaYgTf9BrK7Bh
	oPsr+RaTKBXtHeUbF7TQ3ku5yyvl1bS/WBE+l8g76RT35c5PBtLtTvdOJtKEmlP3
	g+m9fA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbttud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 04:30:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88239fa9ec9so136310346d6.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 20:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763440235; x=1764045035; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RQJR728JMNm7YLg1MFMI4UGwy687LvMd3MTimSmFaQI=;
        b=kP/OFhHYNk58fAqAqoh4XI0TspyrQ5H/gbbOeLPcUK8ZdmjumsY7iuX9OIa8q2lNxG
         oTZm+pc9IygAEeRF2Y3Xld0mPjh2ASOmnL5/6RNVmeAlbvNQPsyWhOpi/fjAnUnN4dfI
         IG9FdCSyWWwempI1ViKUbE0i+bzX8JK9XKu1RvKCyuimx4YD5P28ovXuA4AFx+ki4hWQ
         pfPttP+fhJBctGCTai5hNmG8Q879Yl15lo41fEyMnJgVVBHDaefBPO/juaNEcmllNQaI
         ZnpqMqhLQ8xLRWiqicZnth46EXB6yw5jx9PYmNK1EP3h3T6khtOlivoAwSV5D/nHoL0M
         +6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763440235; x=1764045035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQJR728JMNm7YLg1MFMI4UGwy687LvMd3MTimSmFaQI=;
        b=UIRAY7A6Ui1Z0LcmHohmvUSFIfBd1PpR2GVRUZOa7IoVWdvg+BD4FtP5bJlj+G5W8c
         2FR5sarS7RuMD6rNaiufMmQhTfVb9Fq+N7raiCVr45a3quSZcCAc8v4DmZvuJK8g/WIk
         3awX0dqHgdufNz5GCceq1Abkk5cChr0axSZvdIWXeVAed2GbalTwmpy7b6bWQdnTiuy8
         3LUSM9boCbFhcGorvTZtuK1iXG19qiW8JoFibLalJL4bspLCTi9brKnflPfizSgH9cPf
         pmC2HquFLdEwiuzl3Xy3Rz9KlB/26Pm/LjszjZGt6eCc3+LeE1qqHylIgG93RsQFBYbN
         W7UA==
X-Forwarded-Encrypted: i=1; AJvYcCVMqIzLzbPgvrJhelgItF5mQLiQlgmTnbqbOZ6/3NJ62pTay3dfBlY3xS2ogEc6RJ1PmgpYyYk4FrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMvygVV3sitzK3PPDnm4UPDZbxocfOuiIsjq0T62Aeo4chSVoD
	8NbT+LuTiyDKV5x8IqFpylNB1honvCAhKDuSLp8SaoCk3+gjDjEZIA3MIVtCFmxo/WHT5uRZzsO
	5PHjb35idm+oNfDRS6+85puy3K3F8Ca+u8H1fncTMI5y6r3MVkpz4PdFdM9YyW0Q=
X-Gm-Gg: ASbGncveZx+GVmR+vx2lkWpINCPIhN7I3IAgu0CBExwWnAOYpXp8D+XfkYCpj5u5jva
	QFdvKIMITL7UJ8w078vo1fUbMJONw/okW3PEx5LOTLYURL7KAMTkybsX6h9lIQP47CZyV5YRQgP
	+VI8du6DFptnp7f5k66Gqm1p8OKrnN196sm/UWgj2SuBGWTKYMJAg2WSV3X1jchj6Rmuzlxc1Qe
	+LVKp+HqIlL6F/1oeAXtNG4vnAJGb9bWQ7TAS87MlO7Pg1l3Okt8/hSb5C/2yaFgkZoDC8YNa4j
	enZkw1ziAMCww8ts3UwGO3oQtZMaD1XhSdPgsyoVr+jTvOCzq0xQk5e/iC1AmL0tEmKrIsEtej+
	31fBrYNy0KzZxvkdPRyESRqEVqVCdOy/ZvrUOQZaHJiP+ZKHUhrd2enTXzIcWUPdwmDDlNwH6Ja
	v/eR20M8YYrItJ
X-Received: by 2002:a05:622a:49:b0:4ed:6e79:acf7 with SMTP id d75a77b69052e-4edf212a433mr211296971cf.41.1763440235464;
        Mon, 17 Nov 2025 20:30:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi1Dwkn9v+3PQte62EIHoN9RnD7aNElhuqtkrJPAElhnS5vCrYuccx/wtlZxkvqHwY94rDnw==
X-Received: by 2002:a05:622a:49:b0:4ed:6e79:acf7 with SMTP id d75a77b69052e-4edf212a433mr211296681cf.41.1763440234969;
        Mon, 17 Nov 2025 20:30:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003basm3676196e87.56.2025.11.17.20.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:30:34 -0800 (PST)
Date: Tue, 18 Nov 2025 06:30:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v2 4/4] clk: qcom: gcc: Add support for Global Clock
 controller found on SDM439
Message-ID: <6kzcwl4jlsdnpnyafpdhzczx4olckjou4jqt4ho2dnjfm7f3ga@wszxnzk72hz3>
References: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
 <20251117-gcc-msm8940-sdm439-v2-4-4af57c8bc7eb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-gcc-msm8940-sdm439-v2-4-4af57c8bc7eb@mainlining.org>
X-Proofpoint-GUID: am0qisNISvjyCC_doD8MNgjzgjmN9feO
X-Proofpoint-ORIG-GUID: am0qisNISvjyCC_doD8MNgjzgjmN9feO
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691bf66c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=OklN4PO2VwZmQYoFi2MA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAzMiBTYWx0ZWRfX5YSMG6MNrIsO
 EUOQTpTtfu0jISi5JsgtlMR7PSaIYXHUGG4lkX8yDhEUCbVyvmJUip9/yZVaHfeIwmrcg2WCnwW
 UMaAnznUGiTOqIGgNPSNZu4gJo3j8aGq4LbCAq8in/S0NnScn5+tGXLbBnxQqnW17WVp8rEmUsb
 iUcNopnC3Cvyi447VhRTp0mCRCfRL15Id/ntkPWpxXSo98XtypxOG7x4tjVKcGXGmNJWd1+ZDVv
 1dwuYuCUInI8SfMnCnLEOem0h38JFLKF5zQkAqLPwetMqOGe4XpTtkdIqQq7h0hPFYNk4/JLgdi
 eCimW4HuG9kUF5K89Vktr3tq2QSfxHB0HM5bqEC6srLr8fI58+AGvHE89fK+Q5O6QOM1d/2XxsM
 l5btzPwv4IaB0EBIEf0kJLy1G7/QAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180032

On Mon, Nov 17, 2025 at 05:57:09PM +0100, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Modify existing MSM8917 driver to support SDM439 SoC. SDM439 SoC has the
> same changes as MSM8937 SoC, but with different gpll3 vco rate and
> different GFX3D clock frequency table.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/clk/qcom/Kconfig       |  4 ++--
>  drivers/clk/qcom/gcc-msm8917.c | 49 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
