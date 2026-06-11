Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26925368D4A
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170852; cv=none; b=SfVQQSErjiYWANLYyBYINaHxlsccexlG2r+V9iuAqHzJJl2EUiJwWOQdBlkew/l9Zl8qQTVVSi/EIwyD6roqdn6MKwIdR/hZRDNDmmWsrhD4PQ1qln9WNkYVIn0TugQvCsbOkmVVKHBjVAtVXhQ/63d4hQ5MuRYC7fX7oNs/8Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170852; c=relaxed/simple;
	bh=/tPLp0YnAEbzNEjlPFUBlDrqdFYNHeb+WcToziZLGSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNS3GL2BGVrU1PlAgGs2pR03gUNj2nEXA3zoXgRAEUc7eswDfe9JKYAePpTKA1hS94LZWp24xxnmm8jT9EXJBtTmvgFc0JL0lSROFeIPgcVcZDG4A7wY/T9wK7UkpNO3FzRdgPj9UBLg10BS5U+8oCKdoxhuV2jKok93QCkBIRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGMq06E3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqORIbJc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGMq06E3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqORIbJc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GHDO3815872
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKcvGnq/VpeslsAPlHl1255rnIM6NR1gO7P4RmE+qE4=; b=BGMq06E3/iit69Oc
	hkkdp21erXxDRMwzvyQJ0zUx60JcLRhrbh+Rch81CF/m+0Nu6/YVhp0RyrWF6ntZ
	lT+nSbCMrPurgIrKgfoSkNBLhXZad/QcYGp5C1lpCVZrpSBGupvOJsIeXibGGlAP
	OP2vKfLkkf/3MiZl/RKZTuFrET/EUYUANxn2FhRkYpnM4lk9eOOv07mELtLoErHm
	So1E/2tkPeP5y+fmNxbaJy+h9cMA6IWAaI5gZyrxBs2gTbHiilt/hHkyZZurzSXW
	2nYjgwzPVotWRwW5SIpzgTthMDQnl4Fw6UMuvW8e365KnDhwinsQg98QKoh2QWVa
	WXFLhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2ra7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 09:40:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517647fbff1so25645121cf.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170849; x=1781775649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKcvGnq/VpeslsAPlHl1255rnIM6NR1gO7P4RmE+qE4=;
        b=HqORIbJcn0cEwmHlh3fSD7V8tqwKCLjVmk/XdORU/uuh5Gm0y+Khk3/EuzLqLfTTSp
         Alo+aDB3copLMBIP/KxiCdx5IaugUzLAV1izrGu2NlZZdPohKjCH5tegmc0nxWkeAkxe
         XKY+2Sgo+o45z4SQXdDr0SatrPFle8Y2qzThM+c3PWT3QXmfG+2rmj3QW2ifFtY4tGi7
         DV2eXe0TwSPetj/9FxW56BJs07Rj6jwCOTcaFvcqW2TKx8IOpkHrilcddBoRuIDYiYav
         WgTpcwdfmyYO0VcO2GvKkDhu0Prb5qx+oIZlrv0/rhPwCk4b8NiQAGOedbKpmCejZ8hN
         4qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170849; x=1781775649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKcvGnq/VpeslsAPlHl1255rnIM6NR1gO7P4RmE+qE4=;
        b=IDxEs9RW3DZHJn3ji+1aU8U1XAJeQLLsP+XMz0viqKx45UMTZymlfYrgz0IMWC84b6
         SZYNLMXP6YBitCWIXW7TtB1PfT++I1c+tQ9Vn0zAA78hAznMDumwCVAFMIxh4rNetNul
         k619DuEhTHK5Mgf0qeEz/Yd0WOprA2CvII2VUpl1eLihWNxJ6qx9iny8S/KZnKdLUEdF
         16JAfLhVYUs4BD6ROTiTt4i6YYx/fe8NS3jFqF7a14dHF32Cp7eGocn934ur88u/5F9V
         eYCnZSL9mI5Gqta7kQOTneeBCI0yyMHk7P2t0x/zfU4r5yCz4lQOAypnA7R3/cFLjfFC
         NXYg==
X-Forwarded-Encrypted: i=1; AFNElJ/mNe4F93J/NuHvdtAJ4jS6wCCOWPQM4GSmci+kYhSqDf4Z49Xv3b6UDbql7djcTVB/QRH13PIDb9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2WKEiKMz8RDi8bVpd03xaEJTkeq84ANs/rAivKlT1OE+uwT2h
	8lzVLkcW2BiNiRfkSNcSViZ6qTcxGOES43o+7YT0M5e7/64K4F/ulXvtB1PR/FLWNHni82hOSJR
	0BvLaSMndpZHfPS5EDsAgRxWgG5lDgnURYW9DmcvBry5ZpeiWUsE4J5LS9giB+tw=
X-Gm-Gg: Acq92OEgyEAuvEQBY/VNAPWCo6qc6T++G0C7Z1mDk39K7/Cxq78uihvg3061zIY6eFJ
	nKe8UPoiuBk4w196AzoxA7sxRLUWh1o9bUe1waLwlFac6ZFZNmDQEHqNTJq6OD+yUuvb/2AXwxO
	97p2i7498i/UlPh3C7mVTckrKSMhqblCbFon4dpXJmyhIeULdLVcuKMSiqxFtesI9klb0w7nB9B
	CbrhGiFKIcJwA8qqdX0E1WCzQ1lSgMj8EOQUY1GEG4acnHIRbAj2gt/7V6idvGvQo5Tg3dnSdCg
	hi3/n9s5z+r8p1c1u7+JDMzv1bYoM+XDCLOPzweON97kvmhnLT7IwdI2Q45OnMOBTyLh5Du4r3B
	4CFfwo4N0AT/7Jw8I5HWPsc6BmydZghVgc5OdIpHQE523aGaGaNbtxAGL
X-Received: by 2002:a05:622a:4d86:b0:509:39b5:a977 with SMTP id d75a77b69052e-517ee225ff3mr19651231cf.5.1781170849389;
        Thu, 11 Jun 2026 02:40:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4d86:b0:509:39b5:a977 with SMTP id d75a77b69052e-517ee225ff3mr19650901cf.5.1781170848859;
        Thu, 11 Jun 2026 02:40:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f1478csm41082666b.8.2026.06.11.02.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:40:47 -0700 (PDT)
Message-ID: <b86e9f5f-a7ec-489e-829e-6e07c62841a3@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4i1i4dhLLprFlnQAYSh4SI_TET1MiEx6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX+4UGUkL5dXgd
 w6OZKg44iTMnyG0v4o3w2p1dHxizUVQi6Pfkxy8PzMZjeosorOB4ThagO7YlkXTUEN3aIlP+Nf5
 Ef5dNsz9fJ1oOJnRZPV8RDsdAfNmpJg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfXzHXZ6T9mcEuJ
 K3c2ZjdDVnS8ujn8KP+4PqZln6/pJ9fcdwXkE36kmTBMix78FNM/ALCNbtHGNZbVUZm7qydIGEu
 o5w2YlqpmBr5zsidtHMBukkg63C0qu68DYEOum3/kLyYXSwlNfLv2p6GNADA94mxCMSFyY2sXzq
 TAdPXl6VulxE+Le6oNswLQICYeFfg7yA9Gmc/jD5hhGCKsP4AoiOMgKfekPkUD2lM0TcAeFU1E3
 CwGIA7ka6Xv0V54bHW8ahc6L5KqD+J0nIGKMVZaa2YLrHJMc1dn9dqHlgLAYoVcCize+H/4iv31
 CB3snf0Ef+C0z6dZDOuwAY6ufB4V2UOVUhaHdycpLYlkUl7KhkNCp6AObzVJ6fOif8Gx6SofjDt
 qL+1b9halgorqqUyzEutrbq2sV3+Fz6AobxM1xBUMDtqot8KxmpFhEucn10iurYOlikFRrtDqu+
 NLvbjojuinnPQplB0FA==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a82a2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NxhCX_73iKeGXg_BdwEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 4i1i4dhLLprFlnQAYSh4SI_TET1MiEx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110096

On 6/8/26 2:21 PM, Imran Shaik wrote:
> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
> SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 103db984a40b950bd33fba668a292be46af6326e..0b624ed4715c75042b92ec49c073b281533cace4 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -495,6 +495,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
>  
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>  
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>  	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>  	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>  	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,

Is RF_CLK1 19.2 MHz (with the other RFCLKs being 38.4) on purpose?

Konrad
