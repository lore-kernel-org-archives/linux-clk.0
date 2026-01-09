Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5FC350A3F
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949943; cv=none; b=UvDzZb6mOrr19qF9SRBQadqquKg55ypRebmtLPuH51Oe4nkJY9CJH94WAOM6MOr6RnAsC7Sj+C81u8Tb4+XIUMqf86JAh+v/zs47Uo4HxMsWV9xOpiSIR1shswWYiDoutyARCjr5fX+aD29ISNCRmF5A0zNz6GS3Tb9RZb+fwxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949943; c=relaxed/simple;
	bh=9R3WIrrYyTla60f2zkt/XHbU8yKYrYi8TXqxaHbkOa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IogbGW6XELdG1h8Bid6KurVHwYZaQAdZ4FSo9J758oU8WFVt7ciqZRgtWZq6emgK1j3XMtiaPLyi2Oxifx5aGvFjoYqZ1B5br7KagoumCosJCjIeqOilXYDFCstLD77UhBAQ63c2o/BtCUUvIjERABRXMBJrskmrF+fWNuw9xhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIVROBXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0+mbx6m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIVROBXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0+mbx6m"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096ETkx3019530
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 09:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7B6nOUZ79eiYWKjRf8LsfM7xv5YVxjBl1CLT4FtLgU=; b=MIVROBXPdJhPlktb
	2BSf7p4RzEwp2dTNmtiBpcxiLjIMdCCCefSb++kFaVBXjg3Bwl4UIau1EdyP5xJV
	Hfv0YkjpNf379TnO2ePgHQx8r5b9K5UrvKO2rWtWttD2Ll2a9rr/V1IslLpv1um+
	UmySUC+79RQzoz5IBzBfPTsgq+ps3SC8JcCbjWvnZRXAFabPWd7HuWBHKp+eJg3N
	eZZhI4CFSmyqWkcGGMzw1K/p1yn7UfDvKP0rr9Rk/aWPsmik214y9+231H/LAjbH
	VFuY92xMnKMnhyqkMhHb+UgcvSQkbBc1z02pSzukWA/TzS6qzHWKpEBrxqn/yYxp
	JQjpQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3j36w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:12:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1e17aa706so16966821cf.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 01:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949939; x=1768554739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7B6nOUZ79eiYWKjRf8LsfM7xv5YVxjBl1CLT4FtLgU=;
        b=O0+mbx6mfnmxFjDyHBU8Ur+wX/OQjn89ZSI9UwwX7O0aDK0kNmneBjL+Wtq2fqaWBX
         QrghYYQ3FrmUFzcUY+QVfPhjLudVgKFreSQSlgX2luP2iVnDPJkVMLybp41blsia6Pv0
         13xNia0F/3AoWbHIwHAZsmYqvRTXkTCuQumWMLpf/Gj4CeE1+lU5e7XXKdqYBfC+Efzz
         yX1c6hIWdskXB7OHfExehXIlCu+i85E6VkymkgzkKOEa8dPMHttCqHoMXcVkxu6JLEia
         S5DfYkGCRrABti21jTo03NqcFg2ol++EjJ1wSd9WRCcx9p18IdGBt+kmj6gDaYENHdnK
         UrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949939; x=1768554739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7B6nOUZ79eiYWKjRf8LsfM7xv5YVxjBl1CLT4FtLgU=;
        b=JfDNmXaOAaEC9bQ2aJutuvJMi0MT41W8Ta1geojrtv3kZlkxwNMsn0o9vT56REG1NL
         zY3fQdTLUtAWyK7lSL9Y8v3Vy0cDQ8+jfF9y5e9LpP6ja1CTqoYgmIDPIUZbzhP0Odu7
         LZkpAcSYJkrRoM42UpT2q/PYhty6S7A6xQQH2PjtmReIek2QQx/JuGkA//5+0QQMKtaC
         q3z/1rga+XixZ/+w1qYy4q/FaF7n0/dFKPGEoGOyRVU//+bAKaOdsCNYDKX15c22ayFd
         8UJs3uz7lezeYJAGVqDaS3WXoD9+PRhR9L3K28VurvnS4mDv/xt9pmcarjuC0xeXcSpF
         yjmg==
X-Gm-Message-State: AOJu0Yx0uEXmAlC+BP4e9mQn8Thwgr8jPErPk8s9huFtqrc/yLVI+MWb
	iJyLxmG479lq3ioL65KslfEeHxZtNg0lheC7tH/U3gOuoFtD+XxoeFx+BuTvGmxSFevIkqNg6Uo
	EL+ypDX8vLXYxpfDazwSIY71Tq8o7S+FWuZ6L/m0+4E5lvc0atKp2JMM+Sg3VdByX14vGNVw=
X-Gm-Gg: AY/fxX7iMHAg76Zau7HO451A8lVyESU6ECXOB7oauby061vHYt9EviT5KYH34cQ50vk
	bV1U+lhPRJO7aGmbwIRyWjSP5Z2hWjPIvTwptj2NY/7/S05SXpk0j8K++st37chKW4jKKaT70n9
	QdAUO0zmh4rgOk53VGoSqvROAty0xovRTo0Ieui6+wVJn1CjxBU9rOH3LMcD0hkUXUSbldysfS6
	oPE6nrZ2ZZSw/4NQ03HBETPe72KLo5rJhkfWFtk6gCZ3zTD449285drbkHLlIgpJh1A5AMu2yJl
	WxTvGoyIbg44eiTJ1Obro1/EkHZAgcDagndjjfy9RhUqKcpHEL5mdzBd1o+Xper2z0Lpi/ijdiY
	tL6/OZFS/zdYhNOg/iP7Ed+h/TmV9tgEgA/+JGVTIswIX1231CPq5MAw3uVZyDHdKDQ4=
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr104102711cf.5.1767949939278;
        Fri, 09 Jan 2026 01:12:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8iIJP8Rg/ccqZjCeN7WKKtdhZEzIIpEGc17svgWRw975fAD6mZspC1qZIs7HXOn1KvIYZrQ==
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr104102571cf.5.1767949938883;
        Fri, 09 Jan 2026 01:12:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a233fb3sm1048738866b.12.2026.01.09.01.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:12:18 -0800 (PST)
Message-ID: <0d92568d-545b-4cad-bc29-ffed93a1bba6@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:16 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/27] clk: qcom: regmap-divider: convert from
 divider_ro_round_rate() to divider_ro_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-15-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 12EE7-luOIvxcUEJ8T8QGU04dzYclKd6
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960c674 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=bI0rxR5HNnv1m9k-B9oA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 12EE7-luOIvxcUEJ8T8QGU04dzYclKd6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfXwZ/xTMrAmISp
 mT0tvR5e60ACK+dXjV1Q46ms1WydSgfIlN4xmK8n7A1Fu0Y4zhawoJsPvagdU5Dn/cRrz2Y20US
 V3IYIi0y3k8c5oW4uUTQnCuot1u1LyY4XPpb2rX437Zoq8fI3XZaNmqp/RLlxW46n2SzWSiBM5p
 +/j6jEpeHwOXCOUU18mtFec7gwJS9yD3pdzDG9oAYNsmlfL+G3DIEEq3TiwDiemh0U0K+LQJqoq
 +KAz1r0wejTP+AohBZvY4tipO5vtf9jtcurq62Uq3eYnS3FJWUrXTALXUzz62lx/UVfbMRc/1Kn
 vqUEROgkmkF63Bj978aJHlpfB9yQitEukM1P88/MlTR5uPnikeTZoLK76qDSfp9g2EVOP3Qs1r1
 IqEdRmmJE9HGxcy03i+UEmNiGkZFZfazExMfmWzf1qrv2KdsKDwwHQ64JLkjw5CqVaG7Ojcr7Ek
 SrmgEF5WlPElUFdgqxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_ro_round_rate() function is now deprecated, so let's migrate
> to divider_ro_determine_rate() instead so that this deprecated API can
> be removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

